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

enum Images {
    
    static func permission_icon(for permission: SPPermissions.PermissionType) -> UIImage {
        switch permission {
        case .camera:
            return UIImage.init(named: "Camera", in: bundle, compatibleWith: nil) ?? UIImage()
        case .photoLibrary:
            return UIImage.init(named: "Photos", in: bundle, compatibleWith: nil) ?? UIImage()
        case .microphone:
            return UIImage.init(named: "Microphone", in: bundle, compatibleWith: nil) ?? UIImage()
        case .calendar:
            return UIImage.init(named: "Calendar", in: bundle, compatibleWith: nil) ?? UIImage()
        case .contacts:
            return UIImage.init(named: "Contacts", in: bundle, compatibleWith: nil) ?? UIImage()
        case .reminders:
            return UIImage.init(named: "Reminders", in: bundle, compatibleWith: nil) ?? UIImage()
        case .speech:
            return UIImage.init(named: "Speech Recognition", in: bundle, compatibleWith: nil) ?? UIImage()
        case .motion:
            return UIImage.init(named: "Motion", in: bundle, compatibleWith: nil) ?? UIImage()
        case .mediaLibrary:
            return UIImage.init(named: "Media Library", in: bundle, compatibleWith: nil) ?? UIImage()
        case .bluetooth:
            return UIImage.init(named: "Bluetooth", in: bundle, compatibleWith: nil) ?? UIImage()
        case .notification:
            return UIImage.init(named: "Notifications", in: bundle, compatibleWith: nil) ?? UIImage()
        case .locationWhenInUse:
            return UIImage.init(named: "Location", in: bundle, compatibleWith: nil) ?? UIImage()
        case .locationAlways:
            return UIImage.init(named: "Location", in: bundle, compatibleWith: nil) ?? UIImage()
        case .tracking:
            return UIImage.init(named: "Tracking", in: bundle, compatibleWith: nil) ?? UIImage()
        case .faceID:
            return UIImage.init(named: "FaceID", in: bundle, compatibleWith: nil) ?? UIImage()
        case .siri:
            return UIImage.init(named: "Siri", in: bundle, compatibleWith: nil) ?? UIImage()
        case .health:
            return UIImage.init(named: "Health", in: bundle, compatibleWith: nil) ?? UIImage()
        }
    }
    
    static var app_icon_mask: UIImage {
        return UIImage.init(named: "App Icon Mask", in: bundle, compatibleWith: nil) ?? UIImage()
    }
    
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
