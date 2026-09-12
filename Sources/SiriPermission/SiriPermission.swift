import PermissionsKit

#if os(iOS)
import Foundation
import Intents

public extension Permission {

    static var siri: SiriPermission {
        return SiriPermission()
    }
}

public class SiriPermission: Permission {
    
    open override var kind: Permission.Kind { .siri }
    open var usageDescriptionKey: String? { "NSSiriUsageDescription" }
    
    public override var status: Permission.Status {
        switch INPreferences.siriAuthorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        INPreferences.requestSiriAuthorization { _ in
            Task { @MainActor in
                completion()
            }
        }
    }
}
#endif
