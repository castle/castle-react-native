package com.reactnativecastle

import android.app.Application
import com.facebook.react.bridge.*
import io.castle.android.Castle
import io.castle.android.CastleConfiguration

class CastleModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "Castle"
    }

    @ReactMethod
    fun clientIdHeaderName(promise: Promise) {
      promise.resolve(Castle.clientIdHeaderName)
    }

    @ReactMethod
    fun versionString(promise: Promise) {
      promise.resolve(BuildConfig.VERSION_NAME)
    }

    @ReactMethod
    fun configure(options: ReadableMap?, promise: Promise) {
      if (options != null) {
        val builder = CastleConfiguration.Builder()
        builder.publishableKey(options.getString("publishableKey"))
          .screenTrackingEnabled(false)
          .debugLoggingEnabled(options.getBoolean("debugLoggingEnabled"))
          .maxQueueLimit(options.getInt("maxQueueLimit"))
          .flushLimit(options.getInt("flushLimit"))
          .useCloudflareApp(options.getBoolean("useCloudflareApp"))
          .apiDomain(options.getString("apiDomain"))
          .apiPath(options.getString("apiPath"))

        Castle.configure(reactApplicationContext.applicationContext as Application, builder.build())

        promise.resolve(null)
      } else {
        promise.reject("Invalid configuration")
      }
    }

    @ReactMethod
    fun configureWithPublishableKey(publishableKey: String) {
      Castle.configure(reactApplicationContext.applicationContext as Application, publishableKey)
    }

    @ReactMethod
    fun resetConfiguration() {
      Castle.reset()
    }

    @ReactMethod
    fun identify(identifier: String, traits: ReadableMap) {
      var traitsMap = mutableMapOf<String, String>()
      val itr = traits.keySetIterator()
      while (itr.hasNextKey()) {
        val key = itr.nextKey()
        if (traits.getType(key) == ReadableType.String) {
          val value = traits.getString(key)
          value?.let { traitsMap.put(key, it) }
        }
      }

      Castle.identify(identifier, traitsMap)
    }

    @ReactMethod
    fun secure(signature: String) {
      Castle.secure(signature)
    }

    @ReactMethod
    fun screen(screenName: String) {
      Castle.screen(screenName)
    }

    @ReactMethod
    fun flush() {
      Castle.flush()
    }

    @ReactMethod
    fun flushIfNeeded(url: String) {
      Castle.flushIfNeeded(url)
    }

    @ReactMethod
    fun reset() {
      Castle.reset()
    }

    @ReactMethod
    fun isWhitelistUrl(url: String, promise: Promise) {
      promise.resolve(true)

    }

    @ReactMethod
    fun baseUrl(promise: Promise) {
      promise.resolve(Castle.baseUrl())
    }

    @ReactMethod
    fun clientId(promise: Promise) {
      promise.resolve(Castle.clientId())
    }

    @ReactMethod
    fun userId(promise: Promise) {
      promise.resolve(Castle.userId())
    }

    @ReactMethod
    fun userSignature(promise: Promise) {
      promise.resolve(Castle.userSignature())
    }

    @ReactMethod
    fun userAgent(promise: Promise) {
      promise.resolve(Castle.userAgent())
    }

    @ReactMethod
    fun queueSize(promise: Promise) {
      promise.resolve(Castle.queueSize())
    }
}
