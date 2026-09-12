import PermissionsKit

#if os(iOS)
import Foundation
import CoreMotion

public extension Permission {
    
    static var motion: MotionPermission {
        return MotionPermission()
    }
}

public class MotionPermission: Permission {
    
    open override var kind: Permission.Kind { .motion }
    open var usageDescriptionKey: String? { "NSMotionUsageDescription" }
    
    public override var status: Permission.Status {
        switch CMMotionActivityManager.authorizationStatus() {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        @unknown default: return .denied
        }
    }
    
    /*
     PermissionsKit: Core Motion has no request method of its own — reading
     activity is what raises the system dialog, so the query asks for an empty
     range and throws the result away.
     */
    public override func request(completion: @escaping @MainActor () -> Void) {
        let manager = CMMotionActivityManager()
        let now = Date()
        
        manager.queryActivityStarting(from: now, to: now, to: OperationQueue.main) { _, _ in
            Task { @MainActor in completion() }
        }
    }
}
#endif
