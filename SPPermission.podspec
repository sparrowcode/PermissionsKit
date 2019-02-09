Pod::Spec.new do |s|
  s.name          = "SPPermission"
  s.version       = "3.0.1"
  s.summary       = "Simple request permissions with dialog alert"
  s.homepage      = "https://github.com/IvanVorobei/RequestPermission"
  s.source        = { :git => "https://github.com/IvanVorobei/RequestPermission.git", :tag => s.version }
  s.license       = { :type => "MIT", :file => "LICENSE" }
  
  s.author        = { "Ivan Vorobei" => "hello@ivanvorobei.by" }
  
  s.swift_version = '4.2'
  s.platform      = :ios
  s.ios.deployment_target = "10.0"

  s.source_files  = "Source/SPPermission/**/*.swift"
end
