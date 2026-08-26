# Releasing

## Updating the Castle iOS SDK

Castle iOS 4.x is not published to CocoaPods, so `ios/CastleSDK.xcframework` is
vendored in this repository and has to be refreshed by hand whenever the native
SDK is bumped:

```bash
VERSION=4.3.0
gh release download "$VERSION" --repo castle/castle-ios --pattern "Castle.xcframework.zip" --clobber

# Verify the download matches the checksum in castle-ios' Package.swift
shasum -a 256 Castle.xcframework.zip

rm -rf ios/CastleSDK.xcframework
unzip -q Castle.xcframework.zip
mv Castle.xcframework ios/CastleSDK.xcframework
rm Castle.xcframework.zip
```

The release ships the bundle as `Castle.xcframework`, but it **must** be renamed
to `CastleSDK.xcframework`. CocoaPods derives the linker flag from the file name,
so leaving it as `Castle.xcframework` produces `-framework Castle` and the build
fails with `ld: framework 'Castle' not found`. The framework inside is named
`CastleSDK.framework`.

After updating, run `pod install` in `example/ios` and check that the example app
still launches — a missing or misnamed framework links fine but crashes at
startup with `dyld: Library not loaded: @rpath/CastleSDK.framework/CastleSDK`.

## Pre-release

Create a new `X.Y.Z` branch from `master` and run:

```bash
npm version <--major | --minor | --patch>

# E.g., to upgrade, from 0.0.0 to 0.0.1 version, please run:
# npm version --patch

# after that commit files and create a version tag
git tag -a version -m "<version>"

# and push it to the remote
git push --tags
```

After that make a PR to `master` branch. When approved, merge the code


## NPM release

Castle SDK is also accessible as an [NPM package](https://www.npmjs.com/package/@castleio/react-native-castle). To publish the package, please follow the instructions:

```bash
npm login
npm publish castleio-react-native-castle-<version>.tgz
```

You can check the content of the pre-published package with:
```bash
npm pack
tar -tf <file>
```
