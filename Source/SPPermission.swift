// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (ivanvorobei@icloud.com)
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
 Available permissions.
 */
public enum SPPermission: String {
    
    case speech = "speech"
    case motion = "motion"
    case camera = "camera"
    case calendar = "calendar"
    case contacts = "contacts"
    case reminders = "reminders"
    case microphone = "microphone"
    case photoLibrary = "photo library"
    case notification = "notification"
    case mediaLibrary = "media library"
    case locationWhenInUse = "location when use"
    case locationAlwaysAndWhenInUse = "location always"
    
    public var isAuthorized: Bool {
        SPPermission.manager(for: self).isAuthorized
    }
    
    public var isDenied: Bool {
        SPPermission.manager(for: self).isDenied
    }
    
    public func request(completion: @escaping ()->()) {
        let manager = SPPermission.manager(for: self)
        if let usageDescriptionKey = usageDescriptionKey {
            guard let _ = Bundle.main.object(forInfoDictionaryKey: usageDescriptionKey) else {
                print("SPPermissions Warning - \(usageDescriptionKey) for \(description) not found in Info.plist")
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
        case .camera:
            return "NSCameraUsageDescription"
        case .photoLibrary:
            return "NSPhotoLibraryUsageDescription"
        case .notification:
            return nil
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
        case .locationWhenInUse:
            return "NSLocationWhenInUseUsageDescription"
        case .locationAlwaysAndWhenInUse:
            return "NSLocationAlwaysAndWhenInUseUsageDescription"
        case .motion:
            return "NSMotionUsageDescription"
        case .mediaLibrary:
            return "NSAppleMusicUsageDescription"
        }
    }
}

extension SPPermission {
    
    fileprivate static func manager(for permission: SPPermission) -> SPPermissionInterface {
        switch permission {
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
        case .notification:
            #if SPPERMISSION_NOTIFICATION
            return SPNotificationPermission()
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
        case .locationWhenInUse:
            #if SPPERMISSION_LOCATION
            return SPLocationPermission(type: SPLocationPermission.SPLocationType.WhenInUse)
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
        }
    }
    
    fileprivate static func error(_ permission: SPPermission) -> String {
        return "SPPermissions - \(permission.description) not import. Probelm not with \(permission.usageDescriptionKey ?? "usage key"). See Readme: https://github.com/ivanvorobei/SPPermission"
    }
    
    fileprivate var description: String {
        return rawValue.localizedUppercase
    }
}
