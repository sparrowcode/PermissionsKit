# SPPermissions

<img align="left" src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Readme/Preview.gif" width="480"/>

### About
API to ask for permissions on Swift. Available table, dialog & native. Available check state permissions. I do UI in **Apple style**. 

Visit my store for iOS developers:

[![xcode-shop.com](https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Buttons/xcode-shop.svg)](https://xcode-shop.com)

If you like the project, do not forget to `put star ★` and follow me on GitHub:

[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Buttons/follow-me-on-github.svg)](https://github.com/ivanvorobei)

If you want help project, see [Сooperation](#сooperation) section or our [chat](https://t.me/sppermissions).

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
    - [CocoaPods](#cocoapods)
    - [Carthage](#carthage)
    - [Manually](#manually)
- [Usage](#usage)
    - [Dialog](#dialog)
    - [List](#list)
    - [Native](#native)
- [Examples Code](#examples-code)
- [Permissions](#permissions)
- [Keys in Info.plist](#keys-in-infoplist)
- [Localization](#localization)
- [Сooperation](#сooperation)
- [How I do UI](#how-i-do-UI)
- [License](#license)

## Requirements

Swift `4.2` & `5.0`. Ready for use on iOS 10+

## Installation

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `SPPermissions` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPPermissions/Notification', :git => 'https://github.com/ivanvorobei/SPPermissions.git', :branch => 'version-5'
```

Due to Apple's new policy regarding permission access you need to specifically define what kind of permissions you want to access using subspecs. For example if you want to access `Camera`, `Location` & `Microphone` you define the following:

```ruby
pod 'SPPermissions/Camera'
pod 'SPPermissions/Location'
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
pod 'SPPermissions/Location'
```
```ruby
pod 'SPPermissions/Motion'
```
```ruby
pod 'SPPermissions/MediaLibrary'
```

</p>
</details>

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate `SPPermissions` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "ivanvorobei/SPPermissions"
```

By default available all permissions. You can provide custom build flags _before_ building the dynamic framework to only compile
with permissions you request. Open file [Configuration.xcconfig](https://github.com/ivanvorobei/SPPermissions/blob/master/Example/App/Configuration.xcconfig) in `Source/Supporting Files`, comment unusable permissions and rebuild:

```ruby
carthage build
```

### Manually

If you prefer not to use any of dependency managers, you can integrate `SPPermissions` into your project manually. Put `/Source` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

After it need implement configuration file. See example [configuration file](https://github.com/ivanvorobei/SPPermissions/blob/master/Example/App/Configuration.xcconfig) or example project. If you don't know how add configuration file, see this [short video](https://youtube.com/ivanvorobei).

## Usage

Project separates to modules. For now available `Dialog`, `List` and `Native` mode. Each mode has delegates and datasource. Soon I add preview for each mode. See more here:

### Dialog

Modal alert, which you can see in version 4. I recreate methods for it and usage will be simple.

```swift
let controller = SPPermissions.dialog([.camera, .photoLibrary])

// Set `DataSource` or `Delegate` if need. 
// By default using project texts and icons.
controller.dataSource = self
controller.delegate = self

// Ovveride texts in controller
controller.titleText = "Title Text"
controller.subtitleText = "Subtitle Text"
controller.commentText = "Comment Text"

// Always use this method for present
controller.present(on: self)
```

### List

List it native `UITableViewController` with support iPad. Show description of permissions and icon.  See example of usage:

```swift
let controller = SPPermissions.list([.calendar, .camera, .contacts])

// Set `DataSource` or `Delegate` if need. 
// By default using project texts and icons.
controller.dataSource = self
controller.delegate = self

// Ovveride texts in controller
controller.titleText = "Title Text"
controller.headerText = "Header Text"
controller.footerText = "Footer Text"

// Always use this method for present
controller.present(on: self)
```

### Native

Native description.

## Examples Code

Here examples of codes and usage `SPPermissions`.

## Permissions

<p float="left">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Camera.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Photos.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Notifications.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Locations.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Microphone.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Calendar.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Contacts.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Reminders.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Motion.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Media.svg" width="105">
    <img src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Permissions/Speech.svg" width="105">
</p>

## Keys in Info.plist

You need to add some keys to the `Info.plist` file with description. List of keys:

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

Do not use the description as the name of the key.

### Localization

If you use xliff localization export, keys will be create automatically. If you prefer do localization file manually, you need create `InfoPlist.strings`, select languages in right side menu and add keys as keys in plist-file. See:

```
"NSCameraUsageDescription" = "Here description of usage camera";
```

## How I do UI

I develop `SPPermissions` in Apple-way. For this, I check 30 apps to get UI-elements for it project. I am take screenshoot and draw it in Sketch. For example, `Allow` button is similar to `Get` button in the AppStore. Check [timelapse](https://youtu.be/1mDdX7fQRv4) to see how I am design `SPPermissions`:

[![Timelaps on YouTube](https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Readme/YouTube.jpg)](https://youtu.be/1mDdX7fQRv4)

## Сooperation

The development of this project is completely free. If you can make a contribution, it will help development. Here list of task what need do:

- Fix mistakes in this Readme and docs. My English so bad.
- Add docs in source files. Description of public methods and parametrs. 
- Subtitles for [video](https://youtube.com/ivanvorobei) in any your native languages, where I tell you how to connect a configuration file.
- Help me translate [Debts app](https://itunes.apple.com/app/id1446635818) for other languages. 
- Support Swift Package Manager.

## License

`SPPermissions` is released under the MIT license. Check `LICENSE` for details.
