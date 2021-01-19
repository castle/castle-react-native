# Castle for React Native

**[Castle](https://castle.io) adds real-time monitoring of your authentication stack, instantly notifying you and your users on potential account hijacks.**

[![npm](https://img.shields.io/npm/v/react-native-castle)](https://www.npmjs.com/package/react-native-castle)
[![License](https://img.shields.io/npm/l/react-native-castle)](https://www.npmjs.com/package/react-native-castle)
[![CircleCI](https://img.shields.io/circleci/build/github/castle/react-native-castle/master?token=5e33890a81d6ff15736b559ad252a3b6ab6db9b2)](https://circleci.com/gh/castle/react-native-castle)
[![codecov](https://codecov.io/gh/castle/react-native-castle/branch/master/graph/badge.svg)](https://codecov.io/gh/castle/react-native-castle)

## Requirements

### React Native
 - React Native 0.62+

### iOS
 - iOS 9.0+
 - Xcode 8.2+

### Android
 - Android 4.0

## Installation

Castle is available through `npm`

```sh
npm install react-native-castle
```

## Usage

```js
import Castle from "react-native-castle";

// Set properties
await Castle.identify('thisisatestuser');
await Castle.secure('944d7d6c5187cafac297785bbf6de0136a2e10f31788e92b2822f5cfd407fa52');

// Fetch properties
const version = await Castle.versionString();
const clientId = await Castle.clientId();
const clientIdHeaderName = await Castle.clientIdHeaderName();
const userId = await Castle.userId();
const queueSize = await Castle.queueSize();
const userSignature = await Castle.userSignature();
const userAgent = await Castle.userAgent();

// Configure with custom configuration properties
Castle.configure({
  publishableKey: 'pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ',
  debugLoggingEnabled: true,
  maxQueueLimit: 1000,
  flushLimit: 20,
  useCloudflareApp: false,
}).then(() => {
  console.log('Castle configured');
});

// Configure using default configuration properties
Castle.configureWithPublishableKey('pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ').then(() => {
  console.log('Castle configured');
});

```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
