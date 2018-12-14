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

import UIKit
import AVFoundation
import UserNotifications
import Photos
import MapKit
import EventKit
import Contacts
import Speech
import MediaPlayer
import HealthKit

public struct SPPermission {
    
    public static func isAllow(_ permission: SPPermissionType) -> Bool {
        let manager = self.getManagerForPermission(permission)
        return manager.isAuthorized()
    }
    
    public static func request(_ permission: SPPermissionType, with complectionHandler: @escaping ()->()) {
        let manager = self.getManagerForPermission(permission)
        manager.request(withComlectionHandler: {
            complectionHandler()
        })
    }
    
    private init() {}
}

fileprivate protocol SPPermissionInterface {
    
    func isAuthorized() -> Bool
    
    func request(withComlectionHandler complectionHandler: @escaping ()->()?)
}

extension SPPermission {
    
    fileprivate static func getManagerForPermission(_ permission: SPPermissionType) -> SPPermissionInterface {
        switch permission {
        case .camera:
            return SPCameraPermission()
        case .photoLibrary:
            return SPPhotoLibraryPermission()
        case .notification:
            return SPNotificationPermission()
        case .microphone:
            return SPMicrophonePermission()
        case .calendar:
            return SPCalendarPermission()
        case .contacts:
            return SPContactsPermission()
        case .reminders:
            return SPRemindersPermission()
        case .speech:
            return SPSpeechPermission()
        case .locationAlways:
            return SPLocationPermission(type: SPLocationPermission.SPLocationType.Always)
        case .locationWhenInUse:
           return SPLocationPermission(type: SPLocationPermission.SPLocationType.WhenInUse)
        case .locationWithBackground:
           return SPLocationPermission(type: SPLocationPermission.SPLocationType.AlwaysWithBackground)
        case .mediaLibrary:
            return SPMediaLibraryPermission()
        }
    }
}

extension SPPermission {
    
    fileprivate struct SPCameraPermission: SPPermissionInterface {
        
        func isAuthorized() -> Bool {
            if AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == AVAuthorizationStatus.authorized {
                return true
            } else {
                return false
            }
        }
        
        func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
            AVCaptureDevice.requestAccess(for: AVMediaType.video, completionHandler: {
                finished in
                DispatchQueue.main.async {
                    complectionHandler()
                }
            })
        }
    }
    
    fileprivate struct SPNotificationPermission: SPPermissionInterface {
        
        func isAuthorized() -> Bool {
            return UIApplication.shared.isRegisteredForRemoteNotifications
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
                UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
                DispatchQueue.main.async {
                    complectionHandler()
                }
            }
            
            UIApplication.shared.registerForRemoteNotifications()
        }
    }
    
    fileprivate struct SPPhotoLibraryPermission: SPPermissionInterface {
        
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
    
    fileprivate struct SPMicrophonePermission: SPPermissionInterface {
        
        func isAuthorized() -> Bool {
            if AVAudioSession.sharedInstance().recordPermission == .granted {
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
    
    
    fileprivate struct SPCalendarPermission: SPPermissionInterface {
        
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
    
    fileprivate struct SPContactsPermission: SPPermissionInterface {
        
        func isAuthorized() -> Bool {
            if #available(iOS 9.0, *) {
                let status = CNContactStore.authorizationStatus(for: .contacts)
                if status == .authorized {
                    return true
                } else {
                    return false
                }
            } else {
                let status = ABAddressBookGetAuthorizationStatus()
                if status == .authorized {
                    return true
                } else {
                    return false
                }
            }
            
        }
        
        func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
            if #available(iOS 9.0, *) {
                let store = CNContactStore()
                store.requestAccess(for: .contacts, completionHandler: { (granted, error) in
                    DispatchQueue.main.async {
                        complectionHandler()
                    }
                })
            } else {
                let addressBookRef: ABAddressBook = ABAddressBookCreateWithOptions(nil, nil).takeRetainedValue()
                ABAddressBookRequestAccessWithCompletion(addressBookRef) {
                    (granted: Bool, error: CFError?) in
                    DispatchQueue.main.async() {
                        complectionHandler()
                    }
                }
            }
        }
    }
    
    fileprivate struct SPRemindersPermission: SPPermissionInterface {
        
        func isAuthorized() -> Bool {
            let status = EKEventStore.authorizationStatus(for: EKEntityType.reminder)
            switch (status) {
            case EKAuthorizationStatus.authorized:
                return true
            default:
                return false
            }
        }
        
        func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
            let eventStore = EKEventStore()
            eventStore.requestAccess(to: EKEntityType.reminder, completion: {
                (accessGranted: Bool, error: Error?) in
                DispatchQueue.main.async {
                    complectionHandler()
                }
            })
        }
    }
    
    fileprivate struct SPBluetoothPermission: SPPermissionInterface {
        
        func isAuthorized() -> Bool {
            let status = EKEventStore.authorizationStatus(for: EKEntityType.reminder)
            switch (status) {
            case EKAuthorizationStatus.authorized:
                return true
            default:
                return false
            }
        }
        
        func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
            let eventStore = EKEventStore()
            eventStore.requestAccess(to: EKEntityType.reminder, completion: {
                (accessGranted: Bool, error: Error?) in
                DispatchQueue.main.async {
                    complectionHandler()
                }
            })
        }
    }
    
    fileprivate struct SPSpeechPermission: SPPermissionInterface {
        
        func isAuthorized() -> Bool {
            guard #available(iOS 10.0, *) else { return false }
            return SFSpeechRecognizer.authorizationStatus() == .authorized
        }
        
        func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
            guard #available(iOS 10.0, *) else {
                fatalError("ios 10 or higher required")
            }
            
            SFSpeechRecognizer.requestAuthorization { status in
                DispatchQueue.main.async {
                    complectionHandler()
                }
            }
        }
    }
    
    fileprivate struct SPMediaLibraryPermission: SPPermissionInterface {
        
        func isAuthorized() -> Bool {
            let status = MPMediaLibrary.authorizationStatus()
            if status == .authorized {
                return true
            } else {
                return false
            }
        }
        
        func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
            MPMediaLibrary.requestAuthorization() { status in
                DispatchQueue.main.async {
                    complectionHandler()
                }
            }
        }
    }
    
    fileprivate struct SPLocationPermission: SPPermissionInterface {
        
        var type: SPLocationType
        
        enum SPLocationType {
            case Always
            case WhenInUse
            case AlwaysWithBackground
        }
        
        init(type: SPLocationType) {
            self.type = type
        }
        
        func isAuthorized() -> Bool {
            
            let status = CLLocationManager.authorizationStatus()
            
            switch self.type {
            case .Always:
                if status == .authorizedAlways {
                    return true
                } else {
                    return false
                }
            case .WhenInUse:
                if status == .authorizedAlways {
                    return true
                } else {
                    if status == .authorizedWhenInUse {
                        return true
                    } else {
                        return false
                    }
                }
            case .AlwaysWithBackground:
                if status == .authorizedAlways {
                    return true
                } else {
                    return false
                }
            }
        }
        
        func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
            
            switch self.type {
            case .Always:
                if SPPermissionAlwaysAuthorizationLocationHandler.shared == nil {
                    SPPermissionAlwaysAuthorizationLocationHandler.shared = SPPermissionAlwaysAuthorizationLocationHandler()
                }
                
                SPPermissionAlwaysAuthorizationLocationHandler.shared!.requestPermission { (authorized) in
                    DispatchQueue.main.async {
                        complectionHandler()
                        SPPermissionAlwaysAuthorizationLocationHandler.shared = nil
                    }
                }
                break
            case .WhenInUse:
                if SPPermissionWhenInUseAuthorizationLocationHandler.shared == nil {
                    SPPermissionWhenInUseAuthorizationLocationHandler.shared = SPPermissionWhenInUseAuthorizationLocationHandler()
                }
                
                SPPermissionWhenInUseAuthorizationLocationHandler.shared!.requestPermission { (authorized) in
                    DispatchQueue.main.async {
                        complectionHandler()
                        SPPermissionWhenInUseAuthorizationLocationHandler.shared = nil
                    }
                }
                break
            case .AlwaysWithBackground:
                if SPPermissionLocationWithBackgroundHandler.shared == nil {
                    SPPermissionLocationWithBackgroundHandler.shared = SPPermissionLocationWithBackgroundHandler()
                }
                
                SPPermissionLocationWithBackgroundHandler.shared!.requestPermission { (authorized) in
                    DispatchQueue.main.async {
                        complectionHandler()
                        SPPermissionLocationWithBackgroundHandler.shared = nil
                    }
                }
                break
            }
        }
    }

}
