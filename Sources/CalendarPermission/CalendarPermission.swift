import PermissionsKit

#if os(iOS)
import Foundation
import EventKit

public extension Permission {
    
    static func calendar(access: CalendarAccess) -> CalendarPermission {
        CalendarPermission(kind: .calendar(access: access))
    }
}

public class CalendarPermission: Permission {
    
    private var _kind: Permission.Kind
    
    // MARK: - Init
    
    init(kind: Permission.Kind) {
        self._kind = kind
    }
    
    open override var kind: Permission.Kind { self._kind }
    open var usageDescriptionKey: String? {
        if #available(iOS 17, *) {
            switch kind {
            case .calendar(let access):
                switch access {
                case .full:
                    return "NSCalendarsFullAccessUsageDescription"
                case .write:
                    return "NSCalendarsWriteOnlyAccessUsageDescription"
                }
            default:
                fatalError()
            }
        } else {
            return "NSCalendarsUsageDescription"
        }
    }
    
    public override var status: Permission.Status {
        // Fix when status first time response with other state.
        let _ = EKEventStore.authorizationStatus(for: EKEntityType.event)
        
        switch EKEventStore.authorizationStatus(for: EKEntityType.event) {
        case .authorized: return .authorized
        case .denied: return .denied
        case .fullAccess: return .authorized
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .writeOnly:
            if #available(iOS 17, *) {
                switch kind {
                case .calendar(let access):
                    switch access {
                    case .full:
                        return .denied
                    case .write:
                        return .authorized
                    }
                default:
                    fatalError()
                }
            } else {
                return .authorized
            }
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        
        let eventStore = EKEventStore()
        
        if #available(iOS 17.0, *) {
            
            let requestWriteOnly = {
                eventStore.requestWriteOnlyAccessToEvents { (accessGranted: Bool, error: Error?) in
                    Task { @MainActor in
                        completion()
                    }
                }
            }
            
            let requestFull = {
                eventStore.requestFullAccessToEvents { (accessGranted: Bool, error: Error?) in
                    Task { @MainActor in
                        completion()
                    }
                }
            }
            
            switch kind {
            case .calendar(let access):
                if access == .write {
                    requestWriteOnly()
                } else {
                    requestFull()
                }
            default:
                requestFull()
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
