// The MIT License (MIT)
// Copyright © 2019 Ivan Varabei (varabeis@icloud.com)
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

#if SPPERMISSION_LOCATION

import UIKit
import MapKit

struct SPLocationPermission: SPPermissionProtocol {
    
    var type: SPLocationType
    
    enum SPLocationType {
        case WhenInUse
        #if os(iOS)
        case AlwaysAndWhenInUse
        #endif
    }
    
    init(type: SPLocationType) {
        self.type = type
    }
    
    var isAuthorized: Bool {
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedAlways {
            return true
        } else {
            if type == .WhenInUse {
                return status == .authorizedWhenInUse
            } else {
                return false
            }
        }
    }
    
    var isDenied: Bool {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        return authorizationStatus == .denied || authorizationStatus == .restricted
    }
    
    func request(completion: @escaping ()->()?) {
        
        switch self.type {
        #if os(iOS)
        case .AlwaysAndWhenInUse:
            if SPPermissionAlwaysAuthorizationLocationHandler.shared == nil {
                SPPermissionAlwaysAuthorizationLocationHandler.shared = SPPermissionAlwaysAuthorizationLocationHandler()
            }
            
            SPPermissionAlwaysAuthorizationLocationHandler.shared!.requestPermission { (authorized) in
                DispatchQueue.main.async {
                    completion()
                    SPPermissionAlwaysAuthorizationLocationHandler.shared = nil
                }
            }
            break
        #endif
        case .WhenInUse:
            if SPPermissionWhenInUseAuthorizationLocationHandler.shared == nil {
                SPPermissionWhenInUseAuthorizationLocationHandler.shared = SPPermissionWhenInUseAuthorizationLocationHandler()
            }
            
            SPPermissionWhenInUseAuthorizationLocationHandler.shared!.requestPermission { (authorized) in
                DispatchQueue.main.async {
                    completion()
                    SPPermissionWhenInUseAuthorizationLocationHandler.shared = nil
                }
            }
            break
        }
    }
}
#endif
