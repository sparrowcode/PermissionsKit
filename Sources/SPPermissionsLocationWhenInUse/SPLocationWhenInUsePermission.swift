// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if SPPERMISSIONS_SPM
import SPPermissions
import SPPermissionsLocationExtension
#endif

#if SPPERMISSIONS_LOCATION_WHENINUSE
import Foundation
import MapKit

public extension SPPermissions.Permission {
    
    static var locationWhenInUse: SPLocationWhenInUsePermission {
        return SPLocationWhenInUsePermission()
    }
}

public class SPLocationWhenInUsePermission: SPPermissions.Permission {
    
    open override var type: SPPermissions.PermissionType { .locationWhenInUse }
    open var usageDescriptionKey: String? { "NSLocationAlwaysAndWhenInUseUsageDescription" }
    
    public override var status: SPPermissions.PermissionStatus {
        let authorizationStatus: CLAuthorizationStatus = {
            let locationManager = CLLocationManager()
            if #available(iOS 14.0, tvOS 14.0, *) {
                return locationManager.authorizationStatus
            } else {
                return CLLocationManager.authorizationStatus()
            }
        }()
        
        switch authorizationStatus {
        #if os(iOS)
        case .authorized: return .authorized
        #endif
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .authorizedAlways: return .authorized
        case .authorizedWhenInUse: return .authorized
        @unknown default: return .denied
        }
    }
    
    public var isPrecise: Bool {
        #if os(iOS)
        if #available(iOS 14.0, *) {
            switch CLLocationManager().accuracyAuthorization {
            case .fullAccuracy: return true
            case .reducedAccuracy: return false
            @unknown default: return false
            }
        }
        #endif
        return false
    }
    
    public override func request(completion: @escaping () -> Void) {
        SPLocationWhenInUseHandler.shared = SPLocationWhenInUseHandler()
        SPLocationWhenInUseHandler.shared?.requestPermission() {
            DispatchQueue.main.async {
                completion()
                SPLocationWhenInUseHandler.shared = nil
            }
        }
    }
}

#endif
