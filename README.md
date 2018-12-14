<img src="https://rawcdn.githack.com/IvanVorobei/RequestPermission/fb53d20f152a3e76e053e6af529306611fb794f0/resources/request-permission - baner.svg"/>

## About
This project is about managing permissions with the customizable visual effects. Beautiful dialog increases the chance of approval (which is important when we request notification). Simple control of this module saves you hours of development. You can start using this project with just two lines of code and easy customization! You can see [how I am designed UI](https://youtu.be/1mDdX7fQRv4) and [how use pod tutorial](https://youtu.be/viFDunOdyBg) on youtube.

Preview GIF loading `4mb`. Please, wait

<img src="https://rawcdn.githack.com/IvanVorobei/RequestPermission/fb53d20f152a3e76e053e6af529306611fb794f0/resources/request-permission - mockup_preview.gif" width="500">

<img src="https://rawcdn.githack.com/IvanVorobei/RequestPermission/6fcd9bdb50a99cea358294999e161dffe55be46f/resources/request-permission - donate.svg"/>

The project is absolutely free, but but it takes time to support and update it. Your support is very motivating and very important. I often receive emails asking me to update or add functionality. [Small donate](https://money.yandex.ru/to/410012745748312) for a cup of coffee helps to develop the project and make it better

<img src="https://rawcdn.githack.com/IvanVorobei/RequestPermission/6fcd9bdb50a99cea358294999e161dffe55be46f/resources/request-permission - donate.svg"/>

## Requirements
Swift 4.2. Ready for use on iOS 10+

## Integration
Drop in `Source/SPPermission` folder to your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

Or via CocoaPods:
```ruby
pod 'SPPermission'
```

and import library in class:
```swift
import SPPermission
```

## How to use
Call `SPPermission` and use func `request()`. Also passed controller, on which dialog should present:

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

If you want to know if permission allowed, you should call the function:

```swift
let isAvailableCamera = SPPermission.isAllow(.сamera)
```

How customize titles and images you can read section [DataSource & Customization](#datasource--customization)

## Permissions

<img src="https://rawcdn.githack.com/IvanVorobei/RequestPermission/951477c8e89de55eeeac441102b52b1415c691b7/resources/request-permission_permissions.png"/>

Also now supported `MediaLibrary (Apple Music)` permission.

If you want to request notification (or other permissions) without dialog, use the function:

```swift
SPPermission.request(.notification, with: {
    //callback
})
```

Notification permission should be tested _only_ on a real device.
If you want to add new permission, create a new issue [here](https://github.com/IvanVorobei/SPPermission/issues)

## Delegate
To track events hide & allowed permission associated with `SPPermission`, implement the protocol `SPPermissionDialogDelegate`:

```swift
@objc public protocol SPPermissionDialogDelegate: class {
    
    @objc optional func didHide()
    @objc optional func didAllow(permission: SPPermissionType)
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
If you want to change the text, you need to implement the `SPPermissionDialogDataSource` protocol. Override the needed parameters to see the changes:

```swift
@objc public protocol SPPermissionDialogDataSource: class {

    @objc optional var dialogTitle: String { get }
    @objc optional var dialogSubtitle: String { get }
    @objc optional var dialogComment: String { get }
    @objc optional var allowTitle: String { get }
    @objc optional var allowedTitle: String { get }
    @objc optional var bottomComment: String { get }
    @objc optional var showCloseButton: Bool { get }
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

If you want add or remove close button (for close dialog, need swipe it), you need override parametr  `showCloseButton`. How it will look look at the picture below:

<img src="https://rawcdn.githack.com/IvanVorobei/RequestPermission/b3e613295b73be36c8a3d35126d1f7015ef432a8/resources/request-permission - close button.png"/>

In the project you can find an example for usage `SPPermissionDialogDataSource`

## Contribution
I will be glad to your participation in the project. If you want to add new permissions, make a pull request. You can ignore adding an icon, I will add it myself. If you find errors in the project, you can create new [issue](https://github.com/IvanVorobei/SPPermission/issues) or fix and make a pull request

## For Russian-speaking users
Вы можете глянуть [туториал на youtube](https://youtu.be/viFDunOdyBg) или почитать статью [Обновление библиотеки SPPermission](https://habr.com/post/430886/), чтобы больше узнать о проекте. Taк же вы можете прочитать статью [Получил 1.2K звезд на GitHub с ужасной архитектурой. Как?](https://habr.com/post/326620/) о первой версии проекта и работе с архитектурой

## My projects

Here I would like to offer you my other projects

### SPStorkController
I am create [SPStorkController](https://github.com/IvanVorobei/SPStorkController). It is modal controller as in mail or Apple music application. Similar animation and transition. You can see example of use controller in app [in AppStore](https://itunes.apple.com/app/id1446635818)

<img src="https://rawcdn.githack.com/IvanVorobei/SPStorkController/c66764082c0d9bf11d0bd46d5fa458edb62044fe/Resources/gif-mockup - 3.gif" width="500">

### SparrowKit
The `SPPermission` in the past was part of [SparrowKit](https://github.com/IvanVorobei/SparrowKit) library. In library you can find many useful extensions & classes. For install via CocoaPods use:

```ruby
pod 'SparrowKit'
```

## License
`SPPermission` is released under the MIT license. Check `LICENSE.md` for details

## Contact
If you have any requirements to develop any application or UI, write to me at hello@ivanvorobei.by. I am developing iOS apps and creates designs too. I use `swift` for developing projects. For requesting more functionality, you should create a new issue. 
Here are my apps in AppStore: [first account](https://itunes.apple.com/us/developer/polina-zubarik/id1434528595) & [second account](https://itunes.apple.com/us/developer/mikalai-varabei/id1435792103)


