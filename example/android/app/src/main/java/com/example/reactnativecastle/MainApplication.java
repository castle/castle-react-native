package com.example.reactnativecastle;

import android.app.Application;
import com.facebook.react.PackageList;
import com.facebook.react.ReactApplication;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint;
import com.facebook.react.defaults.DefaultReactNativeHost;
import com.facebook.react.soloader.OpenSourceMergedSoMapping;
import com.facebook.soloader.SoLoader;
import com.reactnativecastle.CastlePackage;

import java.util.List;

public class MainApplication extends Application implements ReactApplication {

  private final ReactNativeHost mReactNativeHost =
      new DefaultReactNativeHost(this) {
        @Override
        public boolean getUseDeveloperSupport() {
          return BuildConfig.DEBUG;
        }

        @Override
        protected List<ReactPackage> getPackages() {
          @SuppressWarnings("UnnecessaryLocalVariable")
          List<ReactPackage> packages = new PackageList(this).getPackages();
          // Packages that cannot be autolinked yet can be added manually here:
          packages.add(new CastlePackage());
          return packages;
        }

        @Override
        protected String getJSMainModuleName() {
          return "index";
        }

        @Override
        protected boolean isNewArchEnabled() {
          return BuildConfig.IS_NEW_ARCHITECTURE_ENABLED;
        }

        @Override
        protected Boolean isHermesEnabled() {
          return BuildConfig.IS_HERMES_ENABLED;
        }
      };

  @Override
  public ReactNativeHost getReactNativeHost() {
    return mReactNativeHost;
  }

  @Override
  public void onCreate() {
    super.onCreate();
    // In RN 0.76, libhermes_executor.so and other libraries were merged into
    // libreactnative.so. Pass OpenSourceMergedSoMapping so SoLoader can resolve
    // the old library names (e.g. "hermes_executor") to the merged library.
    try {
      SoLoader.init(this, OpenSourceMergedSoMapping.INSTANCE);
    } catch (java.io.IOException e) {
      throw new RuntimeException("Failed to initialize SoLoader", e);
    }
    if (BuildConfig.IS_NEW_ARCHITECTURE_ENABLED) {
      DefaultNewArchitectureEntryPoint.load();
    }
  }
}
