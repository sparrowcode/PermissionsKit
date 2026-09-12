import PermissionsKit
import UserNotifications

public extension Permission {
    
    static func notification(_ access: Set<NotificationAccess> = [.alert, .badge, .sound]) -> NotificationPermission {
        return NotificationPermission(kind: .notification(access: access))
    }
}

public class NotificationPermission: Permission {
    
    private var _kind: Permission.Kind
    open override var kind: Permission.Kind { self._kind }
    
    init(kind: Permission.Kind) {
        self._kind = kind
    }
    
    public override var status: Permission.Status {
        guard let authorizationStatus = fetchAuthorizationStatus() else { return .notDetermined }
        switch authorizationStatus {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .provisional: return .authorized
        case .ephemeral: return .authorized
        @unknown default: return .denied
        }
    }
    
    /*
     PermissionsKit: Notification center reports its settings asynchronously,
     while the status property is synchronous. The semaphore bridges the two,
     and it also orders the write and the read of the status.
     */
    private func fetchAuthorizationStatus() -> UNAuthorizationStatus? {
        nonisolated(unsafe) var authorizationStatus: UNAuthorizationStatus?
        let semaphore = DispatchSemaphore(value: 0)
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            authorizationStatus = settings.authorizationStatus
            semaphore.signal()
        }
        semaphore.wait()
        return authorizationStatus
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        let center = UNUserNotificationCenter.current()
        switch _kind {
        case .notification(let access):
            center.requestAuthorization(options: UNAuthorizationOptions(access.map { $0.userNotifcationAuthorizationOptions })) { (granted, error) in
                Task { @MainActor in
                    completion()
                }
            }
        default:
            fatalError()
        }
    }
}
