// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
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

class SPAppStoreActionButton: UIButton {
    
    var style: Style = .base {
        didSet {
            
            self.setTitleColor(self.baseColor)
            self.setTitle(self.titleLabel?.text, for: UIControl.State.normal)
            
            switch self.style {
            case .base:
                self.backgroundColor = self.secondColor
                self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                self.contentEdgeInsets = UIEdgeInsets.init(top: 6, left: 15, bottom: 6, right: 15)
                break
            case .main:
                self.backgroundColor = self.baseColor
                self.layer.borderWidth = 0
                self.setTitleColor(UIColor.white)
                self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                self.contentEdgeInsets = UIEdgeInsets.init(top: 6, left: 15, bottom: 6, right: 15)
                break
            case .buyInStore:
                self.backgroundColor = self.baseColor
                self.layer.borderWidth = 0
                self.setTitleColor(UIColor.white)
                self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                self.contentEdgeInsets = UIEdgeInsets.init(top: 8, left: 15, bottom: 8, right: 15)
                break
            case .line:
                self.backgroundColor = UIColor.clear
                self.layer.borderWidth = 1
                self.layer.borderColor = self.baseColor.cgColor
                self.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
                self.contentEdgeInsets = UIEdgeInsets.init(top: 6, left: 15, bottom: 6, right: 15)
                break
            }
        }
    }
    
    var baseColor: UIColor = SPPermissionStyle.Colors.blue {
        didSet {
            let currentStyle = self.style
            self.style = currentStyle
        }
    }
    var secondColor: UIColor = SPPermissionStyle.Colors.lightGray {
        didSet {
            let currentStyle = self.style
            self.style = currentStyle
        }
    }
    
    init() {
        super.init(frame: .zero)
        self.style = .base
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        switch self.style {
        case .base:
            super.setTitle(title?.uppercased(), for: state)
        case .main:
            super.setTitle(title?.uppercased(), for: state)
        case .buyInStore:
            super.setTitle(title?.uppercased(), for: state)
        case .line:
            super.setTitle(title?.uppercased(), for: state)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if self.style == .buyInStore {
            self.layer.cornerRadius = 12
        } else {
            self.layer.cornerRadius = self.frame.height / 2
        }
        
        if self.style != .main {
            if let count = self.titleLabel?.text?.count {
                if count < 4 {
                    self.contentEdgeInsets = UIEdgeInsets.init(top: 6, left: 22, bottom: 6, right: 22)
                }
            }
        }
    }
    
    enum Style {
        case base
        case main
        case buyInStore
        case line
    }
    
    private func setTitleColor(_ color: UIColor) {
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(color.withAlphaComponent(0.7), for: .highlighted)
    }
}
