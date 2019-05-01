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
import CoreMotion

public struct SPPermission {
    
    public static func isAllowed(_ permission: SPPermissionType) -> Bool {
        let manager = self.getManagerForPermission(permission)
        return manager.isAuthorized
    }
    
    public static func isDenied(_ permission: SPPermissionType) -> Bool {
        let manager = self.getManagerForPermission(permission)
        return manager.isDenied
    }
    
    public static func request(_ permission: SPPermissionType, with complectionHandler: @escaping ()->()) {
        let manager = self.getManagerForPermission(permission)
        if let usageDescriptionKey = permission.usageDescriptionKey {
            guard let _ = Bundle.main.object(forInfoDictionaryKey: usageDescriptionKey) else {
                print("SPPermission Warning - \(usageDescriptionKey) for \(permission.name) not found in Info.plist")
                return
            }
        }
        manager.request(withComlectionHandler: {
            complectionHandler()
        })
    }
    
    private init() {}
}

fileprivate protocol SPPermissionInterface {
    
    var isAuthorized: Bool { get }
    
    var isDenied: Bool { get }
    
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
        case .locationWhenInUse:
           return SPLocationPermission(type: SPLocationPermission.SPLocationType.WhenInUse)
        case .locationAlwaysAndWhenInUse:
            return SPLocationPermission(type: SPLocationPermission.SPLocationType.AlwaysAndWhenInUse)
        case .motion:
            return SPMotionPermission()
        case .mediaLibrary:
            return SPMediaLibraryPermission()
        }
    }
}

extension SPPermission {
    
    fileprivate struct SPCameraPermission: SPPermissionInterface {
        
        var isAuthorized: Bool {
            return AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == AVAuthorizationStatus.authorized
        }
        
        var isDenied: Bool {
            return AVCaptureDevice.authorizationStatus(for: AVMediaType.video) == AVAuthorizationStatus.denied
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
        
        var isAuthorized: Bool {
            guard let authorizationStatus = fetchAuthorizationStatus() else { return false }
            return authorizationStatus == .authorized
        }
        
        var isDenied: Bool {
            guard let authorizationStatus = fetchAuthorizationStatus() else { return false }
            return authorizationStatus == .denied
        }
        
        private func fetchAuthorizationStatus() -> UNAuthorizationStatus? {
            var notificationSettings: UNNotificationSettings?
            let semaphore = DispatchSemaphore(value: 0)
            
            DispatchQueue.global().async {
                UNUserNotificationCenter.current().getNotificationSettings { setttings in
                    notificationSettings = setttings
                    semaphore.signal()
                }
            }
            
            semaphore.wait()
            return notificationSettings?.authorizationStatus
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

        var isAuthorized: Bool {
            return PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized
        }
        
        var isDenied: Bool {
            return PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.denied
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
        
        var isAuthorized: Bool {
            return AVAudioSession.sharedInstance().recordPermission == .granted
        }
        
        var isDenied: Bool {
            return AVAudioSession.sharedInstance().recordPermission == .denied
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
        
        var isAuthorized: Bool {
            return EKEventStore.authorizationStatus(for: EKEntityType.event) == .authorized
        }
        
        var isDenied: Bool {
            return EKEventStore.authorizationStatus(for: EKEntityType.event) == .denied
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
        
        var isAuthorized: Bool {
            if #available(iOS 9.0, *) {
                return CNContactStore.authorizationStatus(for: .contacts) == .authorized
            } else {
                return ABAddressBookGetAuthorizationStatus() == .authorized
            }
        }
        
        var isDenied: Bool {
            if #available(iOS 9.0, *) {
                return CNContactStore.authorizationStatus(for: .contacts) == .denied
            } else {
                return ABAddressBookGetAuthorizationStatus() == .denied
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
        
        var isAuthorized: Bool {
            return EKEventStore.authorizationStatus(for: EKEntityType.reminder) == .authorized
        }
        
        var isDenied: Bool {
            return EKEventStore.authorizationStatus(for: EKEntityType.reminder) == .denied
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
        
        var isAuthorized: Bool {
            return EKEventStore.authorizationStatus(for: EKEntityType.reminder) == .authorized
        }
        
        var isDenied: Bool {
            return EKEventStore.authorizationStatus(for: EKEntityType.reminder) == .denied
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
        
        var isAuthorized: Bool {
            return SFSpeechRecognizer.authorizationStatus() == .authorized
        }
        
        var isDenied: Bool {
            return SFSpeechRecognizer.authorizationStatus() == .denied
        }
        
        func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
            SFSpeechRecognizer.requestAuthorization { status in
                DispatchQueue.main.async {
                    complectionHandler()
                }
            }
        }
    }
    
    fileprivate struct SPMediaLibraryPermission: SPPermissionInterface {
        
        var isAuthorized: Bool {
            return MPMediaLibrary.authorizationStatus() == .authorized
        }
        
        var isDenied: Bool {
            return MPMediaLibrary.authorizationStatus() == .denied
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
            case WhenInUse
            case AlwaysAndWhenInUse
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
            return CLLocationManager.authorizationStatus() == .denied
        }
        
        func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
            
            switch self.type {
            case .AlwaysAndWhenInUse:
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
            }
        }
    }
    
    private struct SPMotionPermission: SPPermissionInterface {
        
        var isAuthorized: Bool {
            if #available(iOS 11.0, *) {
                return CMMotionActivityManager.authorizationStatus() == .authorized
            }
            return false
        }
        
        var isDenied: Bool {
            if #available(iOS 11.0, *) {
                return CMMotionActivityManager.authorizationStatus() == .denied
            }
            return false
        }
        
        func request(withComlectionHandler complectionHandler: @escaping ()->()?) {
            let manager = CMMotionActivityManager()
            let today = Date()
            
            manager.queryActivityStarting(from: today, to: today, to: OperationQueue.main, withHandler: { (activities: [CMMotionActivity]?, error: Error?) -> () in
                complectionHandler()
                manager.stopActivityUpdates()
            })
        }
    }

}
