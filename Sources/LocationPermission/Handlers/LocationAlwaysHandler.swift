import PermissionsKit

#if os(iOS)
import Foundation
import MapKit

class LocationAlwaysHandler: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Location Manager
    
    lazy var locationManager = CLLocationManager()
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .notDetermined {
            return
        }
        notifyCompletionHandler()
    }
    
    // MARK: - Process
    
    var completionHandler: @MainActor () -> Void = {}
    
    /*
     PermissionsKit: System callbacks arrive off the main actor, so the closure
     is copied into a local first — capturing it directly would send the handler
     itself, which is not Sendable.
     */
    private func notifyCompletionHandler() {
        let completionHandler = completionHandler
        Task { @MainActor in completionHandler() }
    }
    
    func requestPermission(_ completionHandler: @escaping @MainActor () -> Void) {
        self.completionHandler = completionHandler
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
        case .authorizedWhenInUse:
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
        default:
            notifyCompletionHandler()
        }
    }
    
    // MARK: - Init
    
    nonisolated(unsafe) static var shared: LocationAlwaysHandler?
    
    override init() {
        super.init()
    }
    
    deinit {
        locationManager.delegate = nil
    }
}
#endif
