# SPPermissions

<img align="left" src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Readme/Preview - 5.0.jpg" width="420"/>

### About
Library for ask permissions.  You can check state of permissions, available `.authorized`, `.denied` & `.notDetermined`.

Available ready-use controllers for reqeust permissions: list, dialog & native. Support iPad, dark mode and RTL. Interface in an Apple style.  For beginner see [Quick Start](#quick-start).

If you like the project, don't forget to `put star ★` and follow me on GitHub:

[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/Readme/blob/main/Buttons/follow-me-ivanvorobei.svg)](https://github.com/ivanvorobei)

## Navigate

- [Installation](#installation)
    - [Swift Package Manager](#swift-package-manager)
    - [CocoaPods](#cocoapods)
    - [Manually](#manually)
- [Imports](#imports)
- [Quick Start](#quick-start)
- [Usage](#usage)
    - [Dialog](#dialog)
    - [List](#list)
    - [Native](#native)
- [Permissions](#permissions)
- [DataSource](#datasource)
    - [Denied alert](#denied-alert)
- [Delegate](#delegate)
- [Localizations](#localizations)
- [Keys in Info.plist](#keys-in-infoplist)
- [FAQ](#faq)
- [Other Projects](#other-projects)
- [Russian Community](#russian-community)

## Installation

Ready for use on iOS 11+. Support iOS, tvOS and SwiftUI. Works with Swift 5+. Required Xcode 12.5 and higher.

<img align="right" src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Readme/SPM%20Install%20Preview.png" width="490"/>

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

To integrate `SPPermissions` into your Xcode project using Xcode 12, specify it in `File > Swift Packages > Add Package Dependency...`:

```ogdl
https://github.com/ivanvorobei/SPPermissions
```

Next choose permissions, which you need. Don't add all permissions, becouse apple will reject you app.

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `SPPermissions` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPPermissions/Notification'
```

Due to Apple's new policy regarding permission access you need to specifically define what kind of permissions you want to access using subspecs. For example if you want to access `Camera`, `Location` & `Microphone` you define the following:

```ruby
pod 'SPPermissions/Camera'
pod 'SPPermissions/LocationAlways'
pod 'SPPermissions/Microphone'
```

<details><summary>Available subspecs</summary>
<p>

```ruby
pod 'SPPermissions/Camera'
```
```ruby
pod 'SPPermissions/Contacts'
```
```ruby
pod 'SPPermissions/Calendar'
```
```ruby
pod 'SPPermissions/PhotoLibrary'
```
```ruby
pod 'SPPermissions/Notification'
```
```ruby
pod 'SPPermissions/Microphone'
```
```ruby
pod 'SPPermissions/Reminders'
```
```ruby
pod 'SPPermissions/SpeechRecognizer'
```
```ruby
pod 'SPPermissions/LocationWhenInUse'
```
```ruby
pod 'SPPermissions/LocationAlways'
```
```ruby
pod 'SPPermissions/Motion'
```
```ruby
pod 'SPPermissions/MediaLibrary'
```
```ruby
pod 'SPPermissions/Bluetooth'
```
```ruby
pod 'SPPermissions/Tracking'
```

</p>
</details>

### Manually

If you prefer not to use any of dependency managers, you can integrate `SPPermissions` into your project manually. Copy code and add compile flags from [CONTRIBUTING.md](https://github.com/ivanvorobei/SPPermissions/CONTRIBUTING.md) file.

## Imports

If you install via  [Swift Package Manager](#swift-package-manager), you shoud import each module:

```swift
import SPPermissions
import SPPermissionsCamera
import SPPermissionsPhotoLibrary
```

If you install via [CocoaPods](#cocoapods), you shoud simple import  one class:

```swift
import SPPermissions
```

Its required becouse library split to modules. After import you see available permission by typing `SPPermissions.Permission.camera` for example.

## Quick Start

```swift
// 1. Choose permissions, which you need:
let permissions: [SPPermissions.Permission] = [.camera, .notification]

// 2. Choose present style:
// 2a. List Style
let controller = SPPermissions.list(permissions)
controller.present(on: self)

// 2b. Dialog Style
let controller = SPPermissions.dialog(permissions)
controller.present(on: self)

// 2c. Native Style
let controller = SPPermissions.native(permissions)
controller.present(on: self)

// 3. Optional: Check permission state (available `authorized`, `denied`, `notDetermined`):
let authorized = SPPermissions.Permission.calendar.authorized
```

For more details check [usage](#usage) section.

## Usage

Now available 3 present styles: `Dialog`, `List` and `Native`. Each interface has delegates and a data source. If you want see an example app, open `Example Apps/SPPermissions.xcodeproj`.

### Dialog

This is a modal alert. I recommend to use of this alert style when your requested permissions are less than three. Usage example:

```swift
let controller = SPPermissions.dialog([.camera, .photoLibrary])

// Ovveride texts in controller
controller.titleText = "Title Text"
controller.headerText = "Header Text"
controller.footerText = "Footer Text"

// Set `DataSource` or `Delegate` if need. 
// By default using project texts and icons.
controller.dataSource = self
controller.delegate = self

// Always use this method for present
controller.present(on: self)
```

### List

Native `UITableViewController` with support for the iPad. Use it with more than two permissions. An example of how it is used:

```swift
let controller = SPPermissions.list([.calendar, .camera, .contacts])

// Ovveride texts in controller
controller.titleText = "Title Text"
controller.headerText = "Header Text"
controller.footerText = "Footer Text"

// Set `DataSource` or `Delegate` if need. 
// By default using project texts and icons.
controller.dataSource = self
controller.delegate = self

// Always use this method for present
controller.present(on: self)
```

### Native

Request permissions with native alerts. You can request many permissions at once:

```swift
let controller = SPPermissions.native([.calendar, .camera, .contacts])

// Set `Delegate` if need. 
controller.delegate = self

// Always use this method for request. 
controller.present(on: self)
```
## Permissions

<p float="left">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Camera.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Photos.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Notifications.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Locations.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Microphone.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Calendar.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Contacts.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Reminders.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Motion.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Media.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Speech.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Permissions/Bluetooth.svg" width="105">
</p>

To check the state of any permission, call `SPPermissions.Permission`: 

```swift
let authorized = SPPermissions.Permission.calendar.authorized
```

Also available `denied` & `notDetermined`.

## DataSource

For data source using protocol `SPPermissionsDataSource`. You can customise cell for permission or provide denied alert texts.

```swift
extension Controller: SPPermissionsDataSource {
    
    func configure(_ cell: SPPermissionsTableViewCell, for permission: SPPermissions.Permission) {
        // Here you can customise cell, like texts or colors.
    }
}
```

<img align="left" src="https://github.com/ivanvorobei/SPPermissions/blob/main/Assets/Readme/Preview%20-%20Denied%20Alert.png" width="320"/>

### Denied alert

If permission denied, you can provide alert to user for propose open settings. Here you can customise text of it alert:

```swift
let texts = SPPermissionDeniedAlertTexts()
texts.titleText = "Permission denied"
texts.descriptionText = "Please, go to Settings and allow permission."
texts.buttonText = "Settings"
texts.cancelText = "Cancel"
```

Next implement method and return:

```swift
func deniedAlertTexts(for permission: SPPermissions.Permission) -> SPPermissionDeniedAlertTexts? {
    
    // Custom texts:
    return texts
    
    // or default texts:
    // return .default
}
```

## Delegate

For get events about hide, allowed or denied, set delegate of protocol `SPPermissionsDelegate`:

```swift
extension Controller: SPPermissionsDelegate {
    
    func didHidePermissions(_ permissions: [SPPermissions.Permission]) {}
    func didAllowPermission(_ permission: SPPermissions.Permission) {}
    func didDeniedPermission(_ permission: SPPermissions.Permission) {}
}
```

## Localizations

App has ready-use localisation stirngs for `en`, `ar` & `ru`. If you want add more, please, create folder `language-id.lproj` and make pull request.

If you want use your custom strings, check [DataSource](#datasource) section.

## Keys in Info.plist

You need to add some keys to the `Info.plist` file with descriptions. List of keys:

- NSCameraUsageDescription
- NSContactsUsageDescription
- NSCalendarsUsageDescription
- NSMicrophoneUsageDescription
- NSAppleMusicUsageDescription
- NSSpeechRecognitionUsageDescription
- NSMotionUsageDescription
- NSLocationWhenInUseUsageDescription
- NSLocationAlwaysAndWhenInUseUsageDescription
- NSLocationAlwaysUsageDescription (iOS 10 and earlier)
- NSBluetoothAlwaysUsageDescription
- NSBluetoothPeripheralUsageDescription (iOS 12 and earlier)
- NSUserTrackingUsageDescription

Do not use the description as the name of the key.

If you use xliff localization export, keys will be create automatically. If you prefer do the localization file manually, you need to create `InfoPlist.strings`, select languages in the right side menu and add keys as keys in plist-file. See:

```
"NSCameraUsageDescription" = "Here description of usage camera";
```

## FAQ

### Why library looks complex and have modules? 

Apple reject app with you import all frameworks and not request it. `SPPermissions` imported only code, which you choose. Support moduls struct is hard and may looks complex. I tried to make using the library as simple as possible.

### Why I not see permission?

Check imports if you install via [Swift Package Manager](#swift-package-manager). If you install via [CocoaPods](#cocoapods), you podfile shoud have second path with module name.

### I want make PR

Thanks for contribution! Please, support code style and test `iOS` and `tvOS` versions before. For more details about codestyle see [AGREEMENTS.md](https://github.com/ivanvorobei/SPPermissions/AGREEMENTS.md).

## Other Projects

#### [SPAlert](https://github.com/ivanvorobei/SPAlert)
You can find this alerts in AppStore after feedback or after added song to library in Apple Music. Contains popular Done, Heart presets and many other. Done preset present with draw path animation like original. Also available simple present message without icon. Usage in one line code.

#### [SPPerspective](https://github.com/ivanvorobei/SPPerspective)
Animation of widgets from iOS 14. 3D transform with dynamic shadow. Look [video preview](https://ivanvorobei.by/github/spperspective/video-preview). Available deep customisation 3D and shadow. Also you can use static transform without animation.

#### [SPDiffable](https://github.com/ivanvorobei/SPDiffable)
Simplifies working with animated changes in table and collections. Apple's diffable API required models for each object type. If you want use it in many place, you pass time to implement it and get over duplicates codes. This project help do it elegant with shared models and special cell providers. Support side bar iOS14 and already has native cell providers and views.

#### [SparrowKit](https://github.com/ivanvorobei/SparrowKit)
Collection of native Swift extensions to boost your development. Support tvOS and watchOS.

## Russian Community

В телеграм-канале [Код Воробья](https://sparrowcode.by/telegram) пишу о iOS разработке. Помощь можно найти в [нашем чате](https://sparrowcode.by/telegram/chat).
Видео-туториалы выклыдываю на [YouTube](https://sparrowcode.by/youtube):

[![Tutorials on YouTube](https://cdn.ivanvorobei.by/github/readme/youtube-preview.jpg)](https://sparrowcode.by/youtube)


