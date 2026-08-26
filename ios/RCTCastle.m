#import "RCTCastle.h"

@import CastleSDK;

@interface RCTCastle ()
@property (nonatomic, copy) NSString *idfa;
@end

@implementation RCTCastle

RCT_EXPORT_MODULE()

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

/**
 Get request token header name
 */
RCT_EXPORT_METHOD(requestTokenHeaderName
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    resolver([Castle requestTokenHeaderName]);
}

#pragma mark - Configuration

/**
 Configure Castle using the provided configuration

 @param configuration CastleConfiguration instance
 */
RCT_EXPORT_METHOD(configure:(nonnull NSDictionary *)options
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    // Configuration, disable automatic screen tracking.
    // Since there is no straightforward way of adding global headers tokenAutoForwardingEnabled needs to be enabled
    CastleConfiguration *configuration = [CastleConfiguration configurationWithPublishableKey:options[@"publishableKey"]];
    configuration.screenTrackingEnabled = NO;
    configuration.tokenAutoForwardingEnabled = YES;
    [configuration setAdSupportBlock:^NSString* {
        return self.idfa;
    }];

    if (options[@"debugLoggingEnabled"]) {
        configuration.debugLoggingEnabled = [options[@"debugLoggingEnabled"] boolValue];
    }

    if (options[@"maxQueueLimit"]) {
        configuration.maxQueueLimit = [options[@"maxQueueLimit"] integerValue];
    }

    if (options[@"flushLimit"]) {
        configuration.flushLimit = [options[@"flushLimit"] integerValue];
    }

    if (options[@"baseURLAllowList"]) {
        configuration.baseURLAllowList = [RCTCastle URLsFromStrings:options[@"baseURLAllowList"]];
    }

    if (options[@"lifeCycleEventsEnabled"]) {
        configuration.enableApplicationLifecycleTracking = [options[@"lifeCycleEventsEnabled"] boolValue];
    }

    if (options[@"touchCollectionEnabled"]) {
        configuration.touchCollectionEnabled = [options[@"touchCollectionEnabled"] boolValue];
    }

    NSError *error = nil;
    if (![Castle configure:configuration error:&error]) {
        return rejecter(@"castle_configuration_error", error.localizedDescription, error);
    }

    return resolver(nil);
}

/**
 Convert the base URL allow list coming from JavaScript into the NSURL array the
 SDK expects. Entries that aren't parseable as URLs are skipped.

 @param strings Array of URL strings
 @return Array of NSURL instances
 */
+ (NSArray<NSURL *> *)URLsFromStrings:(NSArray<NSString *> *)strings
{
    NSMutableArray<NSURL *> *urls = [NSMutableArray arrayWithCapacity:strings.count];
    for (NSString *string in strings) {
        NSURL *url = [NSURL URLWithString:string];
        if (url) {
            [urls addObject:url];
        }
    }
    return urls;
}

/**
 Configure Castle with default configuration using publishable key

 @param publishableKey Castle publishable key
 */
RCT_EXPORT_METHOD(configureWithPublishableKey:(nonnull NSString *)publishableKey
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    // Use the default configuration, which already has both automatic screen
    // tracking and token auto forwarding disabled.
    NSError *error = nil;
    if (![Castle configureWithPublishableKey:publishableKey error:&error]) {
        return rejecter(@"castle_configuration_error", error.localizedDescription, error);
    }

    return resolver(nil);
}

/**
 Reset current configuration. Will disable logging, request interception (if enabled).
 Once reset the shared Castle instance can be re-configured.
 */
RCT_EXPORT_METHOD(resetConfiguration
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    [Castle resetConfiguration];
    return resolver(nil);
}

#pragma mark - Tracking

/**
 Set user jwt, will be persisted. A call to userJwt or reset will clear the stored user identity.

 @param userJwt user jwt
 */
RCT_EXPORT_METHOD(userJwt:(NSString *)userJwt)
{
    [Castle setUserJwt:userJwt];
}

/**
 Track custom event with a specified name

 @param name Event name
 */
RCT_EXPORT_METHOD(custom:(NSString *)name)
{
    [Castle customWithName:name];
}

/**
 Track custom event with a specified name and properties

 @param name Event name
 @param properties Properties
 */
RCT_EXPORT_METHOD(customWithProperties:(NSString *)name properties:(NSDictionary *)properties)
{
    [Castle customWithName:name properties:properties];
}

/**
 Track screen event with a specified name

 @param screenName Screen name
 */
RCT_EXPORT_METHOD(screen:(NSString *)screenName)
{
    [Castle screenWithName:screenName];
}

/**
 Force a flush of the batch event queue, even if the flush limit hasn't been reached
 */
RCT_EXPORT_METHOD(flush)
{
    [Castle flush];
}

/**
 Force a flush if needed for a specific url, flushes if url is whitelisted

 @param url Whitelist url
 */
RCT_EXPORT_METHOD(flushIfNeeded:(NSURL *)url)
{
    [Castle flushIfNeeded:url];
}

/**
 Reset any stored user information and flush the event queue
 */
RCT_EXPORT_METHOD(reset)
{
    [Castle reset];
}

/**
 Get base url

 @return return Base URL
 */
RCT_EXPORT_METHOD(baseUrl
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    NSURL *baseUrl = [Castle baseURL];
    return resolver(baseUrl.absoluteString);
}

/**
 Set advertising identifier (IDFA)

 @param baseUrl Base URL
 */
RCT_EXPORT_METHOD(setAdvertisingIdentifier:(NSString *)identifier)
{
    self.idfa = identifier;
}

#pragma mark - Metadata

/**
 Create request token

 @return request token
 */
RCT_EXPORT_METHOD(createRequestToken
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    // Returns nil until the SDK has been configured
    NSString *token = [Castle createRequestToken];
    return resolver(token);
}

@end
