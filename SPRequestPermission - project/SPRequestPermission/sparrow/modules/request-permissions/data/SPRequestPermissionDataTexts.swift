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

struct SPRequestPermissionData {}

extension SPRequestPermissionData {
    
    struct texts {
        static func title() -> String {
            return NSLocalizedString("hello", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func subtitile() -> String {
            return NSLocalizedString("app_needs_permission", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func advice() -> String {
            return NSLocalizedString("allow_permission_this_help_you", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func advice_additional() -> String {
            return NSLocalizedString("you_can_manage_permission_in_setting", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func enable_camera() -> String {
            return NSLocalizedString("enable_camera", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func enable_photoLibrary() -> String {
            return NSLocalizedString("enable_photoLibrary", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func enable_notification() -> String {
            return NSLocalizedString("enable_notification", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func swipe_for_hide() -> String {
            return NSLocalizedString("swipe_for_hide", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func cancel() -> String {
            return NSLocalizedString("cancel", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func settings() -> String {
            return NSLocalizedString("settings", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func titleDisablePermissionAlertText() -> String {
            return NSLocalizedString("important", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
        
        static func subtitleDisablePermissionAlertText() -> String {
            return NSLocalizedString("permission_denid_go_to_settings", tableName: "SPRequestPermissionLocalizableTexts", bundle: Bundle.main, value: "", comment: "")
        }
    }
}
