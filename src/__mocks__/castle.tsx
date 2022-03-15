import { NativeModules } from 'react-native';

NativeModules.Castle = {
  configure: jest.fn(),
  configureWithPublishableKey: jest.fn(),
  userJwt: jest.fn(),
  screen: jest.fn(),
  custom: jest.fn(),
  customWithProperties: jest.fn(),
  flush: jest.fn(),
  flushIfNeeded: jest.fn(),
  reset: jest.fn(),
  baseUrl: jest.fn(),
  createRequestToken: jest.fn(),
  requestTokenHeaderName: jest.fn(),
  userId: jest.fn(),
  userSignature: jest.fn(),
  userAgent: jest.fn(),
  queueSize: jest.fn(),
};
