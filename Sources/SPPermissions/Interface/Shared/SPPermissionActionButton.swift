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

#if os(iOS)

public class SPPermissionActionButton: UIButton {
    
    public var allowTitle: String = Text.allow_permission_action { didSet { updateInterface(animated: false) } }
    public var allowedTitle: String = Text.allowed_permission_action { didSet { updateInterface(animated: false) } }
    public var allowTitleColor: UIColor = UIColor.tint { didSet { updateInterface(animated: false) } }
    public var allowBackgroundColor: UIColor = UIColor.buttonArea { didSet { updateInterface(animated: false) } }
    public var allowedTitleColor: UIColor = UIColor.white { didSet { updateInterface(animated: false) } }
    public var allowedBackgroundColor: UIColor = UIColor.tint { didSet { updateInterface(animated: false) } }
    
    var permission: SPPermission = .notification
    
    // MARK: - Helpers
    
    func updateInterface(animated: Bool) {
        let _: AuthorizedStyle = permission.authorized ? .allowed : .default
    }
    
    enum AuthorizedStyle {
        
        case `default`
        case allowed
    }
    
    // MARK: - Layout
    
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSize = super.sizeThatFits(size)
        return .init(width: 60, height: 40)
    }
}

#endif
