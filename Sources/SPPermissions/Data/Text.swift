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

enum Texts {
    
    static func permission_name(_ permission: SPPermissions.PermissionType) -> String {
        switch permission {
        case .camera:
            return NSLocalizedString("permission camera name", bundle: bundle, comment: "")
        case .photoLibrary:
            return NSLocalizedString("permission photoLibrary name", bundle: bundle, comment: "")
        case .microphone:
            return NSLocalizedString("permission microphone name", bundle: bundle, comment: "")
        case .calendar:
            return NSLocalizedString("permission calendar name", bundle: bundle, comment: "")
        case .contacts:
            return NSLocalizedString("permission contacts name", bundle: bundle, comment: "")
        case .reminders:
            return NSLocalizedString("permission reminders name", bundle: bundle, comment: "")
        case .speech:
            return NSLocalizedString("permission speech name", bundle: bundle, comment: "")
        case .motion:
            return NSLocalizedString("permission motion name", bundle: bundle, comment: "")
        case .mediaLibrary:
            return NSLocalizedString("permission media library name", bundle: bundle, comment: "")
        case .bluetooth:
            return NSLocalizedString("permission bluetooth name", bundle: bundle, comment: "")
        case .notification:
            return NSLocalizedString("permission notification name", bundle: bundle, comment: "")
        case .locationWhenInUse:
            return NSLocalizedString("permission location when in use name", bundle: bundle, comment: "")
        case .locationAlways:
            return NSLocalizedString("permission location always name", bundle: bundle, comment: "")
        case .tracking:
            return NSLocalizedString("permission tracking name", bundle: bundle, comment: "")
        case .faceID:
            return NSLocalizedString("permission faceid name", bundle: bundle, comment: "")
        case .siri:
            return NSLocalizedString("permission siri name", bundle: bundle, comment: "")
        case .health:
            return NSLocalizedString("permission health name", bundle: bundle, comment: "")
        }
    }
    
    static func permission_description(_ permission: SPPermissions.PermissionType) -> String {
        switch permission {
        case .camera:
            return NSLocalizedString("permission camera description", bundle: bundle, comment: "")
        case .photoLibrary:
            return NSLocalizedString("permission photoLibrary description", bundle: bundle, comment: "")
        case .microphone:
            return NSLocalizedString("permission microphone description", bundle: bundle, comment: "")
        case .calendar:
            return NSLocalizedString("permission calendar description", bundle: bundle, comment: "")
        case .contacts:
            return NSLocalizedString("permission contacts description", bundle: bundle, comment: "")
        case .reminders:
            return NSLocalizedString("permission reminders description", bundle: bundle, comment: "")
        case .speech:
            return NSLocalizedString("permission speech description", bundle: bundle, comment: "")
        case .motion:
            return NSLocalizedString("permission motion description", bundle: bundle, comment: "")
        case .mediaLibrary:
            return NSLocalizedString("permission media library description", bundle: bundle, comment: "")
        case .bluetooth:
            return NSLocalizedString("permission bluetooth description", bundle: bundle, comment: "")
        case .notification:
            return NSLocalizedString("permission notification description", bundle: bundle, comment: "")
        case .locationWhenInUse:
            return NSLocalizedString("permission location when in use description", bundle: bundle, comment: "")
        case .locationAlways:
            return NSLocalizedString("permission location always description", bundle: bundle, comment: "")
        case .tracking:
            return NSLocalizedString("permission tracking description", bundle: bundle, comment: "")
        case .faceID:
            return NSLocalizedString("permission faceid description", bundle: bundle, comment: "")
        case .siri:
            return NSLocalizedString("permission siri description", bundle: bundle, comment: "")
        case .health:
            return NSLocalizedString("permission health description", bundle: bundle, comment: "")
        }
    }
    
    // MARK: - Action Button
    
    static var allow_permission_action: String { NSLocalizedString("action allow", bundle: bundle, comment: "") }
    static var allowed_permission_action: String { NSLocalizedString("action allowed", bundle: bundle, comment: "") }
    static var denied_permission_action: String { NSLocalizedString("action denied", bundle: bundle, comment: "") }
    
    // MARK: - Titles & Comments
    
    static var header: String { NSLocalizedString("titles header", bundle: bundle, comment: "") }
    static var sub_header: String { NSLocalizedString("titles sub header", bundle: bundle, comment: "") }
    static var description: String { NSLocalizedString("titles description", bundle: bundle, comment: "") }
    static var comment: String { NSLocalizedString("titles comment", bundle: bundle, comment: "") }
    
    // MARK: - Denied Alert
    
    static var denied_alert_title: String { NSLocalizedString("denied alert title", bundle: bundle, comment: "") }
    static var denied_alert_description: String { NSLocalizedString("denied alert description", bundle: bundle, comment: "") }
    static var denied_alert_action: String { NSLocalizedString("denied alert action", bundle: bundle, comment: "") }
    static var denied_alert_cancel: String { NSLocalizedString("denied alert cancel", bundle: bundle, comment: "") }
    
    // MARK: - Internal
    
    static var bundle: Bundle {
        
        // If installed via SPM, will be available bundle .module.
        
        #if SPPERMISSIONS_SPM
        return .module
        #else
        
        // If installed via Cocoapods, should use bundle from podspec.
        
        let path = Bundle(for: SPPermissions.Permission.self).path(forResource: "SPPermissions", ofType: "bundle") ?? ""
        let bundle = Bundle(path: path) ?? Bundle.main
        return bundle
        #endif
    }
}
