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

public class SPGradientView: UIView {
    
    fileprivate var gradient: CAGradientLayer!
    
    init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    init(from fromColor: UIColor, toColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.commonInit()
        self.setGradient(from: fromColor, to: toColor)
    }
    
    init(frame: CGRect, from fromColor: UIColor, to toColor: UIColor) {
        super.init(frame: frame)
        self.commonInit()
        self.setGradient(from: fromColor, to: toColor)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        self.gradient = CAGradientLayer();
        self.layer.insertSublayer(self.gradient, at: 0)
    }
    
    func setGradient(from fromColor: UIColor,
                     to toColor: UIColor,
                     startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0),
                     endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0)) {
        self.gradient.removeFromSuperlayer()
        self.gradient = CAGradientLayer()
        self.gradient!.colors = [fromColor.cgColor, toColor.cgColor]
        self.gradient!.locations = [0.0, 1.0]
        self.gradient!.startPoint = startPoint
        
        self.gradient!.endPoint = endPoint
        self.gradient!.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.insertSublayer(self.gradient!, at: 0)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override public func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.gradient.frame = self.bounds
    }
}


class SPGradientWithPictureView: SPGradientView {
    
    var pictureView: UIView? {
        willSet {
            if self.pictureView != nil {
                if self.subviews.contains(self.pictureView!) {
                    self.pictureView?.removeFromSuperview()
                }
            }
        }
        didSet {
            if self.pictureView != nil {
                self.addSubview(pictureView!)
            }
        }
    }
    
    override func layoutSubviews() {
        self.pictureView?.frame = self.bounds
    }
}
