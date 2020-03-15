// The MIT License (MIT)
// Copyright © 2019 Ivan Varabei (varabeis@icloud.com)
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
 List of events methods. All optional.
 */
@objc public protocol SPPermissionsDelegate: class {
    
    /**
     Call when permission allowed.
     
     - parameter permission: Which permission did allowed.
     */
    @objc optional func didAllow(permission: SPPermission)
    
    /**
     Call when permission denied.
     
     - parameter permission: Which permission did denied.
     */
    @objc optional func didDenied(permission: SPPermission)
    
    /**
     Call when controller closed.
     
     - parameter ids: IDs permissions which showed in this controller. Also include permisssions, which not requested.
     No way pass array of `SPPermission` becouse array of enum can't represented in objc.
     */
    @objc optional func didHide(permissions ids: [Int])
    
    /**
     If permission denied, after action show alert with propose open settings and allow this permission.
     
     - parameter permission: Denied data for this permission.
     */
    @objc optional func deniedData(for permission: SPPermission) -> SPPermissionDeniedAlertData?
}
