// The MIT License (MIT)
// Copyright © 2022 Sparrow Code LTD (https://sparrowcode.io, hello@sparrowcode.io)
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

#if PERMISSIONSKIT_SPM
import PermissionsKit
#endif

#if os(iOS) && PERMISSIONSKIT_LOCATION
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
        switch _kind {
        case .location(let access):
            switch access {
            case .whenInUse:
                LocationWhenInUseHandler.shared = LocationWhenInUseHandler()
                LocationWhenInUseHandler.shared?.requestPermission() {
                    DispatchQueue.main.async {
                        completion()
                        LocationWhenInUseHandler.shared = nil
                    }
                }
            case .always:
                LocationAlwaysHandler.shared = LocationAlwaysHandler()
                LocationAlwaysHandler.shared?.requestPermission() {
                    DispatchQueue.main.async {
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
