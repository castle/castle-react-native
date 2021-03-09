import { Castle } from '../index';

jest.mock('../__mocks__/castle');

it('exports an instance of Castle', () =>
  expect(Castle instanceof Castle).toBe(true));
