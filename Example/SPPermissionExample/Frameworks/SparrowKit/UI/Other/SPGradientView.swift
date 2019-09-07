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

class SPGradientView: SPView {
    
    var gradientLayer: CAGradientLayer = CAGradientLayer()
    
    var startColor = UIColor.white { didSet { self.updateGradient() }}
    var endColor = UIColor.black { didSet { self.updateGradient() }}
    var startColorPosition = Position.topLeft { didSet { self.updateGradient() }}
    var endColorPosition = Position.bottomRight { didSet { self.updateGradient() }}
    
    override func commonInit() {
        super.commonInit()
        self.layer.insertSublayer(self.gradientLayer, at: 0)
    }
    
    private func updateGradient() {
        self.gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        self.gradientLayer.locations = [0.0, 1.0]
        self.gradientLayer.startPoint = self.startColorPosition.point
        self.gradientLayer.endPoint = self.endColorPosition.point
    }
    
    override func layoutSublayers(of layer: CALayer) {
        self.gradientLayer.frame = self.bounds
        super.layoutSublayers(of: layer)
    }
    
    enum Position {
        
        case topLeft
        case topCenter
        case topRight
        case bottomLeft
        case bottomCenter
        case bottomRight
        case mediumLeft
        case mediumRight
        
        var point: CGPoint {
            switch self {
            case .topLeft:
                return CGPoint.init(x: 0, y: 0)
            case .topCenter:
                return CGPoint.init(x: 0.5, y: 0)
            case .topRight:
                return CGPoint.init(x: 1, y: 0)
            case .bottomLeft:
                return CGPoint.init(x: 0, y: 1)
            case .bottomCenter:
                return CGPoint.init(x: 0.5, y: 1)
            case .bottomRight:
                return CGPoint.init(x: 1, y: 1)
            case .mediumLeft:
                return CGPoint.init(x: 0, y: 0.5)
            case .mediumRight:
                return CGPoint.init(x: 1, y: 0.5)
            }
        }
    }
}
