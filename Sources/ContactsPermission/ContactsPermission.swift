import PermissionsKit

#if os(iOS)
import Foundation
import Contacts

public extension Permission {

    static var contacts: ContactsPermission {
        return ContactsPermission()
    }
}

public class ContactsPermission: Permission {
    
    open override var kind: Permission.Kind { .contacts }
    open var usageDescriptionKey: String? { "NSContactsUsageDescription" }
    
    /*
     PermissionsKit: `limited` exists only since iOS 18, and a switch case can't
     be marked with availability. The iOS 18 branch keeps the exhaustive switch,
     so the compiler still reports statuses added in future releases.
     */
    public override var status: Permission.Status {
        let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
        if #available(iOS 18.0, *) {
            switch authorizationStatus {
            case .authorized: return .authorized
            case .limited: return .authorized
            case .denied: return .denied
            case .notDetermined: return .notDetermined
            case .restricted: return .denied
            @unknown default: return .denied
            }
        }
        switch authorizationStatus {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        default: return .denied
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        let store = CNContactStore()
        store.requestAccess(for: .contacts, completionHandler: { (granted, error) in
            Task { @MainActor in
                completion()
            }
        })
    }
}
#endif
