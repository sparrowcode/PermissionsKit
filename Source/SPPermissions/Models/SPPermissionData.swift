// The MIT License (MIT)
// Copyright © 2019 Ivan Vorobei (ivanvorobei@icloud.com)
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

public struct SPPermissionData {
    
    /**
     Short name of permission, like `Camera`.
     */
    public var name: String
    
    /**
     Describe why you need it permission.
     */
    public var description: String
    
    /**
     Pass custom image if you don't want usage default icon.
     */
    public var image: UIImage?
    
    /**
     Title on button when permission not allowed yet.
     */
    public var allowTitle: String
    
    /**
     Title button if permission allowed.
     */
    public var allowedTitle: String
    
    /**
     If permission denied, after action show alert with propose open settings and allow this permission. Apply only this permission.
     
     - warning: Also need set alert's text, see class description. By default using universal texts.
     */
    public var showAlertOpenSettingsWhenPermissionDenied = true
    
    /**
    Title of alert.
    */
    public var alertOpenSettingsDeniedPermissionTitle: String? = nil
    
    /**
    Subtitle of alert.
    */
    public var alertOpenSettingsDeniedPermissionDescription: String? = nil
    
    /**
    Title of action button.
    */
    public var alertOpenSettingsDeniedPermissionButtonTitle: String? = nil
    
    /**
    Title of cancel button.
    */
    public var alertOpenSettingsDeniedPermissionCancelTitle: String? = nil
    
    public init(name: String, description: String, image: UIImage?, allowTitle: String, allowedTitle: String) {
        self.name = name
        self.description = description
        self.image = image
        self.allowTitle = allowTitle
        self.allowedTitle = allowedTitle
    }
}
