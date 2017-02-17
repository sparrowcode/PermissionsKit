![](/resources/request-permission - baner.png)

## Sorry
Несколько дней проект будет совершенствоваться. Я стараюсь максимально быстро исправлять ошибки и осуществить все задуманные планы. Но на это нужно время. Если вы опасаетесь изменений, но хотели бы использовать проект у себя - подождите совсем немного

## About
Модульная работа давно зарекомендовала себя. Этот проект - модуль по управлению разрешениями с визуальной частью и возможностью кастомизации. Красивое диалоговое окно увеличивает шансы на получение разрешения (что важно, когда мы запрашиваем нотификации), а простой управление модулем  экономит часы разработки. Вы можете использовать проект с помощью всего двух строк кода!

<img src="https://raw.githubusercontent.com/IvanVorobei/RequestPermission/master/resources/request-permission%20-%20mockup_preview.gif" width="600">

## Requirements
Xcode 8 and Swift 3. Ready for use on iOS 8+

## Integration
Drop in `Sparrow` folder to your Xcode project (make sure to enable "Copy items if needed" and "Create groups").

Or via CocoaPods:
    
    pod 'Sparrow/Modules/RequsetPermission, :git => 'https://github.com/IvanVorobei/Sparrow.git’

## How to use
Проинициализруйте `Assistant` как проверти в контроллере. Инициализровать в любом другом блоке может быть небезопасно ([read more about](#important))

	class ViewController: UIViewController {
    
    	var permissionAssistant = SPRequestPermissionAssistant.modules.dialog.interactive.init(with: [.Camera, .PhotoLibrary, .Notification])

    	override func viewDidLoad() {
        	super.viewDidLoad()
    	}
	}

Теперь, когда модуль проинициализирован и сконфигурирован нужными разрешениями, мы можем вызвать визуальное представление. Это делается в одну строчку кода

	permissionAssistant.present(on: self)

Если вы хотите узнать, получено ли разрешение, вам необходимо вызвать функцию:
    
    permissionAssistant.isAllowPermission(.Camera)

## Доступные разрешения

![](/resources/request-permission - permissions.png)

## Виды представлений
Вы заметили, что когда инициализировали `Assistant` - мы выбирали модуль (`SPRequestPermissionAssistant.modules.dialog.interactive...`). Вы можете выбрать подходящую вам визуальную состовляющую. Все они адаптированы под iPad и iPhone всех экранов и под все ориентации (пока доступно только `dialog/interactive` и `native`, но в скором времени я пополню количество представлений)

![](/resources/request-permission - presenters.png)

## Important
Для корректной работы ARC вам необходимо сохранить объект класса `Assistant` в течении всей жизни контроллера-родителя. Инициализируйте Аssistant как проперти контроллреа. В противном случае ARC уничтожит файлы, отвечающие за логику и контроллер не будет реагировать на события

## Delegates
Чтобы отслеживать события, связанные с `Асистентом` и его представлением, реализуйте протокол `SPRequestPermissionEventsDelegate` и установите необходимый класс как делегат

	permissionAssistant.eventsDelegate = self

## Кастомизация
Если вы хотите изменить данные в конкретном модуле (к примеру, текст в верхнем футере) - вам неоходимо реализовать класс, поддерживающий протокол. Например, для модуля `dialog/interactive` вы должны реализовать протокол `SPRequestPermissionDialogInteractiveDataSourceInterface`. Далее объект класса нужно передать асистенту, в этой строке 

	let permissionAssistant = SPRequestPermissionAssistant.modules.dialog.interactive.init(with: [.Camera, .PhotoLibrary], dataSourceForController: customDataSource())

Если вы хотите написать свой асистент, используя текущий скелет, вы должны использовать более расширенный инициализатор. Соответственно `PresenterManager` и  `PermissionManager` должны реализовать интерфейсы

	let permissionAssistant = SPRequestPermissionAssistant.init(with: [.Camera, .PhotoLibrary], permissionManager: customPermissionManager(), presenterManager: customPresenterManager())

## Apps, using Requset-Permission
Мне понравилась идея указывать приложения, которые используют RequestPermission. Чтобы я добавил приложение сюда - свяжитесь со мной через почты (найти ее можно в разделе "Контакты")

## License
RequestPermission is released under the MIT license. Check LICENSE.md for details

## Other
![](/resources/request-permission - powered-by-sparrow.png)

In the project you can find my library [Sparrow](https://github.com/IvanVorobei/Sparrow). It’s a library, на основе которой написан мождуль. К сожалению, чтобы сэкономить время в разработке, я писал RequsetPermission используя эту библиотеку. Не волнуйтесь, внутри только SWift файлы и куча полезных вещей. Может быть вам понарвится) 

## Contact
 
[https://hello.ivanvorobei.by](https://hello.ivanvorobei.by)

[https://ivanvorobei.by](https://hello.ivanvorobei.by)

hello@ivanvorobei.by

## Support
The project is fully free, I do not impose any restrictions on its use. I'm, just like you, want to do useful things. If you have a desire to help, tell friends about the project or [donate](http://ivanvorobei.by/donate). Thanks!
