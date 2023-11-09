# PermissionsKit 

Universal API for request permission and get its statuses — available `.authorized`, `.denied` & `.notDetermined`.

<p float="left">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/camera.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/photos.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/notifications.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/location.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/microphone.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/calendar.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/contacts.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/reminders.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/motion.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/music.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/speech.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/bluetooth.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/health.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/tracking.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/faceid.png" width="38">
    <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/siri.png" width="38">
</p>

### Community

<p float="left">
    <a href="https://twitter.com/sparrowcode_en">
        <img src="https://cdn.sparrowcode.io/github/badges/twitter-en.png?version=5" height="52">
    </a>
    <a href="https://twitter.com/sparrowcode_">
        <img src="https://cdn.sparrowcode.io/github/badges/twitter-ru.png?version=5" height="52">
    </a>
    <a href="https://t.me/sparrowcode_en">
        <img src="https://cdn.sparrowcode.io/github/badges/telegram-en.png?version=2" height="52">
    </a>
    <a href="https://t.me/sparrowcode">
        <img src="https://cdn.sparrowcode.io/github/badges/telegram-ru.png?version=2" height="52">
    </a>
        <a href="https://youtube.com/@sparrowcode">
        <img src="https://cdn.sparrowcode.io/github/badges/youtube-ru.png?version=1" height="52">
    </a>
    <a href="#apps-using">
        <img src="https://cdn.sparrowcode.io/github/badges/download-on-the-appstore.png?version=4" height="52">
    </a>
</p>

## Navigate

- [Permissions](#permissions)
- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [CocoaPods](#cocoapods)
- [Usage](#request-permission)
    - [Request Permission](#request-permission)
    - [Get Status Permission](#get-status-permission)
- [Keys in Info.plist](#keys-in-infoplist)
    - [Localisations](#localisation)
- [Apps Using](#apps-using)

### Permissions

| Icon |  Permission | Key for `Info.plist` | Get Status | Make Request |
| :--: | :---------- | :------------------- | :--------: | :----------: |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/bluetooth.png" width="38"> | Bluetooth | NSBluetoothAlwaysUsageDescription, NSBluetoothPeripheralUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/calendar.png" width="38"> | Calendar | NSCalendarsUsageDescription, NSCalendarsFullAccessUsageDescription, NSCalendarsWriteOnlyAccessUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/camera.png" width="38"> | Camera | NSCameraUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/contacts.png" width="38"> | Contacts | NSContactsUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/faceid.png" width="38"> | FaceID | NSFaceIDUsageDescription | ☑️ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/health.png" width="38"> | Health | NSHealthUpdateUsageDescription, NSHealthShareUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/location.png" width="38"> | Location | NSLocationAlwaysAndWhenInUseUsageDescription NSLocationWhenInUseUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/music.png" width="38"> | Media Library | NSAppleMusicUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/microphone.png" width="38"> | Microphone | NSMicrophoneUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/motion.png" width="38"> | Motion | NSMotionUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/notifications.png" width="38"> | Notification | | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/photos.png" width="38"> | Photo Library | NSPhotoLibraryUsageDescription, NSPhotoLibraryAddUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/reminders.png" width="38"> | Reminders | NSRemindersUsageDescription, NSRemindersFullAccessUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/siri.png" width="38"> | Siri | NSSiriUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/speech.png" width="38"> | Speech Recognizer | NSSpeechRecognitionUsageDescription | ✅ | ✅ |
| <img src="https://cdn.sparrowcode.io/github/permissionskit/icons/tracking.png" width="38"> | Tracking | NSUserTrackingUsageDescription | ✅ | ✅ |

## Installation

Ready to use on iOS 11+. Supports iOS, tvOS. Working with `UIKit` and `SwiftUI`.

### Swift Package Manager

In Xcode go to Project -> Your Project Name -> `Package Dependencies` -> Tap *Plus*. Insert url:

```
https://github.com/sparrowcode/PermissionsKit
```

Next, choose the permissions that you need. But don't add all of them, because apple will reject app.
Or adding it to the `dependencies` of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/sparrowcode/PermissionsKit", .upToNextMajor(from: "10.0.1"))
]
```

and choose valid targets.

### CocoaPods:

This is an outdated way. I advise you to use [SPM](#swift-package-manager). However, I will continue to support Cocoapods for some time.

<details><summary>Cocoapods Installation</summary>

[CocoaPods](https://cocoapods.org) is a dependency manager. For usage and installation instructions, visit their website. To integrate using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'PermissionsKit/NotificationPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
```

Due to Apple's new policy regarding permission access you need to specifically define what kind of permissions you want to access using subspecs.

```ruby
pod 'PermissionsKit/CameraPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/ContactsPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/CalendarPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/PhotoLibraryPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/NotificationPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/MicrophonePermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/RemindersPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/SpeechRecognizerPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/LocationWhenInUsePermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/LocationAlwaysPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/MotionPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/MediaLibraryPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/BluetoothPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/TrackingPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/FaceIDPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/SiriPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
pod 'PermissionsKit/HealthPermission', :git => 'https://github.com/sparrowcode/PermissionsKit'
```
</details>

## Request Permission

```swift
import PermissionsKit
import NotificationPermission

Permission.notification.request {
    
}
```

## Get Status Permission

```swift
import PermissionsKit
import NotificationPermission

let authorized = Permission.notification.authorized
```

> **Warning**
> For FaceID permission no way detect if request `.authorized` or `.notDetermined` accurate. Status `.denied` detect well. For now for both states return `.notDetermined`. 

## Keys in `Info.plist`

You need to add some strings to the `Info.plist` file with descriptions per Apple's requirements. You can get a plist of keys for permissions as follows:

```swift
let key = Permission.bluetooth.usageDescriptionKey
```

> **Warning**
> Do not use the description as the name of the key. Xcode can't build this.

### Localisation

If you use xliff localization export, keys will be create automatically. If you prefer do the localization file manually, you need to create `InfoPlist.strings`, select languages on the right side menu and add keys as keys in plist-file. See:

```
"NSCameraUsageDescription" = "Here description of usage camera";
```

## Apps Using

<p float="left">
    <a href="https://apps.apple.com/app/id1487937127"><img src="https://cdn.sparrowcode.io/github/apps-using/id1487937127.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1624477055"><img src="https://cdn.sparrowcode.io/github/apps-using/id1624477055.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1625641322"><img src="https://cdn.sparrowcode.io/github/apps-using/id1625641322.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1625641322"><img src="https://cdn.sparrowcode.io/github/apps-using/id6449774982.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id875280793"><img src="https://cdn.sparrowcode.io/github/apps-using/id875280793.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id743843090"><img src="https://cdn.sparrowcode.io/github/apps-using/id743843090.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id537070378"><img src="https://cdn.sparrowcode.io/github/apps-using/id537070378.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1617055933"><img src="https://cdn.sparrowcode.io/github/apps-using/id1617055933.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1596657751"><img src="https://cdn.sparrowcode.io/github/apps-using/id1596657751.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1459483980"><img src="https://cdn.sparrowcode.io/github/apps-using/id1459483980.png?version=2" height="65"></a>
    <a href="https://apps.apple.com/app/id1544749600"><img src="https://cdn.sparrowcode.io/github/apps-using/id1544749600.png" height="65"></a>
    <a href="https://apps.apple.com/app/id6452079114"><img src="https://cdn.sparrowcode.io/github/apps-using/id6452079114.png" height="65"></a>
</p>

If you use a `PermissionsKit`, add your app via Pull Request.
