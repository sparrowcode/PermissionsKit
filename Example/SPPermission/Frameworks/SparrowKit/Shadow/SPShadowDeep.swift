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

extension SPShadow {
    
    struct DeepStyle {
        
        private init() {}
        
        static func setFor(label: UILabel) {
            var offset = label.frame.height * 0.03
            offset.setIfMore(when: 1)
            label.setShadowOffsetForLetters(heightOffset: offset, opacity: 0.35)
        }
        
        static func setFor(view: UIView) {
            
            let xTranslationFactor: CGFloat = 0
            let yTranslationFactor: CGFloat = 0.18
            var widthRelativeFactor: CGFloat = 0.68
            let heightRelativeFactor: CGFloat = 0.78
            let blurRadiusFactor: CGFloat = 0.1
            let shadowOpacity: CGFloat = 0.3
            
            if view.frame.width < 120 {
                widthRelativeFactor = widthRelativeFactor * 0.8
            }
            
            var shadowWidth = view.frame.width * widthRelativeFactor
            if (view.frame.width - shadowWidth) / 2 > 35 {
                shadowWidth = view.frame.width - 70
                widthRelativeFactor = shadowWidth / view.frame.width
            }
            let shadowHeight = view.frame.height * heightRelativeFactor
            
            let xTranslation = (view.frame.width - shadowWidth) / 2 + (view.frame.width * xTranslationFactor)
            var yTranslation = (view.frame.height - shadowHeight) / 2 + (view.frame.height * yTranslationFactor)
            
            let minBottomSpace: CGFloat = 6
            if (yTranslation + shadowHeight - view.frame.height) < minBottomSpace {
                yTranslation = view.frame.height + minBottomSpace - shadowHeight
            }
            
            let maxBottomSpace: CGFloat = 12
            if (yTranslation + shadowHeight - view.frame.height) > maxBottomSpace {
                yTranslation = view.frame.height + maxBottomSpace - shadowHeight
            }
            
            var blurRadius = view.frame.minSide * blurRadiusFactor
            blurRadius.setIfMore(when: 10)
            blurRadius.setIfFewer(when: 7)
            
            view.setShadow(
                xTranslation: xTranslation,
                yTranslation: yTranslation,
                widthRelativeFactor: widthRelativeFactor,
                heightRelativeFactor: heightRelativeFactor,
                blurRadius: blurRadius,
                shadowOpacity: shadowOpacity,
                cornerRadius: view.layer.cornerRadius
            )
        }
    }
}

extension UIView {
    
    func setDeepShadow() {
        SPShadow.DeepStyle.setFor(view: self)
    }
}

extension UILabel {
    
    func setDeepShadowForLetters() {
        SPShadow.DeepStyle.setFor(label: self)
    }
}
