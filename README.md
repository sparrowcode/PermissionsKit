![](/resources/request-permission - baner.png)

## About
Несколько дней проект будет совершенстоваться. Поэтому пока выкладываю в таком виде, в котором есть. Часть функционала появится позже. Если вы гашли ошибку - создаейте претензию или напишите мне

<img src="https://raw.githubusercontent.com/IvanVorobei/RequsetPermission/master/resources/request-permission - mockup_preview.gif" width="600">

## Requirements
Xcode 8 and Swift 3. Ready for use on iOS 8+

## Integration
Drop in Sparrow folder to your Xcode project (make sure to enable "Copy items if needed" and "Create groups").

Or via CocoaPods:
    
    pod 'Sparrow/Modules/RequsetPermission, :git => 'https://github.com/IvanVorobei/Sparrow.git’

## How to use

Проинициализруйте асистента как проверти в контроллере. Обрашшаю внимание что инициализровать в любом другом блоке может быть небезопасно (читайте подробнее "ссылка на раздел ниже")

	class ViewController: UIViewController {
    
    	var permissionAssistant = SPRequestPermissionAssistant.modules.dialog.interactive.init(with: [.Camera, .PhotoLibrary, .Notification])

    	override func viewDidLoad() {
        	super.viewDidLoad()
    	}
	}

Теперь, когда модуль проинициализирован и сконфигурирован нужными разрешениями, мы можем вызвать визуальное представление. Это делается в одну строчку кода

	permissionAssistant.present(on: self)

##Виды представлений

Вы заметили, что когда инициализировали Assistant - мы выбирали модуль. Вы можете выбрать подходящую вам визуальную состовляющую. Все они адаптированы под iPad и iPhone всех экранов и под все ориентации. 

В скором времени я добавлю дополнительные виды


## Attention
Для корректной работы ARC вам необходимо сохранить объект класса Assistant в течении всей жизни контроллера. Пожалкйста, инициализируйте как проперти контроллреа. В противном случае ARC уничтожит файлы, отвечающие за логику

## Delegates
Вы можете отслеживать события, связанные с Асистентом и его представлением. Реализуйте протокол SPRequestPermissionEventsDelegate и установите необходимый класс как делегат

	permissionAssistant.eventsDelegate = self

## Кастомизация
Если вы хотите изменить данные в конкретном модуле (к примеру, текст в верхнем банере) - вам неоходимо реализовать класс, поддерживающий протокол. Например, для модуля Dialog / Interactive вы должны реализовать протокол SPRequestPermissionDialogInteractiveDataSourceInterface. Далее объект класса нужно передать асистенту, в этой строке 

	let permissionAssistant = SPRequestPermissionAssistant.modules.dialog.interactive.init(with: [.Camera, .PhotoLibrary], dataSourceForController: customDataSource())

Если вы хотите написать свой асистент, используя текущий скелет, вы должны использовать 

	let permissionAssistant = SPRequestPermissionAssistant.init(with: [.Camera, .PhotoLibrary], permissionManager: customPermissionManager(), presenterManager: customPresenterManager())



## Apps, using Requset-Permission
Если вы хотите попасть сюда - свяжитесь со мной чкерез почту. Ее вы можете найти ниже

## License
TwitterLaunchAnimation is released under the MIT license. Check LICENSE.md for details

## Other
![](/resources/request-permission - powered-by-sparrow.png)

In the project you can find my library [Sparrow](https://github.com/IvanVorobei/Sparrow). It’s a library, на основе которой написан мождуль. К сожалению, чтобы сэкономить время в разработке, я писал RequsetPermission используя эту библиотеку. Не волнуйтесь, внутри только SWift файлы и куча полезных вещей. Может быть вам понарвится) 

## Contact
 
[https://hello.ivanvorobei.by](https://hello.ivanvorobei.by)

[https://ivanvorobei.by](https://hello.ivanvorobei.by)

hello@ivanvorobei.by

## Support
The project is fully free, I do not impose any restrictions on its use. I'm, just like you, want to do useful things. If you have a desire to help, tell friends about the project or [donate](http://ivanvorobei.by/donate). Thanks!
