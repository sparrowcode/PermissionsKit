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
Drop in `Source/Sparrow` folder of [SparrowKit](https://github.com/IvanVorobei/SparrowKit) to your Xcode project. Make sure to enable `Copy items if needed` and `Create groups`.

Or via CocoaPods:
```ruby
pod 'SPPermission'
```

and import library in class:
```swift
import SparrowKit
```

## How to use
Call `SPPermission` and use func `request()`. Also passed controller, on which dialog should present:
```swift
import UIKit
import SparrowKit

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

## My projects

Here I would like to offer you my other projects

### SPStorkController
I am create [SPStorkController](https://github.com/IvanVorobei/SPStorkController). It is modal controller as in mail or Apple music application. Similar animation and transition. You can see it on github and simple integrate to your project. Now project in develop and I am fast fix bugs and update it:

<img src="https://rawcdn.githack.com/IvanVorobei/SPStorkController/0acd51bbe76ef48611e1bdd408aebb9c7d9b0ae6/resources/gif-mockup.gif" width="500">

### SparrowKit
The `SPPermission` use [SparrowKit](https://github.com/IvanVorobei/SparrowKit) library. You can install it if you want to receive updates often. Also in library you can find [SPPermission](https://github.com/IvanVorobei/SPPermission) and other useful extensions. For install via CocoaPods use:

```ruby
pod 'SparrowKit'
```

## For Russian-speaking users
Вы можете глянуть [туториал на youtube](https://youtu.be/viFDunOdyBg) или почитать статью [Обновление библиотеки SPPermission](https://habr.com/post/430886/), чтобы больше узнать о проекте. Taк же вы можете прочитать статью [Получил 1.2K звезд на GitHub с ужасной архитектурой. Как?](https://habr.com/post/326620/) о первой версии проекта и работе с архитектурой

## License
`SPPermission` is released under the MIT license. Check `LICENSE.md` for details

## Contact
If you need develop application or UI, write me to hello@ivanvorobei.by. I am develop design and ios apps. I am use `swift`. For request more functionality, you should create a new issue. 
My apps in AppStore: [first account](https://itunes.apple.com/us/developer/polina-zubarik/id1434528595) & [second account](https://itunes.apple.com/us/developer/mikalai-varabei/id1435792103)


