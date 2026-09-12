import PermissionsKit

#if os(iOS)
import Foundation
import CoreLocation

public extension Permission {
    
    static func location(access: LocationAccess) -> LocationPermission {
        LocationPermission(access: access)
    }
}

public class LocationPermission: Permission {
    
    private let access: LocationAccess
    
    // MARK: - Init
    
    init(access: LocationAccess) {
        self.access = access
    }
    
    open override var kind: Permission.Kind { .location(access: access) }
    open var usageDescriptionKey: String? {
        switch access {
        case .whenInUse:
            return "NSLocationWhenInUseUsageDescription"
        case .always:
            return "NSLocationAlwaysAndWhenInUseUsageDescription"
        }
    }
    
    public override var status: Permission.Status {
        switch CLLocationManager().authorizationStatus {
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        /*
         PermissionsKit: Always covers when-in-use as well, so it satisfies
         either access level. When-in-use satisfies only its own.
         */
        case .authorizedAlways: return .authorized
        case .authorizedWhenInUse: return access == .whenInUse ? .authorized : .denied
        @unknown default: return .denied
        }
    }
    
    public var isPrecise: Bool {
        switch CLLocationManager().accuracyAuthorization {
        case .fullAccuracy: return true
        case .reducedAccuracy: return false
        @unknown default: return false
        }
    }
    
    public override func request(completion: @escaping @MainActor () -> Void) {
        switch access {
        case .whenInUse:
            LocationWhenInUseHandler.shared = LocationWhenInUseHandler()
            LocationWhenInUseHandler.shared?.requestPermission() {
                Task { @MainActor in
                    completion()
                    LocationWhenInUseHandler.shared = nil
                }
            }
        case .always:
            LocationAlwaysHandler.shared = LocationAlwaysHandler()
            LocationAlwaysHandler.shared?.requestPermission() {
                Task { @MainActor in
                    completion()
                    LocationAlwaysHandler.shared = nil
                }
            }
        }
    }
}
#endif
