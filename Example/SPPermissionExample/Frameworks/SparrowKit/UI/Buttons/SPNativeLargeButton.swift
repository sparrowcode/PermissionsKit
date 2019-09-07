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

class SPNativeLargeButton: SPDownloadingButton {
    
    override var isHighlighted: Bool {
        didSet {
            if self.gradientView == nil {
                if isHighlighted {
                    self.backgroundColor = self.backgroundColor?.withAlphaComponent(0.7)
                } else {
                    self.backgroundColor = self.backgroundColor?.withAlphaComponent(1)
                }
            } else {
                self.backgroundColor = self.backgroundColor?.withAlphaComponent(0)
                if isHighlighted {
                    self.gradientView?.alpha = 0.7
                } else {
                    self.gradientView?.alpha = 1
                }
            }
        }
    }
    
    override func commonInit() {
        super.commonInit()
        self.titleLabel?.font = UIFont.system(weight: UIFont.FontWeight.demiBold, size: 16)
        self.setTitleColor(UIColor.white)
        self.backgroundColor = SPNativeColors.blue
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        self.contentEdgeInsets = UIEdgeInsets.init(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    override func sizeToFit() {
        super.sizeToFit()
        if let superview = self.superview {
            let sideSpace: CGFloat = superview.frame.width * 0.112
            var width = superview.frame.width - sideSpace * 2
            width.setIfMore(when: 335)
            self.frame.set(width: width)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientView?.setSuperviewBounds()
        self.gradientView?.layer.cornerRadius = self.layer.cornerRadius
        self.gradientView?.gradientLayer.cornerRadius = self.layer.cornerRadius
    }
}

