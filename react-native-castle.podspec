require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-castle"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "13.0" }
  s.source       = { :git => "https://github.com/castle/castle-react-native.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,mm,swift}"

  s.dependency "React-Core"

  # Castle iOS 4.x is no longer published to CocoaPods. It is distributed as a
  # binary XCFramework, which is vendored here so that CocoaPods links, embeds
  # and signs it without any extra setup in the host app's Podfile.
  s.vendored_frameworks = "ios/CastleSDK.xcframework"
end
