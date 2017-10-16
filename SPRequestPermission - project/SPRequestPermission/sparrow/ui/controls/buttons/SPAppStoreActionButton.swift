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
            
            self.setTitleColorForNoramlAndHightlightedStates(color: self.baseColor)
            
            switch self.style {
            case .base:
                self.backgroundColor = self.secondColor
                self.titleLabel?.font = UIFont.system(type: .Bold, size: 14)
                break
            case .main:
                self.backgroundColor = self.baseColor
                self.layer.borderWidth = 0
                self.setTitleColorForNoramlAndHightlightedStates(color: UIColor.white)
                self.titleLabel?.font = UIFont.system(type: .Bold, size: 14)
                break
            case .line:
                self.backgroundColor = UIColor.clear
                self.layer.borderWidth = 1
                self.layer.borderColor = self.baseColor.cgColor
                self.titleLabel?.font = UIFont.system(type: .Medium, size: 14)
                break
            }
        }
    }
    
    var baseColor: UIColor = UIColor.init(hex: "0076FF")
    var secondColor: UIColor = UIColor.init(hex: "F0F1F6")
    
    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.style = .base
        self.layer.masksToBounds = true
        self.contentEdgeInsets = UIEdgeInsetsMake(6, 14, 6, 14)
    }
    
    override func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title?.uppercased(), for: state)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.minSideSize() / 2
    }
    
    enum Style {
        case base
        case main
        case line
    }
}
