# SPPermissions

<img align="left" src="https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Readme/Preview.gif" width="470"/>

### About
Permissions agregator allow request its native, as dialog and other way.  Available check state permissions. I do UI of dialog in **Apple style**. Watch timelaps how I design for this pod [on YouTube](https://youtu.be/1mDdX7fQRv4).

Visit my store for iOS developers:

[![xcode-shop.com](https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Buttons/xcode-shop-3.svg)](https://xcode-shop.com)

If you like the project, do not forget to `put star ★` and follow me on GitHub:

[![https://github.com/ivanvorobei](https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Buttons/follow-me-on-github.svg)](https://github.com/ivanvorobei)

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
- [Permissions](#permissions)
- [Keys in Info.plist](#keys-in-infoplist)
- [Сooperation](#сooperation)
- [How I do UI](#how-i-do-UI)
- [Other Projects +gif](#my-projects)
    - [Awesome iOS UI](https://github.com/ivanvorobei/awesome-ios-ui)
    - [SPStorkController](#spstorkcontroller)
    - [SPLarkController](#splarkcontroller)
    - [SPAlert](#spalert)
- [License](#license)

## Requirements

Swift `4.2` & `5.0`. Ready for use on iOS 10+

## Installation

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `SPPermissions` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPPermissions/Notification'
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

Project separates to modules. For now available `Dialog`, `List` and `Native` mode. Each mode has delegates and datasource. See more here:

### Dialog

Dialog description.

### List

List description.

### Native

Native description.

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

## How I do UI

I develop `SPPermissions` in Apple-way. For this, I check 30 apps to get UI-elements for it project. I am take screenshoot and draw it in Sketch. For example, `Allow` button is similar to `Get` button in the AppStore. Check [timelapse](https://youtu.be/1mDdX7fQRv4) to see how I am design `SPPermissions`:

[![Timelaps on YouTube](https://github.com/ivanvorobei/SPPermissions/blob/version-5/Assets/Readme/YouTube.jpg)](https://youtu.be/1mDdX7fQRv4)

## Сooperation

The development of this project is completely free. If you can make a contribution, it will help development. Here list of task what need do:

- Fix mistakes in this Readme. My English so bad.
- Add docs in source files. Description of public methods and parametrs. 
- Subtitles for [video](https://youtube.com/ivanvorobei) in any your native languages, where I tell you how to connect a configuration file.
- Help me translate [Debts app](https://itunes.apple.com/app/id1446635818) for other languages. 
- Support Swift Package Manager.

## My projects

<img align="left" src="https://github.com/ivanvorobei/SPStorkController/blob/master/Resources/Preview.gif" width="220"/>

### SPStorkController

[SPStorkController](https://github.com/ivanvorobei/SPStorkController) is сontroller **as in Apple Music, Podcasts and Mail** apps. Simple adding close button and centering arrow indicator. Customizable height. Using custom TransitionDelegate. Check scroll's bounce for more interactive. Simple adding close button and centering arrow indicator. You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore.

Alert you can find in [SPAlert](https://github.com/ivanvorobei/SPAlert) project. If you want to **buy source code** of app in preview, please, go to [xcode-shop.com](https://xcode-shop.com)

---

<img align="left" src="https://github.com/ivanvorobei/SPLarkController/blob/master/Resources/Preview.gif" width="220"/>

### SPLarkController

[SPLarkController](https://github.com/ivanvorobei/SPLarkController) transition between controllers. Translate to top. Make **settings screen** for application. You can add **buttons and switches**. The amount cells is not limited. You can start using project with just two lines of code and easy customisation. For implement settings as in preiew, see section [Settings Controller](https://github.com/ivanvorobei/SPLarkController#settings-controller).

You can download example app [Code - Learn Swift & Design](https://itunes.apple.com/app/id1453325619) from AppStore. If you want to **buy source code** of app this app, please, go to [xcode-shop.com](https://xcode-shop.com).

---

<img align="left" src="https://github.com/ivanvorobei/SPAlert/blob/master/Resources/Preview-Done.gif" width="220"/>

### SPAlert

[SPAlert](https://github.com/ivanvorobei/SPAlert) is **popup from Apple Music & Feedback in AppStore**. Contains `Done` & `Heart` presets. `Done` present with draw path animation. I clone Apple's alerts as much as possible.  
You can find this alerts in AppStore after feedback, after added song to library in Apple Music. I am also add alert without icon, as simple message.

You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore. If you want to **buy source code** of app in preview, please, go to [xcode-shop.com](https://xcode-shop.com).

## License

`SPPermissions` is released under the MIT license. Check `LICENSE` for details.
