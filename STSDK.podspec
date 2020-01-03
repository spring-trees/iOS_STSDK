#
# Be sure to run `pod lib lint STSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'STSDK'
  s.version          = '0.1.5'
  s.summary          = 'Spring Tree SDK = STSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Spring Tree For Indochat SDK 2020/1/2 make description
                       DESC

                       #s.homepage         = 'https://github.com/tommyz/STSDK'
                       #s.homepage         = 'https://github.com/spring-trees/iOS_IndoMonster.git'
  s.homepage         = 'https://github.com/tommyz/PPSPrivateStaticLibrary.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tommyz' => 'tommyz1981@gmail.com' }
  s.source           = { :git => 'https://github.com/spring-trees/iOS_STSDK.git', :tag => s.version.to_s }
  #s.source           = { :git => '/Users/tommy-mac/iOS_IndoMonster', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_versions = '4.0'
  
  s.requires_arc = true
  s.source_files = 'STSDK/Classes/**/*'
  s.static_framework = true
  s.ios.vendored_frameworks = 'STSDK.framework'
  #s.ios.vendored_frameworks = 'ios/STSDK.framework'
  #s.ios.vendored_frameworks = 'ios/PPSPrivateStaticLibrary.framework'
  s.resource_bundles = {
      'STSDK' => ['STSDK/Assets/*.png','STSDK/Assets/*.xcassets'],
      'STSDK-Localizations' => ['STSDK/Localizations/*.lproj']
  }
  
  # s.resource_bundles = {
  #   'STSDK' => ['STSDK/Assets/*.png']
  # }
  
  s.public_header_files = 'STSDK/Classes/Public/*.h'
  #s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 2.7'
  s.dependency 'JSONModel'
  s.dependency 'Masonry'
  #s.dependency 'lottie-ios'
  s.dependency 'MBProgressHUD', '~> 1.1.0'
  s.dependency 'MJRefresh'
  s.dependency 'SDWebImage', '~> 5.0'
  #s.dependency 'YYModel'
end
