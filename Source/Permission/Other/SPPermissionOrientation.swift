import UIKit

extension SPPermissionStyle.Orientation {
    
    static var isPortrait: Bool {
        var isPortraitOrientation = true
        if UIDevice.current.orientation.isValidInterfaceOrientation {
            if UIDevice.current.orientation.isPortrait {
                isPortraitOrientation = true
            } else {
                isPortraitOrientation = false
            }
        } else {
            if UIScreen.main.bounds.width < UIScreen.main.bounds.height {
                isPortraitOrientation = true
            } else {
                isPortraitOrientation = false
            }
        }
        return isPortraitOrientation
    }
}
