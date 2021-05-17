Pod::Spec.new do |s|

  s.name          = "SPPermissions"
  s.version       = "6.0.2"
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

  s.subspec 'Core' do |subspec|
    subspec.source_files  = "Sources/SPPermissions/**/*.swift"
    subspec.resource_bundles = {
        "SPPermissions" => ["Sources/SPPermissions/Resources/*.lproj/*.strings"]
    }
  end

  s.subspec 'Camera' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsCamera/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_CAMERA" }
  end

  s.subspec 'PhotoLibrary' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsPhotoLibrary/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_PHOTOLIBRARY" }
  end

  s.subspec 'Notification' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsNotification/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_NOTIFICATION" }
  end

  s.subspec 'Microphone' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsMicrophone/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_MICROPHONE" }
  end

  s.subspec 'Calendar' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsCalendar/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_CALENDAR" }
  end

  s.subspec 'Contacts' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsContacts/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_CONTACTS" }
  end

  s.subspec 'Reminders' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsReminders/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_REMINDERS" }
  end

  s.subspec 'SpeechRecognizer' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsSpeechRecognizer/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_SPEECH" }
  end

  s.subspec 'LocationWhenInUse' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsLocationWhenInUse/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_LOCATION_WHENINUSE" }
  end
  
  s.subspec 'LocationAlways' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsLocationAlways/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_LOCATION_ALWAYS" }
  end

  s.subspec 'Motion' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsMotion/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_MOTION" }
  end

  s.subspec 'MediaLibrary' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsMediaLibrary/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_MEDIALIBRARY" }
  end

  s.subspec 'Bluetooth' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsBluetooth/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_BLUETOOTH" }
  end

  s.subspec 'Tracking' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsTracking/**/*.swift"
    subspec.pod_target_xcconfig = { "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_TRACKING" }
  end

end
