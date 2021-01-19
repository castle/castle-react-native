#import "RCTCastle.h"

#import <Castle/Castle.h>

@implementation RCTCastle

RCT_EXPORT_MODULE()

/**
 Get client id header name
 */
RCT_EXPORT_METHOD(clientIdHeaderName
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    resolver(CastleClientIdHeaderName);
}

/**
 Get SDK version as a string
 */
RCT_EXPORT_METHOD(versionString
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    NSString *versionString = [Castle versionString];
    resolver(versionString);
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
    CastleConfiguration *configuration = [CastleConfiguration configurationWithPublishableKey:options[@"publishableKey"]];
    configuration.screenTrackingEnabled = options[@"screenTrackingEnabled"];
    configuration.debugLoggingEnabled = options[@"debugLoggingEnabled"];
    configuration.deviceIDAutoForwardingEnabled = options[@"deviceIDAutoForwardingEnabled"];
    configuration.maxQueueLimit = [options[@"maxQueueLimit"] integerValue];
    configuration.flushLimit = [options[@"flushLimit"] integerValue];
    configuration.baseURLWhiteList = options[@"baseUrlWhitelist"];
    configuration.useCloudflareApp = [options[@"useCloudflareApp"] boolValue];
    
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
 Track identify event with specified user identity. User identity will be persisted. A call to identify or reset will clear the stored user identity.
 Provided user traits will be included in the identify event sent to the Castle API.

 @param identifier user id
 @param traits user traits
 */
RCT_EXPORT_METHOD(identify:(NSString *)identifier traits:(NSDictionary *)traits)
{
    [Castle identify:identifier traits:traits];
}

/**
 Set user signature and enable secure mode. User signature will be included in all events after it has been set and will be persisted.
 A stored user signature will be removed when the user signature or reset methods are called.

 @param signature User signature (SHA-256 HMAC in hex format)
 */
RCT_EXPORT_METHOD(secure:(NSString *)signature)
{
    [Castle secure:signature];
}

/**
 Track screen event with a specified name

 @param screenName Screen name
 */
RCT_EXPORT_METHOD(screen:(NSString *)screenName)
{
    [Castle screen:screenName];
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
 Determine if a given url is whitelisted

 @param url url
 @return return url whitelist status
 */
RCT_EXPORT_METHOD(isWhitelistURL:(NSURL *)url
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    return resolver(@([Castle isWhitelistURL:url]));
}

/**
 Get base url

 @return return Base URL
 */
RCT_EXPORT_METHOD(baseURL
                   :(RCTPromiseResolveBlock)resolver
                   :(RCTPromiseRejectBlock)rejecter)
{
    NSURL *baseUrl = [Castle baseURL];
    return resolver(baseUrl);
}

#pragma mark - Metadata

/**
 Get client identifier if set, otherwise returns nil

 @return client identifier
 */
RCT_EXPORT_METHOD(clientId
                   :(RCTPromiseResolveBlock)resolver
                   :(RCTPromiseRejectBlock)rejecter)
{
    NSString *clientId = [Castle clientId];
    return resolver(clientId);
}

/**
 Get stored user id from last identify call, returns nil if not set

 @return User Id
 */
RCT_EXPORT_METHOD(userId
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    NSString *userId = [Castle userId];
    return resolver(userId);
}

/**
 Get stored signature from secure call, returns nil if not set

 @return Signature
 */
RCT_EXPORT_METHOD(userSignature
                  :(RCTPromiseResolveBlock)resolver
                  :(RCTPromiseRejectBlock)rejecter)
{
    NSString *userSignature = [Castle userSignature];
    return resolver(userSignature);
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
