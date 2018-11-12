Pod::Spec.new do |s|
  s.name = 'SPRequestPermission'
  s.version = '2.0'
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.summary = 'A library for simplify iOS programming'
  s.homepage = 'https://github.com/IvanVorobei/RequestPermission'
  s.authors = { 'Ivan Vorobei' => 'hello@ivanvorobei.by' }
  s.platform = :ios 
  s.source = { :git => 'https://github.com/IvanVorobei/RequestPermission.git', :tag => s.version.to_s }
  s.framework = 'UIKit'
  s.requires_arc = true
  s.ios.deployment_target = '10.0'
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.name = 'Core'
    core.source_files = 'sparrow/**/*.swift'
  end

end