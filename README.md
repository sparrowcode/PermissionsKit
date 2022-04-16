# PermissionsKit

<p aligment="left">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/v8/list-style.png?version=1" height="260"/>
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/v8/dialog-style.png?version=1" height="260"/>
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/v8/native-request.png?version=1" height="260"/>
</p>

Availalbe three ready-use interface - list, dialog & native. Supports iPad, dark mode and has ready localizations. Also you can check state of permissions, available are `.authorized`, `.denied` & `.notDetermined`.

<p float="left">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/camera.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/photos.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/notifications.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/location.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/microphone.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/calendar.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/contacts.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/reminders.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/motion.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/music.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/speech.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/bluetooth.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/health.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/tracking.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/faceid.png" width="38">
    <img src="https://cdn.sparrowcode.io/frameworks/permissionskit/icons/siri.png" width="38">
</p>

### Comunity

<p float="left">
    <a href="https://discord.gg/BfZQUG6pnh">
        <img src="https://cdn.sparrowcode.io/github/badges/discord.png?version=1" height="47">
    </a>
    <a href="https://github.com/sponsors/sparrowcode">
        <img src="https://cdn.sparrowcode.io/github/badges/github-sponsorship.png?version=1" height="47">
    </a>
    <a href="https://sparrowcode.io/telegram/chat">
        <img src="https://cdn.sparrowcode.io/github/badges/sparrowcode-telegram-chat.png?version=1" height="47">
    </a>
</p>

## Navigate

- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [CocoaPods](#cocoapods)
    - [Manually](#manually)
- [Imports](#imports)
- [Quick Start](#quick-start)
- [Status](#status)
    - [Location](#location)
- [Request](#request)
    - [List](#list)
    - [Dialog](#dialog)
    - [Native](#native)
- [DataSource](#datasource)
    - [Denied alert](#denied-alert)
- [Delegate](#delegate)
- [Localizations](#localizations)
- [Keys in Info.plist](#keys-in-infoplist)
- [Apple Review](#apple-review)

## Installation

Ready to use on iOS 11+. Supports iOS, tvOS, and `SwiftUI`.

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

Once you have your Swift package set up, adding as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/ivanvorobei/PermissionsKit", .upToNextMajor(from: "8.0.0"))
]
```

Next choose the permissions you need. But don't add all of them, because apple [will reject app](#apple-review).

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager. For usage and installation instructions, visit their website. To integrate using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'PermissionsKit/Notification', :git => 'https://github.com/sparrowcode/PermissionsKit'
```

Due to Apple's new policy regarding permission access you need to specifically define what kind of permissions you want to access using subspecs. For example if you want to access `Camera`, `Location` & `Microphone` you define the following:

```ruby
pod 'PermissionsKit/Camera'
pod 'PermissionsKit/LocationAlways'
pod 'PermissionsKit/Microphone'
```

<details><summary>Subspecs</summary>
<p>

```ruby
pod 'PermissionsKit/Camera'
```
```ruby
pod 'PermissionsKit/Contacts'
```
```ruby
pod 'PermissionsKit/Calendar'
```
```ruby
pod 'PermissionsKit/PhotoLibrary'
```
```ruby
pod 'PermissionsKit/Notification'
```
```ruby
pod 'PermissionsKit/Microphone'
```
```ruby
pod 'PermissionsKit/Reminders'
```
```ruby
pod 'PermissionsKit/SpeechRecognizer'
```
```ruby
pod 'PermissionsKit/LocationWhenInUse'
```
```ruby
pod 'PermissionsKit/LocationAlways'
```
```ruby
pod 'PermissionsKit/Motion'
```
```ruby
pod 'PermissionsKit/Music'
```
```ruby
pod 'PermissionsKit/Bluetooth'
```
```ruby
pod 'PermissionsKit/Tracking'
```
```ruby
pod 'PermissionsKit/FaceID'
```
```ruby
pod 'PermissionsKit/Siri'
```
```ruby
pod 'PermissionsKit/Health'
```

</p>
</details>

### Manually

If you prefer not to use any of dependency managers, you can integrate `PermissionsKit`  manually. Copy code and add compile flags from [CONTRIBUTING.md](https://github.com/sparrowcode/PermissionsKit/blob/main/CONTRIBUTING.md) file.

## Imports

If you install via  [Swift Package Manager](#swift-package-manager), you shoud import each module:

```swift
import PermissionsKit
import PermissionsKitCamera
import PermissionsKitPhotoLibrary
```

It's required because library split to modules. After importing you'll see available permissions by typing `Permission.camera` for example.
If you install via [CocoaPods](#cocoapods), you only need to import one class:

```swift
import PermissionsKit
```

All other installed classes imported automatically.

## Quick Start

```swift

// MARK: 1. Choose the permissions you need:

let permissions: [Permission] = [.camera, .notification]

// MARK: 2. Choose present style:

// 2a. List Style
let controller = PermissionsKit.list(permissions)
controller.present(on: self)

// 2b. Dialog Style
let controller = PermissionsKit.dialog(permissions)
controller.present(on: self)

// 2c. Native Style
let controller = PermissionsKit.native(permissions)
controller.present(on: self)

// MARK: 3. Optional: Check permission state (available `authorized`, `denied`, `notDetermined`):

let authorized = Permission.calendar.authorized
```

For more details see [Request](#Request) section.

## Status

To check the state of any permission, call `Permission` model: 

```swift
let authorized = Permission.calendar.authorized
```

Also available are status for `denied` & `notDetermined`.

### Location

For location user can granted `precise` or not. For get state for it, call this:

```swift
if Permission.locationWhenInUse.isPrecise { ... }
```

Same for `.locationAlways`.

## Request

`PermissionsKit` has three presentation styles: `Dialog`, `List` and `Native`. Each interface has delegates and a data source. If you want see an example app, open `Example Apps/PermissionsKit.xcodeproj`.

### List

It's native `UITableViewController`. Use it when you have more than two permissions. An example of how it is used:

```swift
let controller = PermissionsKit.list([.calendar, .camera, .contacts])

// Ovveride texts in controller
controller.titleText = "Title Text"
controller.headerText = "Header Text"
controller.footerText = "Footer Text"

// Set `DataSource` or `Delegate` if need. 
// By default using project texts and icons.
controller.dataSource = self
controller.delegate = self

// If you want auto dismiss controler,
// when all permissions has any determinated state
// set dismiss mode `allPermissionsDeterminated`.
// By default dismiss controller happen only when all permission allowed.
controller.dismissCondition = .allPermissionsDeterminated

// Always use this method for present
controller.present(on: self)
```

### Dialog

This is a modal alert. I recommend using this alert style when you have less than three requested permissions. Usage example:

```swift
let controller = PermissionsKit.dialog([.camera, .photoLibrary])

// Override texts in controller
controller.titleText = "Title Text"
controller.headerText = "Header Text"
controller.footerText = "Footer Text"

// Set `DataSource` or `Delegate` if need. 
// By default using project texts and icons.
controller.dataSource = self
controller.delegate = self

// If you want auto dismiss controler,
// when all permissions has any determinated state
// set dismiss mode `allPermissionsDeterminated`.
// By default dismiss controller happen only when all permission allowed.
controller.dismissCondition = .allPermissionsDeterminated

// Always use this method for present
controller.present(on: self)
```

### Native

Request permissions with native `UIAlertController`. You can request many permissions at once:

```swift
let controller = PermissionsKit.native([.calendar, .camera, .contacts])

// Set `Delegate` if need. 
controller.delegate = self

// Always use this method for request. 
controller.present(on: self)
```

## DataSource

For data source using protocol `PermissionsDataSource`. You can customize the permission cells and provide denied alert texts.

```swift
extension Controller: PermissionsDataSource {
    
    func configure(_ cell: PermissionTableViewCell, for permission: Permission) {
        
        // Here you can customise cell, like texts or colors.
        cell.permissionTitleLabel.text = "Title"
        cell.permissionDescriptionLabel.text = "Description"
        
        // If you need change icon, choose one of this:
        cell.permissionIconView.setPermissionType(.bluetooth)
        cell.permissionIconView.setCustomImage(UIImage.init(named: "custom-name"))
        cell.permissionIconView.setCustomView(YourView())
    }
}
```

### Denied alert

If a permission is denied, you can provide an alert to the user with an option to open settings. An example of how you can customise the alert text:

```swift
let texts = PermissionDeniedAlertTexts()
texts.titleText = "Permission denied"
texts.descriptionText = "Please, go to Settings and allow permission."
texts.actionText = "Settings"
texts.cancelText = "Cancel"
```

Next implement the following method and return:

```swift
func deniedAlertTexts(for permission: Permission) -> PermissionDeniedAlertTexts? {
    
    // Custom texts:
    return texts
    
    // or default texts:
    // return .default
}
```

## Delegate

To get `hidden`, `allowed` or `denied` events , set the delegate with protocol `PermissionsDelegate`:

```swift
extension Controller: PermissionsDelegate {
    
    func didHidePermissions(_ permissions: [Permission]) {}
    func didAllowPermission(_ permission: Permission) {}
    func didDeniedPermission(_ permission: Permission) {}
}
```

## Localizations

`PermissionsKit` has ready-to-use localizations for:

- English `en`
- Arabic `ar`
- German `de`
- Spanish `es`
- French `fr`
- Polish `pl`
- Portuguese `pt`
- Ukrainian `uk`
- Russian `ru`
- Chinese Simplified Han `zh_Hans`
- Italian `it`
- Chinese Traditional `zh_Hant`
- Persian `fa`

If you want to add more, please, create folder `[language_id].lproj` and make a pull request. If you want to use your custom strings, check the [DataSource](#datasource) section.

## Keys in Info.plist

You need to add some keys to the `Info.plist` file with descriptions, per Apple's requirement(s). You can get a plist of keys for permissions as follows:

```swift
let key = Permission.bluetooth.usageDescriptionKey
```

List of keys:

- NSCameraUsageDescription
- NSContactsUsageDescription
- NSCalendarsUsageDescription
- NSMicrophoneUsageDescription
- NSAppleMusicUsageDescription
- NSRemindersUsageDescription
- NSPhotoLibraryUsageDescription
- NSPhotoLibraryAddUsageDescription
- NSSpeechRecognitionUsageDescription
- NSMotionUsageDescription
- NSLocationWhenInUseUsageDescription
- NSLocationAlwaysAndWhenInUseUsageDescription
- NSBluetoothAlwaysUsageDescription
- NSBluetoothPeripheralUsageDescription (iOS 12 and earlier)
- NSUserTrackingUsageDescription
- NSFaceIDUsageDescription
- NSSiriUsageDescription
- NSHealthUpdateUsageDescription
- NSHealthShareUsageDescription

Do not use the description as the name of the key.

If you use xliff localization export, keys will be create automatically. If you prefer do the localization file manually, you need to create `InfoPlist.strings`, select languages on the right side menu and add keys as keys in plist-file. See:

```
"NSCameraUsageDescription" = "Here description of usage camera";
```

## Apple Review

Apple changed its review guidelines in June 2021. When requesting permissions, apps should require users to always request and make a decision whether to allow or decline the permission. For this reason, the close button in `PermissionsKit` is hidden by default. If you want to force show the close button, run the following code:

```swift
// Show & hide close button
controller.showCloseButton = true

// Enable or Disable drag intercation
controller.allowSwipeDismiss = true
```

Also changed title for button. Instead of  `allow` now using `continue`. The Apple Review Team asked for this. For details, check out [this issue](https://github.com/sparrowcode/PermissionsKit/issues/229). 