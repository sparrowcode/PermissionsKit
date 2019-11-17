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

class SPPermissionActionButton: UIButton {
    
    var allowTitle: String = SPPermissionsText.allow
    var allowedTitle: String = SPPermissionsText.allowed
    var allowColor: UIColor = SPPermissionsColor.buttonArea
    var allowedColor: UIColor = SPPermissionsColor.base
    
    var permission: SPPermission = .notification
    
    var style: Style = .base {
        didSet {
            switch self.style {
            case .base:
                setTitle(allowTitle, for: .normal)
                setTitleColor(allowedColor, for: .normal)
                setTitleColor(allowedColor.withAlphaComponent(0.7), for: .highlighted)
                backgroundColor = self.allowColor
                titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                contentEdgeInsets = UIEdgeInsets.init(top: 6, left: 15, bottom: 6, right: 15)
            case .allowed:
                setTitle(allowedTitle, for: .normal)
                backgroundColor = self.allowedColor
                setTitleColor(UIColor.white, for: .normal)
                setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)
                titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                contentEdgeInsets = UIEdgeInsets.init(top: 6, left: 15, bottom: 6, right: 15)
            }
        }
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title?.uppercased(), for: state)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.height / 2
    }
    
    public func update() {
        UIView.animate(withDuration: 0.3, animations: {
            self.style = self.permission.isAuthorized ? .allowed : .base
        })
    }
    
    enum Style {
        case base
        case allowed
    }
}
