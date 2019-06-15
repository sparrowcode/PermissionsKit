# SPPermission

<img align="left" src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Preview.gif" width="470"/>

### About
Request permissions with dialog. You can request many permissions at once. I do UI of dialog in **Apple style**. If you need additional permission, please, create new issue.

Watch timelaps how I design UI for this pod [on YouTube](https://youtu.be/1mDdX7fQRv4).

If you like the project, do not forget to `put star ★` or help visit my store for iOS developers:

[![xcode-shop.com](https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Xcode%20Shop%20Button.svg)](https://xcode-shop.com)

See project's backers in [Sponsors](https://github.com/ivanvorobei/SPPermission#sponsors) section.

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
    - [CocoaPods](#cocoapods)
    - [Carthage](#carthage)
    - [Manually](#manually)
- [Usage](#usage)
- [Permissions](#permissions)
- [Customisation](#customisation)
    - [Protocol](#protocol)
    - [Texts](#texts)
    - [Close Button](#close-button)
    - [Drag](#drag)
    - [Colors](#colors)
    - [Start position](#start-position)
- [Delegate](#delegate)
- [String in Info.plist](#string-in-infoplist)
- [How I do UI](#how-i-do-UI)
- [Sponsors](#sponsors)
- [Other Projects +gif](#my-projects)
    - [SPStorkController](#spstorkcontroller)
    - [SPAlert](#spalert)
    - [SPLarkController](#splarkcontroller)
    - [Awesome iOS UI](https://github.com/ivanvorobei/awesome-ios-ui)
- [License](#license)
- [Contact or Order Develop](#contact)


## Requirements

Swift `4.2` & `5.0`. Ready for use on iOS 10+

## Installation

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `SPPermission` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPPermission/Notification'
```

Due to Apple's new policy regarding permission access you need to specifically define what kind of permissions you want to access using subspecs. For example if you want to access `Camera`, `Location` & `Microphone` you define the following:

```ruby
pod 'SPPermission/Camera'
pod 'SPPermission/Location'
pod 'SPPermission/Microphone'
```

<details><summary>Available subspecs</summary>
<p>

```ruby
pod 'SPPermission/Camera'
```
```ruby
pod 'SPPermission/Contacts'
```
```ruby
pod 'SPPermission/Calendar'
```
```ruby
pod 'SPPermission/PhotoLibrary'
```
```ruby
pod 'SPPermission/Notification'
```
```ruby
pod 'SPPermission/Microphone'
```
```ruby
pod 'SPPermission/Reminders'
```
```ruby
pod 'SPPermission/SpeechRecognizer'
```
```ruby
pod 'SPPermission/Location'
```
```ruby
pod 'SPPermission/Motion'
```
```ruby
pod 'SPPermission/MediaLibrary'
```

</p>
</details>

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate `SPPermission` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "ivanvorobei/SPPermission"
```

By default available all permissions. You can provide custom build flags _before_ building the dynamic framework to only compile
with permissions you request. Open file [Configuration.xcconfig](https://github.com/ivanvorobei/SPPermission/blob/master/Source/Supporting%20Files/Configuration.xcconfig) in `Source/Supporting Files`, comment unusable permissions and rebuild:

```ruby
carthage build
```

### Manually

If you prefer not to use any of dependency managers, you can integrate `SPPermission` into your project manually. Put `Source/SPPermission` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

After it need implement configuration file. See example [configuration file](https://github.com/ivanvorobei/SPPermission/blob/master/ExampleConfiguration.xcconfig) or example project.

## Usage

Call `SPPermission` and use func `request()`. Also, pass the controller on which the dialog should present:

```swift
import UIKit
import SPPermission

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SPPermission.Dialog.request(with: [.camera, .microphone, .notification], on: self)
    }
}
```

If you want to know if permission is allowed, you need to call the function:

```swift
let isAllowedCamera = SPPermission.isAllowed(.camera)
let isDeniedMicrophone = SPPermission.isDenied(.microphone)
```

To learn how to customize titles and images you can read section [Customisation](#customisation)

## Permissions

<p float="left">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Camera.svg" width="130">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Photo.svg" width="130">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Notification.svg" width="130">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Location.svg" width="130">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Microphone.svg" width="130">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Calendar.svg" width="130">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Contacts.svg" width="130">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Reminder.svg" width="130">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Motion.svg" width="130">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Media.svg" width="130">
    <img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Permissions/Speech.svg" width="130">
</p>

If you want to request notification (or other permissions) without dialog, use the function:

```swift
SPPermission.request(.notification, with: {
    // Callback
})
```

If you want add new permission, create [issue](https://github.com/ivanvorobei/SPPermission/issues).

## Customisation

### Protocol

If you want to change the text, you need to implement `SPPermissionDialogDataSource` protocol. Override needed parameters to see the changes:

```swift
extension Controller: SPPermissionDialogDataSource {

    var showCloseButton: Bool { 
        return true
    }
}
```

And pass the object to the function:

```swift
SPPermission.Dialog.request(
    with: [.photoLibrary, .contacts],
    on: self,
    delegate: self,
    dataSource: self
)
```

### Texts

All properties and functions optional. Func can return `nil`. If do it - will be used defualt value.

```swift
extension Controller: SPPermissionDialogDataSource {
    
    var dialogTitle: String { return "Need Permissions" }
    var dialogSubtitle: String { return "Permissions Request" }
    var dialogComment: String { return "Push are not required permissions" }
    var allowTitle: String { return "Allow" }
    var allowedTitle: String { return "Allowed" }
    var bottomComment: String { return "" }
    
    func name(for permission: SPPermissionType) -> String? { return nil }
    func description(for permission: SPPermissionType) -> String? { return nil }
    func deniedTitle(for permission: SPPermissionType) -> String? { return nil }
    func deniedSubtitle(for permission: SPPermissionType) -> String? { return nil }

    var cancelTitle: String { return "Cancel" }
    var settingsTitle: String { return "Settings" }
}
```

### Close Button

For add or remove close button, you need to override parameter `showCloseButton`. Without button you’ll have to swipe the dialog to close it. 

```swift
var showCloseButton: Bool {
    return true
}
```

To see what it looks like, see the picture below:

<img src="https://github.com/ivanvorobei/SPPermission/blob/master/Resources/Close%20Button.png"/>

### Drag

For disable drag ovveride `dragEnabled`. If need allow drag, but disable swipe for hide, ovveride `dragToDismiss`:

```swift
var dragEnabled: Bool {
    return true
}
    
var dragToDismiss: Bool {
    return true
}
```

### Colors

If you want to change the color scheme, you need to implement the protocol `SPPermissionDialogColorSource`. It is not necessary to override all parameters, you can only change those that are necessary:

```swift
@objc public protocol SPPermissionDialogColorSource: class {
    
    @objc optional var whiteColor: UIColor { get }
    @objc optional var blackColor: UIColor { get }
    @objc optional var baseColor: UIColor { get }
    @objc optional var grayColor: UIColor { get }
    @objc optional var lightGrayColor: UIColor { get }
    
    @objc optional var iconWhiteColor: UIColor { get }
    @objc optional var iconLightColor: UIColor { get }
    @objc optional var iconMediumColor: UIColor { get }
    @objc optional var iconDarkColor: UIColor { get }

    @objc optional var closeIconBackgroundColor: UIColor { get }
    @objc optional var closeIconColor: UIColor { get }
}
```

Will auto check `SPPermissionDialogDataSource` also implement `SPPermissionDialogColorSource`. You need pass for `dataSource` object, which implements two protocols.

### Start position

Property `startTransitionYoffset` customise position before start. Set to 0 if need disable wobble animation. By default used `center.y * 1.2`.

```swift
var startTransitionYoffset: CGFloat {
    return 0
}
```

## Delegate

To track events of hiding & allowing permissions associated with `SPPermission`, implement protocol `SPPermissionDialogDelegate`:

```swift
@objc public protocol SPPermissionDialogDelegate: class {

    @objc optional func didHide()
    @objc optional func didAllow(permission: SPPermissionType)
    @objc optional func didDenied(permission: SPPermissionType)
}
```

And pass the delegate to the function:

```swift
SPPermission.Dialog.request(
    with: [.calendar, .microphone],
    on: self,
    delegate: self
)
```

## String in Info.plist

You need to add some strings to the `Info.plist` file with description. List of keys:

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

Do not use the description as the name of the key - this causes errors in the latest version of the new Xcode.

## How I do UI

I develop `SPPermission` in Apple-way. For this, I check 30 apps to get UI-elements for it project. I am take screenshoot and draw it in Sketch. For example, `Allow` button is similar to `Get` button in the AppStore. Check [timelapse](https://youtu.be/1mDdX7fQRv4) to see how I am design `SPPermission`:

[![Timelaps on YouTube](https://github.com/ivanvorobei/SPPermission/blob/master/Resources/YouTube.jpg)](https://youtu.be/1mDdX7fQRv4)

## Sponsors

Support me with a monthly donation and help me continue activities. After payment I add you to list of sponsor **in my all projects** with link to your profile. [Become a sponsors](https://www.patreon.com/ivanvorobei)

<a href="https://github.com/zubara21/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/zubara21.jpg" width="100"></a>
<a href="https://github.com/sparrowganz/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/sparrowganz.jpg" width="100"></a>
<a href="https://github.com/shatk0vskiy/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/shatk0vskiy.jpg" width="100"></a>
<a href="https://www.patreon.com/ivanvorobei" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/add.jpg" width="100"></a>

## My projects

<img align="left" src="https://github.com/ivanvorobei/SPStorkController/blob/master/Resources/Preview.gif" width="220"/>

### SPStorkController

[SPStorkController](https://github.com/ivanvorobei/SPStorkController) is сontroller **as in Apple Music, Podcasts and Mail** apps. Simple adding close button and centering arrow indicator. Customizable height. Using custom TransitionDelegate. Check scroll's bounce for more interactive. Simple adding close button and centering arrow indicator. You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore.

Alert you can find in [SPAlert](https://github.com/ivanvorobei/SPAlert) project. If you want to **buy source code** of app in preview, please, go to [xcode-shop.com](https://xcode-shop.com)

---

<img align="left" src="https://github.com/ivanvorobei/SPAlert/blob/master/Resources/Preview-Done.gif" width="220"/>

### SPAlert

[SPAlert](https://github.com/ivanvorobei/SPAlert) is **popup from Apple Music & Feedback in AppStore**. Contains `Done` & `Heart` presets. `Done` present with draw path animation. I clone Apple's alerts as much as possible.  
You can find this alerts in AppStore after feedback, after added song to library in Apple Music. I am also add alert without icon, as simple message.

You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore. If you want to **buy source code** of app in preview, please, go to [xcode-shop.com](https://xcode-shop.com).

---

<img align="left" src="https://github.com/ivanvorobei/SPLarkController/blob/master/Resources/Preview.gif" width="220"/>

### SPLarkController

[SPLarkController](https://github.com/ivanvorobei/SPLarkController) transition between controllers. Translate to top. Make **settings screen** for application. You can add **buttons and switches**. The amount cells is not limited. You can start using project with just two lines of code and easy customisation. For implement settings as in preiew, see section [Settings Controller](https://github.com/ivanvorobei/SPLarkController#settings-controller).

You can download example app [Code - Learn Swift & Design](https://itunes.apple.com/app/id1453325619) from AppStore. If you want to **buy source code** of app this app, please, go to [xcode-shop.com](https://xcode-shop.com).

## License
`SPPermission` is released under the MIT license. Check `LICENSE.md` for details.

## Contact
If you need any application or UI to be developed, message me at hello@ivanvorobei.by or via [telegram](https://t.me/ivanvorobei). I develop iOS apps and designs. I use `swift` for development. To request more functionality, you should create a new issue. You can see my [apps in AppStore](https://itunes.apple.com/developer/id1446635817).
