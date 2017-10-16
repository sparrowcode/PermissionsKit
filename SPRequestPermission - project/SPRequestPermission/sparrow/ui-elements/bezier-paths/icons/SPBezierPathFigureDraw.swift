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

public class SPBezierPathFigureDraw : NSObject {

    //// Drawing Methods

    @objc public dynamic class func drawFillChecked(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 26, height: 26), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 26, height: 26), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 26, y: resizedFrame.height / 26)
        
        
        //// Color Declarations
        let fillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 12.89, y: 1))
        bezierPath.addCurve(to: CGPoint(x: 1, y: 13.09), controlPoint1: CGPoint(x: 6.33, y: 1), controlPoint2: CGPoint(x: 1, y: 6.43))
        bezierPath.addCurve(to: CGPoint(x: 12.89, y: 25.19), controlPoint1: CGPoint(x: 1, y: 19.76), controlPoint2: CGPoint(x: 6.33, y: 25.19))
        bezierPath.addCurve(to: CGPoint(x: 24.77, y: 13.09), controlPoint1: CGPoint(x: 19.44, y: 25.19), controlPoint2: CGPoint(x: 24.77, y: 19.76))
        bezierPath.addCurve(to: CGPoint(x: 12.89, y: 1), controlPoint1: CGPoint(x: 24.77, y: 6.43), controlPoint2: CGPoint(x: 19.44, y: 1))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 18.55, y: 9.98))
        bezierPath.addLine(to: CGPoint(x: 12.3, y: 17.14))
        bezierPath.addCurve(to: CGPoint(x: 11.71, y: 17.4), controlPoint1: CGPoint(x: 12.14, y: 17.31), controlPoint2: CGPoint(x: 11.93, y: 17.4))
        bezierPath.addCurve(to: CGPoint(x: 11.22, y: 17.23), controlPoint1: CGPoint(x: 11.54, y: 17.4), controlPoint2: CGPoint(x: 11.37, y: 17.35))
        bezierPath.addLine(to: CGPoint(x: 7.32, y: 14.05))
        bezierPath.addCurve(to: CGPoint(x: 7.2, y: 12.93), controlPoint1: CGPoint(x: 6.98, y: 13.78), controlPoint2: CGPoint(x: 6.93, y: 13.28))
        bezierPath.addCurve(to: CGPoint(x: 8.3, y: 12.81), controlPoint1: CGPoint(x: 7.47, y: 12.59), controlPoint2: CGPoint(x: 7.96, y: 12.54))
        bezierPath.addLine(to: CGPoint(x: 11.62, y: 15.52))
        bezierPath.addLine(to: CGPoint(x: 17.38, y: 8.93))
        bezierPath.addCurve(to: CGPoint(x: 18.48, y: 8.86), controlPoint1: CGPoint(x: 17.67, y: 8.6), controlPoint2: CGPoint(x: 18.16, y: 8.57))
        bezierPath.addCurve(to: CGPoint(x: 18.55, y: 9.98), controlPoint1: CGPoint(x: 18.8, y: 9.15), controlPoint2: CGPoint(x: 18.83, y: 9.66))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath.fill()
        
        context.restoreGState()
    }

    @objc(SPBezierPathIconsDrawResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
