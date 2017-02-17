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

// MARK: - resizeByWidth
public extension UIView {
    
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

public extension UIImage {
    func resize(to size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        self.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: size.width, height: size.height)))
        let resizeImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizeImage
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
    
    func updateShadow(
        xTranslationFactor: CGFloat = 0,
        yTranslationFactor: CGFloat = 0.04,
        widthRelativeFactor: CGFloat = 0.8,
        heightRelativeFactor: CGFloat = 1,
        blurRadiusFactor: CGFloat = 0.024,
        shadowOpacity: CGFloat = 0.35
    ) {
        let shadowWidth = self.frame.width * widthRelativeFactor
        let shadowHeight = self.frame.height * heightRelativeFactor
        
        let xTranslation = (self.frame.width - shadowWidth) / 2 + (self.frame.width * xTranslationFactor)
        let yTranslation = (self.frame.height - shadowHeight) / 2 + (self.frame.height * yTranslationFactor)
        
        let shadowPath = UIBezierPath.init(rect:
            CGRect.init(
                x: xTranslation,
                y: yTranslation,
                width: shadowWidth,
                height: shadowHeight
            )
        )
        
        let blurRadius = min(self.frame.width, self.frame.height) * blurRadiusFactor
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowRadius = blurRadius
        self.layer.masksToBounds = false
        self.layer.shadowPath = shadowPath.cgPath;
    }
    
    func setShadow(
        xTranslationFactor: CGFloat = 0,
        yTranslationFactor: CGFloat = 0.1,
        widthRelativeFactor: CGFloat = 0.8,
        heightRelativeFactor: CGFloat = 0.9,
        blurRadius: CGFloat = 5,
        shadowOpacity: Float = 0.35,
        animated: Bool = false,
        duration: CGFloat = 0)
    {
        
        let shadowWidth = self.frame.width * widthRelativeFactor
        let shadowHeight = self.frame.height * heightRelativeFactor
        
        let xTranslation = (self.frame.width - shadowWidth) / 2 + (self.frame.width * xTranslationFactor)
        let yTranslation = (self.frame.height - shadowHeight) / 2 + (self.frame.height * yTranslationFactor)
        
        let shadowPath = UIBezierPath.init(rect:
            CGRect.init(
                x: xTranslation,
                y: yTranslation,
                width: shadowWidth,
                height: shadowHeight
            )
        )
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = blurRadius
        self.layer.masksToBounds = false

        if animated {
            let theAnimation = CABasicAnimation.init(keyPath: "shadowPath")
            theAnimation.duration = CFTimeInterval(duration)
            theAnimation.fromValue = layer.shadowPath
            theAnimation.toValue = shadowPath.cgPath
            self.layer.add(theAnimation, forKey: "shadowPath")
        }
        self.layer.shadowPath = shadowPath.cgPath;
    }
    
    func setShadow(
        xTranslationFactor: CGFloat = 0,
        yTranslationFactor: CGFloat = 0.1,
        widthRelativeFactor: CGFloat = 0.8,
        heightRelativeFactor: CGFloat = 0.9,
        blurRadius: CGFloat = 5,
        shadowOpacity: Float = 0.35,
        duration: CGFloat,
        damping: CGFloat)
    {
        
        let shadowWidth = self.frame.width * widthRelativeFactor
        let shadowHeight = self.frame.height * heightRelativeFactor
        
        let xTranslation = (self.frame.width - shadowWidth) / 2 + (self.frame.width * xTranslationFactor)
        let yTranslation = (self.frame.height - shadowHeight) / 2 + (self.frame.height * yTranslationFactor)
        
        let shadowPath = UIBezierPath.init(rect:
            CGRect.init(
                x: xTranslation,
                y: yTranslation,
                width: shadowWidth,
                height: shadowHeight
            )
        )
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = blurRadius
        self.layer.masksToBounds = false
        
        if #available(iOS 9.0, *) {
            let theAnimation = CASpringAnimation.init(keyPath: "shadowPath")
            theAnimation.damping = 0.85
            theAnimation.duration = CFTimeInterval(duration)
            theAnimation.fromValue = layer.shadowPath
            theAnimation.toValue = shadowPath.cgPath
            self.layer.add(theAnimation, forKey: "shadowPath")
        } else {
            // Fallback on earlier versions
        }
        self.layer.shadowPath = shadowPath.cgPath;
    }
}

