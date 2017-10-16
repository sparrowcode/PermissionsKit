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

public extension UILabel {
    
    func setShadowOffsetForLetters(blurRadius: CGFloat = 0, widthOffset: CGFloat = 0, heightOffset: CGFloat, opacity: CGFloat) {
        self.layer.shadowRadius = blurRadius
        self.layer.shadowOffset = CGSize(
            width: widthOffset,
            height: heightOffset
        )
        self.layer.shadowOpacity = Float(opacity)
    }
    
    func setShadowOffsetFactorForLetters(blurRadius: CGFloat = 0, widthOffsetFactor: CGFloat = 0, heightOffsetFactor: CGFloat, opacity: CGFloat) {
        let widthOffset = widthOffsetFactor * self.frame.width
        let heightOffset = heightOffsetFactor * self.frame.height
        self.setShadowOffsetForLetters(blurRadius: blurRadius, widthOffset: widthOffset, heightOffset: heightOffset, opacity: opacity)
    }
    
    func removeShadowForLetters() {
        self.setShadowOffsetForLetters(blurRadius: 0, widthOffset: 0, heightOffset: 0, opacity: 0)
    }
    
    func setCenteringAlignment() {
        self.textAlignment = .center
        self.baselineAdjustment = .alignCenters
    }
}
