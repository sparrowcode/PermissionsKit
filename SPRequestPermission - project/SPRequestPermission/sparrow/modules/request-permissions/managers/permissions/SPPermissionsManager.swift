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

import Foundation

public enum SPRequestPermissionType {
    case camera
    case photoLibrary
    case notification
    case microphone
    case calendar
    case locationAlways
    case locationWhenInUse
    case locationWithBackground
    case contacts
    case reminders
}

class SPPermissionsManager: SPPermissionsManagerInterface {
    
    func isAuthorizedPermission(_ permission: SPRequestPermissionType) -> Bool {
        let manager = self.getManagerForPermission(permission)
        return manager.isAuthorized()
    }
    
    func requestPermission(_ permission: SPRequestPermissionType, with complectionHandler: @escaping ()->()) {
        let manager = self.getManagerForPermission(permission)
        manager.request(withComlectionHandler: {
            complectionHandler()
        })
    }

    private func getManagerForPermission(_ permission: SPRequestPermissionType) -> SPPermissionInterface {
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
        case .locationAlways:
            return SPLocationPermission(type: SPLocationPermission.SPLocationType.Always)
        case .locationWhenInUse:
            return SPLocationPermission(type: SPLocationPermission.SPLocationType.WhenInUse)
        case .locationWithBackground:
            return SPLocationPermission(type: SPLocationPermission.SPLocationType.AlwaysWithBackground)
        case .contacts:
            return SPContactsPermission()
        case .reminders:
            return SPRemindersPermission()
        }
    }
}

public protocol SPPermissionsManagerInterface {
    
    func isAuthorizedPermission(_ permission: SPRequestPermissionType) -> Bool
    
    func requestPermission(_ permission: SPRequestPermissionType, with complectionHandler: @escaping ()->())
}

public protocol SPPermissionInterface {
    
    func isAuthorized() -> Bool
    
    func request(withComlectionHandler complectionHandler: @escaping ()->()?)
}



