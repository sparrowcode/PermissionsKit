// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
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

import AVFoundation
import UserNotifications
import Photos
import MapKit
import EventKit

class SPCameraPermission: SPPermissionInterface {
    
    func isAuthorized() -> Bool {
        if AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) == AVAuthorizationStatus.authorized {
            return true
        } else {
            return false
        }
    }
    
    func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
        AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: {
            finished in
            DispatchQueue.main.async {
                complectionHandler()
            }
        })
    }
}

class SPNotificationPermission: SPPermissionInterface {
    
    func isAuthorized() -> Bool {
        let notificationType = UIApplication.shared.currentUserNotificationSettings!.types
        if notificationType == [] {
            return false
        } else {
            return true
        }
    }
    
    func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
                DispatchQueue.main.async {
                    complectionHandler()
                }
            }
        } else {
            //TODO: Fallback on earlier versions
        }
        UIApplication.shared.registerForRemoteNotifications()
    }
}

class SPPhotoLibraryPermission: SPPermissionInterface {
    
    func isAuthorized() -> Bool {
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized {
            return true
        } else {
            return false
        }
    }
    
    func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
        PHPhotoLibrary.requestAuthorization({
            finished in
            DispatchQueue.main.async {
                complectionHandler()
            }
        })
    }
}

class SPMicrophonePermission: SPPermissionInterface {
    
    func isAuthorized() -> Bool {
        if AVAudioSession.sharedInstance().recordPermission() == .granted {
            return true
        }
        return false
    }
    
    func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
        AVAudioSession.sharedInstance().requestRecordPermission {
            granted in
            DispatchQueue.main.async {
                complectionHandler()
            }
        }
    }
}


class SPCalendarPermission: SPPermissionInterface {
    
    func isAuthorized() -> Bool {
        let status = EKEventStore.authorizationStatus(for: EKEntityType.event)
        switch (status) {
        case EKAuthorizationStatus.authorized:
            return true
        default:
            return false
        }
    }
    
    func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
        let eventStore = EKEventStore()
        eventStore.requestAccess(to: EKEntityType.event, completion: {
            (accessGranted: Bool, error: Error?) in
            DispatchQueue.main.async {
                complectionHandler()
            }
        })
    }
}

class SPLocationPermission: SPPermissionInterface {
    
    func isAuthorized() -> Bool {
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedAlways {
            return true
        }
        if status == .authorizedWhenInUse {
            return true
        }
        return false
    }
    
    func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
        
        if SPRequestPermissionLocationHandler.shared == nil {
            SPRequestPermissionLocationHandler.shared = SPRequestPermissionLocationHandler()
        }
        
        SPRequestPermissionLocationHandler.shared!.requestPermission { (authorized) in
            DispatchQueue.main.async {
                complectionHandler()
                SPRequestPermissionLocationHandler.shared = nil
            }
        }
    }
}

