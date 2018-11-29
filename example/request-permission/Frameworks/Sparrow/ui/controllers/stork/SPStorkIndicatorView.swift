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

class SPStorkIndicatorView: UIView {
    
    var style: Style = .line {
        didSet {
            switch self.style {
            case .line:
                SPAnimationSpring.animate(0.5, animations: {
                    self.leftView.transform = .identity
                    self.rightView.transform = .identity
                }, options: .curveEaseOut)
            case .arrow:
                SPAnimationSpring.animate(0.5, animations: {
                    let angle = CGFloat(20 * Float.pi / 180)
                    self.leftView.transform = CGAffineTransform.init(rotationAngle: angle)
                    self.rightView.transform = CGAffineTransform.init(rotationAngle: -angle)
                }, options: .curveEaseOut)
            }
            
        }
    }
    
    private var leftView: UIView = UIView()
    private var rightView: UIView = UIView()
    
    init() {
        super.init(frame: .zero)
        self.addSubview(self.leftView)
        self.addSubview(self.rightView)
        self.leftView.backgroundColor = UIColor.init(hex: "CAC9CF")
        self.rightView.backgroundColor = UIColor.init(hex: "CAC9CF")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func sizeToFit() {
        super.sizeToFit()
        self.setWidth(36)
        self.setHeight(13)
        
        let height: CGFloat = 5
        let correction = height / 2
        
        self.leftView.frame = CGRect.init(x: 0, y: 0, width: self.frame.width / 2 + correction, height: height)
        self.leftView.center.y = self.frame.height / 2
        self.leftView.round()
        
        self.rightView.frame = CGRect.init(x: self.frame.width / 2 - correction, y: 0, width: self.frame.width / 2 + correction, height: height)
        self.rightView.center.y = self.frame.height / 2
        self.rightView.round()
    }
    
    enum Style {
        case arrow
        case line
    }
}
