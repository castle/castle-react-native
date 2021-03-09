import mockConsole, { RestoreConsole } from 'jest-mock-console';

import { Castle } from '../index';

jest.mock('../__mocks__/castle');

const nextTick = () => new Promise((resolve) => setImmediate(resolve));
const getBridgeStub = <K extends keyof typeof Castle>(
  name: K
): jest.Mock<typeof Castle[K]> => (Castle as any)[name];
let restoreConsole: RestoreConsole = null!;

beforeEach(async () => {
  restoreConsole = mockConsole();
  Object.keys(Castle).forEach((key) => getBridgeStub(key as any).mockClear());

  await Castle.configure({
    publishableKey: 'pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ',
    debugLoggingEnabled: true,
    maxQueueLimit: 1000,
    flushLimit: 20,
    useCloudflareApp: false,
  });
});

afterEach(() => {
  restoreConsole();
});

function testCall<K extends keyof typeof Castle>(name: K) {
  return (async (...args: any[]) => {
    Castle.constructor.prototype[name].call(Castle, ...args);
    await nextTick();
    expect(Castle[name]).toHaveBeenNthCalledWith(1, ...args);
  }) as typeof Castle[K];
}

it('call .reset()', testCall('reset'));
it('call .flush()', testCall('flush'));
