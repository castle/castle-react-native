import { Castle } from '../index';

jest.mock('../__mocks__/castle');

it('exports an instance of Castle', () => {
  expect(typeof Castle).toEqual('object');
});

const publishableKey = 'pk_CTsfAeRTqxGgA7HHxqpEESvjfPp4QAKA';

beforeEach(async () => {
  await Castle.configure({
    publishableKey,
    debugLoggingEnabled: true,
    lifeCycleEventsEnabled: true,
    maxQueueLimit: 1000,
    flushLimit: 20,
    useCloudflareApp: false,
  });
});

const testCall = (name: string, ...args: any[]) => {
  return () => {
    Castle[name](...args);
    expect(Castle[name]).toHaveBeenNthCalledWith(1, ...args);
  };
};

it('call .reset()', testCall('reset'));
it('call .flush()', testCall('flush'));
it(
  'call .userJwt()',
  testCall(
    'userJwt',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImVjMjQ0ZjMwLTM0MzItNGJiYy04OGYxLTFlM2ZjMDFiYzFmZSIsImVtYWlsIjoidGVzdEBleGFtcGxlLmNvbSIsInJlZ2lzdGVyZWRfYXQiOiIyMDIyLTAxLTAxVDA5OjA2OjE0LjgwM1oifQ.eAwehcXZDBBrJClaE0bkO9XAr4U3vqKUpyZ-d3SxnH0'
  )
);
it('call .requestTokenHeaderName()', testCall('requestTokenHeaderName'));
it('call .queueSize()', testCall('queueSize'));
it('call .userAgent()', testCall('userAgent'));
it(
  'call .configureWithPublishableKey()',
  testCall('configureWithPublishableKey', publishableKey)
);
