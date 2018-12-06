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

public class SPAnimationAlpha {
    
    fileprivate static let durationListAnimation: TimeInterval = 0.45
    fileprivate static let coefLenthForTransition: CGFloat = 2.8
    fileprivate static let delayPerItem: TimeInterval = 0.09

    static func hideList(_ duration: TimeInterval = durationListAnimation,
                         views: [UIView],
                         delayPerItem: TimeInterval = delayPerItem,
                         withComplection completion: (() -> Void)! = {}) {
        
        var del: Double = 0
        for view in views {
            delay(del, closure: {
                if (view == views.last) {
                    SPAnimation.animate(duration, animations: {
                        view.alpha = 0
                    }, withComplection: {
                        completion()
                    })
                } else {
                    SPAnimation.animate(duration, animations: {
                        view.alpha = 0
                    })
                }
            })
            del += delayPerItem
        }
    }
    
    static func hideReverseList(_ duration: TimeInterval = durationListAnimation,
                         views: [UIView],
                         delayPerItem: TimeInterval = delayPerItem,
                         withComplection completion: (() -> Void)! = {}) {
        
        var del: Double = 0
        let reversedViews = views.reversed()
        for view in reversedViews {
            delay(del, closure: {
                if (view == views.last) {
                    SPAnimation.animate(duration, animations: {
                        view.alpha = 0
                    }, withComplection: {
                        completion()
                    })
                } else {
                    SPAnimation.animate(duration, animations: {
                        view.alpha = 0
                    })
                }
            })
            del += delayPerItem
        }
    }
    
    static func showList(_ duration: TimeInterval = durationListAnimation,
                         views: [UIView],
                         delayPerItem: TimeInterval = delayPerItem,
                         withComplection completion: (() -> Void)! = {}) {
        
        var del: Double = 0
        for view in views {
            delay(del, closure: {
                if (view == views.last) {
                    SPAnimation.animate(duration, animations: {
                        view.alpha = 1
                    }, withComplection: {
                        completion()
                    })
                } else {
                    SPAnimation.animate(duration, animations: {
                        view.alpha = 1
                    })
                }
            })
            del += delayPerItem
        }
        
    }
}
