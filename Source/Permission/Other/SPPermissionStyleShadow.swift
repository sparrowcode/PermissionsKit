import UIKit

extension SPPermissionStyle.Shadow {
    
    static func setShadowOffsetForLabel(_ label: UILabel, blurRadius: CGFloat = 0, widthOffset: CGFloat = 0, heightOffset: CGFloat, opacity: CGFloat) {
        label.layer.shadowRadius = blurRadius
        label.layer.shadowOffset = CGSize(
            width: widthOffset,
            height: heightOffset
        )
        label.layer.shadowOpacity = Float(opacity)
    }
}
