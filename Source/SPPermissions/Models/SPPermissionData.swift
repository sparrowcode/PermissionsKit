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

/**
 Texts and icon for permission. Using in Data Source.
 
 - parameter name: Title of permission
 - parameter description: Why need this permission
 - parameter image: Custom icon if need. If nil using default value
 - parameter allowTitle: Title for button when permission not allow yet. Include denied state
 - parameter allowedTitle: Title for button when permission allowed
 */
public struct SPPermissionData {
    
    var name: String
    var description: String
    var image: UIImage?
    var allowTitle: String
    var allowedTitle: String
    
    public init(name: String, description: String, image: UIImage?, allowTitle: String, allowedTitle: String) {
        self.name = name
        self.description = description
        self.image = image
        self.allowTitle = allowTitle
        self.allowedTitle = allowedTitle
    }
}
