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
            return "Hello!"
        }
        
        static func subtitile() -> String {
            return "Application needs permission"
        }
        
        static func advice() -> String {
            return "Allow permission please. This helps to use application"
        }
        
        static func advice_additional() -> String {
            return "You can manage permissions in settings"
        }
        
        static func enable_camera() -> String {
            return "Enable Camera"
        }
        
        static func enable_photoLibrary() -> String {
            return "Enable PhotoLibrary"
        }
        
        static func enable_notification() -> String {
            return "Enable Notification"
        }
        
        static func enable_microphone() -> String {
            return "Enable Microphone"
        }
        
        static func enable_calendar() -> String {
            return "Enable Calendar"
        }
        
        static func enable_location() -> String {
            return "Enable Location"
        }
        
        static func enable_contacts() -> String {
            return "Enable Contacts"
        }
        
        static func enable_reminedrs() -> String {
            return "Enable Reminedrs"
        }
        
        static func swipe_for_hide() -> String {
            return "Swipe to hide"
        }
        
        static func cancel() -> String {
            return "Cancel"
        }
        
        static func settings() -> String {
            return "Settings"
        }
        
        static func titleForDenidPermission() -> String {
            return "Important"
        }
        
        static func subtitleForDenidPermission() -> String {
            return "Permission denied. Please, go to Settings and allow permissions"
        }
    }
}
