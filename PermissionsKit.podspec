Pod::Spec.new do |s|

  s.name = "PermissionsKit"
  s.version = "8.0.0"
  s.summary = "Ask permissions with ready-use interface. You can check status permission and if it has been requested before. Support SwiftUI."
  s.homepage = "https://github.com/sparrowcode/PermissionsKit"
  s.source = { :git => "https://github.com/sparrowcode/PermissionsKit.git", :tag => s.version }
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Sparrow Code" => "hello@sparrowcode.io" }

  s.requires_arc = true
  s.ios.framework = 'UIKit'
  s.tvos.framework = 'UIKit'
  s.swift_version = ['4.2', '5.0']
  s.ios.deployment_target = "11.0"
  s.tvos.deployment_target = "11.0"

  s.default_subspec = 'Core'

  s.subspec 'Core' do |subspec|
    subspec.source_files  = "Sources/PermissionsKit/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_COCOAPODS"
    }
    subspec.resource_bundles = {
        "PermissionsKit" => [
            "Sources/PermissionsKit/Resources/Localization/*.lproj/*.strings",
            "Sources/PermissionsKit/Resources/Assets.xcassets",
        ]
    }
  end

  s.subspec 'Camera' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/CameraPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_CAMERA PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'PhotoLibrary' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/PhotoLibraryPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_PHOTOLIBRARY PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'Notification' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/NotificationPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_NOTIFICATION PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'Microphone' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/MicrophonePermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_MICROPHONE PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'Calendar' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/CalendarPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_CALENDAR PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'Contacts' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/ContactsPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_CONTACTS PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'Reminders' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/RemindersPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_REMINDERS PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'SpeechRecognizer' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/SpeechRecognizerPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_SPEECH PERMISSIONSKIT_COCOAPODS"
    }
  end
  
  s.subspec 'LocationExtension' do |subspec|
    subspec.source_files = "Sources/LocationExtension/**/*.swift"
  end

  s.subspec 'LocationWhenInUse' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.dependency 'PermissionsKit/LocationExtension'
    subspec.source_files = "Sources/LocationWhenInUsePermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_LOCATION_WHENINUSE PERMISSIONSKIT_COCOAPODS"
    }
  end
  
  s.subspec 'LocationAlways' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.dependency 'PermissionsKit/LocationExtension'
    subspec.source_files = "Sources/LocationAlwaysPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_LOCATION_ALWAYS PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'Motion' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/MotionPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_MOTION PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'MediaLibrary' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/MediaLibraryPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_MEDIA_LIBRARY PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'Bluetooth' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/BluetoothPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_BLUETOOTH PERMISSIONSKIT_COCOAPODS"
    }
  end

  s.subspec 'Tracking' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/TrackingPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_TRACKING PERMISSIONSKIT_COCOAPODS"
    }
  end
  
  s.subspec 'FaceID' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/FaceIDPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_FACEID PERMISSIONSKIT_COCOAPODS"
    }
  end
  
  s.subspec 'Siri' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/SiriPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_SIRI PERMISSIONSKIT_COCOAPODS"
    }
  end
  
  s.subspec 'Health' do |subspec|
    subspec.dependency 'PermissionsKit/Core'
    subspec.source_files = "Sources/HealthPermission/**/*.swift"
    subspec.pod_target_xcconfig = {
        "SWIFT_ACTIVE_COMPILATION_CONDITIONS"  => "PERMISSIONSKIT_HEALTH PERMISSIONSKIT_COCOAPODS"
    }
  end
end
