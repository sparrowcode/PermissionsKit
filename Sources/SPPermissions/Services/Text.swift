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

enum Text {
    
    static func permission_name(_ permission: SPPermissions.PermissionType) -> String {
        switch permission {
        case .camera:
            return NSLocalizedString("permission camera name", bundle: .module, comment: "")
        case .photoLibrary:
            return NSLocalizedString("permission photoLibrary name", bundle: .module, comment: "")
        case .microphone:
            return NSLocalizedString("permission microphone name", bundle: .module, comment: "")
        case .calendar:
            return NSLocalizedString("permission calendar name", bundle: .module, comment: "")
        case .contacts:
            return NSLocalizedString("permission contacts name", bundle: .module, comment: "")
        case .reminders:
            return NSLocalizedString("permission reminders name", bundle: .module, comment: "")
        case .speech:
            return NSLocalizedString("permission speech name", bundle: .module, comment: "")
        case .motion:
            return NSLocalizedString("permission motion name", bundle: .module, comment: "")
        case .mediaLibrary:
            return NSLocalizedString("permission media library name", bundle: .module, comment: "")
        case .bluetooth:
            return NSLocalizedString("permission bluetooth name", bundle: .module, comment: "")
        case .notification:
            return NSLocalizedString("permission notification name", bundle: .module, comment: "")
        case .locationWhenInUse:
            return NSLocalizedString("permission location when in use name", bundle: .module, comment: "")
        case .locationAlways:
            return NSLocalizedString("permission location always name", bundle: .module, comment: "")
        case .tracking:
            return NSLocalizedString("permission tracking name", bundle: .module, comment: "")
        }
    }
    
    static func permission_description(_ permission: SPPermissions.PermissionType) -> String {
        switch permission {
        case .camera:
            return NSLocalizedString("permission camera description", bundle: .module, comment: "")
        case .photoLibrary:
            return NSLocalizedString("permission photoLibrary description", bundle: .module, comment: "")
        case .microphone:
            return NSLocalizedString("permission microphone description", bundle: .module, comment: "")
        case .calendar:
            return NSLocalizedString("permission calendar description", bundle: .module, comment: "")
        case .contacts:
            return NSLocalizedString("permission contacts description", bundle: .module, comment: "")
        case .reminders:
            return NSLocalizedString("permission reminders description", bundle: .module, comment: "")
        case .speech:
            return NSLocalizedString("permission speech description", bundle: .module, comment: "")
        case .motion:
            return NSLocalizedString("permission motion description", bundle: .module, comment: "")
        case .mediaLibrary:
            return NSLocalizedString("permission media library description", bundle: .module, comment: "")
        case .bluetooth:
            return NSLocalizedString("permission bluetooth description", bundle: .module, comment: "")
        case .notification:
            return NSLocalizedString("permission notification description", bundle: .module, comment: "")
        case .locationWhenInUse:
            return NSLocalizedString("permission location when in use description", bundle: .module, comment: "")
        case .locationAlways:
            return NSLocalizedString("permission location always description", bundle: .module, comment: "")
        case .tracking:
            return NSLocalizedString("permission tracking description", bundle: .module, comment: "")
        }
    }
    
    // MARK: - Action Button
    
    static var allow_permission_action: String { NSLocalizedString("action allow", bundle: .module, comment: "") }
    static var allowed_permission_action: String { NSLocalizedString("action allowed", bundle: .module, comment: "") }
    
    // MARK: - Titles & Comments
    
    static var header: String { NSLocalizedString("titles header", bundle: .module, comment: "") }
    static var sub_header: String { NSLocalizedString("titles sub header", bundle: .module, comment: "") }
    static var description: String { NSLocalizedString("titles description", bundle: .module, comment: "") }
    static var comment: String { NSLocalizedString("titles comment", bundle: .module, comment: "") }
}
