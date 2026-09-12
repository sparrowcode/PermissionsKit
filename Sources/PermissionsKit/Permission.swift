import Foundation

#if os(iOS)
import UIKit
#endif

open class Permission {
    
    open var authorized: Bool {
        return status == .authorized
    }
    
    open var denied: Bool {
        return status == .denied
    }
    
    open var notDetermined: Bool {
        return status == .notDetermined
    }
    
    open var debugName: String {
        return kind.name
    }
    
    open var localisedName: String {
        return Texts.permission_name(for: kind)
    }
    
    /**
     PermissionsKit: Open settings page.
     For most permissions its app page in settings app.
     You can override it if your permission needs to open a custom page.
     */
    #if os(iOS)
    @available(iOSApplicationExtension, unavailable)
    @MainActor
    open func openSettingPage() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: nil)
        }
    }
    #endif
    
    // MARK: - Must Override
    
    open var kind: Permission.Kind {
        preconditionFailure("This method must be overridden.")
    }
    
    open var status: Permission.Status {
        preconditionFailure("This method must be overridden.")
    }
    
    open func request(completion: @escaping @MainActor () -> Void) {
        preconditionFailure("This method must be overridden.")
    }
    
    open var canBePresentWithCustomInterface: Bool {
        return true
    }
    
    // MARK: Internal
    
    public init() {}
    
    // MARK: - Models
    
    @objc public enum Status: Int, CustomStringConvertible {
        
        case authorized
        case denied
        case notDetermined
        case notSupported
        
        public var description: String {
            switch self {
            case .authorized: return "authorized"
            case .denied: return "denied"
            case .notDetermined: return "not determined"
            case .notSupported: return "not supported"
            }
        }
    }
    
    public enum Kind {
        
        case camera
        case notification(access: Set<NotificationAccess>)
        case photoLibrary
        case microphone
        case calendar(access: CalendarAccess)
        case contacts
        case reminders
        case speech
        case location(access: LocationAccess)
        case motion
        case mediaLibrary
        case bluetooth
        case tracking
        case faceID
        case siri
        case health
        
        public var name: String {
            switch self {
            case .camera:
                return "Camera"
            case .photoLibrary:
                return "Photo Library"
            case .microphone:
                return "Microphone"
            case .calendar(access: .write):
                return "Calendar Only Write"
            case .calendar(access: .full):
                return "Calendar"
            case .contacts:
                return "Contacts"
            case .reminders:
                return "Reminders"
            case .speech:
                return "Speech"
            case .location(access: .always):
                return "Location Always"
            case .location(access: .whenInUse):
                return "Location When Use"
            case .motion:
                return "Motion"
            case .mediaLibrary:
                return "Media Library"
            case .bluetooth:
                return "Bluetooth"
            case .notification:
                return "Notification"
            case .tracking:
                return "Tracking"
            case .faceID:
                return "FaceID"
            case .siri:
                return "Siri"
            case .health:
                return "Health"
            }
        }
    }
    
    public enum CalendarAccess {
        
        case full
        case write
    }
    
    public enum LocationAccess {
        
        case whenInUse
        case always
    }
    
    public enum NotificationAccess {
        
        case badge
        case sound
        case alert
        case carPlay
        case criticalAlert
        case providesAppNotificationSettings
        case provisional
        
        @available(iOS, introduced: 13.0, deprecated: 15.0, message: "Only from iOS 13.0 to 15.0")
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        case announcement
        @available(iOS, introduced: 15.0, deprecated: 15.0, message: "Only with iOS 15.0")
        case timeSensitive
    }
}
