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

import UIKit

public enum SPPermissions {
    
    @objc public enum Permission: Int {
        
        // MARK: iOS Permissions
        
        #if os(iOS)
        
        @available(iOS 11.0, macCatalyst 14.0, *)
        case camera = 0
        
        case photoLibrary = 1
        case microphone = 3
        case calendar = 4
        case contacts = 5
        case reminders = 6
        case speech = 7
        case locationAlways = 10
        case motion = 11
        case mediaLibrary = 12
        case bluetooth = 13
        
        @available(iOS 14.5, *)
        case tracking = 14
        
        #endif
        
        // MARK: Shared Permissions
        
        case notification = 2
        case locationWhenInUse = 9
        
    }
}

extension SPPermissions.Permission {
    
    // MARK: - Status
    
    public var authorized: Bool {
        let manager = Self.manager(for: self)
        return manager.status == .authorized
    }
    
    public var denied: Bool {
        let manager = Self.manager(for: self)
        return manager.status == .denied
    }
    
    public var notDetermined: Bool {
        let manager = Self.manager(for: self)
        return manager.status == .notDetermined
    }
    
    // MARK: - Request
    
    public func request(completion: @escaping ()->()) {
        let manager = Self.manager(for: self)
        if let usageDescriptionKey = self.usageDescriptionKey {
            guard let _ = Bundle.main.object(forInfoDictionaryKey: usageDescriptionKey) else {
                print("SPPermissions Warning: \(usageDescriptionKey) for \(name) not found in Info.plist.")
                return
            }
        }
        manager.request(completion: completion)
    }
    
    public var usageDescriptionKey: String? {
        switch self {
        #if os(iOS)
        case .camera:
            return "NSCameraUsageDescription"
        case .photoLibrary:
            return "NSPhotoLibraryUsageDescription"
        case .microphone:
            return "NSMicrophoneUsageDescription"
        case .calendar:
            return "NSCalendarsUsageDescription"
        case .contacts:
            return "NSContactsUsageDescription"
        case .reminders:
            return "NSRemindersUsageDescription"
        case .speech:
            return "NSSpeechRecognitionUsageDescription"
        case .locationAlways:
            return "NSLocationAlwaysAndWhenInUseUsageDescription"
        case .motion:
            return "NSMotionUsageDescription"
        case .mediaLibrary:
            return "NSAppleMusicUsageDescription"
        case .bluetooth:
            return "NSBluetoothAlwaysUsageDescription"
        #endif
        case .notification:
            return nil
        case .locationWhenInUse:
            return "NSLocationWhenInUseUsageDescription"
        case .tracking:
            return "NSUserTrackingUsageDescription"
        }
    }
    
    // MARK: - Texts
    
    public var name: String {
        switch self {
        #if os(iOS)
        case .camera:
            return "Camera"
        case .photoLibrary:
            return "Photo Library"
        case .microphone:
            return "Microphone"
        case .calendar:
            return "Calendar"
        case .contacts:
            return "Contacts"
        case .reminders:
            return "Reminders"
        case .speech:
            return "Speech"
        case .locationAlways:
            return "Location Always"
        case .motion:
            return "Motion"
        case .mediaLibrary:
            return "Media Library"
        case .bluetooth:
            return "Bluetooth"
        #endif
        case .notification:
            return "Notification"
        case .locationWhenInUse:
            return "Location When Use"
        case .tracking:
            return "Tracking"
        }
    }
    
    // MARK: - Models
    
    public enum State {
        
        case authorized
        
        case denied
        
        case notDetermined
    }
    
    // MARK: - Internal
    
    internal static func manager(for permission: SPPermissions.Permission) -> SPPermissionsPermissionInterface {
        switch permission {
        #if os(iOS)
        case .camera:
            #if SPPERMISSIONS_CAMERA
            if #available(iOS 11.0, macCatalyst 14.0, *) {
                return SPCameraPermission()
            } else {
                fatalError(error(permission))
            }
            #else
            fatalError(error(permission))
            #endif
        case .photoLibrary:
            #if SPPERMISSIONS_PHOTOLIBRARY
            return SPPhotoLibraryPermission()
            #else
            fatalError(error(permission))
            #endif
        case .microphone:
            #if SPPERMISSIONS_MICROPHONE
            return SPMicrophonePermission()
            #else
            fatalError(error(permission))
            #endif
        case .calendar:
            #if SPPERMISSIONS_CALENDAR
            return SPCalendarPermission()
            #else
            fatalError(error(permission))
            #endif
        case .contacts:
            #if SPPERMISSIONS_CONTACTS
            return SPContactsPermission()
            #else
            fatalError(error(permission))
            #endif
        case .reminders:
            #if SPPERMISSIONS_REMINDERS
            return SPRemindersPermission()
            #else
            fatalError(error(permission))
            #endif
        case .speech:
            #if SPPERMISSIONS_SPEECH
            return SPSpeechPermission()
            #else
            fatalError(error(permission))
            #endif
        case .locationAlways:
            #if SPPERMISSIONS_LOCATION
            return SPLocationPermission(type: .always)
            #else
            fatalError(error(permission))
            #endif
        case .motion:
            #if SPPERMISSIONS_MOTION
            return SPMotionPermission()
            #else
            fatalError(error(permission))
            #endif
        case .mediaLibrary:
            #if SPPERMISSIONS_MEDIALIBRARY
            return SPMediaLibraryPermission()
            #else
            fatalError(error(permission))
            #endif
        case .bluetooth:
            #if SPPERMISSIONS_BLUETOOTH
            return SPBluetoothPermission()
            #else
            fatalError(error(permission))
            #endif
        #endif
        case .notification:
            #if SPPERMISSIONS_NOTIFICATION
            return SPNotificationPermission()
            #else
            fatalError(error(permission))
            #endif
        case .locationWhenInUse:
            #if SPPERMISSIONS_LOCATION
            return SPLocationPermission(type: .whenInUse)
            #else
            fatalError(error(permission))
            #endif
        case .tracking:
            #if SPPERMISSIONS_TRACKING
            if #available(iOS 14.5, *) {
                return SPTrackingPermission()
            } else {
                fatalError(error(permission))
            }
            #else
            fatalError(error(permission))
            #endif
        }
    }
    
    private static func error(_ permission: SPPermissions.Permission) -> String {
        return "SPPermissions: \(permission.name) not imported. It may happen with 2 ways, or code not correctly imported or macros ignoring. In any case please create new issue here https://github.com/ivanvorobei/SPPermissions and provide all details."
    }
}
