import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        launch(UINavigationController(rootViewController: ViewController()))
        return true
    }
    
    func launch(_ viewController: UIViewController) {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

