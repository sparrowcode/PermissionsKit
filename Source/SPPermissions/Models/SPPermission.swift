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

import UIKit

/**
 Available permissions. For request permissions recomended use `SPPermissions.requestNative()`.
 For check permission avability use `.isAuthorized` & `.isDenied` methods.
 For `tvOS` available only `.notification` & `.locationWhenInUse` permissions,
 */
@objc public enum SPPermission: Int, CaseIterable {
    
    #if os(iOS)
    case camera = 0
    case photoLibrary = 1
    case microphone = 3
    case calendar = 4
    case contacts = 5
    case reminders = 6
    case speech = 7
    case locationAlwaysAndWhenInUse = 10
    case motion = 11
    case mediaLibrary = 12
    case bluetooth = 13
    #endif
    case notification = 2
    case locationWhenInUse = 9
    
    /**
     Check permission is allowed.
     */
    public var isAuthorized: Bool {
        return SPPermission.manager(for: self).isAuthorized
    }
    
    /**
     Check permission is denied. If permission not requested anytime returned `false`.
     */
    public var isDenied: Bool {
        return SPPermission.manager(for: self).isDenied
    }
    
    /**
     Request permission now
     */
    public func request(completion: @escaping ()->()) {
        let manager = SPPermission.manager(for: self)
        if let usageDescriptionKey = usageDescriptionKey {
            guard let _ = Bundle.main.object(forInfoDictionaryKey: usageDescriptionKey) else {
                print("SPPermissions Warning - \(usageDescriptionKey) for \(name) not found in Info.plist")
                return
            }
        }
        manager.request(completion: { completion() })
    }
    
    /**
     Key which should added in Info.plist file. If key not added, app can crash when request permission.
     Before request check if key added, if not - show warning in console. Without fatal error.
     */
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
        case .locationAlwaysAndWhenInUse:
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
        }
    }
}

extension SPPermission {
    
    /**
     Permission worker. Implement base protocol `SPPermissionProtocol`, can request permission and check it state.
     */
    fileprivate static func manager(for permission: SPPermission) -> SPPermissionProtocol {
        switch permission {
            #if os(iOS)
        case .camera:
            #if SPPERMISSION_CAMERA
            return SPCameraPermission()
            #else
            fatalError(error(permission))
            #endif
        case .photoLibrary:
            #if SPPERMISSION_PHOTOLIBRARY
            return SPPhotoLibraryPermission()
            #else
            fatalError(error(permission))
            #endif
        case .microphone:
            #if SPPERMISSION_MICROPHONE
            return SPMicrophonePermission()
            #else
            fatalError(error(permission))
            #endif
        case .calendar:
            #if SPPERMISSION_CALENDAR
            return SPCalendarPermission()
            #else
            fatalError(error(permission))
            #endif
        case .contacts:
            #if SPPERMISSION_CONTACTS
            return SPContactsPermission()
            #else
            fatalError(error(permission))
            #endif
        case .reminders:
            #if SPPERMISSION_REMINDERS
            return SPRemindersPermission()
            #else
            fatalError(error(permission))
            #endif
        case .speech:
            #if SPPERMISSION_SPEECH
            return SPSpeechPermission()
            #else
            fatalError(error(permission))
            #endif
        case .locationAlwaysAndWhenInUse:
            #if SPPERMISSION_LOCATION
            return SPLocationPermission(type: SPLocationPermission.SPLocationType.AlwaysAndWhenInUse)
            #else
            fatalError(error(permission))
            #endif
        case .motion:
            #if SPPERMISSION_MOTION
            return SPMotionPermission()
            #else
            fatalError(error(permission))
            #endif
        case .mediaLibrary:
            #if SPPERMISSION_MEDIALIBRARY
            return SPMediaLibraryPermission()
            #else
            fatalError(error(permission))
            #endif
        case .bluetooth:
            #if SPPERMISSION_BLUETOOTH
            return SPBluetoothPermission()
            #else
            fatalError(error(permission))
            #endif
            #endif
        case .notification:
            #if SPPERMISSION_NOTIFICATION
            return SPNotificationPermission()
            #else
            fatalError(error(permission))
            #endif
        case .locationWhenInUse:
            #if SPPERMISSION_LOCATION
            return SPLocationPermission(type: SPLocationPermission.SPLocationType.WhenInUse)
            #else
            fatalError(error(permission))
            #endif
        }
    }
    
    /**
     Description error about invalid installation.
     */
    fileprivate static func error(_ permission: SPPermission) -> String {
        return "SPPermissions - \(permission.name) not import. Problem NOT with usage description key. I recomend to see installation guide: https://youtu.be/1kR5HGVhJfk. More details in Readme: https://github.com/ivanvorobei/SPPermissions"
    }
    
    /**
     Name of permission.
     */
    public var name: String {
        return SPPermissionsText.name(for: self)
    }
}
