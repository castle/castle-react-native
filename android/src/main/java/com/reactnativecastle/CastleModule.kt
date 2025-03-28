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
    fun requestTokenHeaderName(promise: Promise) {
      promise.resolve(Castle.requestTokenHeaderName)
    }

    @ReactMethod
    fun configure(options: ReadableMap?, promise: Promise) {
      if (options != null) {
        val builder = CastleConfiguration.Builder()
        builder.publishableKey(options.getString("publishableKey"))
        builder.screenTrackingEnabled(false)
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
      Castle.flushIfNeeded(url)
    }

    @ReactMethod
    fun reset() {
      Castle.reset()
    }

    @ReactMethod
    fun baseUrl(promise: Promise) {
      promise.resolve(Castle.baseUrl())
    }

    @ReactMethod
    fun createRequestToken(promise: Promise) {
      promise.resolve(Castle.createRequestToken())
    }

    @ReactMethod
    fun setAdvertisingIdentifier(idfa: String) {
      // Do nothing, setting IDFA is not applicable on Android
    }

    @ReactMethod
    fun userJwt(promise: Promise) {
      promise.resolve(Castle.userJwt())
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
