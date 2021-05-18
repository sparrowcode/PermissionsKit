// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public enum SPPermissions {
    
    // MARK: - Present Styles
    
    /**
     SPPermissions: Request permissions with native style without any special controller.
     
     - parameter permissions: List if permissions for request, using model `SPPermissions.Permission`.
     */
    public static func native(_ permissions: [SPPermissions.Permission]) -> SPPermissionsNativeController {
        let controller = SPPermissionsNativeController(permissions.removedDuplicates())
        return controller
    }
    
    #if os(iOS)
    
    /**
     SPPermissions: Request permissions as list style.
     
     - parameter permissions: List if permissions for request, using model `SPPermissions.Permission`.
     */
    public static func list(_ permissions: [SPPermissions.Permission]) -> SPPermissionsListController {
        let controller = SPPermissionsListController(permissions.removedDuplicates())
        return controller
    }
    
    /**
     SPPermissions: Request permissions as dialog style.
     
     - parameter permissions: List if permissions for request, using model `SPPermissions.Permission`.
     */
    public static func dialog(_ permissions: [SPPermissions.Permission]) -> SPPermissionsDialogController {
        let controller = SPPermissionsDialogController(permissions.removedDuplicates())
        return controller
    }
    
    #endif
    
    // MARK: - Models
    
    /**
     SPPermissions: Basic permission model.
     
     Using like enum for list of permissions.
     All permissions will be adding to this class like static.
     */
    open class Permission: Equatable {
        
        public final var authorized: Bool {
            return status == .authorized
        }
        
        public final var denied: Bool {
            return status == .denied
        }
        
        public final var notDetermined: Bool {
            return status == .notDetermined
        }
        
        /**
         SPPermissions: Internal name for permissions.
         
         Don't use it in your interface. Only for console debug.
         */
        public var debugName: String {
            return type.name
        }
        
        /**
         SPPermissions: Localized name of permission.
         
         Allowed using in interface.
         */
        public var localisedName: String {
            return Text.permission_name(type)
        }
        
        // MARK: Must Ovveride
        
        /**
         SPPermissions: Permission type.
         */
        open var usageDescriptionKey: String? {
            preconditionFailure("This method must be overridden.")
        }
        
        /**
         SPPermissions: Permission type.
         */
        open var type: PermissionType {
            preconditionFailure("This method must be overridden.")
        }
        
        /**
         SPPermissions: Authorization status of permission.
         */
        open var status: PermissionStatus {
            preconditionFailure("This method must be overridden.")
        }
        
        /**
         SPPermissions: Call request of permission in system.
         */
        open func request(completion: @escaping ()->Void) {
            preconditionFailure("This method must be overridden.")
        }
        
        // MARK: Internal
        
        public static func == (lhs: SPPermissions.Permission, rhs: SPPermissions.Permission) -> Bool {
            return lhs.type == rhs.type
        }
        
        public init() {}
    }
    
    /**
     SPPermissions: Permissions authorization status.
     */
    @objc public enum PermissionStatus: Int {
        
        case authorized
        case denied
        case notDetermined
    }
    
    /**
     SPPermissions: Permissions type.
     
     Type using like identifier for each permission.
     */
    @objc public enum PermissionType: Int {
        
        case camera = 0
        case notification = 2
        case photoLibrary = 1
        case microphone = 3
        case calendar = 4
        case contacts = 5
        case reminders = 6
        case speech = 7
        case locationWhenInUse = 9
        case locationAlways = 10
        case motion = 11
        case mediaLibrary = 12
        case bluetooth = 13
        case tracking = 14
        
        public var name: String {
            switch self {
            case .camera:
                return "Camera"
            case .photoLibrary:
                return "Photo Library"
            case .microphone:
                return "Microphone"
            case .calendar:
                return "Calendar"
            case .contacts:
                return "Contacts"
            case .reminders:
                return "Reminders"
            case .speech:
                return "Speech"
            case .locationAlways:
                return "Location Always"
            case .motion:
                return "Motion"
            case .mediaLibrary:
                return "Media Library"
            case .bluetooth:
                return "Bluetooth"
            case .notification:
                return "Notification"
            case .locationWhenInUse:
                return "Location When Use"
            case .tracking:
                return "Tracking"
            }
        }
    }
}
