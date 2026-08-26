# Castle for React Native

**[Castle](https://castle.io) adds real-time monitoring to your authentication stack, instantly notifying you and your users of potential account hijacks.**

[![npm](https://img.shields.io/npm/v/@castleio/react-native-castle)](https://www.npmjs.com/package/@castleio/react-native-castle)
[![License](https://img.shields.io/npm/l/@castleio/react-native-castle)](https://www.npmjs.com/package/@castleio/react-native-castle)
[![CircleCI](https://img.shields.io/circleci/build/github/castle/castle-react-native/master?token=5e33890a81d6ff15736b559ad252a3b6ab6db9b2)](https://circleci.com/gh/castle/castle-react-native)

**NOTE:** Version `4.0.0` has breaking changes compared to previous `2.x.x` versions. Android now requires 8.0+ (`minSdkVersion` 26, `compileSdkVersion` 36), so apps supporting API 24-25 cannot upgrade, and the iOS deployment target was raised from 12.0 to 13.0. In addition:

- `userAgent()`, `queueSize()` and the `sensorTrackingEnabled` option have been removed.
- `flushIfNeeded()` and `baseUrl()` are iOS only. On Android `flushIfNeeded()` is a no-op and `baseUrl()` resolves `null`.
- `createRequestToken()` resolves `null` instead of an empty string before the SDK has been configured.
- `configure()` and `configureWithPublishableKey()` reject the promise when configuration fails instead of resolving.
- `baseURLAllowList` entries must include a scheme, for example `https://api.example.com`.

See the [CHANGELOG](CHANGELOG.md) for the full list.

## Requirements

### React Native
 - React Native 0.77.0+

### iOS
 - iOS 15.1+
 - Xcode 16.3+

### Android
 - Android 8.0 (API 26)
 - compileSdkVersion 36

## Installation

Add the `@castleio/react-native-castle` package to your `package.json`.

### yarn

```bash
yarn add @castleio/react-native-castle
```

### npm

```bash
npm install --save @castleio/react-native-castle
```

### Linking Native Code on iOS
Run `pod install` in the `ios` directory in order to link to the native iOS project. A shortcut for doing this without switching directories is to run

```bash
npx pod-install
```

The Castle iOS SDK ships as a binary XCFramework vendored inside this package, so
CocoaPods links, embeds and signs it for you. No extra Podfile setup is required.

Once completed, re-build the app binary and start using the library

```bash
npx react-native run-ios
```

### Liking Native Code on Android
In order to start using the library you'll need to re-build the app binary

```bash
npx react-native run-android
```

## Usage

Please see the [Mobile Integration Guide](https://docs.castle.io).

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
