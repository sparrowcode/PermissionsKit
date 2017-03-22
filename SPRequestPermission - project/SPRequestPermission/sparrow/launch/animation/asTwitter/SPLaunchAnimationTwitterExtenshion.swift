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

public extension SPLaunchAnimation {
    
    //scale logo in middle animation
    static private let scaleLogoFactor: CGFloat = 0.9
    //scale root view controller from
    static private let scaleFactorRootView: CGFloat = 1.09
    //duration all animation
    static private let duration: TimeInterval = 0.7
    //position change animation in timeline: [0..1]
    static private let changeAnimationFactor: NSNumber = 0.52
    //in end animation scale mask
    static private let scaleMaskInEndFactor: CGFloat = 3.3
    //delay for start animation
    static private let delay: Double = 1
    //options animations grade view and root view
    static private let delayHidyingGradeView: TimeInterval = 1.4
    static private let durationHidyingGradeView: TimeInterval = 0.095
    static private let delayScalingRootView: TimeInterval = 1.4
    static private let durationScalingRootView: TimeInterval = 0.45
    //timing function for scale twitter to front
    static private let scalingToFrontTimingFunction = CAMediaTimingFunction.init(controlPoints: 1, 0, 0, 1)

    static func asTwitter(
        forLaunchScreenName launchScreenName: String = "LaunchScreen",
        numberLogoAsSubview: Int = 0,
        withComplection complection: @escaping ()->() = {},
        onWindow window: UIWindow) {
        
        window.makeKeyAndVisible()
        let rootViewController = window.rootViewController!
        let launchScreenController = UIStoryboard.init(name: launchScreenName, bundle: nil).instantiateInitialViewController()!
        let backgroundColor = launchScreenController.view.backgroundColor!
        window.backgroundColor = backgroundColor
        
        let logoImageView = launchScreenController.view.subviews[numberLogoAsSubview] as! UIImageView
        let logoSideSize = logoImageView.frame.width
        let yPositionTranslateFactor: CGFloat = logoImageView.center.y / (launchScreenController.view.frame.height / 2)
        
        let gradeView = UIView.init(frame: rootViewController.view.frame)
        gradeView.backgroundColor = UIColor.white
        rootViewController.view.addSubview(gradeView)
        
        rootViewController.view.transform = CGAffineTransform.init(scaleX: scaleFactorRootView, y: scaleFactorRootView)
        
        let maskLayer = CAShapeLayer()
        maskLayer.contents = logoImageView.image!.cgImage
        maskLayer.bounds = CGRect.init(
            x: 0,
            y: 0,
            width: logoSideSize / scaleFactorRootView,
            height: logoSideSize / scaleFactorRootView
        )
        let space: CGFloat = (rootViewController.view.frame.height - UIScreen.main.bounds.height) / 2 / scaleFactorRootView
        let centerDisplay: CGFloat = UIScreen.main.bounds.height / 2
        maskLayer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        maskLayer.position = CGPoint.init(
            x: rootViewController.view.center.x,
            y: space + (centerDisplay * yPositionTranslateFactor) / scaleFactorRootView
        )
        rootViewController.view.layer.addSublayer(maskLayer)
        rootViewController.view.layer.mask = maskLayer
        
        let initialScale = NSValue(caTransform3D:
            CATransform3DScale(rootViewController.view.layer.mask!.transform, 1, 1, 1)
        )
        
        let secondScale = NSValue(caTransform3D:
            CATransform3DScale(rootViewController.view.layer.mask!.transform, self.scaleLogoFactor, self.scaleLogoFactor, 1)
        )
        
        let scale = UIScreen.main.bounds.height / (rootViewController.view.layer.mask!.bounds.height / 3) * scaleMaskInEndFactor
        let finalScale = NSValue(caTransform3D:
            CATransform3DScale(
                rootViewController.view.layer.mask!.transform, scale, scale, 1)
        )
        
        let scaleAnimation = CAKeyframeAnimation.init(keyPath: "transform.scale")
        scaleAnimation.values = [initialScale, secondScale, finalScale]
        scaleAnimation.keyTimes = [0, changeAnimationFactor, 1]
        scaleAnimation.duration = duration
        let startTime = CACurrentMediaTime() + delay
        scaleAnimation.beginTime = startTime
        scaleAnimation.isRemovedOnCompletion = false
        scaleAnimation.fillMode = kCAFillModeForwards
        scaleAnimation.timingFunctions = [
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
            self.scalingToFrontTimingFunction
        ]
        rootViewController.view.layer.mask?.add(scaleAnimation, forKey: "maskScaleAnimation")
        
        UIView.animate(
            withDuration: self.durationHidyingGradeView,
            delay: self.delayHidyingGradeView,
            options: [.curveEaseInOut],
            animations: {
                gradeView.alpha = 0
        }, completion: {
            finished in
            gradeView.removeFromSuperview()
        })
        
        UIView.animate(
            withDuration: self.durationScalingRootView,
            delay: self.delayScalingRootView,
            options: [.curveEaseOut],
            animations: {
                rootViewController.view.transform = CGAffineTransform.identity
        }, completion: {
            finished in
            rootViewController.view.layer.mask = nil
            complection()
        })
    }
    
    static func asTwitter(
        forLaunchScreenName launchScreenName: String = "LaunchScreen",
        numberLogoAsSubview: Int = 0,
        withIcon iconBezierPath: UIBezierPath,
        withComplection complection: @escaping ()->() = {},
        onWindow window: UIWindow) {

        window.makeKeyAndVisible()
        let rootViewController = window.rootViewController!
        let launchScreenController = UIStoryboard.init(name: launchScreenName, bundle: nil).instantiateInitialViewController()!
        let backgroundColor = launchScreenController.view.backgroundColor!
        window.backgroundColor = backgroundColor
        
        let logoImageView = launchScreenController.view.subviews[numberLogoAsSubview] as! UIImageView
        let logoSideSize = logoImageView.frame.width
        let yPositionTranslateFactor: CGFloat = logoImageView.center.y / (launchScreenController.view.frame.height / 2)
        
        let gradeView = UIView.init(frame: rootViewController.view.frame)
        gradeView.backgroundColor = UIColor.white
        rootViewController.view.addSubview(gradeView)
        
        rootViewController.view.transform = CGAffineTransform.init(scaleX: scaleFactorRootView, y: scaleFactorRootView)
        
        let logoScaleFactor = logoSideSize / scaleFactorRootView / iconBezierPath.bounds.width
        let logoScaleTransform = CGAffineTransform.init(
            scaleX: logoScaleFactor,
            y: logoScaleFactor
        )
        iconBezierPath.apply(logoScaleTransform)
        
        let logoTranslationY = (logoSideSize / scaleFactorRootView - iconBezierPath.bounds.height) / 2
        let logoTranslationYTransform = CGAffineTransform.init(
            translationX: 0,
            y: logoTranslationY
        )
        iconBezierPath.apply(logoTranslationYTransform)
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = CGRect.init(x: 0, y: 0, width: logoSideSize / scaleFactorRootView, height: logoSideSize / scaleFactorRootView)
        maskLayer.path = iconBezierPath.cgPath
        maskLayer.fillColor = UIColor.blue.cgColor
        maskLayer.backgroundColor = UIColor.clear.cgColor
        maskLayer.frame.origin = CGPoint.init(
            x: (window.bounds.width / 2) - (maskLayer.bounds.width / 2),
            y: ((window.bounds.height / 2) - (maskLayer.bounds.height / 2)) * yPositionTranslateFactor
        )
        
        rootViewController.view.layer.addSublayer(maskLayer)
        rootViewController.view.layer.mask = maskLayer
        
        let initialScale = NSValue(caTransform3D:
            CATransform3DScale(rootViewController.view.layer.mask!.transform, 1, 1, 1)
        )
        
        let secondScale = NSValue(caTransform3D:
            CATransform3DScale(rootViewController.view.layer.mask!.transform, self.scaleLogoFactor, self.scaleLogoFactor, 1)
        )
        
        let scale = UIScreen.main.bounds.height / (rootViewController.view.layer.mask!.bounds.height / 3) * scaleMaskInEndFactor
        let finalScale = NSValue(caTransform3D:
            CATransform3DScale(
                rootViewController.view.layer.mask!.transform, scale, scale, 1)
        )
        
        let scaleAnimation = CAKeyframeAnimation.init(keyPath: "transform.scale")
        scaleAnimation.values = [initialScale, secondScale, finalScale]
        scaleAnimation.keyTimes = [0, changeAnimationFactor, 1]
        scaleAnimation.duration = duration
        let startTime = CACurrentMediaTime() + delay
        scaleAnimation.beginTime = startTime
        scaleAnimation.isRemovedOnCompletion = false
        scaleAnimation.fillMode = kCAFillModeForwards
        scaleAnimation.timingFunctions = [
            CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),
            self.scalingToFrontTimingFunction
        ]
        rootViewController.view.layer.mask?.add(scaleAnimation, forKey: "maskScaleAnimation")
        
        UIView.animate(
            withDuration: self.durationHidyingGradeView,
            delay: self.delayHidyingGradeView,
            options: [.curveEaseInOut],
            animations: {
                gradeView.alpha = 0
        }, completion: {
            finished in
            gradeView.removeFromSuperview()
        })
        
        UIView.animate(
            withDuration: self.durationScalingRootView,
            delay: self.delayScalingRootView,
            options: [.curveEaseOut],
            animations: {
                rootViewController.view.transform = CGAffineTransform.identity
        }, completion: {
            finished in
            rootViewController.view.layer.mask = nil
            complection()
        })
    }
}
