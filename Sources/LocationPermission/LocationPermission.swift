import PermissionsKit

#if os(iOS)
import Foundation
import EventKit

public extension Permission {
    
    static func location(access: LocationAccess) -> LocationPermission {
        LocationPermission(kind: .location(access: access))
    }
}

public class LocationPermission: Permission {
    
    private var _kind: Permission.Kind
    
    // MARK: - Init
    
    init(kind: Permission.Kind) {
        self._kind = kind
    }
    
    open override var kind: Permission.Kind { self._kind }
    open var usageDescriptionKey: String? {
        switch _kind {
        case .location(let access):
            switch access {
            case .whenInUse:
                return "NSLocationWhenInUseUsageDescription"
            case .always:
                return "NSLocationAlwaysAndWhenInUseUsageDescription"
            }
        default:
            fatalError()
        }
    }
    
    public override var status: Permission.Status {
        switch CLLocationManager().authorizationStatus {
        #if os(iOS)
        case .authorized: return .authorized
        #endif
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .authorizedAlways:
            if case .location(let access) = _kind, access == .always {
                return .authorized
            }
            return .denied
        case .authorizedWhenInUse:
            if case .location(let access) = _kind, access == .whenInUse {
                return .authorized
            }
            return .denied
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
        switch _kind {
        case .location(let access):
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
        default:
            fatalError()
        }
    }
}
#endif
