import PermissionsKit

#if os(iOS)
import Foundation
import EventKit

public extension Permission {

    static var reminders: RemindersPermission {
        return RemindersPermission()
    }
}

public class RemindersPermission: Permission {
    
    open override var kind: Permission.Kind { .reminders }
    open var usageDescriptionKey: String? { "NSRemindersUsageDescription" }
    open var usageFullAccessDescriptionKey: String? { "NSRemindersFullAccessUsageDescription" }
    
    public override var status: Permission.Status {
        switch EKEventStore.authorizationStatus(for: EKEntityType.reminder) {
        case .fullAccess: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .writeOnly: return .authorized
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        
        let eventStore = EKEventStore()
        
        if #available(iOS 17.0, *) {
            eventStore.requestFullAccessToReminders { (accessGranted: Bool, error: Error?) in
                Task { @MainActor in
                    completion()
                }
            }
        } else {
            eventStore.requestAccess(to: EKEntityType.reminder) { (accessGranted: Bool, error: Error?) in
                Task { @MainActor in
                    completion()
                }
            }
        }
    }
}
#endif
