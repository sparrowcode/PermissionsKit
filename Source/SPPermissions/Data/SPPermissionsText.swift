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

enum SPPermissionsText {
    
    static func name(for permission: SPPermission) -> String {
        switch permission {
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
        case .locationAlwaysAndWhenInUse:
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
        }
    }
    
    static func description(for permission: SPPermission) -> String {
        switch permission {
        #if os(iOS)
        case .camera:
            return "Allow app for use camera"
        case .calendar:
            return "Application can add events to calendar"
        case .contacts:
            return "Access for your contacts and phones"
        case .microphone:
            return "Allow record voice from app"
        case .photoLibrary:
            return "Access for save photos in your gallery"
        case .reminders:
            return "Application can create new task"
        case .speech:
            return "Allow to check your voice"
        case .locationAlwaysAndWhenInUse:
            return "Allow to access your location"
        case .motion:
            return "Allow to report motion and environment-related data"
        case .mediaLibrary:
            return "Allow to check your media"
        case .bluetooth:
            return "Allow access to bluetooth"
        #endif
        case .notification:
            return "Get important information without opening app."
        case .locationWhenInUse:
            return "Allow to access your location"
        }
    }
    
    static var titleText: String = "Need Permissions"
    static var subtitleText: String = "These are the permissions the app requires to work properly. Please see description for each permission."
    static var subtitleShortText: String = "Permissions request"
    static var commentText: String = "Permissions are necessary for the application to work and perform correctly. Push are not required permissions."
    
    static var allow: String = "Allow"
    static var allowed: String = "Allowed"
}
