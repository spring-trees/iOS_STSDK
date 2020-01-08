#
# Be sure to run `pod lib lint STSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'STSDK'
  s.version          = '0.1.13'
  s.summary          = 'Spring Tree SDK = STSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Spring Tree For Indochat SDK 2020/1/2 make description
                       DESC

  s.homepage         = 'https://www.friendo.com.tw/brands'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Spring Tree', :file => 'LICENSE' }
  s.author           = 'Spring Tree'
  #s.source           = { :git => 'https://github.com/spring-trees/iOS_IndoMonster.git', :tag => s.version.to_s }
  #s.source           = { :git => '/Users/tommy-mac/iOS_IndoMonster', :tag => s.version.to_s }
  #s.source           = { :git => '/Users/phoebe.lin/Desktop/iOS_IndoMonster', :tag => s.version.to_s }
  s.source           = { :git => 'https://github.com/spring-trees/iOS_STSDK.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_versions = '4.0'
  
  s.requires_arc = true
  s.source_files = 'STSDK/Classes/**/*'
  s.static_framework = true
  s.ios.vendored_frameworks = 'STSDK.framework'
  s.resource_bundles = {
      'STSDK' => ['STSDK/Assets/*.png','STSDK/Assets/*.xcassets'],
      'STSDKStrings' => ['STSDK/Strings/*.lproj']
  }
  #s.resource_bundles = {
  #    'STSDK' => ['STSDK/Assets/*.png','STSDK/Assets/*.xcassets'],
  #    'STSDKStrings' => ['STSDK/Strings/*.lproj']
  #}
  
  s.public_header_files = 'STSDK/Classes/Public/*.h'
  #s.frameworks = 'UIKit', 'MapKit'
  s.frameworks = 'UIKit', 'Accelerate'
  #s.dependency 'AFNetworking', '~> 2.7'
  s.dependency  'AFNetworking', '~> 3.0'
  s.dependency 'JSONModel', '~> 1.8.0'
  s.dependency 'Masonry', '~> 1.1.0'
  s.dependency 'lottie-ios', '~> 2.5.2'
  s.dependency 'MBProgressHUD', '~> 1.1.0'
  s.dependency 'MJRefresh', '~> 3.3.1'
  s.dependency 'SDWebImage', '~> 5.0'
  s.dependency 'YYModel', '~> 1.0.4'
  
  s.subspec 'UIView' do |uiv|
      uiv.source_files = 'STSDK/Classes/Category/UIView/**/*'
      
      #ss.source_files = 'SYBaseKit/Classes/Category/NSDictionary/**/*'
      #ss.source_files = 'SYBaseKit/Classes/UIKit/*'
      #ss.public_header_files = 'STSDK/Classes/UIKit/*.h'
      #ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
      #ss.public_header_files = 'AFNetworking/AFURL{Request,Response}Serialization.h'
      #ss.watchos.frameworks = 'MobileCoreServices', 'CoreGraphics'
      #ss.ios.frameworks = 'MobileCoreServices', 'CoreGraphics'
      #ss.osx.frameworks = 'CoreServices'
      #ss.frameworks = 'UIKit'
  end
  #s.subspec 'UIKit' do |ss|
      #ss.source_files = 'SYBaseKit/Classes/Category/NSDictionary/**/*'
      #ss.source_files = 'SYBaseKit/Classes/UIKit/*'
      #ss.public_header_files = 'STSDK/Classes/UIKit/*.h'
      #ss.source_files = 'AFNetworking/AFURL{Request,Response}Serialization.{h,m}'
      #ss.public_header_files = 'AFNetworking/AFURL{Request,Response}Serialization.h'
      #ss.watchos.frameworks = 'MobileCoreServices', 'CoreGraphics'
      #ss.ios.frameworks = 'MobileCoreServices', 'CoreGraphics'
      #ss.osx.frameworks = 'CoreServices'
      #ss.frameworks = 'UIKit'
      #end

end
