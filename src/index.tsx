import { NativeModules } from 'react-native';

type CastleType = {
  multiply(a: number, b: number): Promise<number>;
};

const { Castle } = NativeModules;

export default Castle as CastleType;
