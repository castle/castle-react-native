"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = exports.Castle = void 0;
var _reactNative = require("react-native");
const {
  Castle
} = _reactNative.NativeModules;
exports.Castle = Castle;
if (!Castle) {
  throw new Error('Failed to load Castle native module.');
}
var _default = exports.default = Castle;
//# sourceMappingURL=index.js.map