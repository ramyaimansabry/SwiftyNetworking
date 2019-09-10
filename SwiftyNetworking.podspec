# Be sure to run `pod lib lint SwiftyNetworking.podspec' to ensure this is a
# valid spec before submitting.


Pod::Spec.new do |s|
  
  
  
  s.name             = 'SwiftyNetworking'
  s.version          = '0.1.0'
  s.summary          = 'HTTP Networking library and image downloader with caching written in swift'

  s.homepage         = 'https://github.com/ramysabry22/SwiftyNetworking'
  s.license = 'MIT'
  s.author           = { 'ramysabry22' => 'ramysabry1996@gmail.com' }
  s.source           = { :git => 'https://github.com/ramysabry22/SwiftyNetworking.git', :tag => s.version }
   
  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  s.source_files = 'Classes/**/*.swift'
   

  
end
