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

enum SPApp {
    
    static var udid: String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    static var displayName: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    static var rootController: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController
    }
    
    static var safeArea: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeArea ?? UIEdgeInsets.zero
        } else {
            return UIEdgeInsets.zero
        }
    }
    
    static func set(rootController: UIViewController, animatable: Bool = true) {
        
        rootController.view.frame = UIScreen.main.bounds
        
        let replaceRootViewController = {
            UIApplication.shared.keyWindow?.rootViewController = rootController
        }
        
        if animatable {
            UIView.transition(
                with: UIApplication.shared.keyWindow ?? UIWindow(),
                duration: 0.5,
                options: UIView.AnimationOptions.transitionCrossDissolve,
                animations: {
                    replaceRootViewController()
            }, completion: nil)
        } else {
            replaceRootViewController()
        }
    }
    
    static func set(elementsColor: UIColor) {
        UINavigationController.elementsColor = elementsColor
        UIAlertController.elementsColor = elementsColor
        UITabBarController.elementsColor = elementsColor
        UITabBar.appearance().tintColor = elementsColor
    }
}
