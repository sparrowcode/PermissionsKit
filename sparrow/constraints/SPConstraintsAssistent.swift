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
            attribute: NSLayoutConstraint.Attribute.topMargin,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: superVuew,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 0)
        
        let bottomMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutConstraint.Attribute.bottomMargin,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: superVuew,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: 0)
        
        let leadingMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutConstraint.Attribute.leadingMargin,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: superVuew,
            attribute: NSLayoutConstraint.Attribute.leading,
            multiplier: 1,
            constant: 0)
        
        let trailingMarginConstraint = NSLayoutConstraint(
            item: subView,
            attribute: NSLayoutConstraint.Attribute.trailingMargin,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: superVuew,
            attribute: NSLayoutConstraint.Attribute.trailing,
            multiplier: 1,
            constant: 0)
        
        superVuew.addConstraints([
            topMarginConstraint, bottomMarginConstraint, leadingMarginConstraint, trailingMarginConstraint
            ])
    }
}


       
