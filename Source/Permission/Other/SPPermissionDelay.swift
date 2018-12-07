import UIKit

extension SPPermissionStyle.Delay {
    
    public static func wait(_ delay: Double, closure: @escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when) {
            closure()
        }
    }
}
