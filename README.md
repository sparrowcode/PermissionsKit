<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/e85814ac/resources/request-permission_baner.svg"/>

## About
This project is about managing permissions with the customizable visual effects. Beautiful dialog increases the chance of approval (which is important when we request notification). Simple control of this module saves you hours of development. You can start using this project with just two lines of code and easy customization!

<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/e85814ac/resources/request-permission%20-%20mockup_preview.gif" width="600">

## Requirements
Xcode 8 and Swift 3. Ready for use on iOS 8+

## Integration
Drop in `Sparrow` folder to your Xcode project (make sure to enable "Copy items if needed" and "Create groups").

Or via CocoaPods:
```ruby
pod 'Sparrow/Modules/RequestPermission', :git => 'https://github.com/IvanVorobei/Sparrow.git’
```
## How to use
Call `SPRequestPermission` and choose type UI (for example: `dialog/interactive`)
```swift
class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SPRequestPermission.dialog.interactive.present(on: self, with: [.сamera])
    }
}
```
If you want to know if you have received permission, you should call the function:
```swift
let isAvailableCamera = SPRequestPermission.isAllowPermission(.сamera)
```
## Available permissions

<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/e85814ac/resources/request-permission_permissions.svg"/>

## Types of presentation
Did you notice that when initialized the `SPRequestPermission` - we chose the module (`SPRequestPermission.dialog.interactive...`). You can choose an appropriate visual component. They all adapted to the iPad and iPhone for all screens and for all orientations (currently available `dialog/interactive` and `native`, but soon I will add number of presentations)

<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/e85814ac/resources/request-permission_presenters.png"/>

## Delegates
To track events associated with `SPRequestPermission`, implement the protocol `SPRequestPermissionEventsDelegate` and pass the delegate
```swift
SPRequestPermission.dialog.interactive.present(
    on: self,
    with: [.сamera],
    delegate: self
)
```
## Customize
If you want to change data in a particular module (for example, the text in the top footer) - you should implement a class supporting the protocol. For example, for module `dialog/interactive`, you should implement the protocol `SPRequestPermissionDialogInteractiveDataSourceInterface`. Then the class object needs to be passed to creator
```swift
SPRequestPermission.dialog.interactive.present(
    on: self,
    with: [.сamera],
    dataSource: CustomDataSource()
)
```

Read more about customization data in [wiki](https://github.com/IvanVorobei/RequestPermission/wiki/Customization)

For russian comunity:
Я написал [статью](https://habrahabr.ru/post/326620/) на Хабрахабр. Здесь вы найдете наглядное объяснение архитектуры проекта. Полезно, если собираетесь кастомизировать много функционала

UPD: Архитектура изменена, статья носит ознакомительный характер

## Questions
Read [wiki](https://github.com/IvanVorobei/RequestPermission/wiki/Questions). If you can't find answer - contact me via email

## Apps, using Request-Permission
I like the idea to specify applications that use the RequestPermission. Please, contact me via email (you can find it in the section "Contacts") so that I added app here

## License
RequestPermission is released under the MIT license. Check LICENSE.md for details

## Other
<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/e85814ac/resources/powered_by_sparrow.svg"/>

In the project you can find my library [Sparrow](https://github.com/IvanVorobei/Sparrow). It's a library, on which the module is written. Unfortunately, to save time in development, I wrote RequestPermission using this library. Don't worry, within just Swift files and a lot of useful things. Maybe you will like it:)

## Contact
 
[https://hello.ivanvorobei.by](https://hello.ivanvorobei.by)

[https://ivanvorobei.by](https://hello.ivanvorobei.by) 

hello@ivanvorobei.by

## Support
The project is fully free, I do not impose any restrictions on its use. I'm, just like you, want to do useful things. If you have a desire to help, tell friends about the project or [donate](http://ivanvorobei.by/donate). Thanks!
