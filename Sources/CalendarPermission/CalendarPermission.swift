import PermissionsKit

#if os(iOS)
import Foundation
import EventKit

public extension Permission {
    
    static func calendar(access: CalendarAccess) -> CalendarPermission {
        CalendarPermission(access: access)
    }
}

public class CalendarPermission: Permission {
    
    private let access: CalendarAccess
    
    // MARK: - Init
    
    init(access: CalendarAccess) {
        self.access = access
    }
    
    open override var kind: Permission.Kind { .calendar(access: access) }
    open var usageDescriptionKey: String? {
        guard #available(iOS 17, *) else { return "NSCalendarsUsageDescription" }
        switch access {
        case .full:
            return "NSCalendarsFullAccessUsageDescription"
        case .write:
            return "NSCalendarsWriteOnlyAccessUsageDescription"
        }
    }
    
    public override var status: Permission.Status {
        // Fix when status first time response with other state.
        let _ = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
        switch EKEventStore.authorizationStatus(for: EKEntityType.event) {
        case .fullAccess: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .writeOnly:
            guard #available(iOS 17, *) else { return .authorized }
            return access == .write ? .authorized : .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        
        let eventStore = EKEventStore()
        
        if #available(iOS 17.0, *) {
            if access == .write {
                eventStore.requestWriteOnlyAccessToEvents { (accessGranted: Bool, error: Error?) in
                    Task { @MainActor in
                        completion()
                    }
                }
            } else {
                eventStore.requestFullAccessToEvents { (accessGranted: Bool, error: Error?) in
                    Task { @MainActor in
                        completion()
                    }
                }
            }
        } else {
            eventStore.requestAccess(to: EKEntityType.event) { (accessGranted: Bool, error: Error?) in
                Task { @MainActor in
                    completion()
                }
            }
        }
    }
}
#endif
