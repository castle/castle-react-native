package com.example.reactnativecastle;

import com.facebook.react.ReactActivity;
import com.facebook.react.ReactActivityDelegate;
import com.facebook.react.defaults.DefaultReactActivityDelegate;

public class MainActivity extends ReactActivity {

  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   */
  @Override
  protected String getMainComponentName() {
    return "CastleExample";
  }

  /**
   * Returns the instance of the {@link ReactActivityDelegate}. We use {@link
   * DefaultReactActivityDelegate} which allows you to enable New Architecture with a single boolean
   * flags {@code fabricEnabled} and {@code concurrentRootEnabled} flags.
   */
  @Override
  protected ReactActivityDelegate createReactActivityDelegate() {
    return new DefaultReactActivityDelegate(this, getMainComponentName(), BuildConfig.IS_NEW_ARCHITECTURE_ENABLED);
  }
}
