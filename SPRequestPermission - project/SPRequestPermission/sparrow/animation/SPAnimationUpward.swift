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

public class SPAnimationUpward {
    
    fileprivate static let durationListAnimation: TimeInterval = 0.45
    fileprivate static let coefLenthForTransition: CGFloat = 2.8
    fileprivate static let delayPerItem: TimeInterval = 0.09
    
    static func hide(_ duration: TimeInterval,
                   view: UIView,
                   delay: TimeInterval = 0,
                   withComplection completion: (() -> Void)! = {}) {
        
        var options: UIViewAnimationOptions = []
        options.insert(.curveEaseIn)
        
        SPAnimationSpring.animate(
            duration, animations: {
                view.alpha = 0
                //view.transform = CGAffineTransform(translationX: 0, y: -UIScreen.main.bounds.height / coefLenthForTransition)
                view.frame.origin.y = view.frame.origin.y + (-UIScreen.main.bounds.height / coefLenthForTransition)
            },
            delay: delay,
            options: options,
            withComplection: {
                completion()
                
        })
    }
    
    static func hideList(_ duration: TimeInterval = durationListAnimation,
                       views: [UIView],
                       delayPerItem: TimeInterval = delayPerItem,
                       withComplection completion: (() -> Void)! = {}) {
        
        var del: Double = 0
        for view in views {
            delay(del, closure: {
                if (view == views.last) {
                    SPAnimationUpward.hide(duration, view: view, withComplection: {
                        completion()
                    })
                } else {
                    SPAnimationUpward.hide(duration, view: view)
                }
            })
            del += delayPerItem
        }
        
    }
    
    static func show(_ duration: TimeInterval,
                   view: UIView,
                   delay: TimeInterval = 0,
                   withComplection completion: (() -> Void)! = {}) {
        
        view.alpha = 0
        view.isHidden = false
        view.transform = CGAffineTransform(translationX: 0, y: UIScreen.main.bounds.height / coefLenthForTransition)
        
        var options: UIViewAnimationOptions = []
        options.insert(.curveEaseOut)
        
        SPAnimationSpring.animate(
            duration, animations: {
                view.alpha = 1
                view.transform = CGAffineTransform.identity
            },
            delay: delay,
            options: options,
            withComplection: {
                completion()
        })
    }
    
    static func showList(_ duration: TimeInterval = durationListAnimation,
                       views: [UIView],
                       delayPerItem: TimeInterval = delayPerItem,
                       options: UIViewAnimationOptions = [],
                       withComplection completion: (() -> Void)! = {}) {
        
        var del: Double = 0
        for view in views {
            delay(del, closure: {
                if (view == views.last) {
                    SPAnimationUpward.show(duration, view: view, withComplection: {
                        completion()
                    })
                } else {
                    SPAnimationUpward.show(duration, view: view)
                }
            })
            del += delayPerItem
        }
        
    }
}


