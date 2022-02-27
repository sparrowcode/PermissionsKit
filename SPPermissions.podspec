Pod::Spec.new do |s|

  s.name = "SPPermissions"
  s.version = "7.1.5"
  s.summary = "Ask permissions with ready-use interface. You can check status permission and if it has been requested before. Support SwiftUI."
  s.homepage = "https://github.com/ivanvorobei/SPPermissions"
  s.source = { :git => "https://github.com/ivanvorobei/SPPermissions.git", :tag => s.version }
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Ivan Vorobei" => "hello@ivanvorobei.io" }

  s.requires_arc = true
  s.ios.framework = 'UIKit'
  s.tvos.framework = 'UIKit'
  s.swift_version = ['4.2', '5.0']
  s.ios.deployment_target = "11.0"
  s.tvos.deployment_target = "11.0"

  s.default_subspec = 'Core'

  s.subspec 'Core' do |subspec|
    subspec.source_files  = "Sources/SPPermissions/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_COCOAPODS"
    }
    subspec.resource_bundles = {
        "SPPermissions" => [
            "Sources/SPPermissions/Resources/Localization/*.lproj/*.strings",
            "Sources/SPPermissions/Resources/Assets.xcassets",
        ]
    }
  end

  s.subspec 'Camera' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsCamera/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_CAMERA SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'PhotoLibrary' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsPhotoLibrary/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_PHOTOLIBRARY SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'Notification' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsNotification/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_NOTIFICATION SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'Microphone' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsMicrophone/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_MICROPHONE SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'Calendar' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsCalendar/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_CALENDAR SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'Contacts' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsContacts/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_CONTACTS SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'Reminders' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsReminders/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_REMINDERS SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'SpeechRecognizer' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsSpeechRecognizer/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_SPEECH SPPERMISSIONS_COCOAPODS"
    }
  end
  
  s.subspec 'LocationExtension' do |subspec|
    subspec.source_files = "Sources/SPPermissionsLocationExtension/**/*.swift"
  end

  s.subspec 'LocationWhenInUse' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.dependency 'SPPermissions/LocationExtension'
    subspec.source_files = "Sources/SPPermissionsLocationWhenInUse/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_LOCATION_WHENINUSE SPPERMISSIONS_COCOAPODS"
    }
  end
  
  s.subspec 'LocationAlways' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.dependency 'SPPermissions/LocationExtension'
    subspec.source_files = "Sources/SPPermissionsLocationAlways/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_LOCATION_ALWAYS SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'Motion' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsMotion/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_MOTION SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'Music' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsMusic/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_MUSIC SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'Bluetooth' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsBluetooth/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_BLUETOOTH SPPERMISSIONS_COCOAPODS"
    }
  end

  s.subspec 'Tracking' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsTracking/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_TRACKING SPPERMISSIONS_COCOAPODS"
    }
  end
  
  s.subspec 'FaceID' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsFaceID/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_FACEID SPPERMISSIONS_COCOAPODS"
    }
  end
  
  s.subspec 'Siri' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsSiri/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_SIRI SPPERMISSIONS_COCOAPODS"
    }
  end
  
  s.subspec 'Health' do |subspec|
    subspec.dependency 'SPPermissions/Core'
    subspec.source_files = "Sources/SPPermissionsHealth/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "SPPERMISSIONS_HEALTH SPPERMISSIONS_COCOAPODS"
    }
  end
end
