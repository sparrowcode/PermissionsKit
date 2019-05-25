Pod::Spec.new do |s|

  s.name          = "SPPermission"
  s.version       = "3.1.1"
  s.summary       = "Request permissions with dialog. For customise implement DataSource protocol. Check permissions."
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