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
    
    // MARK: - Styles
    
    public static func native(_ permissions: [SPPermission]) -> SPPermissionsNativeController {
        let controller = SPPermissionsNativeController(removeDuplicates(permissions))
        return controller
    }
    
    #if os(iOS)
    public static func list(_ permissions: [SPPermission]) -> SPPermissionsListController {
        let controller = SPPermissionsListController(removeDuplicates(permissions))
        return controller
    }
    
    public static func dialog(_ permissions: [SPPermission]) -> UIViewController {
        fatalError()
    }
    #endif
    
    // MARK: - Internal
    
    static func manager(for permission: SPPermission) -> SPPermissionInterface {
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
        case .locationAlwaysAndWhenInUse:
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
    
    private static func removeDuplicates(_ permissions: [SPPermission]) -> [SPPermission] {
        var result = [SPPermission]()
        for permission in permissions {
            if !result.contains(permission) { result.append(permission) }
        }
        return result
    }
    
    private static func error(_ permission: SPPermission) -> String {
        return "SPPermissions: \(permission.name) not imported correct. It may happen with 2 ways, or code not correctly imported or macros ignoring. In any case please create new issue here https://github.com/ivanvorobei/SPPermissions and provide all details."
    }
}
