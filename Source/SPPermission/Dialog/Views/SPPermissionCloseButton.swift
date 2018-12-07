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

class SPPermissionCloseButton: UIButton {
    
    let iconView = SPPermissionCloseIconView()
    var widthIconFactor: CGFloat = 1
    var heightIconFactor: CGFloat = 1
    
    var color = SPPermissionStyle.Colors.blue {
        didSet {
            self.iconView.color = self.color
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                self.iconView.color = self.color.withAlphaComponent(0.7)
            } else {
                self.iconView.color = self.color.withAlphaComponent(1)
            }
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.iconView.isUserInteractionEnabled = false
        self.addSubview(self.iconView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = self.frame.width * self.widthIconFactor
        let height = self.frame.height * self.heightIconFactor
        self.iconView.frame = CGRect.init(origin: .zero, size: CGSize.init(width: width, height: height))
        self.iconView.center = CGPoint.init(x: self.frame.width / 2, y: self.frame.height / 2)
    }
}
