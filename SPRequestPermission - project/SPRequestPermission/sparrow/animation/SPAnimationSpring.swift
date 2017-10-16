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

public class SPAnimationSpring {
    
    fileprivate static let spring: CGFloat = 1
    fileprivate static let velocity: CGFloat = 1
    
    static func animate(_ duration: TimeInterval,
                        animations: (() -> Void)!,
                        delay: TimeInterval = 0,
                        spring: CGFloat = spring,
                        velocity: CGFloat = velocity,
                        options: UIViewAnimationOptions = [],
                        withComplection completion: (() -> Void)! = {}) {
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: spring,
            initialSpringVelocity: velocity,
            options: options,
            animations: {
                animations()
            }, completion: { finished in
                completion()
        })
    }
    
    static func animateWithRepeatition(_ duration: TimeInterval,
                                       animations: (() -> Void)!,
                                       delay: TimeInterval = 0,
                                       spring: CGFloat = spring,
                                       velocity: CGFloat = velocity,
                                       options: UIViewAnimationOptions = [],
                                       withComplection completion: (() -> Void)! = {}) {
        
        var optionsWithRepeatition = options
        optionsWithRepeatition.insert([.autoreverse, .repeat])
        
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: spring,
            initialSpringVelocity: velocity,
            options: optionsWithRepeatition,
            animations: {
                animations()
            }, completion: { finished in
                completion()
        })
    }
}
