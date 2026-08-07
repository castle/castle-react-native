package com.reactnativecastle

import android.app.Application
import com.facebook.react.bridge.*
import io.castle.Castle
import io.castle.Configuration

class CastleModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    private var advertisingIdentifier: String? = null

    override fun getName(): String {
        return "Castle"
    }

    @ReactMethod
    fun requestTokenHeaderName(promise: Promise) {
      promise.resolve(Castle.requestTokenHeaderName)
    }

    @ReactMethod
    fun configure(options: ReadableMap?, promise: Promise) {
      if (options == null) {
        promise.reject("castle_configuration_error", "Invalid configuration")
        return
      }

      val publishableKey = options.getString("publishableKey")
      if (publishableKey == null) {
        promise.reject("castle_configuration_error", "Missing publishableKey")
        return
      }

      val builder = Configuration.Builder()
      builder.publishableKey(publishableKey)
      builder.screenTrackingEnabled(false)
      builder.adIdProvider { advertisingIdentifier ?: "" }
      if (options.hasKey("debugLoggingEnabled")) {
          builder.debugLoggingEnabled(options.getBoolean("debugLoggingEnabled"))
      }
      if (options.hasKey("maxQueueLimit")) {
          builder.maxQueueLimit(options.getInt("maxQueueLimit"))
      }
      if (options.hasKey("flushLimit")) {
          builder.flushLimit(options.getInt("flushLimit"))
      }
      if (options.hasKey("baseURLAllowList")) {
          val array = options.getArray("baseURLAllowList")
          array?.let {
            val baseURLAllowList = mutableListOf<String>()
            for (i in 0 until array.size()) {
              array.getString(i)?.let {
                s -> baseURLAllowList.add(s)
              }
            }
            builder.baseURLAllowList(baseURLAllowList)
          }
      }
      if (options.hasKey("lifeCycleEventsEnabled")) {
          builder.applicationLifecycleTrackingEnabled(options.getBoolean("lifeCycleEventsEnabled"))
      }

      try {
        Castle.configure(reactApplicationContext.applicationContext as Application, builder.build())
        promise.resolve(null)
      } catch (e: RuntimeException) {
        promise.reject("castle_configuration_error", e.message, e)
      }
    }

    @ReactMethod
    fun configureWithPublishableKey(publishableKey: String) {
      Castle.configure(reactApplicationContext.applicationContext as Application, publishableKey)
    }

    @ReactMethod
    fun resetConfiguration() {
      Castle.resetConfiguration()
    }

    @ReactMethod
    fun userJwt(userJwt: String) {
      Castle.setUserJwt(userJwt)
    }

    @ReactMethod
    fun custom(name: String) {
      Castle.custom(name)
    }

    @ReactMethod
    fun customWithProperties(name: String, properties: ReadableMap) {
      Castle.custom(name, properties.toHashMap())
    }

    @ReactMethod
    fun screen(name: String) {
      Castle.screen(name)
    }

    @ReactMethod
    fun flush() {
      Castle.flush()
    }

    @ReactMethod
    fun flushIfNeeded(url: String) {
      // Not available on Android since Castle Android 4.0.0, iOS only.
    }

    @ReactMethod
    fun reset() {
      Castle.reset()
    }

    @ReactMethod
    fun baseUrl(promise: Promise) {
      // Not available on Android since Castle Android 4.0.0, iOS only.
      promise.resolve(null)
    }

    @ReactMethod
    fun createRequestToken(promise: Promise) {
      promise.resolve(Castle.createRequestToken())
    }

    @ReactMethod
    fun setAdvertisingIdentifier(idfa: String) {
      advertisingIdentifier = idfa
    }
}
