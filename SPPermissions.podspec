Pod::Spec.new do |s|

  s.name          = "SPPermissions"
  s.version       = "6.0.0"
  s.summary       = "Ask permissions on Swift. Available List, Dialog & Native interface. Can check state permission."
  s.homepage      = "https://github.com/ivanvorobei/SPPermissions"
  s.source        = { :git => "https://github.com/ivanvorobei/SPPermissions.git", :tag => s.version }
  s.license       = { :type => "MIT", :file => "LICENSE" }

  s.author        = { "Ivan Vorobei" => "hello@ivanvorobei.by" }

  s.requires_arc = true
  s.ios.framework = 'UIKit'
  s.tvos.framework = 'UIKit'
  s.swift_version = ['4.2', '5.0']
  s.ios.deployment_target = "11.0"
  s.tvos.deployment_target = "11.0"

  s.default_subspec = 'Core'

  s.subspec 'Core' do |co|
    co.source_files  = "Sources/SPPermissions/**/*.swift"
  end

  s.subspec 'Camera' do |cm|
    cm.dependency 'SPPermissions/Core'
    cm.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_CAMERA" }
  end

  s.subspec 'PhotoLibrary' do |pl|
    pl.dependency 'SPPermissions/Core'
    pl.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_PHOTOLIBRARY" }
  end

  s.subspec 'Notification' do |no|
    no.dependency 'SPPermissions/Core'
    no.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_NOTIFICATION" }
  end

  s.subspec 'Microphone' do |mi|
    mi.dependency 'SPPermissions/Core'
    mi.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_MICROPHONE" }
  end

  s.subspec 'Calendar' do |ca|
    ca.dependency 'SPPermissions/Core'
    ca.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_CALENDAR" }
  end

  s.subspec 'Contacts' do |cn|
    cn.dependency 'SPPermissions/Core'
    cn.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_CONTACTS" }
  end

  s.subspec 'Reminders' do |re|
    re.dependency 'SPPermissions/Core'
    re.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_REMINDERS" }
  end

  s.subspec 'SpeechRecognizer' do |sr|
    sr.dependency 'SPPermissions/Core'
    sr.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_SPEECHRECOGNIZER" }
  end

  s.subspec 'Location' do |lo|
    lo.dependency 'SPPermissions/Core'
    lo.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_LOCATION" }
  end

  s.subspec 'Motion' do |mo|
    mo.dependency 'SPPermissions/Core'
    mo.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_MOTION" }
  end

  s.subspec 'MediaLibrary' do |ml|
    ml.dependency 'SPPermissions/Core'
    ml.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_MEDIALIBRARY" }
  end

  s.subspec 'Bluetooth' do |bl|
    bl.dependency 'SPPermissions/Core'
    bl.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_BLUETOOTH" }
  end

  s.subspec 'Tracking' do |tr|
    tr.dependency 'SPPermissions/Core'
    tr.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_TRACKING" }
  end

end
