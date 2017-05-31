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

// MARK: - layout
public extension UIView {
    
    func rounded() {
        self.layer.cornerRadius = self.minSideSize() / 2
    }
    
    func bootomYPosition() -> CGFloat {
        return self.frame.origin.y + self.frame.height
    }
    
    func minSideSize() -> CGFloat {
        return min(self.frame.width, self.frame.height)
    }
    
    func isWidthLessThanHeight() -> Bool {
        return self.bounds.width < self.bounds.height
    }
    
    func setHeight(_ height: CGFloat) {
        self.frame = CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: height)
    }
    
    func setWidth(_ width: CGFloat) {
        self.frame = CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: width, height: self.frame.height)
    }
    
    /*func setEqualsFrameFromBounds(_ view: UIView, withWidthFactor widthFactor: CGFloat = 1, maxWidth: CGFloat? = nil, withCentering: Bool = false) {
        
        var width = view.bounds.width * widthFactor
        if maxWidth != nil {
            width.setIfMore(when: maxWidth!)
        }
        
        self.frame = CGRect.init(x: 0, y: 0, width: width, height: view.bounds.height)
        
        if withCentering {
            self.center.x = view.frame.width / 2
        }
    }*/
    
    func setEqualsFrameFromBounds(_ view: UIView, withWidthFactor widthFactor: CGFloat = 1, maxWidth: CGFloat? = nil, withHeightFactor heightFactor: CGFloat = 1, maxHeight: CGFloat? = nil, withCentering: Bool = false) {
        
        var width = view.bounds.width * widthFactor
        if maxWidth != nil {
            width.setIfMore(when: maxWidth!)
        }
        
        var height = view.bounds.height * heightFactor
        if maxHeight != nil {
            height.setIfMore(when: maxHeight!)
        }
        
        self.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        
        if withCentering {
            self.center.x = view.frame.width / 2
            self.center.y = view.frame.height / 2
        }
    }
    
    func setEqualsBoundsFromSuperview(customWidth: CGFloat? = nil, customHeight: CGFloat? = nil) {
        
        if self.superview == nil {
            return
        }
        
        self.frame = CGRect.init(origin: CGPoint.zero, size: self.superview!.frame.size)
        
        if customWidth != nil {
            self.frame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: customWidth!, height: self.frame.height))
        }
        
        if customHeight != nil {
            self.frame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: self.frame.width, height: customHeight!))
        }
    }
    
    func resize(to width: CGFloat) {
        let relativeFactor = self.frame.width / self.frame.height
        self.frame = CGRect.init(
            x: self.frame.origin.x,
            y: self.frame.origin.y,
            width: width,
            height: self.frame.height * relativeFactor
        )
    }
}

public extension UIView {
    
    func setParalax(amountFactor: CGFloat) {
        let amount = self.minSideSize() * amountFactor
        self.setParalax(amount: amount)
    }
    
    func setParalax(amount: CGFloat) {
        self.motionEffects.removeAll()
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -amount
        horizontal.maximumRelativeValue = amount
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -amount
        vertical.maximumRelativeValue = amount
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontal, vertical]
        self.addMotionEffect(group)
    }
}

// MARK: - convertToImage
public extension UIView {
    
    func convertToImage() -> UIImage {
        return UIImage.drawFromView(view: self)
    }
}

// MARK: - gradeView
public extension UIView {
    
    func addGrade(alpha: CGFloat, color: UIColor = UIColor.black) -> UIView {
        let gradeView = UIView.init()
        gradeView.alpha = 0
        self.addSubview(gradeView)
        SPConstraintsAssistent.setEqualSizeConstraint(gradeView, superVuew: self)
        gradeView.alpha = alpha
        gradeView.backgroundColor = color
        return gradeView
    }
    
    func setShadow(
        xTranslationFactor: CGFloat,
        yTranslationFactor: CGFloat,
        widthRelativeFactor: CGFloat,
        heightRelativeFactor: CGFloat,
        blurRadiusFactor: CGFloat,
        shadowOpacity: CGFloat,
        cornerRadiusFactor: CGFloat = 0
    ) {
        let shadowWidth = self.frame.width * widthRelativeFactor
        let shadowHeight = self.frame.height * heightRelativeFactor
        
        let xTranslation = (self.frame.width - shadowWidth) / 2 + (self.frame.width * xTranslationFactor)
        let yTranslation = (self.frame.height - shadowHeight) / 2 + (self.frame.height * yTranslationFactor)
        
        let cornerRadius = self.minSideSize() * cornerRadiusFactor
        
        let shadowPath = UIBezierPath.init(
            roundedRect: CGRect.init(x: xTranslation, y: yTranslation, width: shadowWidth, height: shadowHeight),
            cornerRadius: cornerRadius
        )
        
        let blurRadius = self.minSideSize() * blurRadiusFactor
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowRadius = blurRadius
        self.layer.masksToBounds = false
        self.layer.shadowPath = shadowPath.cgPath;
    }
    
    func setShadow(
        xTranslation: CGFloat,
        yTranslation: CGFloat,
        widthRelativeFactor: CGFloat,
        heightRelativeFactor: CGFloat,
        blurRadius: CGFloat,
        shadowOpacity: CGFloat,
        cornerRadius: CGFloat = 0
        ) {
        let shadowWidth = self.frame.width * widthRelativeFactor
        let shadowHeight = self.frame.height * heightRelativeFactor
        
        let shadowPath = UIBezierPath.init(
            roundedRect: CGRect.init(x: xTranslation, y: yTranslation, width: shadowWidth, height: shadowHeight),
            cornerRadius: cornerRadius
        )

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowRadius = blurRadius
        self.layer.masksToBounds = false
        self.layer.shadowPath = shadowPath.cgPath
    }
}

