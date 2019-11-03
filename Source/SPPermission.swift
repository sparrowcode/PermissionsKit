import UIKit

public enum SPPermission {
    
    public static func request(mode: SPPermissionMode, permissions: [SPPermissionType]) {
        
    }
}

public enum SPPermissionMode {
    
    case native
    case dialog
    case fullscreen
}
