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

struct SPPermissionDraw { private init(){} }

extension SPPermissionDraw {
    
    public class IconPack : NSObject {

        private struct Cache {
            static let gradient: CGGradient = CGGradient(colorsSpace: nil, colors: [UIColor.red.cgColor, UIColor.red.cgColor] as CFArray, locations: [0, 1])!
        }

        @objc dynamic public class var gradient: CGGradient { return Cache.gradient }

        @objc dynamic public class func drawFavorite(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {

            let context = UIGraphicsGetCurrentContext()!
            
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 100, height: 100), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 100, y: resizedFrame.height / 100)
            
            let bezier2Path = UIBezierPath()
            bezier2Path.move(to: CGPoint(x: 49.5, y: 8.22))
            bezier2Path.addLine(to: CGPoint(x: 39.17, y: 40.29))
            bezier2Path.addLine(to: CGPoint(x: 36.66, y: 40.32))
            bezier2Path.addLine(to: CGPoint(x: 6.89, y: 40.68))
            bezier2Path.addLine(to: CGPoint(x: 32.78, y: 60.88))
            bezier2Path.addLine(to: CGPoint(x: 32.04, y: 63.39))
            bezier2Path.addLine(to: CGPoint(x: 23.17, y: 93.18))
            bezier2Path.addLine(to: CGPoint(x: 49.5, y: 73.61))
            bezier2Path.addLine(to: CGPoint(x: 51.55, y: 75.13))
            bezier2Path.addLine(to: CGPoint(x: 75.83, y: 93.19))
            bezier2Path.addLine(to: CGPoint(x: 66.22, y: 60.89))
            bezier2Path.addLine(to: CGPoint(x: 68.23, y: 59.32))
            bezier2Path.addLine(to: CGPoint(x: 92.11, y: 40.68))
            bezier2Path.addLine(to: CGPoint(x: 59.83, y: 40.29))
            bezier2Path.addLine(to: CGPoint(x: 49.5, y: 8.22))
            bezier2Path.close()
            bezier2Path.move(to: CGPoint(x: 52.21, y: 5.04))
            bezier2Path.addLine(to: CGPoint(x: 62.38, y: 36.61))
            bezier2Path.addLine(to: CGPoint(x: 94.17, y: 37))
            bezier2Path.addCurve(to: CGPoint(x: 95.84, y: 42.39), controlPoint1: CGPoint(x: 96.9, y: 37.03), controlPoint2: CGPoint(x: 98.04, y: 40.68))
            bezier2Path.addLine(to: CGPoint(x: 70.34, y: 62.29))
            bezier2Path.addLine(to: CGPoint(x: 79.81, y: 94.1))
            bezier2Path.addCurve(to: CGPoint(x: 75.43, y: 97.43), controlPoint1: CGPoint(x: 80.63, y: 96.84), controlPoint2: CGPoint(x: 77.67, y: 99.09))
            bezier2Path.addLine(to: CGPoint(x: 49.5, y: 78.16))
            bezier2Path.addLine(to: CGPoint(x: 23.57, y: 97.43))
            bezier2Path.addCurve(to: CGPoint(x: 19.19, y: 94.1), controlPoint1: CGPoint(x: 21.34, y: 99.09), controlPoint2: CGPoint(x: 18.37, y: 96.83))
            bezier2Path.addLine(to: CGPoint(x: 28.66, y: 62.29))
            bezier2Path.addLine(to: CGPoint(x: 3.16, y: 42.39))
            bezier2Path.addCurve(to: CGPoint(x: 4.83, y: 36.99), controlPoint1: CGPoint(x: 0.96, y: 40.68), controlPoint2: CGPoint(x: 2.1, y: 37.03))
            bezier2Path.addLine(to: CGPoint(x: 36.62, y: 36.61))
            bezier2Path.addLine(to: CGPoint(x: 46.79, y: 5.04))
            bezier2Path.addCurve(to: CGPoint(x: 52.21, y: 5.04), controlPoint1: CGPoint(x: 47.67, y: 2.32), controlPoint2: CGPoint(x: 51.33, y: 2.32))
            bezier2Path.close()
            color.setFill()
            bezier2Path.fill()
            
            context.restoreGState()
        }
        
        @objc dynamic public class func drawFavoriteFill(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
            
            let context = UIGraphicsGetCurrentContext()!

            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 100, height: 100), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 100, y: resizedFrame.height / 100)
   
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 51.78, y: 4.92))
            bezierPath.addLine(to: CGPoint(x: 61.96, y: 36.5))
            bezierPath.addLine(to: CGPoint(x: 93.75, y: 36.88))
            bezierPath.addCurve(to: CGPoint(x: 95.42, y: 42.28), controlPoint1: CGPoint(x: 96.48, y: 36.92), controlPoint2: CGPoint(x: 97.61, y: 40.57))
            bezierPath.addLine(to: CGPoint(x: 69.92, y: 62.17))
            bezierPath.addLine(to: CGPoint(x: 79.39, y: 93.98))
            bezierPath.addCurve(to: CGPoint(x: 75.01, y: 97.32), controlPoint1: CGPoint(x: 80.2, y: 96.72), controlPoint2: CGPoint(x: 77.24, y: 98.98))
            bezierPath.addLine(to: CGPoint(x: 49.08, y: 78.04))
            bezierPath.addLine(to: CGPoint(x: 23.14, y: 97.32))
            bezierPath.addCurve(to: CGPoint(x: 18.76, y: 93.98), controlPoint1: CGPoint(x: 20.91, y: 98.97), controlPoint2: CGPoint(x: 17.95, y: 96.71))
            bezierPath.addLine(to: CGPoint(x: 28.24, y: 62.17))
            bezierPath.addLine(to: CGPoint(x: 2.73, y: 42.27))
            bezierPath.addCurve(to: CGPoint(x: 4.41, y: 36.88), controlPoint1: CGPoint(x: 0.54, y: 40.57), controlPoint2: CGPoint(x: 1.67, y: 36.91))
            bezierPath.addLine(to: CGPoint(x: 36.19, y: 36.49))
            bezierPath.addLine(to: CGPoint(x: 46.37, y: 4.92))
            bezierPath.addCurve(to: CGPoint(x: 51.78, y: 4.92), controlPoint1: CGPoint(x: 47.24, y: 2.2), controlPoint2: CGPoint(x: 50.91, y: 2.2))
            bezierPath.close()
            color.setFill()
            bezierPath.fill()
            
            context.restoreGState()
        }
        
        @objc dynamic public class func drawShare(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)) {
            
            let context = UIGraphicsGetCurrentContext()!

            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 100, height: 100), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 100, y: resizedFrame.height / 100)
            
            let clip2Path = UIBezierPath()
            clip2Path.move(to: CGPoint(x: 38.59, y: 33.54))
            clip2Path.addLine(to: CGPoint(x: 38.59, y: 38.16))
            clip2Path.addLine(to: CGPoint(x: 24.9, y: 38.16))
            clip2Path.addLine(to: CGPoint(x: 24.9, y: 90.08))
            clip2Path.addLine(to: CGPoint(x: 75.1, y: 90.08))
            clip2Path.addLine(to: CGPoint(x: 75.1, y: 38.16))
            clip2Path.addLine(to: CGPoint(x: 61.41, y: 38.16))
            clip2Path.addLine(to: CGPoint(x: 61.41, y: 33.54))
            clip2Path.addLine(to: CGPoint(x: 80, y: 33.54))
            clip2Path.addLine(to: CGPoint(x: 80, y: 95))
            clip2Path.addLine(to: CGPoint(x: 20, y: 95))
            clip2Path.addLine(to: CGPoint(x: 20, y: 33.54))
            clip2Path.addLine(to: CGPoint(x: 38.59, y: 33.54))
            clip2Path.close()
            clip2Path.move(to: CGPoint(x: 52.27, y: 61.81))
            clip2Path.addLine(to: CGPoint(x: 47.73, y: 61.81))
            clip2Path.addLine(to: CGPoint(x: 47.73, y: 14.88))
            clip2Path.addLine(to: CGPoint(x: 40.08, y: 22.75))
            clip2Path.addLine(to: CGPoint(x: 37.14, y: 19.73))
            clip2Path.addLine(to: CGPoint(x: 50, y: 6.5))
            clip2Path.addLine(to: CGPoint(x: 62.86, y: 19.73))
            clip2Path.addLine(to: CGPoint(x: 59.92, y: 22.75))
            clip2Path.addLine(to: CGPoint(x: 52.27, y: 14.88))
            clip2Path.addLine(to: CGPoint(x: 52.27, y: 61.81))
            clip2Path.close()
            color.setFill()
            clip2Path.fill()
            
            context.restoreGState()
        }
        
        @objc dynamic public class func drawClose(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 100, height: 100), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)) {

            let context = UIGraphicsGetCurrentContext()!

            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 100, height: 100), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 100, y: resizedFrame.height / 100)

            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 92.02, y: 22.92))
            bezierPath.addLine(to: CGPoint(x: 64.42, y: 50.52))
            bezierPath.addLine(to: CGPoint(x: 92.02, y: 78.13))
            bezierPath.addCurve(to: CGPoint(x: 92.02, y: 92.99), controlPoint1: CGPoint(x: 96.13, y: 82.23), controlPoint2: CGPoint(x: 96.13, y: 88.89))
            bezierPath.addCurve(to: CGPoint(x: 84.59, y: 96.07), controlPoint1: CGPoint(x: 89.97, y: 95.05), controlPoint2: CGPoint(x: 87.28, y: 96.07))
            bezierPath.addCurve(to: CGPoint(x: 77.16, y: 92.99), controlPoint1: CGPoint(x: 81.9, y: 96.07), controlPoint2: CGPoint(x: 79.22, y: 95.05))
            bezierPath.addLine(to: CGPoint(x: 49.55, y: 65.38))
            bezierPath.addLine(to: CGPoint(x: 21.95, y: 92.99))
            bezierPath.addCurve(to: CGPoint(x: 14.51, y: 96.07), controlPoint1: CGPoint(x: 19.89, y: 95.05), controlPoint2: CGPoint(x: 17.2, y: 96.07))
            bezierPath.addCurve(to: CGPoint(x: 7.08, y: 92.99), controlPoint1: CGPoint(x: 11.82, y: 96.07), controlPoint2: CGPoint(x: 9.13, y: 95.05))
            bezierPath.addCurve(to: CGPoint(x: 7.08, y: 78.13), controlPoint1: CGPoint(x: 2.97, y: 88.89), controlPoint2: CGPoint(x: 2.97, y: 82.23))
            bezierPath.addLine(to: CGPoint(x: 34.69, y: 50.52))
            bezierPath.addLine(to: CGPoint(x: 7.08, y: 22.92))
            bezierPath.addCurve(to: CGPoint(x: 7.08, y: 8.04), controlPoint1: CGPoint(x: 2.97, y: 18.8), controlPoint2: CGPoint(x: 2.97, y: 12.15))
            bezierPath.addCurve(to: CGPoint(x: 21.94, y: 8.04), controlPoint1: CGPoint(x: 11.18, y: 3.94), controlPoint2: CGPoint(x: 17.84, y: 3.94))
            bezierPath.addLine(to: CGPoint(x: 49.55, y: 35.65))
            bezierPath.addLine(to: CGPoint(x: 77.16, y: 8.04))
            bezierPath.addCurve(to: CGPoint(x: 92.02, y: 8.04), controlPoint1: CGPoint(x: 81.26, y: 3.94), controlPoint2: CGPoint(x: 87.92, y: 3.94))
            bezierPath.addCurve(to: CGPoint(x: 92.02, y: 22.92), controlPoint1: CGPoint(x: 96.13, y: 12.15), controlPoint2: CGPoint(x: 96.13, y: 18.8))
            bezierPath.close()
            color.setFill()
            bezierPath.fill()
            
            context.restoreGState()
            
        }
        
        @objc(StyleKitNameResizingBehavior)
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
        
        private override init() {}
    }
}
