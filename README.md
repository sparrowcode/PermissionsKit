# SPPermission

Request permissions **with native dialog** UI and interactive animations. Also you can request permissions without dialog. Check state any permission. You can start using this project with just two lines of code and easy customisation. You can watch how I design UI for this pod [on YouTube](https://youtu.be/1mDdX7fQRv4). If you like the project, do not forget to **put star ★**

### Preview

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Preview.gif" width="500">

## Navigate

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Permissions](#permissions)
- [DataSource & Customisation](#datasource--customisation)
    - [Content](#datasource--customisation)
    - [Colors](#colors)
- [Delegate](#delegate)
- [Purpose String in Info.plist](#purpose-string-in-infoplist)
- [Screen record with design](#screen-record-with-design)
- [Other Projects (+gif)](#my-projects)
    - [SPStorkController](#spstorkcontroller)
    - [SPAlert](#spalert)
    - [SPLarkController](#splarkcontroller)
    - [Xcode Shop](#xcode-shop)
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

## DataSource & Customisation

If you want to change the text, you need to implement `SPPermissionDialogDataSource` protocol. Override needed parameters to see the changes:

```swift
@objc public protocol SPPermissionDialogDataSource: class {

    @objc optional var dialogTitle: String { get }
    @objc optional var dialogSubtitle: String { get }
    @objc optional var dialogComment: String { get }
    @objc optional var allowTitle: String { get }
    @objc optional var allowedTitle: String { get }
    @objc optional var bottomComment: String { get }
    @objc optional var showCloseButton: Bool { get }
    @objc optional var dragEnabled: Bool { get }
    @objc optional func name(for permission: SPPermissionType) -> String?
    @objc optional func description(for permission: SPPermissionType) -> String?
    @objc optional func image(for permission: SPPermissionType) -> UIImage?
    @objc optional func deniedTitle(for permission: SPPermissionType) -> String?
    @objc optional func deniedSubtitle(for permission: SPPermissionType) -> String?
    @objc optional var cancelTitle: String { get }
    @objc optional var settingsTitle: String { get }
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

If you want to inhibite drag gesture to discard the dialog view you need to override `dragEnabled` parameter, and if you want to add or remove the close button (without the button you’ll have to swipe the dialog to close it), you need to override parameter `showCloseButton`. To see what it looks like, see the picture below:

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Close%20Button.png"/>

In the project you can find an example of usage of `SPPermissionDialogDataSource`

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

    @objc optional var closeIconBackgroundColor: UIColor? { get }
    @objc optional var closeIconColor: UIColor? { get }
}
```

Will auto check `SPPermissionDialogDataSource` also implement `SPPermissionDialogColorSource`. You need pass for `dataSource` object, which implements two protocols.

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

## Screen record with design

I have [YouTube channel](http://youtube.com/ivanvorobei) where I publish videos about Xcode and Design. You can see how I develop native design for `SPPermission` dialog view:

[![Timelaps on YouTube](https://github.com/IvanVorobei/SPPermission/blob/master/Resources/YouTube.jpg)](https://youtu.be/1mDdX7fQRv4)

## My projects

### SPStorkController

[SPStorkController](https://github.com/IvanVorobei/SPStorkController) is very similar to the modal **controller displayed in Apple Music, Podcasts and Mail** apps. Customizable height of view. Check scroll's bounce for more interactive. Simple adding close button and centering arrow indicator. You can download example [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) app from AppStore.

<img src="https://github.com/IvanVorobei/SPStorkController/blob/master/Resources/Preview.gif" width="440">

If you want to **buy source code** of this apps, please, go to [xcode-shop.com](https://xcode-shop.com).

### SPAlert

Native popup [SPAlert](https://github.com/IvanVorobei/SPAlert) is **similar to Apple Music or Feedback in AppStore** app. Support animations. I tried to repeat Apple alert as much as possible. 

<p float="left">
    <img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Done.gif" width="250">
    <img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Heart.gif" width="250">
    <img src="https://github.com/IvanVorobei/SPAlert/blob/master/Resources/Preview-Message.gif" width="250">
</p>

You can download example app [Debts - Spending tracker](https://itunes.apple.com/app/id1446635818) from AppStore. If you want to **buy source code** of example apps, please, go to [xcode-shop.com](https://xcode-shop.com).

### SPLarkController

[SPLarkController](https://github.com/IvanVorobei/SPLarkController) make **settings screen** for your application. You can add **buttons and switches**. The amount cells is not limited. You can start using project with just two lines of code and easy customisation.

<img src="https://github.com/IvanVorobei/SPLarkController/blob/master/Resources/Preview.gif" width="440">

You can download [Code - Learn Swift & Design](https://itunes.apple.com/app/id1453325619) app, which uses `SPLarkController`. Also you can **buy source code** of this app on [xcode-shop.com](https://xcode-shop.com).

### Xcode Shop

If you want **buy apps with source code**, you can visit my [xcode-shop.com](https://xcode-shop.com). Here I am sale apps, modules, 3D elements and other. In applications you can find many cool UI that will be useful for your projects. Also by buying, **you support me** and my free GitHub development.

## License
`SPPermission` is released under the MIT license. Check `LICENSE.md` for details.

## Contact
If you need any application or UI to be developed, message me at hello@ivanvorobei.by or via [telegram](https://t.me/ivanvorobei). I develop iOS apps and designs. I use `swift` for development. To request more functionality, you should create a new issue. You can see my [apps in AppStore](https://itunes.apple.com/developer/id1446635817).
