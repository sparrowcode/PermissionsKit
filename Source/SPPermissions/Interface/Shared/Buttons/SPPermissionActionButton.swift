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

#if os(iOS)
/**
 Action button. Have 2 state: allow & allowed.
 For each state can set colors and title.
 */
public class SPPermissionActionButton: UIButton {
    
    /**
     Title of button when permissin not authorized yet.
     */
    public var allowTitle: String = SPPermissionsText.allow { didSet { applyStyle() } }
    
    /**
     Title of button when permission authorized.
     */
    public var allowedTitle: String = SPPermissionsText.allowed { didSet { applyStyle() } }
    
    /**
     Title color for button when permissin not authorized yet.
     */
    public var allowTitleColor: UIColor = SPPermissionsColor.base { didSet { applyStyle() } }
    
    /**
     Background button color when permissin not authorized yet.
     */
    public var allowBackgroundColor: UIColor = SPPermissionsColor.buttonArea { didSet { applyStyle() } }
    
    /**
     Title color for button when permissin authorized.
     */
    public var allowedTitleColor: UIColor = SPPermissionsColor.white { didSet { applyStyle() } }
    
    /**
     Background button color when permission authorized.
     */
    public var allowedBackgroundColor: UIColor = SPPermissionsColor.base { didSet { applyStyle() } }
    
    /**
     For which permission generate this button.
     */
    var permission: SPPermission = .notification
    
    /**
     Button has 2 styles: `.base` & `.allowed`.
     For each style can set title and colors.
     */
    var style: Style = .base {
        didSet {
            switch self.style {
            case .base:
                setTitle(allowTitle, for: .normal)
                setTitleColor(allowTitleColor, for: .normal)
                setTitleColor(allowTitleColor.withAlphaComponent(0.7), for: .highlighted)
                backgroundColor = self.allowBackgroundColor
                titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                contentEdgeInsets = UIEdgeInsets.init(top: 6, left: 15, bottom: 6, right: 15)
            case .allowed:
                setTitle(allowedTitle, for: .normal)
                backgroundColor = allowedBackgroundColor
                setTitleColor(allowedTitleColor, for: .normal)
                setTitleColor(allowedTitleColor.withAlphaComponent(0.7), for: .highlighted)
                titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                contentEdgeInsets = UIEdgeInsets.init(top: 6, left: 15, bottom: 6, right: 15)
            }
        }
    }
    
    /**
     Ovveride for always uppercased title.
     */
    override public func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title?.uppercased(), for: state)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.height / 2
    }
    
    /**
     Animatable update button style.
     */
    public func update() {
        UIView.animate(withDuration: 0.3, animations: {
            self.style = self.permission.isAuthorized ? .allowed : .base
        })
    }
    
    private func applyStyle() {
        let current = self.style
        self.style = current
    }
    
    /**
     Button style.
     */
    enum Style {
        case base
        case allowed
    }
}
#endif
