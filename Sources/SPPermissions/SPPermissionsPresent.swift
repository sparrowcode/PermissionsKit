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

public extension SPPermissions {
    
    // MARK: - Present Styles
    
    static func native(_ permissions: [SPPermissions.Permission]) -> SPPermissionsNativeController {
        let controller = SPPermissionsNativeController(removeDuplicates(permissions))
        return controller
    }
    
    #if os(iOS)
    static func list(_ permissions: [SPPermissions.Permission]) -> SPPermissionsListController {
        let controller = SPPermissionsListController(removeDuplicates(permissions))
        return controller
    }
    
    static func dialog(_ permissions: [SPPermissions.Permission]) -> SPPermissionsDialogController {
        let controller = SPPermissionsDialogController(removeDuplicates(permissions))
        return controller
    }
    #endif
    
    // MARK: - Internal
    
    private static func removeDuplicates(_ permissions: [SPPermissions.Permission]) -> [SPPermissions.Permission] {
        var result = [SPPermissions.Permission]()
        for permission in permissions {
            if !result.contains(permission) { result.append(permission) }
        }
        return result
    }
}
