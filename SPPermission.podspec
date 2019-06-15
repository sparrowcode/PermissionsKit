Pod::Spec.new do |s|

  s.name          = "SPPermission"
  s.version       = "4.0.4"
  s.summary       = "A unified API to ask for permissions on iOS. Available dialog UI."
  s.homepage      = "https://github.com/IvanVorobei/SPPermission"
  s.source        = { :git => "https://github.com/IvanVorobei/SPPermission.git", :tag => s.version }
  s.license       = { :type => "MIT", :file => "LICENSE" }
  
  s.author        = { "Ivan Vorobei" => "hello@ivanvorobei.by" }
  
  s.platform      = :ios
  s.ios.framework = 'UIKit'
  s.swift_version = ['4.2', '5.0']
  s.ios.deployment_target = "10.0"
  s.requires_arc = true

  s.default_subspec = 'Core'

  s.subspec 'Core' do |co|
    co.source_files  = "Source/SPPermission/**/*.swift"
  end

  s.subspec 'Camera' do |cm|
    cm.dependency 'SPPermission/Core'
    cm.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_CAMERA" }
  end

  s.subspec 'PhotoLibrary' do |pl|
    pl.dependency 'SPPermission/Core'
    pl.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_PHOTOLIBRARY" }
  end

  s.subspec 'Notification' do |no|
    no.dependency 'SPPermission/Core'
    no.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_NOTIFICATION" }
  end

  s.subspec 'Microphone' do |mi|
    mi.dependency 'SPPermission/Core'
    mi.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_MICROPHONE" }
  end

  s.subspec 'Calendar' do |ca|
    ca.dependency 'SPPermission/Core'
    ca.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_CALENDAR" }
  end

  s.subspec 'Contacts' do |cn|
    cn.dependency 'SPPermission/Core'
    cn.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_CONTACTS" }
  end

  s.subspec 'Reminders' do |re|
    re.dependency 'SPPermission/Core'
    re.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_REMINDERS" }
  end

  s.subspec 'SpeechRecognizer' do |sr|
    sr.dependency 'SPPermission/Core'
    sr.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_SPEECH" }
  end

  s.subspec 'Location' do |lo|
    lo.dependency 'SPPermission/Core'
    lo.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_LOCATION" }
  end

  s.subspec 'Motion' do |mo|
    mo.dependency 'SPPermission/Core'
    mo.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_MOTION" }
  end

  s.subspec 'MediaLibrary' do |ml|
    ml.dependency 'SPPermission/Core'
    ml.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSION_MEDIALIBRARY" }
  end

end