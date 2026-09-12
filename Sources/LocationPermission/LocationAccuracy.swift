import Foundation
import MapKit

extension CLLocationManager {
    
    public func setAccuracy(_ value: LocationAccuracy) {
        desiredAccuracy = value.coreLocationAccuracy
    }
}

public enum LocationAccuracy {
    
    case best
    case bestForNavigation
    case nearestTenMeters
    case hundredMeters
    case kilometer
    case threeKilometers
    case reduced
    
    var coreLocationAccuracy: CLLocationAccuracy {
        switch self {
        case .best: return kCLLocationAccuracyBest
        case .bestForNavigation: return  kCLLocationAccuracyBestForNavigation
        case .nearestTenMeters: return kCLLocationAccuracyNearestTenMeters
        case .hundredMeters: return kCLLocationAccuracyHundredMeters
        case .kilometer: return kCLLocationAccuracyKilometer
        case .threeKilometers: return  kCLLocationAccuracyThreeKilometers
        case .reduced: return kCLLocationAccuracyReduced
        }
    }
}
