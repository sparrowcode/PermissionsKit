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

class SPPatternView: UIView {
    
    var color: UIColor = UIColor.black {
        didSet {
            self.updatePattern(animated: false)
        }
    }
    var cellWidthFactor: CGFloat = 0.2 {
        didSet {
            self.updatePattern(animated: false)
        }
    }
    var cellWidthMin: CGFloat = 50 {
        didSet {
            self.updatePattern(animated: false)
        }
    }
    var cellWidthMax: CGFloat? {
        didSet {
            self.updatePattern(animated: false)
        }
    }
    var pattern: UIBezierPath? {
        didSet {
            self.updatePattern(animated: false)
        }
    }
    
    private func setPattren() {
        if let pattern = self.pattern {
            var newWidth = self.frame.width * self.cellWidthFactor
            if newWidth < self.cellWidthMin {
                newWidth = self.cellWidthMin
            }
            if self.cellWidthMax != nil {
                if newWidth > self.cellWidthMax! {
                    newWidth = self.cellWidthMax!
                }
            }
            let patternBezierPath = pattern
            patternBezierPath.resizeTo(width: newWidth)
            let patternImage = patternBezierPath.convertToImage(fill: false, stroke: true, color: self.color)
            self.backgroundColor = UIColor.init(patternImage: patternImage)
        }
    }
    
    func updatePattern(animated: Bool) {
        if animated {
            SPAnimation.animate(0.3, animations: {
                self.setPattren()
            })
        } else {
            self.setPattren()
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    init(pattern: UIBezierPath) {
        super.init(frame: CGRect.zero)
        self.pattern = pattern
        self.updatePattern(animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updatePattern(animated: true)
    }
}
