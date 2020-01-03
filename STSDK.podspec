Pod::Spec.new do |s|
  s.name = "STSDK"
  s.version = "0.1.5"
  s.summary = "Spring Tree SDK = STSDK."
  s.license = {"type"=>"MIT", "file"=>"LICENSE"}
  s.authors = {"tommyz"=>"tommyz1981@gmail.com"}
  s.homepage = "https://github.com/tommyz/PPSPrivateStaticLibrary.git"
  s.description = "Spring Tree For Indochat SDK 2020/1/2 make description"
  s.requires_arc = true
#s.source = { :path => '.' }
  s.source           = { :git => 'https://github.com/spring-trees/iOS_STSDK.git', :tag => s.version.to_s }
  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'STSDK.framework'
end
