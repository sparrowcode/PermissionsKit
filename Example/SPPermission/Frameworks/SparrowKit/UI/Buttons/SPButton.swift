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

class SPButton: UIButton {
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        if self.title(for: .normal) != nil {
            let inset: CGFloat = 6
            let sideSize = self.frame.height - inset * 2
            let titleFrame = self.titleRect(forContentRect: contentRect)
            return CGRect.init(x: titleFrame.origin.x - sideSize - 6, y: 0, width: sideSize, height: self.frame.height)
        } else {
            return super.imageRect(forContentRect: contentRect)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                self.imageView?.alpha = 0.7
            } else {
                self.imageView?.alpha = 1
            }
        }
    }
    
    var gradientView: SPGradientView? {
        didSet {
            self.gradientView?.isUserInteractionEnabled = false
            if self.gradientView?.superview == nil {
                if self.gradientView != nil {
                    if self.imageView != nil {
                        self.insertSubview(self.gradientView!, belowSubview: self.imageView!)
                    }
                }
            }
        }
    }
    
    var rounded: Bool = false {
        didSet {
            self.layoutSubviews()
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    internal func commonInit() {
        self.adjustsImageWhenHighlighted = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientView?.setSuperviewBounds()
        if self.rounded {
            self.round()
        }
    }
    
    func set(enable: Bool, animatable: Bool) {
        self.isEnabled = enable
        if animatable {
            SPAnimation.animate(0.3, animations: {
                self.alpha = enable ? 1 : 0.6
            })
        } else {
            self.alpha = enable ? 1 : 0.6
        }
    }
}
