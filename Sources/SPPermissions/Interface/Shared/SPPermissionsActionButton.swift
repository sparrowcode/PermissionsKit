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
@available(iOSApplicationExtension, unavailable)
public class SPPermissionsActionButton: UIButton {
    
    var permission: SPPermissions.Permission?
    
    public var allowTitle: String = Texts.allow_permission_action
    public var allowTitleColor: UIColor = UIColor.tint
    public var allowBackgroundColor: UIColor = UIColor.buttonArea
    
    public var allowedTitle: String = Texts.allowed_permission_action
    public var allowedTitleColor: UIColor = UIColor.white
    public var allowedBackgroundColor: UIColor = UIColor.tint
    
    public var deniedTitle: String = Texts.denied_permission_action
    public var deniedTitleColor: UIColor = UIColor.tint
    public var deniedBackgroundColor: UIColor = UIColor.buttonArea
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        contentEdgeInsets = UIEdgeInsets.init(top: 5, left: 13, bottom: 5, right: 13)
        titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func updateInterface() {
        guard let permission = self.permission else { return }
        switch permission.status {
        case .notDetermined, .notSupported:
            setTitle(allowTitle, for: .normal)
            setTitleColor(allowTitleColor, for: .normal)
            setTitleColor(allowTitleColor.withAlphaComponent(0.7), for: .highlighted)
            backgroundColor = allowBackgroundColor
        case .authorized:
            setTitle(allowedTitle, for: .normal)
            backgroundColor = allowedBackgroundColor
            setTitleColor(allowedTitleColor, for: .normal)
            setTitleColor(allowedTitleColor.withAlphaComponent(0.7), for: .highlighted)
        case .denied:
            setTitle(deniedTitle, for: .normal)
            backgroundColor = deniedBackgroundColor
            setTitleColor(deniedTitleColor, for: .normal)
            setTitleColor(deniedTitleColor.withAlphaComponent(0.7), for: .highlighted)
        }
    }
    
    // MARK: - Layout
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.height / 2
    }
    
    // MARK: - Ovveride
    
    override public func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title?.uppercased(), for: state)
    }
}

#endif
