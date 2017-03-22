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
    
    var startColor: UIColor = UIColor.white { didSet { self.updateGradient() }}
    var endColor: UIColor = UIColor.black { didSet { self.updateGradient() }}
    
    var startColorPoint: CGPoint = CGPoint.zero { didSet { self.updateGradient() }}
    var endColorPoint: CGPoint = CGPoint.zero { didSet { self.updateGradient() }}
    
    fileprivate var gradient: CAGradientLayer!
    
    public init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    public func setStartColorPosition(_ position: Position) {
        self.startColorPoint = getPointForPosition(position)
    }
    
    public func setEndColorPosition(_ position: Position) {
        self.endColorPoint = getPointForPosition(position)
    }
    
    private func commonInit() {
        self.gradient = CAGradientLayer()
        self.layer.insertSublayer(self.gradient!, at: 0)
    }
    
    private func updateGradient() {
        self.gradient!.colors = [startColor.cgColor, endColor.cgColor]
        self.gradient!.locations = [0.0, 1.0]
        self.gradient!.startPoint = self.startColorPoint
        self.gradient!.endPoint = self.endColorPoint
    }
    
    override public func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.gradient.frame = self.bounds
    }
    
    public enum Position {
        case TopLeft
        case TopCenter
        case TopRight
        case BottomLeft
        case BottomCenter
        case BottomRight
    }
    
    private func getPointForPosition(_ position: Position) -> CGPoint {
        switch position {
        case .TopLeft:
            return CGPoint.init(x: 0, y: 0)
        case .TopCenter:
            return CGPoint.init(x: 0.5, y: 0)
        case .TopRight:
            return CGPoint.init(x: 1, y: 0)
        case .BottomLeft:
            return CGPoint.init(x: 0, y: 1)
        case .BottomCenter:
            return CGPoint.init(x: 0.5, y: 1)
        case .BottomRight:
            return CGPoint.init(x: 1, y: 1)
        }
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
