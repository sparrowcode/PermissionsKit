import UIKit

extension SPPermissionStyle.Animation {
    
    static func base(_ duration: TimeInterval,
                        animations: (() -> Void)!,
                        delay: TimeInterval = 0,
                        options: UIView.AnimationOptions = [],
                        withComplection completion: (() -> Void)! = {}) {
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: options,
            animations: {
                animations()
        }, completion: { finished in
            completion()
        })
    }
    
    static func spring(_ duration: TimeInterval,
                        animations: (() -> Void)!,
                        delay: TimeInterval = 0,
                        spring: CGFloat = 1,
                        velocity: CGFloat = 1,
                        options: UIView.AnimationOptions = [],
                        withComplection completion: (() -> Void)! = {}) {
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: spring,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                animations()
        }, completion: { finished in
            completion()
        })
    }
}
