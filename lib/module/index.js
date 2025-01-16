"use strict";

import { NativeModules } from 'react-native';
export const {
  Castle
} = NativeModules;
if (!Castle) {
  throw new Error('Failed to load Castle native module.');
}
export default Castle;
//# sourceMappingURL=index.js.map