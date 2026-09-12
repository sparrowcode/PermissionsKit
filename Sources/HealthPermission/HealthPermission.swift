import PermissionsKit

#if os(iOS)
import Foundation
import HealthKit

public extension Permission {
    
    static var health: HealthPermission {
        return HealthPermission()
    }
}

public class HealthPermission: Permission {
    
    open override var kind: Permission.Kind { .health }
    
    open var readingUsageDescriptionKey: String? { "NSHealthShareUsageDescription" }
    open var writingUsageDescriptionKey: String? { "NSHealthUpdateUsageDescription" }
    
    public static func status(for type: HKObjectType) -> Permission.Status {
        switch HKHealthStore().authorizationStatus(for: type) {
        case .sharingAuthorized: return .authorized
        case .sharingDenied: return .denied
        case .notDetermined: return .notDetermined
        @unknown default: return .denied
        }
    }
    
    public static func request(forReading readingTypes: Set<HKObjectType>, writing writingTypes: Set<HKSampleType>, completion: @escaping @MainActor () -> Void) {
        HKHealthStore().requestAuthorization(toShare: writingTypes, read: readingTypes) { _, _ in
            Task { @MainActor in
                completion()
            }
        }
    }
    
    public override var canBePresentWithCustomInterface: Bool { false }
    
    // MARK: - Locked
    
    @available(*, unavailable)
    open override var authorized: Bool { fatalError() }
    
    @available(*, unavailable)
    open override var denied: Bool { fatalError() }
    
    @available(*, unavailable)
    open override var notDetermined: Bool { fatalError() }
    
    @available(*, unavailable)
    public override var status: Permission.Status { fatalError() }
    
    @available(*, unavailable)
    open override func request(completion: @escaping @MainActor () -> Void) { fatalError() }
}
#endif
