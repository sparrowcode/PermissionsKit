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

class SPDotButton: SPButton {
    
    var customSideSize: CGFloat = 26 {
        didSet {
            self.sizeToFit()
        }
    }
    
    var dotColor: UIColor = UIColor.white {
        didSet {
            for dotView in self.dotsView {
                dotView.backgroundColor = self.dotColor
            }
        }
    }
    
    override var isHighlighted: Bool{
        didSet{
            if isHighlighted{
                UIView.animate(withDuration: 0.1, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: [.curveEaseOut, .beginFromCurrentState], animations: {
                    for dotView in self.dotsView {
                        dotView.alpha = 0.35
                    }
                }, completion: nil)
            }else{
                UIView.animate(withDuration: 0.35, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1.0, options: [.curveEaseOut, .beginFromCurrentState], animations: {
                    for dotView in self.dotsView {
                        dotView.alpha = 1
                    }
                }, completion: nil)
            }
        }
    }
    
    private var dotsView: [UIView] = []
    
    override func commonInit() {
        super.commonInit()
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        for _ in 0...2 {
            let dotView = UIView()
            dotView.isUserInteractionEnabled = false
            dotView.backgroundColor = self.dotColor
            self.dotsView.append(dotView)
            self.addSubview(dotView)
        }
    }
    
    override func sizeToFit() {
        super.sizeToFit()
        self.frame.set(width: self.customSideSize)
        self.frame.set(height: self.customSideSize)
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        let space: CGFloat = 2
        let sideSize: CGFloat = 4
        
        let insest: CGFloat = (self.frame.width - (sideSize * 3) - (space * 2)) / 2

        var currentXPosition: CGFloat = insest
        
        for dotView in self.dotsView {
            dotView.frame.set(width: sideSize)
            dotView.frame.set(height: sideSize)
            dotView.setYCenter()
            dotView.frame.origin.x = currentXPosition
            dotView.round()
            currentXPosition += (sideSize + space)
        }
        
        self.round()
    }
}
