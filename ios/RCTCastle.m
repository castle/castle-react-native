#import "RCTCastle.h"

#import <Castle/Castle.h>

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
    resolver(CastleRequestTokenHeaderName);
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
    // Since there is no straightforward way of adding global headers deviceIDAutoForwardingEnabled needs to be enabled
    CastleConfiguration *configuration = [CastleConfiguration configurationWithPublishableKey:options[@"publishableKey"]];
    configuration.screenTrackingEnabled = NO;
    configuration.deviceIDAutoForwardingEnabled = YES;
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
        configuration.baseURLAllowList = options[@"baseURLAllowList"];
    }
    
    [Castle configure:configuration];
    
    return resolver(nil);
}

/**
 Configure Castle with default configuration using publishable key
 
 @param publishableKey Castle publishable key
 */
RCT_EXPORT_METHOD(configureWithPublishableKey:(nonnull NSString *)publishableKey
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    // Use default configuration, disable automatic screen tracking
    // Since there is no straightforward way of adding global headers deviceIDAutoForwardingEnabled needs to be enabled
    CastleConfiguration *configuration = [CastleConfiguration configurationWithPublishableKey:publishableKey];
    configuration.screenTrackingEnabled = NO;
    configuration.deviceIDAutoForwardingEnabled = NO;
    
    [Castle configureWithPublishableKey:publishableKey];
    
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
    NSString *token = [Castle createRequestToken];
    return resolver(token);
}

/**
 Get the User Agent for used in all requests to the Castle API.
 User agent will have the following format: App Name/x.x (xxxx) (iPhone XR; iOS xx.x; Castle x.x.x)
 
 @return User Agent
 */
RCT_EXPORT_METHOD(userAgent
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    NSString *userAgent = [Castle userAgent];
    return resolver(userAgent);
}

/**
 Get the current size of the event queue
 
 @return return The current size of the event queue
 */
RCT_EXPORT_METHOD(queueSize
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    NSUInteger queueSize = [Castle queueSize];
    return resolver(@(queueSize));
}

@end
