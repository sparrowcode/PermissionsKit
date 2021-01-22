import UIKit
import SPPermissions

public class AppPermissionsText: SPPermissionsTextProtocol {
    
    public func name(for permission: SPPermission) -> String {
        switch permission {
        #if os(iOS)
        case .camera:
            return "(A)Camera"
        case .photoLibrary:
            return "(A)Photo Library"
        case .microphone:
            return "(A)Microphone"
        case .calendar:
            return "(A)Calendar"
        case .contacts:
            return "(A)Contacts"
        case .reminders:
            return "(A)Reminders"
        case .speech:
            return "(A)Speech"
        case .locationAlwaysAndWhenInUse:
            return "(A)Location Always"
        case .motion:
            return "(A)Motion"
        case .mediaLibrary:
            return "(A)Media Library"
        case .bluetooth:
            return "(A)Bluetooth"
        #endif
        case .notification:
            return "(A)Notification"
        case .locationWhenInUse:
            return "(A)Location When Use"
        case .tracking:
            return "(A)Tracking"
        }
    }
    
    public func description(for permission: SPPermission) -> String {
        switch permission {
        #if os(iOS)
        case .camera:
            return "(A)Allow app for use camera"
        case .calendar:
            return "(A)Application can add events to calendar"
        case .contacts:
            return "(A)Access for your contacts and phones"
        case .microphone:
            return "(A)Allow record voice from app"
        case .photoLibrary:
            return "(A)Access for save photos in your gallery"
        case .reminders:
            return "(A)Application can create new task"
        case .speech:
            return "(A)Allow to check your voice"
        case .locationAlwaysAndWhenInUse:
            return "(A)Allow to access your location"
        case .motion:
            return "(A)Allow to report motion and environment-related data"
        case .mediaLibrary:
            return "(A)Allow to check your media"
        case .bluetooth:
            return "(A)Allow access to bluetooth"
        #endif
        case .notification:
            return "(A)Get important information without opening app."
        case .locationWhenInUse:
            return "(A)Allow to access your location"
        case .tracking:
            return "(A)Allow to access app-related data"
        }
    }
    
    public let titleText: String = "(A)Need Permissions"
    public let subtitleText: String = "(A)These are the permissions the app requires to work properly. Please see description for each permission."
    public let subtitleShortText: String = "(A)Permissions request"
    public let commentText: String = "(A)Permissions are necessary for the application to work and perform correctly. Push are not required permissions."
    
    public let allow: String = "(A)Allow"
    public let allowed: String = "(A)Allowed"
}
