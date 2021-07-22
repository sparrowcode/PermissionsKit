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

/**
 SPPermissions: Protocol using for configure permission cell and alert texts.
 */
@available(iOSApplicationExtension, unavailable)
public protocol SPPermissionsDataSource: AnyObject {
    
    #if os(iOS)
    /**
     SPPermissions: After default configure you can apply your changes like texts or custom icon.
     
     - parameter cell: Default cell object of class `SPPermissionsTableViewCell`.
     - parameter permission: For which permissions cell configuring.
     */
    func configure(_ cell: SPPermissionsTableViewCell, for permission: SPPermissions.Permission)
    #endif
    
    /**
     SPPermissions: Provide here alert texts if permission denied.
     If you return `nil` for alert texts, alert won't show.
     
     - parameter permission: Text for this permission.
     */
    func deniedAlertTexts(for permission: SPPermissions.Permission) -> SPPermissionsDeniedAlertTexts?
}

// Using like default for allow it like optional.
@available(iOSApplicationExtension, unavailable)
public extension SPPermissionsDataSource {
    
    #if os(iOS)
    func configure(_ cell: SPPermissionsTableViewCell, for permission: SPPermissions.Permission) -> SPPermissionsTableViewCell { return cell }
    #endif
}


