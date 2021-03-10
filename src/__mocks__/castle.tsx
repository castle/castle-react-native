import { NativeModules } from 'react-native';

NativeModules.Castle = {
  configure: jest.fn(),
  identify: jest.fn(),
  secure: jest.fn(),
  screen: jest.fn(),
  flush: jest.fn(),
  flushIfNeeded: jest.fn(),
  reset: jest.fn(),
  baseUrl: jest.fn(),
  clientId: jest.fn(),
  clientIdHeaderName: jest.fn(),
  userId: jest.fn(),
  userSignature: jest.fn(),
  userAgent: jest.fn(),
  queueSize: jest.fn(),
  versionString: jest.fn(),
};
