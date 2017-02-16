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

extension SPBezierPathFigure {
    
    struct logos {
        
        static func logoTwitter() -> UIBezierPath {
            
            let bezierPath = UIBezierPath.init()
            
            bezierPath.move(to: CGPoint.init(x: 22.05, y: 56.63))
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 34.23, y: 54.93),
                controlPoint1: CGPoint.init(x: 26.32, y: 56.63),
                controlPoint2: CGPoint.init(x: 30.38, y: 56.06)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 44.42, y: 50.27),
                controlPoint1: CGPoint.init(x: 38.08, y: 53.8),
                controlPoint2: CGPoint.init(x: 41.48, y: 52.25)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 52.37, y: 43.37),
                controlPoint1: CGPoint.init(x: 47.36, y: 48.29),
                controlPoint2: CGPoint.init(x: 50.01, y: 45.99)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 58.2, y: 34.89),
                controlPoint1: CGPoint.init(x: 54.74, y: 40.75),
                controlPoint2: CGPoint.init(x: 56.68, y: 37.92)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 61.69, y: 25.53),
                controlPoint1: CGPoint.init(x: 59.72, y: 31.86),
                controlPoint2: CGPoint.init(x: 60.89, y: 28.74)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 62.9, y: 15.97),
                controlPoint1: CGPoint.init(x: 62.5, y: 22.32),
                controlPoint2: CGPoint.init(x: 62.9, y: 19.14)
            )
            
            bezierPath.addLine(to: CGPoint.init(x: 62.9, y: 14.11))
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 70.03, y: 6.68),
                controlPoint1: CGPoint.init(x: 65.7, y: 12.07),
                controlPoint2: CGPoint.init(x: 68.07, y: 9.6)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 61.78, y: 8.95),
                controlPoint1: CGPoint.init(x: 67.37, y: 7.86),
                controlPoint2: CGPoint.init(x: 64.62, y: 8.61)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 68.08, y: 1.05),
                controlPoint1: CGPoint.init(x: 64.87, y: 7.12),
                controlPoint2: CGPoint.init(x: 66.97, y: 4.49)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 59.02, y: 4.51),
                controlPoint1: CGPoint.init(x: 65.17, y: 2.72),
                controlPoint2: CGPoint.init(x: 62.15, y: 3.88)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 48.49, y: 0),
                controlPoint1: CGPoint.init(x: 56.07, y: 1.5),
                controlPoint2: CGPoint.init(x: 52.56, y: 0)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 38.34, y: 4.17),
                controlPoint1: CGPoint.init(x: 44.51, y: 0),
                controlPoint2: CGPoint.init(x: 41.13, y: 1.39)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 34.14, y: 14.28),
                controlPoint1: CGPoint.init(x: 35.54, y: 6.95),
                controlPoint2: CGPoint.init(x: 34.14, y: 10.32)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 34.45, y: 17.57),
                controlPoint1: CGPoint.init(x: 34.14, y: 15.56),
                controlPoint2: CGPoint.init(x: 34.25, y: 16.66)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 17.92, y: 13.26),
                controlPoint1: CGPoint.init(x: 28.54, y: 17.25),
                controlPoint2: CGPoint.init(x: 23.04, y: 15.81)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 4.87, y: 2.92),
                controlPoint1: CGPoint.init(x: 12.81, y: 10.7),
                controlPoint2: CGPoint.init(x: 8.46, y: 7.26)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 2.93, y: 9.83),
                controlPoint1: CGPoint.init(x: 3.58, y: 5.15),
                controlPoint2: CGPoint.init(x: 2.93, y: 7.46)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 4.65, y: 16.6),
                controlPoint1: CGPoint.init(x: 2.93, y: 12.25),
                controlPoint2: CGPoint.init(x: 3.5, y: 14.51)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 9.34, y: 21.7),
                controlPoint1: CGPoint.init(x: 5.8, y: 18.69),
                controlPoint2: CGPoint.init(x: 7.36, y: 20.39)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 2.86, y: 19.9),
                controlPoint1: CGPoint.init(x: 7.04, y: 21.61),
                controlPoint2: CGPoint.init(x: 4.88, y: 21.01)
            )
            
            bezierPath.addLine(to: CGPoint.init(x: 2.86, y: 20.07))
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 6.13, y: 29.2),
                controlPoint1: CGPoint.init(x: 2.86, y: 23.53),
                controlPoint2: CGPoint.init(x: 3.95, y: 26.57)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 14.35, y: 34.11),
                controlPoint1: CGPoint.init(x: 8.31, y: 31.82),
                controlPoint2: CGPoint.init(x: 11.05, y: 33.46)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 10.56, y: 34.59),
                controlPoint1: CGPoint.init(x: 13.12, y: 34.43),
                controlPoint2: CGPoint.init(x: 11.86, y: 34.59)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 7.87, y: 34.35),
                controlPoint1: CGPoint.init(x: 9.59, y: 34.59),
                controlPoint2: CGPoint.init(x: 8.69, y: 34.51)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 12.93, y: 41.44),
                controlPoint1: CGPoint.init(x: 8.78, y: 37.22),
                controlPoint2: CGPoint.init(x: 10.47, y: 39.58)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 21.26, y: 44.29),
                controlPoint1: CGPoint.init(x: 15.4, y: 43.29),
                controlPoint2: CGPoint.init(x: 18.17, y: 44.24)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 3.41, y: 51.03),
                controlPoint1: CGPoint.init(x: 15.58, y: 48.78),
                controlPoint2: CGPoint.init(x: 9.63, y: 51.03)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 0, y: 50.8),
                controlPoint1: CGPoint.init(x: 2.23, y: 51.03),
                controlPoint2: CGPoint.init(x: 1.09, y: 50.95)
            )
            
            bezierPath.addCurve(
                to: CGPoint.init(x: 22.05, y: 56.63),
                controlPoint1: CGPoint.init(x: 6.11, y: 54.68),
                controlPoint2: CGPoint.init(x: 13.46, y: 56.63)
            )
            
            bezierPath.addLine(to: CGPoint.init(x: 22.05, y: 56.63))
            bezierPath.close()
            
            return bezierPath
        }
    }
}
