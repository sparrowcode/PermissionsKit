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

extension ViewController: SPPermissionDialogDataSource {
    
    var dragToDismiss: Bool {
        return true
    }
    
    var showCloseButton: Bool {
        return true
    }
    
    var allowTitle: String {
        return "Allow"
    }
    
    var allowedTitle: String {
        return "Allowed"
    }
    
    var dialogTitle: String {
        return "Need Permissions"
    }
    
    var dialogSubtitle: String {
        return "Permissions Request"
    }
    
    var dialogComment: String {
        return "Permissions are necessary for the correct work of the application and the performance of all functions. Push are not required permissions"
    }
    
    func name(for permission: SPPermissionType) -> String? {
        switch permission {
        case .camera:
            return "Camera"
        case .photoLibrary:
            return "Photo Library"
        case .notification:
            return "Notification"
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
            return "Location"
        case .locationWhenInUse:
            return "Location"
        case .motion:
            return "Motion"
        case .mediaLibrary:
            return "Media Library"
        }
    }
    
    func description(for permission: SPPermissionType) -> String? {
        switch permission {
        case .camera:
            return "Allow app for use camera"
        case .calendar:
            return "Application can add events to calendar"
        case .contacts:
            return "Access for your contacts and phones"
        case .microphone:
            return "Allow record voice from app"
        case .notification:
            return "Get important information without opening app."
        case .photoLibrary:
            return "Access for save photos in your gallery"
        case .reminders:
            return "Application can create new task"
        case .speech:
            return "Allow check you voice"
        case .locationAlways:
            return "App will can check your location"
        case .locationWhenInUse:
            return "App will can check your location"
        case .motion:
            return "Allow reports motion and environment-related data"
        case .mediaLibrary:
            return "Allow check your media"
        }
    }
    
    func image(for permission: SPPermissionType) -> UIImage? {
        return nil // default icon
    }
    
    func deniedTitle(for permission: SPPermissionType) -> String? {
        return "Permission denied"
    }
    
    func deniedSubtitle(for permission: SPPermissionType) -> String? {
        return "Please, go to Settings and allow permissions"
    }
    
    var cancelTitle: String {
        return "Cancel"
    }
    
    var settingsTitle: String {
        return "Settings"
    }
}
