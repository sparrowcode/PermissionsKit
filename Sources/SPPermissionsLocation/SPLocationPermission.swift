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

#if SPPERMISSIONS_LOCATION

import UIKit
import MapKit

class SPLocationPermission: SPPermissionInterface {
    
    var status: SPPermissions.Permission.State {
        
        let authorizationStatus: CLAuthorizationStatus = {
            let locationManager = CLLocationManager()
            if #available(iOS 14.0, *) {
                return locationManager.authorizationStatus
            } else {
                return CLLocationManager.authorizationStatus()
            }
        }()
        
        switch authorizationStatus {
        case .authorized: return .authorized
        case .denied: return .denied
        case .notDetermined: return .notDetermined
        case .restricted: return .denied
        case .authorizedAlways:
            if type == .always { return .authorized }
            return .denied
        case .authorizedWhenInUse:
            if type == .always { return .authorized }
            if type == .whenInUse { return .authorized }
            return .denied
        @unknown default: return .denied
        }
    }
    
    // MARK: Internal
    
    var type: SPLocationType
    
    enum SPLocationType {
        
        #if os(iOS)
        case always
        #endif
        case whenInUse
    }
    
    init(type: SPLocationType) {
        self.type = type
    }
    
    func request(completion: @escaping ()->Void) {
        #warning("todo")
        fatalError()
    }
}
#endif
