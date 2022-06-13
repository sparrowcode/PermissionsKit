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

enum Texts {
    
    static func permission_name(for kind: Permission.Kind) -> String {
        switch kind {
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
    
    // MARK: - Internal
    
    static var bundle: Bundle {
        
        // If installed via SPM, will be available bundle .module.
        
        #if PERMISSIONSKIT_SPM
        return .module
        #else
        
        // If installed via Cocoapods, should use bundle from podspec.
        
        let path = Bundle(for: Permission.self).path(forResource: "PermissionsKit", ofType: "bundle") ?? ""
        let bundle = Bundle(path: path) ?? Bundle.main
        return bundle
        #endif
    }
}
