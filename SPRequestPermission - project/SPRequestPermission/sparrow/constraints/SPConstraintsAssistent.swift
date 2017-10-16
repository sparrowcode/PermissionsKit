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

public struct SPConstraintsAssistent {
    
    static func setEqualSizeConstraint(_ subView: UIView, superVuew: UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false;
        let topMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.topMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.top,
            multiplier: 1,
            constant: 0)
        
        let bottomMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.bottomMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1,
            constant: 0)
        
        let leadingMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.leadingMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1,
            constant: 0)
        
        let trailingMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.trailingMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1,
            constant: 0)
        
        superVuew.addConstraints([
            topMarginConstraint, bottomMarginConstraint, leadingMarginConstraint, trailingMarginConstraint
            ])
    }
    
    static func setMarginConstraint(_ subView: UIView, superVuew: UIView, top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat) {
        subView.translatesAutoresizingMaskIntoConstraints = false;
        let topMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.topMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.top,
            multiplier: 1,
            constant: top)
        
        let bottomMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.bottomMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.bottom,
            multiplier: 1,
            constant: -bottom)
        
        let leadingMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.leadingMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.leading,
            multiplier: 1,
            constant: leading)
        
        let trailingMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutAttribute.trailingMargin,
            relatedBy: NSLayoutRelation.equal,
            toItem: superVuew,
            attribute: NSLayoutAttribute.trailing,
            multiplier: 1,
            constant: -trailing)
        
        superVuew.addConstraints([
            topMarginConstraint, bottomMarginConstraint, leadingMarginConstraint, trailingMarginConstraint
            ])
    }
    
    static func setXCenteringConstraint(_ subView: UIView, superView: UIView) -> NSLayoutConstraint {
        subView.translatesAutoresizingMaskIntoConstraints = false;
        
        let centerXConstraint = NSLayoutConstraint(
            item: subView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: superView,
            attribute: .centerX,
            multiplier: 1, constant: 0
        )
        superView.addConstraints([centerXConstraint])
        return centerXConstraint
    }
    
    static func setYCenteringConstraint(_ subView: UIView, superView: UIView) -> NSLayoutConstraint {
        subView.translatesAutoresizingMaskIntoConstraints = false;
        let centerYConstraint = NSLayoutConstraint(
            item: subView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: superView,
            attribute: .centerY,
            multiplier: 1, constant: 0
        )
        superView.addConstraints([centerYConstraint])
        return centerYConstraint
    }
    
    static func setMaxSide(_ side: NSLayoutAttribute, on view: UIView, value: CGFloat) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: view,
            attribute: side,
            relatedBy: .lessThanOrEqual,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1, constant: value
        )
        view.addConstraints([constraint])
        return constraint

    }
    
    static func setWidth(width: CGFloat, andHeight height: CGFloat, toView view: UIView) {
        let widthConstraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.width,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1,
            constant: width
        )
        let heightConstraint = NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.height,
            relatedBy: NSLayoutRelation.equal,
            toItem: nil,
            attribute: NSLayoutAttribute.notAnAttribute,
            multiplier: 1,
            constant: height
        )
        view.addConstraints([widthConstraint, heightConstraint])
    }
    
    static func attachView(_ view: UIView, to superView: UIView, side: NSLayoutAttribute) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint.init(
            item: view,
            attribute: side,
            relatedBy: NSLayoutRelation.equal,
            toItem: superView,
            attribute: side,
            multiplier: 1,
            constant: 0
        )
        return constraint
    }
    
    static func equalSide(_ view: UIView, superView: UIView, side: NSLayoutAttribute, factor: CGFloat = 1) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(
            item: view,
            attribute: side,
            relatedBy: .equal,
            toItem: superView,
            attribute: side,
            multiplier: factor,
            constant: 0
        )
        return constraint
    }
}


       
