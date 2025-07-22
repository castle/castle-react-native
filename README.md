# Castle for React Native

**[Castle](https://castle.io) adds real-time monitoring to your authentication stack, instantly notifying you and your users of potential account hijacks.**

[![npm](https://img.shields.io/npm/v/@castleio/react-native-castle)](https://www.npmjs.com/package/@castleio/react-native-castle)
[![License](https://img.shields.io/npm/l/@castleio/react-native-castle)](https://www.npmjs.com/package/@castleio/react-native-castle)
[![CircleCI](https://img.shields.io/circleci/build/github/castle/castle-react-native/master?token=5e33890a81d6ff15736b559ad252a3b6ab6db9b2)](https://circleci.com/gh/castle/castle-react-native)
[![codecov](https://codecov.io/gh/castle/castle-react-native/branch/master/graph/badge.svg)](https://codecov.io/gh/castle/castle-react-native)

## Requirements

### React Native
 - React Native 0.77.0+

### iOS
 - iOS 15.1+
 - Xcode 16.3+

### Android
 - Android 7.0

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
