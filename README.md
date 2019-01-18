<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Banner.svg"/>

## About
This project is about managing permissions with customizable visual effects. Beautiful dialog increases chance of approval (which is important when we request notification). Simple control of this module saves you hours of development. You can start using this project with just two lines of code and easy customization! You can watch [how I design UI](https://youtu.be/1mDdX7fQRv4) and [how to use pod tutorial](https://youtu.be/viFDunOdyBg) on YouTube.

Preview GIF is loading `4mb`. Please wait.

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Preview.gif" width="500">

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Shop.svg"/>

I have a store where I sell applications and modules for Xcode projects. You can find source codes of applications or custom animations / UI. I regularly update the code. Visit my website to see all items for sale: [xcode-shop.com](https://xcode-shop.com). On the website you can find previews and, for some items, links to AppStore.

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Shop.svg"/>

## Requirements
Swift 4.2. Ready for use on iOS 10+

## Integration
Put `Source/SPPermission` folder in your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

Or via CocoaPods:
```ruby
pod 'SPPermission'
```

## How to use
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
let isAllowCamera = SPPermission.isAllow(.camera)
```

To learn how to customize titles and images you can read section [DataSource & Customization](#datasource--customization)

## Permissions

<img src="https://github.com/IvanVorobei/SPPermission/blob/master/Resources/Permissions.jpg"/>

If you want to request notification (or other permissions) without dialog, use the function:

```swift
SPPermission.request(.notification, with: {
    // Callback
})
```

Notification permission should be tested _only_ on a real device.
If you want new permission added, create new issue [here](https://github.com/IvanVorobei/SPPermission/issues)

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
## DataSource & Customization
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
    @objc optional var dragToDismiss: Bool { get }
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

If you want to inhibite drag gesture to discard the dialog view you need to override `dragToDismiss` parameter, and if you want to add or remove the close button (without the button you’ll have to swipe the dialog to close it), you need to override parameter `showCloseButton`. To see what it looks like, see the picture below:

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
}
```

Will auto check `SPPermissionDialogDataSource` also implement `SPPermissionDialogColorSource`. You need pass for `dataSource` object, which implements two protocols.

## Purpose String in Info.plist

SPPermission uses many permissions in one library; you need to add some strings to the `Info.plist` file with description. List of keys:

- NSContactsUsageDescription
- NSCalendarsUsageDescription
- NSMicrophoneUsageDescription
- NSAppleMusicUsageDescription
- NSSpeechRecognitionUsageDescription

## Contribution
I would appreciate your participation in the project. If you want to add new permissions, make a pull request. You can ignore adding an icon, I will add it myself. If you find errors in the project, you can create new [issue](https://github.com/IvanVorobei/SPPermission/issues) or fix it and make a pull request.

## YouTube Video

I have [YouTube channel](http://youtube.com/ivanvorobei) where I publish videos about Xcode and Design. You can see how I develop native design for `SPPermission` dialog view:

[![Timelaps on YouTube](https://github.com/IvanVorobei/SPPermission/blob/master/Resources/YouTube.jpg)](https://youtu.be/1mDdX7fQRv4)

## For Russian-speaking users
Вы можете глянуть [туториал на youtube](https://youtu.be/viFDunOdyBg) или почитать статью [Обновление библиотеки SPPermission](https://habr.com/post/430886/), чтобы больше узнать о проекте. Taк же вы можете прочитать статью [Получил 1.2K звезд на GitHub с ужасной архитектурой. Как?](https://habr.com/post/326620/) о первой версии проекта и работе с архитектурой

## My projects

Here I would like to offer you my other projects.

### SPStorkController
I created [SPStorkController](https://github.com/IvanVorobei/SPStorkController). It is a modal controller like in Mail or Apple Music application. Similar animation and transition. You can see an example of using controller in app [in AppStore](https://itunes.apple.com/app/id1446635818).

<img src="https://github.com/IvanVorobei/SPStorkController/blob/master/Resources/Preview.gif" width="500">

You can buy source code of this app on [xcode-shop.com](https://xcode-shop.com). Price: $200.

### SparrowKit
`SPPermission` was formerly a part of [SparrowKit](https://github.com/IvanVorobei/SparrowKit) library. In the library you can find many useful extensions & classes. To install via CocoaPods use:

```ruby
pod 'SparrowKit'
```

## License
`SPPermission` is released under the MIT license. Check `LICENSE.md` for details.

## Contact
If you need any application or UI to be developed, message me at hello@ivanvorobei.by. I develop iOS apps and create designs, too. I use `swift` for development. To request more functionality, you should create a new issue.
Here are my apps in AppStore: [first account](https://itunes.apple.com/us/developer/polina-zubarik/id1434528595) & [second account](https://itunes.apple.com/us/developer/mikalai-varabei/id1435792103).
