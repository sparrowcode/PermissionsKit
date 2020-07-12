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

import Foundation
import MapKit

#if os(iOS)
class SPPermissionAlwaysAuthorizationLocationHandler: NSObject, CLLocationManagerDelegate {
    
    static var shared: SPPermissionAlwaysAuthorizationLocationHandler?
    
    lazy var locationManager: CLLocationManager =  {
        return CLLocationManager()
    }()
    
    var completionHandler: SPPermissionAuthorizationHandlerCompletionBlock?
    
    override init() {
        super.init()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined {
            return
        }

        if let completionHandler = completionHandler {
            completionHandler(self.isAuthorized)
        }
    }
    
    private var whenInUseNotRealChangeStatus: Bool = false
    
    func requestPermission(_ completionHandler: @escaping SPPermissionAuthorizationHandlerCompletionBlock) {
        self.completionHandler = completionHandler
        
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .notDetermined:
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
        case .authorizedWhenInUse:
            locationManager.delegate = self
            locationManager.requestAlwaysAuthorization()
            self.whenInUseNotRealChangeStatus = true
        default:
            completionHandler(self.isAuthorized)
        }
    }
    
    var isAuthorized: Bool {
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedAlways {
            return true
        }
        return false
    }
    
    deinit {
        locationManager.delegate = nil
    }
}
#endif

class SPPermissionWhenInUseAuthorizationLocationHandler: NSObject, CLLocationManagerDelegate {
    
    static var shared: SPPermissionWhenInUseAuthorizationLocationHandler?
    
    lazy var locationManager: CLLocationManager =  {
        return CLLocationManager()
    }()
    
    var completionHandler: SPPermissionAuthorizationHandlerCompletionBlock?
    
    override init() {
        super.init()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .notDetermined {
            return
        }
        
        if let completionHandler = completionHandler {
            completionHandler(self.isAuthorized)
        }
    }
    
    func requestPermission(_ completionHandler: @escaping SPPermissionAuthorizationHandlerCompletionBlock) {
        self.completionHandler = completionHandler
        
        let status = CLLocationManager.authorizationStatus()
        if (status == .notDetermined) || (status == .authorizedAlways) {
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
        } else {
            completionHandler(self.isAuthorized)
        }
    }
    
    var isAuthorized: Bool {
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse {
            return true
        }
        return false
    }
    
    deinit {
        locationManager.delegate = nil
    }
}

#if os(iOS)
extension SPPermissionAlwaysAuthorizationLocationHandler {
    
    typealias SPPermissionAuthorizationHandlerCompletionBlock = (Bool) -> Void
}
#endif

extension SPPermissionWhenInUseAuthorizationLocationHandler {
    
    typealias SPPermissionAuthorizationHandlerCompletionBlock = (Bool) -> Void
}
