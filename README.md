# react-native-castle

Castle SDK for React Native

## Installation

```sh
npm install react-native-castle
```

## Usage

```js
import Castle from "react-native-castle";

// ...

await Castle.identify('thisisatestuser');

// Fetch properties
const version = await Castle.versionString();
const clientId = await Castle.clientId();
const clientIdHeaderName = await Castle.clientIdHeaderName();
const userId = await Castle.userId();
const queueSize = await Castle.queueSize();
const userSignature = await Castle.userSignature();
const userAgent = await Castle.userAgent();

// Configure
Castle.configure({
  publishableKey: 'pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ',
  screenTrackingEnabled: true,
  debugLoggingEnabled: true,
  deviceIDAutoForwardingEnabled: true,
  maxQueueLimit: 1000,
  flushLimit: 20,
  baseUrlWhitelist: ['https://google.com/'],
  useCloudflareApp: false,
}).then(() => {
  console.log('Castle configured');
});


```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
