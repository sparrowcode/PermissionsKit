import UIKit

struct SPRootViewController {
    
    static var controller: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }
    
    static func set(_ rootController: UIViewController, animatable: Bool = true) {
        
        rootController.view.frame = UIScreen.main.bounds
        
        let replaceRootViewController = {
            UIApplication.shared.keyWindow?.rootViewController = rootController
        }
        
        if animatable {
            UIView.transition(
                with: UIApplication.shared.keyWindow ?? UIWindow(),
                duration: 0.5,
                options: UIView.AnimationOptions.transitionCrossDissolve,
                animations: {
                    replaceRootViewController()
            }, completion: nil)
        } else {
            replaceRootViewController()
        }
    }
    
    private init() {}
}
