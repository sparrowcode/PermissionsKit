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
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        let manager = CMMotionActivityManager()
        let today = Date()
        
        manager.queryActivityStarting(from: today, to: today, to: OperationQueue.main, withHandler: { (activities: [CMMotionActivity]?, error: Error?) -> () in
            manager.stopActivityUpdates()
            Task { @MainActor in completion() }
        })
    }
}
#endif
