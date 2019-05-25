# SPPermission

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Preview.gif" width="500"/>
</p>

<p><h3>About</h3>
Request permissions with dialog. You can request many permission at once. I do UI of dialog in <b>Apple style</b>. If you need additional permission, please, create new issue.
<br><br>
Watch timelaps how I design UI for this pod <a href="https://youtu.be/1mDdX7fQRv4">on YouTube</a>.
<br><br>
If you like this project, do not forget to <b>put star ★</b> or donate:<br><br>

[![Patron](https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Patron%20Button.svg?)](https://patreon.com/ivanvorobei)

See project's backers in <a href="https://github.com/IvanVorobei/SPPermission#sponsors">Sponsors</a> section.</p>

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
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
- [Purpose String in Info.plist](#purpose-string-in-infoplist)
- [How I do UI](#how-i-do-UI)
- [Sponsors](#sponsors)
- [Other Projects +gif](#my-projects)
    - [SPStorkController](#spstorkcontroller)
    - [SPAlert](#spalert)
    - [SPLarkController](#splarkcontroller)
- [License](#license)
- [Contact or Order Develop](#contact)


## Requirements

Swift 4.2 & **5.0**. Ready for use on iOS 10+

## Installation

### CocoaPods:

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate `SPPermission` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SPPermission'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate `SPPermission` into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "IvanVorobei/SPPermission"
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate `SPPermission` into your project manually. Put `Source/SPPermission` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

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
```

If you want to know if permission is denied, you need to call the function:

```swift
let isDeniedMicrophone = SPPermission.isDenied(.microphone)
```

To learn how to customize titles and images you can read section [DataSource & Customisation](#datasource--customisation)

## Permissions

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Permissions%20List.jpg"/>

If you want to request notification (or other permissions) without dialog, use the function:

```swift
SPPermission.request(.notification, with: {
    // Callback
})
```

If you want new permission added, create new issue [here](https://github.com/IvanVorobei/SPPermission/issues).

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

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Close%20Button.png"/>

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

## Purpose String in Info.plist

SPPermission uses many permissions in one library; you need to add some strings to the `Info.plist` file with description. List of keys:

- NSContactsUsageDescription
- NSCalendarsUsageDescription
- NSMicrophoneUsageDescription
- NSAppleMusicUsageDescription
- NSSpeechRecognitionUsageDescription
- NSMotionUsageDescription
- NSLocationAlwaysUsageDescription
- NSLocationWhenInUseUsageDescription

Do not use the description as the name of the key - this causes errors in the latest version of the new Xcode. Specify `For SPPermission` in the description.
If I forgot to mention some, please let me know and create [issue](https://github.com/IvanVorobei/SPPermission/issues) or [pull request](https://github.com/IvanVorobei/SPPermission/pulls).

## How I do UI

I develop `SPPermission` in Apple-way. For this, I check 30 apps to get UI-elements for it project. I am take screenshoot and draw it in Sketch. For example, `Allow` button is similar to `Get` button in the AppStore. Check [timelapse](https://youtu.be/1mDdX7fQRv4) to see how I am design `SPPermission`:

[![Timelaps on YouTube](https://github.com/IvanVorobei/SPPermission/blob/master/Resources/YouTube.jpg)](https://youtu.be/1mDdX7fQRv4)

## Sponsors

Support me with a monthly donation and help me continue activities: [Become a sponsors](https://www.patreon.com/ivanvorobei)

<a href="https://github.com/zubara21/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/zubara21.jpg" width="100"></a>
<a href="https://github.com/sparrowganz/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/sparrowganz.jpg" width="100"></a>
<a href="https://github.com/shatk0vskiy/" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/shatk0vskiy.jpg" width="100"></a>
<a href="https://www.patreon.com/ivanvorobei" target="_blank"><img src="https://github.api.ivanvorobei.by/sponsors/add.jpg" width="100"></a>

## My projects

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPStorkController/blob/master/Resources/Preview.gif" width="220"/>
</p>

### SPStorkController

<p><a href="https://github.com/IvanVorobei/SPStorkController" target="_blank">SPStorkController</a> is transition controller <b>as in Apple Music, Podcasts and Mail</b> apps. Customizable height. Simple adding close button and centering arrow indicator. Check scroll's bounce for more interactive. Simple adding close button and centering arrow indicator. You can download example <a href="https://itunes.apple.com/app/id1446635818">Debts - Spending tracker</a> app from AppStore.<br><br>
Alert you can find in <a href="https://github.com/IvanVorobei/SPAlert">SPAlert</a> project. If you want to <b>buy source code</b> of app in preview, please, go to <a href="https://xcode-shop.com">xcode-shop.com</a>.</p>

---

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Done.gif" width="220"/>
</p>

### SPAlert

<p><a href="https://github.com/IvanVorobei/SPAlert" target="_blank">SPAlert</a> is <b>popup from Apple Music & Feedback in AppStore</b>. Contains `Done` & `Heart` presets. `Done` preset present with animation. I clone Apple's alerts as much as possible. You can find this alerts in AppStore after feedback, after added song to library in Apple Music. I am also add alert without icon, as simple message.
<br><br>
You can download example <a href="https://itunes.apple.com/app/id1446635818">Debts - Spending tracker</a> app from AppStore. If you want to <b>buy source code</b> of app in preview, please, go to <a href="https://xcode-shop.com">xcode-shop.com</a>.</p>

---

<p float="left">
    <img align="left" src="https://github.com/IvanVorobei/SPLarkController/blob/master/Resources/Preview.gif" width="220"/>
</p>

### SPLarkController

<p><a href="https://github.com/IvanVorobei/SPLarkController" target="_blank">SPLarkController</a> make <b>settings screen</b> for application. You can add <b>buttons and switches</b>. The amount cells is not limited. You can start using project with just two lines of code and easy customisation. For implement settings as in preiew, see section <a href="https://github.com/IvanVorobei/SPLarkController#settings-controller">Settings Controller</a>.<br><br>
You can download example app <a href="https://itunes.apple.com/app/id1453325619" target="_blank">Code - Learn Swift & Design</a> from AppStore. If you want to <b>buy source code</b> of app this app, please, go to <a href="https://xcode-shop.com" target="_blank">xcode-shop.com</a><p>

## License
`SPPermission` is released under the MIT license. Check `LICENSE.md` for details.

## Contact
If you need any application or UI to be developed, message me at hello@ivanvorobei.by or via [telegram](https://t.me/ivanvorobei). I develop iOS apps and designs. I use `swift` for development. To request more functionality, you should create a new issue. You can see my [apps in AppStore](https://itunes.apple.com/developer/id1446635817).
