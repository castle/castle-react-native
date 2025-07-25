# Changelog

## 2.2.0 (2025-07-21)

- [#136](https://github.com/castle/castle-react-native/pull/136) Add lifecycle events config option.
- Update Castle iOS SDK to 3.1.0.
- Update Castle Android SDK to 3.1.0.

## 2.1.1 (2025-03-31)

- [#131](https://github.com/castle/castle-react-native/pull/131) Remove duplicate userJwt method on android
- [#127](https://github.com/castle/castle-react-native/pull/127) Revert: remove uneccesary safe call
- Updated dependencies

## 2.1.0 (2025-01-27)

- Upgrade to use React Native 0.75 for SDK and example app
- Updated dependencies

## 2.0.14 (2024-09-17)

- Update Castle iOS SDK to 3.0.13

## 2.0.13 (2024-04-05)

- Update Castle iOS SDK to 3.0.10
- Updated dependencies

## 2.0.12 (2024-03-18)

- Update Castle iOS SDK to 3.0.9
- Add support for providing IDFA on iOS
- Updated dependencies

## 2.0.11 (2023-09-08)

- Updated dependencies

## 2.0.10 (2023-04-21)

- Upgraded to React Native 0.70.
- Updated dependencies

## 2.0.9 (2022-10-07)
**Enhancements**

- Updated Castle Android SDK to 3.0.7

## 2.0.8 (2022-09-19)
**Enhancements**

- Updated Castle Android SDK to 3.0.6

## 2.0.7 (2022-08-09)
**Enhancements**

- Updated Castle iOS SDK to 3.0.7
- Updated Castle Android SDK to 3.0.5
- [#66](https://github.com/castle/castle-react-native/pull/66) Bump parse-url from 6.0.0 to 6.0.2

## 2.0.6 (2022-06-30)
**Enhancements**

- Updated Castle iOS SDK to 3.0.6
- Updated Castle Android SDK to 3.0.4

## 2.0.5 (2022-06-23)
**Enhancements**

- Updated dependencies

## 2.0.4 (2022-05-11)
**Enhancements**

- Updated Castle iOS SDK to 3.0.5

## 2.0.3 (2022-04-29)
**Enhancements**

- Updated Castle Android SDK to 3.0.3
- Updated Castle iOS SDK to 3.0.4

## 2.0.2 (2022-04-08)
**Enhancements**

- Updated Castle Android SDK to 3.0.2
- Updated Castle iOS SDK to 3.0.3

## 2.0.1 (2022-03-29)
**Enhancements**

- Updated Castle Android SDK to 3.0.1
- Updated Castle iOS SDK to 3.0.2

## 2.0.0 (2022-03-16)
**Enhancements**

- Add support for enhanced user activity monitoring.
	- Introduced custom() method
	- Introduced customWithProperties() method
	- Introduced screen() method
	- Introduced userJwt() method
- Remove deprecated methods.
	- Removed identify()
	- Removed userId()
	- Removed secure()
	- Removed secureModeEnabled()
	- Removed userSignature
	- Removed track()
	- Removed useCloudflareApp()
	- Removed Castle.clientIdHeaderName()

## 1.1.5 (2022-03-14)
**Fixes**

- Updated Castle iOS SDK to 2.1.8. (*Updated internal library because of an issue with the vendored framework included in the 2.1.7 release.*)

## 1.1.4 (2022-03-03)
**Enhancements**

- Updated Castle Android SDK to 2.1.4
- Updated Castle iOS SDK to 2.1.7

## 1.1.3 (2022-02-10)
**Enhancements**

- Updated Castle Android SDK to 2.1.3
- Updated Castle iOS SDK to 2.1.6

## 1.1.2 (2021-09-29)
**Enhancements**

- [#42](https://github.com/castle/castle-react-native/pull/42) Update Kotlin 1.5.10

## 1.1.1 (2021-09-14)
**Enhancements**

- Updated Castle Android SDK to 2.1.2
- Updated Castle iOS SDK to 2.1.2

**Bug fixes:**

- [#37](https://github.com/castle/castle-react-native/pull/37) Update README with missing installation step
- [#36](https://github.com/castle/castle-react-native/pull/36) Remove versionString function
- [#34](https://github.com/castle/castle-react-native/pull/34) Add missing request token


## 1.1.0 (2021-06-08)
- Updated Castle Android SDK to 2.1.0
- Updated Castle iOS SDK to 2.1.1
- Added `createRequestToken` and `requestTokenHeaderName` functions

## 1.0.8 (2021-05-06)
**Bug fixes:**

- [#31](https://github.com/castle/castle-react-native/pull/31) Update to Castle Android 2.0.3
- [#30](https://github.com/castle/castle-react-native/pull/30) remove package-lock.json from the example

## 1.0.7 (2021-05-03)
**Bug fixes:**

- [#28](https://github.com/castle/castle-react-native/pull/28) iOS call native module on main thread
- [#27](https://github.com/castle/castle-react-native/pull/27) update to Castle Android 2.0.2


## 1.0.6 (2021-04-28)
**Bug fixes:**

- [#24](https://github.com/castle/castle-react-native/pull/24) update to Castle Android 2.0.1
- [#23](https://github.com/castle/castle-react-native/pull/23) update to Castle iOS 2.0.0

## 1.0.5 (2021-03-29)
**Bug fixes:**

- [#20](https://github.com/castle/castle-react-native/pull/20) update Castle type

## 1.0.4 (2021-03-12)
**Enhancements:**

- [#17](https://github.com/castle/castle-react-native/pull/17) update supported Android version
- [#16](https://github.com/castle/castle-react-native/pull/16) link to Castle Docs

## 1.0.3 (2021-03-11)
**Enhancements:**

- [#14](https://github.com/castle/castle-react-native/pull/14) update example

## 1.0.2 (2021-03-11)
**Enhancements:**

- add release instructions

## 1.0.1 (2021-03-11)
**Enhancements:**

- [#11](https://github.com/castle/castle-react-native/pull/11) update badges and instructions

## 1.0.0 (2021-03-11)
Initial public release
