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
 SPPermissions: Get notifications about events.
 */
@available(iOSApplicationExtension, unavailable)
public protocol SPPermissionsDelegate: AnyObject {
    
    /**
     SPPermissions: Called when permission allowed.
     
     - parameter permission: For which permission action invocation.
     */
    func didAllowPermission(_ permission: SPPermissions.Permission)
    
    /**
     SPPermissions: Called when permission denied.
     
     - parameter permission: For which permission action invocation.
     */
    func didDeniedPermission(_ permission: SPPermissions.Permission)
    
    /**
     SPPermissions: Called when permission hided.
     
     - parameter permission: For which permission action invocation.
     */
    func didHidePermissions(_ permissions: [SPPermissions.Permission])
}

// Using like default for allow it like optional.
@available(iOSApplicationExtension, unavailable)
public extension SPPermissionsDelegate {
    
    func didAllowPermission(_ permission: SPPermissions.Permission) {}
    
    func didDeniedPermission(_ permission: SPPermissions.Permission) {}
    
    func didHidePermissions(_ permissions: [SPPermissions.Permission]) {}
}
