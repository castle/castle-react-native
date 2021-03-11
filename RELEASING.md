# Releasing

## Pre-release

Create a new `X.Y.Z` branch from `master` and run:

```bash
yarn version <--major | --minor | --patch>

# E.g., to upgrade, from 0.0.0 to 0.0.1 version, please run:
# yarn version --patch

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
