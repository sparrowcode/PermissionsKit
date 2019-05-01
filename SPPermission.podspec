Pod::Spec.new do |s|

  s.name          = "SPPermission"
  s.version       = "3.0.6"
  s.summary       = "Request permissions with native dialog UI and interactive animations. Check state any permission."
  s.homepage      = "https://github.com/IvanVorobei/RequestPermission"
  s.source        = { :git => "https://github.com/IvanVorobei/RequestPermission.git", :tag => s.version }
  s.license       = { :type => "MIT", :file => "LICENSE" }
  
  s.author        = { "Ivan Vorobei" => "hello@ivanvorobei.by" }
  
  s.platform      = :ios
  s.ios.framework = 'UIKit'
  s.swift_version = ['4.2', '5.0']
  s.ios.deployment_target = "10.0"

  s.source_files  = "Source/SPPermission/**/*.swift"

end