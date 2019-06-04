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

public enum SPPermission {
    
    public static func isAllowed(_ permission: SPPermissionType) -> Bool {
        let manager = self.getManagerForPermission(permission)
        return manager.isAuthorized
    }
    
    public static func isDenied(_ permission: SPPermissionType) -> Bool {
        let manager = self.getManagerForPermission(permission)
        return manager.isDenied
    }
    
    public static func request(_ permission: SPPermissionType, with сompletionHandler: @escaping ()->()) {
        let manager = self.getManagerForPermission(permission)
        if let usageDescriptionKey = permission.usageDescriptionKey {
            guard let _ = Bundle.main.object(forInfoDictionaryKey: usageDescriptionKey) else {
                print("SPPermission Warning - \(usageDescriptionKey) for \(permission.name) not found in Info.plist")
                return
            }
        }
        manager.request(withCompletionHandler: {
            сompletionHandler()
        })
    }
}

protocol SPPermissionInterface {
    
    var isAuthorized: Bool { get }
    
    var isDenied: Bool { get }
    
    func request(withCompletionHandler сompletionHandler: @escaping ()->()?)
}

extension SPPermission {
    
    fileprivate static func getManagerForPermission(_ permission: SPPermissionType) -> SPPermissionInterface {
        switch permission {
        case .camera:
            #if SPPERMISSION_CAMERA
                return SPCameraPermission()
            #else
                fatalError(self.error(for: permission))
            #endif
        case .photoLibrary:
            #if SPPERMISSION_PHOTOLIBRARY
                return SPPhotoLibraryPermission()
            #else
                fatalError(self.error(for: permission))
            #endif
        case .notification:
            #if SPPERMISSION_NOTIFICATION
                return SPNotificationPermission()
            #else
                fatalError(self.error(for: permission))
            #endif
        case .microphone:
            #if SPPERMISSION_MICROPHONE
                return SPMicrophonePermission()
            #else
                fatalError(self.error(for: permission))
            #endif
        case .calendar:
            #if SPPERMISSION_CALENDAR
                return SPCalendarPermission()
            #else
                fatalError(self.error(for: permission))
            #endif
        case .contacts:
            #if SPPERMISSION_CONTACTS
                return SPContactsPermission()
            #else
                fatalError(self.error(for: permission))
            #endif
        case .reminders:
            #if SPPERMISSION_REMINDERS
                return SPRemindersPermission()
            #else
                fatalError(self.error(for: permission))
            #endif
        case .speech:
            #if SPPERMISSION_SPEECH
                return SPSpeechPermission()
            #else
                fatalError(self.error(for: permission))
            #endif
        case .locationWhenInUse:
            #if SPPERMISSION_LOCATION
                return SPLocationPermission(type: SPLocationPermission.SPLocationType.WhenInUse)
            #else
                fatalError(self.error(for: permission))
            #endif
        case .locationAlwaysAndWhenInUse:
            #if SPPERMISSION_LOCATION
                return SPLocationPermission(type: SPLocationPermission.SPLocationType.AlwaysAndWhenInUse)
            #else
                fatalError(self.error(for: permission))
            #endif
        case .motion:
            #if SPPERMISSION_MOTION
                return SPMotionPermission()
            #else
                fatalError(self.error(for: permission))
            #endif
        case .mediaLibrary:
            #if SPPERMISSION_MEDIALIBRARY
                return SPMediaLibraryPermission()
            #else
                fatalError(self.error(for: permission))
            #endif
        }
    }
    
    fileprivate static func error(for permission: SPPermissionType) -> String {
        return "SPPermission - \(permission.name) not import. See Readme: https://github.com/ivanvorobei/SPPermission"
    }
}
