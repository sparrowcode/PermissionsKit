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

class SPGradientGradeWithBlurView: SPGradeWithBlurView {
    
    internal var gradientView: SPGradientView = SPGradientView()
    
    init() {
        super.init()
        self.commonInit()
    }
    
    private func commonInit() {
        self.insertSubview(self.gradientView, aboveSubview: self.gradeView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setGradientStartColorPoint(_ point: CGPoint) {
        self.gradientView.startColorPoint = point
    }
    
    func setGradientEndColorPoint(_ point: CGPoint) {
        self.gradientView.endColorPoint = point
    }
    
    func setGradientStartColor(_ color: UIColor) {
        self.gradientView.startColor = color
    }
    
    func setGradientEndColor(_ color: UIColor) {
        self.gradientView.endColor = color
    }
    
    func setGradientAlpha(_ alpha: CGFloat) {
        self.gradientView.alpha = alpha
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradientView.frame = self.bounds
    }
}
