import { Castle } from '../index';

jest.mock('../__mocks__/castle');

it('exports an instance of Castle', () => {
  expect(typeof Castle).toEqual('object');
});

beforeEach(async () => {
  await Castle.configure({
    publishableKey: 'pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ',
    debugLoggingEnabled: true,
    maxQueueLimit: 1000,
    flushLimit: 20,
    useCloudflareApp: false,
  });
});

function testCall<K extends keyof typeof Castle>(name: K) {
  return ((...args: any[]) => {
    Castle[name](...args);
    expect(Castle[name]).toHaveBeenNthCalledWith(1, ...args);
  }) as typeof Castle[K];
}

it('call .reset()', testCall('reset'));
it('call .flush()', testCall('flush'));
it('call .identify()', testCall('identify'));
it('call .secure()', testCall('secure'));
it('call .versionString()', testCall('versionString'));
it('call .clientId()', testCall('clientId'));
it('call .clientIdHeaderName()', testCall('clientIdHeaderName'));
it('call .userId()', testCall('userId'));
it('call .queueSize()', testCall('queueSize'));
it('call .userSignature()', testCall('userSignature'));
it('call .userAgent()', testCall('userAgent'));
