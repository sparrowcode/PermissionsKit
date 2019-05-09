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

extension SPCodeDraw {
    
    class AudioIconPack : NSObject {
        
        @objc dynamic class func drawPlay(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 200, height: 200), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)) {

            let context = UIGraphicsGetCurrentContext()!
            
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 200, height: 200), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 200, y: resizedFrame.height / 200)
            
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 177.85, y: 86.98))
            bezierPath.addLine(to: CGPoint(x: 54.26, y: 9.11))
            bezierPath.addCurve(to: CGPoint(x: 42.64, y: 7.3), controlPoint1: CGPoint(x: 50.61, y: 6.94), controlPoint2: CGPoint(x: 46.07, y: 7.3))
            bezierPath.addCurve(to: CGPoint(x: 29, y: 20.56), controlPoint1: CGPoint(x: 28.94, y: 7.3), controlPoint2: CGPoint(x: 29, y: 17.88))
            bezierPath.addLine(to: CGPoint(x: 29, y: 179.72))
            bezierPath.addCurve(to: CGPoint(x: 42.64, y: 192.98), controlPoint1: CGPoint(x: 29, y: 181.98), controlPoint2: CGPoint(x: 28.94, y: 192.98))
            bezierPath.addCurve(to: CGPoint(x: 54.26, y: 191.16), controlPoint1: CGPoint(x: 46.07, y: 192.98), controlPoint2: CGPoint(x: 50.61, y: 193.34))
            bezierPath.addLine(to: CGPoint(x: 177.85, y: 113.3))
            bezierPath.addCurve(to: CGPoint(x: 186.24, y: 100.14), controlPoint1: CGPoint(x: 187.99, y: 107.26), controlPoint2: CGPoint(x: 186.24, y: 100.14))
            bezierPath.addCurve(to: CGPoint(x: 177.85, y: 86.98), controlPoint1: CGPoint(x: 186.24, y: 100.14), controlPoint2: CGPoint(x: 187.99, y: 93.02))
            bezierPath.close()
            bezierPath.usesEvenOddFillRule = true
            fillColor.setFill()
            bezierPath.fill()
            
            context.restoreGState()
        }
        
        @objc dynamic class func drawPause(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 200, height: 200), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)) {

            let context = UIGraphicsGetCurrentContext()!
            
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 200, height: 200), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 200, y: resizedFrame.height / 200)
            
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 70.11, y: 6.86))
            bezierPath.addLine(to: CGPoint(x: 34.32, y: 6.86))
            bezierPath.addCurve(to: CGPoint(x: 20, y: 21.18), controlPoint1: CGPoint(x: 26.41, y: 6.86), controlPoint2: CGPoint(x: 20, y: 13.27))
            bezierPath.addLine(to: CGPoint(x: 20, y: 178.68))
            bezierPath.addCurve(to: CGPoint(x: 34.32, y: 193), controlPoint1: CGPoint(x: 20, y: 186.59), controlPoint2: CGPoint(x: 26.41, y: 193))
            bezierPath.addLine(to: CGPoint(x: 70.11, y: 193))
            bezierPath.addCurve(to: CGPoint(x: 84.43, y: 178.68), controlPoint1: CGPoint(x: 78.02, y: 193), controlPoint2: CGPoint(x: 84.43, y: 186.59))
            bezierPath.addLine(to: CGPoint(x: 84.43, y: 21.18))
            bezierPath.addCurve(to: CGPoint(x: 70.11, y: 6.86), controlPoint1: CGPoint(x: 84.43, y: 13.27), controlPoint2: CGPoint(x: 78.02, y: 6.86))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 163.19, y: 6.86))
            bezierPath.addLine(to: CGPoint(x: 127.39, y: 6.86))
            bezierPath.addCurve(to: CGPoint(x: 113.07, y: 21.18), controlPoint1: CGPoint(x: 119.48, y: 6.86), controlPoint2: CGPoint(x: 113.07, y: 13.27))
            bezierPath.addLine(to: CGPoint(x: 113.07, y: 178.68))
            bezierPath.addCurve(to: CGPoint(x: 127.39, y: 193), controlPoint1: CGPoint(x: 113.07, y: 186.59), controlPoint2: CGPoint(x: 119.48, y: 193))
            bezierPath.addLine(to: CGPoint(x: 163.19, y: 193))
            bezierPath.addCurve(to: CGPoint(x: 177.5, y: 178.68), controlPoint1: CGPoint(x: 171.09, y: 193), controlPoint2: CGPoint(x: 177.5, y: 186.59))
            bezierPath.addLine(to: CGPoint(x: 177.5, y: 21.18))
            bezierPath.addCurve(to: CGPoint(x: 163.19, y: 6.86), controlPoint1: CGPoint(x: 177.5, y: 13.27), controlPoint2: CGPoint(x: 171.09, y: 6.86))
            bezierPath.close()
            bezierPath.usesEvenOddFillRule = true
            fillColor.setFill()
            bezierPath.fill()
            
            context.restoreGState()
        }
        
        @objc dynamic class func drawStop(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 200, height: 200), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)) {
            
            let context = UIGraphicsGetCurrentContext()!
            
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 200, height: 200), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 200, y: resizedFrame.height / 200)
            
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 177.82, y: 7.86))
            bezierPath.addLine(to: CGPoint(x: 20.32, y: 7.86))
            bezierPath.addCurve(to: CGPoint(x: 6, y: 22.18), controlPoint1: CGPoint(x: 12.41, y: 7.86), controlPoint2: CGPoint(x: 6, y: 14.27))
            bezierPath.addLine(to: CGPoint(x: 6, y: 179.68))
            bezierPath.addCurve(to: CGPoint(x: 20.32, y: 194), controlPoint1: CGPoint(x: 6, y: 187.59), controlPoint2: CGPoint(x: 12.41, y: 194))
            bezierPath.addLine(to: CGPoint(x: 177.82, y: 194))
            bezierPath.addCurve(to: CGPoint(x: 192.15, y: 179.68), controlPoint1: CGPoint(x: 185.73, y: 194), controlPoint2: CGPoint(x: 192.15, y: 187.59))
            bezierPath.addLine(to: CGPoint(x: 192.15, y: 22.18))
            bezierPath.addCurve(to: CGPoint(x: 177.82, y: 7.86), controlPoint1: CGPoint(x: 192.15, y: 14.27), controlPoint2: CGPoint(x: 185.73, y: 7.86))
            bezierPath.close()
            bezierPath.usesEvenOddFillRule = true
            fillColor.setFill()
            bezierPath.fill()
            
            context.restoreGState()
        }

        @objc(StyleKitNameResizingBehavior)
        enum ResizingBehavior: Int {
            case aspectFit /// The content is proportionally resized to fit into the target rectangle.
            case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
            case stretch /// The content is stretched to match the entire target rectangle.
            case center /// The content is centered in the target rectangle, but it is NOT resized.
            
            func apply(rect: CGRect, target: CGRect) -> CGRect {
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
        
        private override init() {}
    }
}
