<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/349e5204/resources/request-permission_baner.svg"/>

## About
This project is about managing permissions with the customizable visual effects. Beautiful dialog increases the chance of approval (which is important when we request notification). Simple control of this module saves you hours of development. You can start using this project with just two lines of code and easy customization!

<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/master/resources/request-permission%20-%20mockup_preview.gif" width="600">

## Requirements
Xcode 8 and Swift 3. Ready for use on iOS 8+

## Integration
Drop in `Sparrow` folder to your Xcode project (make sure to enable "Copy items if needed" and "Create groups").

Or via CocoaPods:
```ruby
pod 'Sparrow/Modules/RequestPermission', :git => 'https://github.com/IvanVorobei/Sparrow.git’
```
## How to use
Initialize `Assistant` as a property in controller. Initialization in any other unit may be unsafe ([read more about](#important))
```swift
class ViewController: UIViewController {

    var permissionAssistant = SPRequestPermissionAssistant.modules.dialog.interactive.create(with: [.Camera, .PhotoLibrary, .Notification])

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```
Now when the module is initialized and configured with the desired permissions, we can generate a visual representation. This is done in one line of code
```swift
permissionAssistant.present(on: self)
```
If you want to know if you have received permission, you should call the function:
```swift
let isAvailableCamera = permissionAssistant.isAllowPermission(.Camera)
```
## Available permissions

<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/a0c08270/resources/request-permission_permissions.svg"/>

## Types of presentation
Did you notice that when initialized the `Assistant` - we chose the module (`SPRequestPermissionAssistant.modules.dialog.interactive...`). You can choose an appropriate visual component. They all adapted to the iPad and iPhone for all screens and for all orientations (currently available `dialog/interactive` and `native`, but soon I will add number of presentations)

![](/resources/request-permission_presenters.png)

## Important
For correct ARC work you need to save an object of class `Assistant` during the lifetime of parent's controller. Initialize Аssistant as controller's property. Otherwise, ARC will destroy files that is responsible for logic and the controller will not respond to events

## Delegates
To track events associated with `Assistant` and its view, implement the protocol `SPRequestPermissionEventsDelegate` and set the class as delegate
```swift
permissionAssistant.eventsDelegate = self
```
## Customize
If you want to change data in a particular module (for example, the text in the top footer) - you should implement a class supporting the protocol. For example, for module `dialog/interactive`, you should implement the protocol `SPRequestPermissionDialogInteractiveDataSourceInterface`. Then the class object needs to be passed to the assistant, in this line
```swift
let permissionAssistant = SPRequestPermissionAssistant.modules.dialog.interactive.init(with: [.Camera, .PhotoLibrary], dataSourceForController: customDataSource())
```

Read more about customization data in [wiki](https://github.com/IvanVorobei/RequestPermission/wiki/Customization)

If you want to write your assistant, using the current skeleton, you should use a more extended initializer. Accordingly `PresenterManager` and `PermissionManager` must implement the interfaces
```swift
let permissionAssistant = SPRequestPermissionAssistant.init(with: [.Camera, .PhotoLibrary], permissionManager: customPermissionManager(), presenterManager: customPresenterManager())
```

## Questions
Read [wiki](https://github.com/IvanVorobei/RequestPermission/wiki/Questions). If you can't find answer - contact me via email

## Apps, using Request-Permission
I like the idea to specify applications that use the RequestPermission. Please, contact me via email (you can find it in the section "Contacts") so that I added app here

## License
RequestPermission is released under the MIT license. Check LICENSE.md for details

## Other
<img src="https://cdn.rawgit.com/IvanVorobei/RequestPermission/c325272d/resources/request-permission_powered-by-sparrow.svg"/>

In the project you can find my library [Sparrow](https://github.com/IvanVorobei/Sparrow). It's a library, on which the module is written. Unfortunately, to save time in development, I wrote RequestPermission using this library. Don't worry, within just Swift files and a lot of useful things. Maybe you will like it:)

## Contact
 
[https://hello.ivanvorobei.by](https://hello.ivanvorobei.by)

[https://ivanvorobei.by](https://hello.ivanvorobei.by) 

hello@ivanvorobei.by

## Support
The project is fully free, I do not impose any restrictions on its use. I'm, just like you, want to do useful things. If you have a desire to help, tell friends about the project or [donate](http://ivanvorobei.by/donate). Thanks!
