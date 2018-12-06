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

public extension UIView {
    
    var viewController: UIViewController? {
        get {
            if let nextResponder = self.next as? UIViewController { return nextResponder }
            else if let nextResponder = self.next as? UIView { return nextResponder.viewController }
            else { return nil }
        }
    }
}

public extension UIView {
    
    var topSafeArea: CGFloat {
        var topSafeArea: CGFloat = 0
        if #available(iOS 11.0, *) {
            topSafeArea = self.safeAreaInsets.top
        }
        return topSafeArea
    }
    
    var bottomSafeArea: CGFloat {
        var bottomSafeArea: CGFloat = 0
        if #available(iOS 11.0, *) {
            bottomSafeArea = self.safeAreaInsets.bottom
        }
        return bottomSafeArea
    }
    
    func setHeight(_ height: CGFloat) {
        self.frame = CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: height)
    }
    
    func setWidth(_ width: CGFloat) {
        self.frame = CGRect.init(x: self.frame.origin.x, y: self.frame.origin.y, width: width, height: self.frame.height)
    }
    
    func setEqualsFrameFromBounds(_ view: UIView, withWidthFactor widthFactor: CGFloat = 1, maxWidth: CGFloat? = nil, withHeightFactor heightFactor: CGFloat = 1, maxHeight: CGFloat? = nil, withCentering: Bool = false) {
        self.setEqualsFrameFromBounds(view.bounds, withWidthFactor: widthFactor, maxWidth: maxWidth, withHeightFactor: heightFactor, maxHeight: maxHeight, withCentering: withCentering)
    }
    
    func setEqualsFrameFromBounds(_ bounds: CGRect, withWidthFactor widthFactor: CGFloat = 1, maxWidth: CGFloat? = nil, withHeightFactor heightFactor: CGFloat = 1, maxHeight: CGFloat? = nil, withCentering: Bool = false) {
        
        var width = bounds.width * widthFactor
        if maxWidth != nil { width.setIfMore(when: maxWidth!) }
        
        var height = bounds.height * heightFactor
        if maxHeight != nil { height.setIfMore(when: maxHeight!) }
        
        self.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        
        if withCentering {
            self.center.x = bounds.width / 2
            self.center.y = bounds.height / 2
        }
    }
    
    func setEqualsBoundsFromSuperview(customWidth: CGFloat? = nil, customHeight: CGFloat? = nil) {
        if self.superview == nil { return }
        self.frame = CGRect.init(origin: CGPoint.zero, size: self.superview!.frame.size)
        if customWidth != nil {
            self.frame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: customWidth!, height: self.frame.height))
        }
        if customHeight != nil {
            self.frame = CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: self.frame.width, height: customHeight!))
        }
    }
    
    func resize(width: CGFloat) {
        let relativeFactor = self.frame.width / self.frame.height
        if relativeFactor.isNaN { return }
        self.frame = CGRect.init(
            x: self.frame.origin.x,
            y: self.frame.origin.y,
            width: width,
            height: width * relativeFactor
        )
    }
    
    func resize(height: CGFloat) {
        let relativeFactor = self.frame.width / self.frame.height
        if relativeFactor.isNaN { return }
        self.frame = CGRect.init(
            x: self.frame.origin.x,
            y: self.frame.origin.y,
            width: height / relativeFactor,
            height: height
        )
    }
    
    func setYCenteringFromSuperview() {
        self.center.y = (self.superview?.frame.height ?? 0) / 2
    }
    
    func setXCenteringFromSuperview() {
        self.center.x = (self.superview?.frame.width ?? 0) / 2
    }
    
    func setToCenterInSuperview() {
        self.center = CGPoint.init(x: ((self.superview?.frame.width) ?? 0) / 2, y: ((self.superview?.frame.height) ?? 0) / 2)
    }
}

public extension UIView {
    
    func setParalax(amountFactor: CGFloat) {
        let amount = self.frame.minSideSize * amountFactor
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

public extension UIView {
    
    func addGrade(alpha: CGFloat, color: UIColor = UIColor.black) -> UIView {
        let gradeView = UIView.init()
        gradeView.alpha = 0
        self.addSubview(gradeView)
        SPConstraints.setEqualSize(gradeView, superVuew: self)
        gradeView.alpha = alpha
        gradeView.backgroundColor = color
        return gradeView
    }
}

extension UIView {
    
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
        
        let cornerRadius = self.frame.minSideSize * cornerRadiusFactor
        
        let shadowPath = UIBezierPath.init(
            roundedRect: CGRect.init(x: xTranslation, y: yTranslation, width: shadowWidth, height: shadowHeight),
            cornerRadius: cornerRadius
        )
        
        let blurRadius = self.frame.minSideSize * blurRadiusFactor
        
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
    
    func removeShadow() {
        self.layer.shadowColor = nil
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0
        self.layer.shadowPath = nil
    }
    
    func addShadowOpacityAnimation(to: CGFloat, duration: CFTimeInterval) {
        let animation = CABasicAnimation(keyPath:"shadowOpacity")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fromValue = self.layer.cornerRadius
        animation.fromValue = self.layer.shadowOpacity
        animation.toValue = to
        animation.duration = duration
        self.layer.add(animation, forKey: "shadowOpacity")
        self.layer.shadowOpacity = Float(to)
    }
}

extension UIView {
    
    func addCornerRadiusAnimation(to: CGFloat, duration: CFTimeInterval) {
        let animation = CABasicAnimation(keyPath:"cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fromValue = self.layer.cornerRadius
        animation.toValue = to
        animation.duration = duration
        self.layer.add(animation, forKey: "cornerRadius")
        self.layer.cornerRadius = to
    }
    
    func show(duration: TimeInterval = 0.3) {
        self.isHidden = false
        SPAnimation.animate(duration, animations: {
            self.alpha = 1
        })
    }
    
    func hide(duration: TimeInterval = 0.3) {
        SPAnimation.animate(duration, animations: {
            self.alpha = 0
        }, withComplection: {
            self.isHidden = true
        })
    }
    
    func removeAllAnimations() {
        self.layer.removeAllAnimations()
    }
}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func round() {
        self.layer.cornerRadius = self.frame.minSideSize / 2
    }
}
