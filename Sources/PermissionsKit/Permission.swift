// The MIT License (MIT)
// Copyright © 2022 Sparrow Code LTD (https://sparrowcode.io, hello@sparrowcode.io)
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

open class Permission: Equatable {
    
    open var authorized: Bool {
        return status == .authorized
    }
    
    open var denied: Bool {
        return status == .denied
    }
    
    open var notDetermined: Bool {
        return status == .notDetermined
    }
    
    open var debugName: String {
        return kind.name
    }
    
    open var localisedName: String {
        return Texts.permission_name(for: kind)
    }
    
    /**
     PermissionsKit: Open settings page.
     For most permissions its app page in settings app.
     You can overide it if your permission need open custom page.
     */
    @available(iOSApplicationExtension, unavailable)
    open func openSettingPage() {
        DispatchQueue.main.async {
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: nil)
            }
        }
    }
    
    // MARK: Must Ovveride
    
    open var kind: Permission.Kind {
        preconditionFailure("This method must be overridden.")
    }
    
    open var status: Permission.Status {
        preconditionFailure("This method must be overridden.")
    }
    
    open func request(completion: @escaping ()->Void) {
        preconditionFailure("This method must be overridden.")
    }
    
    open var canBePresentWithCustomInterface: Bool {
        return true
    }
    
    // MARK: Internal
    
    public static func == (lhs: Permission, rhs: Permission) -> Bool {
        return lhs.kind == rhs.kind
    }
    
    public init() {}
    
    // MARK: - Models
    
    @objc public enum Status: Int, CustomStringConvertible {
        
        case authorized
        case denied
        case notDetermined
        case notSupported
        
        public var description: String {
            switch self {
            case .authorized: return "authorized"
            case .denied: return "denied"
            case .notDetermined: return "not determined"
            case .notSupported: return "not supported"
            }
        }
    }
    
    @objc public enum Kind: Int {
        
        case camera = 0
        case notification = 2
        case photoLibrary = 1
        case microphone = 3
        case calendar = 4
        case contacts = 5
        case reminders = 6
        case speech = 7
        case locationWhenInUse = 9
        case locationAlways = 10
        case motion = 11
        case mediaLibrary = 12
        case bluetooth = 13
        case tracking = 14
        case faceID = 15
        case siri = 16
        case health = 17
        
        public var name: String {
            switch self {
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
            case .notification:
                return "Notification"
            case .locationWhenInUse:
                return "Location When Use"
            case .tracking:
                return "Tracking"
            case .faceID:
                return "FaceID"
            case .siri:
                return "Siri"
            case .health:
                return "Health"
            }
        }
    }
}
