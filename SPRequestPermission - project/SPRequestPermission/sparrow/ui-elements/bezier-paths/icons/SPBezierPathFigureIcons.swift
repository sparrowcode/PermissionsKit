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

public extension SPBezierPathFigure {
    
    struct icons {}
}

extension SPBezierPathFigure.icons {

    static func checked(width: CGFloat, color: UIColor = .black) -> UIBezierPath {
        let fillColor = color
        let frame = CGRect(x: 0, y: 0, width: 327, height: 251)
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: frame.minX + 3.75, y: frame.minY + 138.61))
        bezierPath.addCurve(to: CGPoint(x: frame.minX, y: frame.minY + 129.74), controlPoint1: CGPoint(x: frame.minX + 1.23, y: frame.minY + 136.09), controlPoint2: CGPoint(x: frame.minX, y: frame.minY + 132.26))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 3.75, y: frame.minY + 120.95), controlPoint1: CGPoint(x: frame.minX, y: frame.minY + 127.22), controlPoint2: CGPoint(x: frame.minX + 1.23, y: frame.minY + 123.47))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 21.43, y: frame.minY + 103.29))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 39.11, y: frame.minY + 103.29), controlPoint1: CGPoint(x: frame.minX + 26.49, y: frame.minY + 98.24), controlPoint2: CGPoint(x: frame.minX + 34.06, y: frame.minY + 98.24))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 40.36, y: frame.minY + 104.59))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 109.77, y: frame.minY + 178.9))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 118.59, y: frame.minY + 178.9), controlPoint1: CGPoint(x: frame.minX + 112.3, y: frame.minY + 181.43), controlPoint2: CGPoint(x: frame.minX + 116.05, y: frame.minY + 181.43))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 288.91, y: frame.minY + 3.73))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 306.58, y: frame.minY + 3.73), controlPoint1: CGPoint(x: frame.minX + 293.97, y: frame.minY - 1.24), controlPoint2: CGPoint(x: frame.minX + 301.54, y: frame.minY - 1.24))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 324.22, y: frame.minY + 21.39))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 324.22, y: frame.minY + 39.05), controlPoint1: CGPoint(x: frame.minX + 329.26, y: frame.minY + 26.45), controlPoint2: CGPoint(x: frame.minX + 329.26, y: frame.minY + 34.01))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 122.41, y: frame.minY + 248.25))
        bezierPath.addCurve(to: CGPoint(x: 113.53, y: 252), controlPoint1: CGPoint(x: frame.minX + 119.88, y: frame.minY + 250.77), controlPoint2: CGPoint(x: 117.34, y: 252))
        bezierPath.addCurve(to: CGPoint(x: frame.minX + 104.73, y: frame.minY + 248.25), controlPoint1: CGPoint(x: 109.77, y: 252), controlPoint2: CGPoint(x: frame.minX + 107.25, y: frame.minY + 250.77))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 6.28, y: frame.minY + 142.36))
        bezierPath.addLine(to: CGPoint(x: frame.minX + 3.75, y: frame.minY + 138.61))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        fillColor.setFill()
        bezierPath.fill()
        bezierPath.resizeTo(width: width)
        return bezierPath
    }
    
    static func camera(width: CGFloat, color: UIColor = .black) -> UIBezierPath {
        let color = color
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 456.5, y: 80.68))
        bezier3Path.addCurve(to: CGPoint(x: 411.72, y: 62.44), controlPoint1: CGPoint(x: 444.13, y: 68.52), controlPoint2: CGPoint(x: 429.2, y: 62.44))
        bezier3Path.addLine(to: CGPoint(x: 356.3, y: 62.44))
        bezier3Path.addLine(to: CGPoint(x: 343.68, y: 29.36))
        bezier3Path.addCurve(to: CGPoint(x: 326.48, y: 8.78), controlPoint1: CGPoint(x: 340.54, y: 21.41), controlPoint2: CGPoint(x: 334.82, y: 14.56))
        bezier3Path.addCurve(to: CGPoint(x: 300.87, y: 0.15), controlPoint1: CGPoint(x: 318.15, y: 3.04), controlPoint2: CGPoint(x: 309.62, y: 0.15))
        bezier3Path.addLine(to: CGPoint(x: 174.19, y: 0.15))
        bezier3Path.addCurve(to: CGPoint(x: 148.59, y: 8.78), controlPoint1: CGPoint(x: 165.44, y: 0.15), controlPoint2: CGPoint(x: 156.9, y: 3.04))
        bezier3Path.addCurve(to: CGPoint(x: 131.38, y: 29.36), controlPoint1: CGPoint(x: 140.25, y: 14.56), controlPoint2: CGPoint(x: 134.51, y: 21.41))
        bezier3Path.addLine(to: CGPoint(x: 118.76, y: 62.44))
        bezier3Path.addLine(to: CGPoint(x: 63.35, y: 62.44))
        bezier3Path.addCurve(to: CGPoint(x: 18.55, y: 80.68), controlPoint1: CGPoint(x: 45.85, y: 62.44), controlPoint2: CGPoint(x: 30.93, y: 68.52))
        bezier3Path.addCurve(to: CGPoint(x: 0, y: 124.72), controlPoint1: CGPoint(x: 6.18, y: 92.84), controlPoint2: CGPoint(x: 0, y: 107.53))
        bezier3Path.addLine(to: CGPoint(x: 0, y: 342.73))
        bezier3Path.addCurve(to: CGPoint(x: 18.55, y: 386.76), controlPoint1: CGPoint(x: 0, y: 359.91), controlPoint2: CGPoint(x: 6.18, y: 374.6))
        bezier3Path.addCurve(to: CGPoint(x: 63.35, y: 405), controlPoint1: CGPoint(x: 30.93, y: 398.92), controlPoint2: CGPoint(x: 45.85, y: 405))
        bezier3Path.addLine(to: CGPoint(x: 411.72, y: 405))
        bezier3Path.addCurve(to: CGPoint(x: 456.5, y: 386.76), controlPoint1: CGPoint(x: 429.2, y: 405), controlPoint2: CGPoint(x: 444.13, y: 398.92))
        bezier3Path.addCurve(to: CGPoint(x: 475.05, y: 342.73), controlPoint1: CGPoint(x: 468.87, y: 374.6), controlPoint2: CGPoint(x: 475.05, y: 359.91))
        bezier3Path.addLine(to: CGPoint(x: 475.05, y: 124.72))
        bezier3Path.addCurve(to: CGPoint(x: 456.5, y: 80.68), controlPoint1: CGPoint(x: 475.05, y: 107.53), controlPoint2: CGPoint(x: 468.87, y: 92.84))
        bezier3Path.close()
        bezier3Path.move(to: CGPoint(x: 315.84, y: 310.73))
        bezier3Path.addCurve(to: CGPoint(x: 237.52, y: 342.73), controlPoint1: CGPoint(x: 294.16, y: 332.05), controlPoint2: CGPoint(x: 268.04, y: 342.73))
        bezier3Path.addCurve(to: CGPoint(x: 159.21, y: 310.73), controlPoint1: CGPoint(x: 207.01, y: 342.73), controlPoint2: CGPoint(x: 180.91, y: 332.05))
        bezier3Path.addCurve(to: CGPoint(x: 126.68, y: 233.73), controlPoint1: CGPoint(x: 137.52, y: 289.4), controlPoint2: CGPoint(x: 126.68, y: 263.72))
        bezier3Path.addCurve(to: CGPoint(x: 159.21, y: 156.73), controlPoint1: CGPoint(x: 126.68, y: 203.72), controlPoint2: CGPoint(x: 137.53, y: 178.06))
        bezier3Path.addCurve(to: CGPoint(x: 237.52, y: 124.72), controlPoint1: CGPoint(x: 180.91, y: 135.39), controlPoint2: CGPoint(x: 207.01, y: 124.72))
        bezier3Path.addCurve(to: CGPoint(x: 315.84, y: 156.73), controlPoint1: CGPoint(x: 268.04, y: 124.72), controlPoint2: CGPoint(x: 294.14, y: 135.39))
        bezier3Path.addCurve(to: CGPoint(x: 348.37, y: 233.73), controlPoint1: CGPoint(x: 337.53, y: 178.04), controlPoint2: CGPoint(x: 348.37, y: 203.72))
        bezier3Path.addCurve(to: CGPoint(x: 315.84, y: 310.73), controlPoint1: CGPoint(x: 348.37, y: 263.72), controlPoint2: CGPoint(x: 337.53, y: 289.4))
        bezier3Path.close()
        bezier3Path.move(to: CGPoint(x: 237.23, y: 148.5))
        bezier3Path.addCurve(to: CGPoint(x: 175.24, y: 173.84), controlPoint1: CGPoint(x: 213.06, y: 148.5), controlPoint2: CGPoint(x: 192.4, y: 156.95))
        bezier3Path.addCurve(to: CGPoint(x: 149.49, y: 234.87), controlPoint1: CGPoint(x: 158.08, y: 190.73), controlPoint2: CGPoint(x: 149.49, y: 211.07))
        bezier3Path.addCurve(to: CGPoint(x: 175.24, y: 295.87), controlPoint1: CGPoint(x: 149.49, y: 258.64), controlPoint2: CGPoint(x: 158.08, y: 278.98))
        bezier3Path.addCurve(to: CGPoint(x: 237.23, y: 321.21), controlPoint1: CGPoint(x: 192.4, y: 312.76), controlPoint2: CGPoint(x: 213.06, y: 321.21))
        bezier3Path.addCurve(to: CGPoint(x: 299.25, y: 295.87), controlPoint1: CGPoint(x: 261.41, y: 321.21), controlPoint2: CGPoint(x: 282.08, y: 312.76))
        bezier3Path.addCurve(to: CGPoint(x: 325, y: 234.87), controlPoint1: CGPoint(x: 316.42, y: 278.98), controlPoint2: CGPoint(x: 325, y: 258.64))
        bezier3Path.addCurve(to: CGPoint(x: 299.25, y: 173.84), controlPoint1: CGPoint(x: 325, y: 211.07), controlPoint2: CGPoint(x: 316.42, y: 190.73))
        bezier3Path.addCurve(to: CGPoint(x: 237.23, y: 148.5), controlPoint1: CGPoint(x: 282.08, y: 156.95), controlPoint2: CGPoint(x: 261.41, y: 148.5))
        bezier3Path.close()
        color.setFill()
        bezier3Path.fill()
        bezier3Path.resizeTo(width: width)
        return bezier3Path
    }
    
    static func photo_library(width: CGFloat, color: UIColor = .black) -> UIBezierPath {
        let fillColor4 = color
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 42.21))
        bezierPath.addCurve(to: CGPoint(x: 42.18, y: 0), controlPoint1: CGPoint(x: 0, y: 18.9), controlPoint2: CGPoint(x: 18.88, y: 0))
        bezierPath.addLine(to: CGPoint(x: 501.82, y: 0))
        bezierPath.addCurve(to: CGPoint(x: 544, y: 42.21), controlPoint1: CGPoint(x: 525.12, y: 0), controlPoint2: CGPoint(x: 544, y: 18.85))
        bezierPath.addLine(to: CGPoint(x: 544, y: 383.79))
        bezierPath.addCurve(to: CGPoint(x: 501.82, y: 426), controlPoint1: CGPoint(x: 544, y: 407.1), controlPoint2: CGPoint(x: 525.12, y: 426))
        bezierPath.addLine(to: CGPoint(x: 42.18, y: 426))
        bezierPath.addCurve(to: CGPoint(x: 0, y: 383.79), controlPoint1: CGPoint(x: 18.88, y: 426), controlPoint2: CGPoint(x: 0, y: 407.15))
        bezierPath.addLine(to: CGPoint(x: 0, y: 42.21))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 145.03, y: 80.14))
        bezierPath.addCurve(to: CGPoint(x: 92.78, y: 131.87), controlPoint1: CGPoint(x: 116.22, y: 80.14), controlPoint2: CGPoint(x: 92.78, y: 103.33))
        bezierPath.addCurve(to: CGPoint(x: 145.03, y: 183.65), controlPoint1: CGPoint(x: 92.78, y: 160.42), controlPoint2: CGPoint(x: 116.22, y: 183.65))
        bezierPath.addCurve(to: CGPoint(x: 197.24, y: 131.87), controlPoint1: CGPoint(x: 173.84, y: 183.65), controlPoint2: CGPoint(x: 197.24, y: 160.42))
        bezierPath.addCurve(to: CGPoint(x: 145.03, y: 80.14), controlPoint1: CGPoint(x: 197.24, y: 103.33), controlPoint2: CGPoint(x: 173.84, y: 80.14))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 489.01, y: 252.78))
        bezierPath.addCurve(to: CGPoint(x: 488.43, y: 239.62), controlPoint1: CGPoint(x: 492.49, y: 248.97), controlPoint2: CGPoint(x: 492.22, y: 243.11))
        bezierPath.addLine(to: CGPoint(x: 375.85, y: 137.42))
        bezierPath.addCurve(to: CGPoint(x: 369.12, y: 134.97), controlPoint1: CGPoint(x: 374.02, y: 135.74), controlPoint2: CGPoint(x: 371.59, y: 134.93))
        bezierPath.addCurve(to: CGPoint(x: 362.61, y: 138), controlPoint1: CGPoint(x: 366.64, y: 135.05), controlPoint2: CGPoint(x: 364.26, y: 136.15))
        bezierPath.addLine(to: CGPoint(x: 270.73, y: 237.66))
        bezierPath.addLine(to: CGPoint(x: 226.22, y: 193.6))
        bezierPath.addCurve(to: CGPoint(x: 213.4, y: 193.19), controlPoint1: CGPoint(x: 222.73, y: 190.16), controlPoint2: CGPoint(x: 217.11, y: 189.97))
        bezierPath.addLine(to: CGPoint(x: 53.78, y: 332.43))
        bezierPath.addCurve(to: CGPoint(x: 52.96, y: 345.58), controlPoint1: CGPoint(x: 49.89, y: 335.84), controlPoint2: CGPoint(x: 49.52, y: 341.73))
        bezierPath.addCurve(to: CGPoint(x: 60.02, y: 348.72), controlPoint1: CGPoint(x: 54.79, y: 347.67), controlPoint2: CGPoint(x: 57.4, y: 348.72))
        bezierPath.addCurve(to: CGPoint(x: 66.2, y: 346.41), controlPoint1: CGPoint(x: 62.21, y: 348.72), controlPoint2: CGPoint(x: 64.42, y: 347.95))
        bezierPath.addLine(to: CGPoint(x: 219.22, y: 212.94))
        bezierPath.addLine(to: CGPoint(x: 315.85, y: 308.65))
        bezierPath.addCurve(to: CGPoint(x: 329.09, y: 308.65), controlPoint1: CGPoint(x: 319.51, y: 312.27), controlPoint2: CGPoint(x: 325.42, y: 312.27))
        bezierPath.addCurve(to: CGPoint(x: 329.09, y: 295.53), controlPoint1: CGPoint(x: 332.75, y: 305.01), controlPoint2: CGPoint(x: 332.75, y: 299.16))
        bezierPath.addLine(to: CGPoint(x: 284.02, y: 250.83))
        bezierPath.addLine(to: CGPoint(x: 370.12, y: 157.38))
        bezierPath.addLine(to: CGPoint(x: 475.74, y: 253.32))
        bezierPath.addCurve(to: CGPoint(x: 489.01, y: 252.78), controlPoint1: CGPoint(x: 479.58, y: 256.82), controlPoint2: CGPoint(x: 485.49, y: 256.54))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        fillColor4.setFill()
        bezierPath.fill()
        bezierPath.resizeTo(width: width)
        return bezierPath
    }
    
    static func notification(width: CGFloat, color: UIColor = .black) -> UIBezierPath {
        let fillColor = color
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 0, y: 323))
        bezier2Path.addCurve(to: CGPoint(x: 17.19, y: 339.22), controlPoint1: CGPoint(x: 0.02, y: 331.38), controlPoint2: CGPoint(x: 7.07, y: 339.22))
        bezier2Path.addLine(to: CGPoint(x: 306.8, y: 339.22))
        bezier2Path.addCurve(to: CGPoint(x: 320.83, y: 313.71), controlPoint1: CGPoint(x: 320.7, y: 339.22), controlPoint2: CGPoint(x: 328.86, y: 324.42))
        bezier2Path.addLine(to: CGPoint(x: 279.17, y: 258.22))
        bezier2Path.addLine(to: CGPoint(x: 279.17, y: 149.79))
        bezier2Path.addCurve(to: CGPoint(x: 179.17, y: 40.66), controlPoint1: CGPoint(x: 279.17, y: 94.45), controlPoint2: CGPoint(x: 235.67, y: 48.51))
        bezier2Path.addLine(to: CGPoint(x: 179.17, y: 16.17))
        bezier2Path.addCurve(to: CGPoint(x: 162, y: 0), controlPoint1: CGPoint(x: 179.17, y: 7.24), controlPoint2: CGPoint(x: 171.48, y: 0))
        bezier2Path.addCurve(to: CGPoint(x: 144.82, y: 16.17), controlPoint1: CGPoint(x: 152.51, y: 0), controlPoint2: CGPoint(x: 144.82, y: 7.24))
        bezier2Path.addLine(to: CGPoint(x: 144.82, y: 40.66))
        bezier2Path.addCurve(to: CGPoint(x: 44.83, y: 149.79), controlPoint1: CGPoint(x: 88.33, y: 48.51), controlPoint2: CGPoint(x: 44.83, y: 94.45))
        bezier2Path.addLine(to: CGPoint(x: 44.83, y: 258.22))
        bezier2Path.addLine(to: CGPoint(x: 3.17, y: 313.71))
        bezier2Path.addCurve(to: CGPoint(x: 0, y: 322.94), controlPoint1: CGPoint(x: 0.99, y: 316.61), controlPoint2: CGPoint(x: 0.01, y: 319.81))
        bezier2Path.addLine(to: CGPoint(x: 0, y: 323))
        bezier2Path.addLine(to: CGPoint(x: 0, y: 323))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: 197.83, y: 408.27))
        bezier2Path.addCurve(to: CGPoint(x: 161.75, y: 442), controlPoint1: CGPoint(x: 197.83, y: 426.9), controlPoint2: CGPoint(x: 181.68, y: 442))
        bezier2Path.addCurve(to: CGPoint(x: 125.68, y: 408.27), controlPoint1: CGPoint(x: 141.83, y: 442), controlPoint2: CGPoint(x: 125.68, y: 426.9))
        bezier2Path.addCurve(to: CGPoint(x: 161.75, y: 374.54), controlPoint1: CGPoint(x: 125.68, y: 389.64), controlPoint2: CGPoint(x: 141.83, y: 374.54))
        bezier2Path.addCurve(to: CGPoint(x: 197.83, y: 408.27), controlPoint1: CGPoint(x: 181.68, y: 374.54), controlPoint2: CGPoint(x: 197.83, y: 389.64))
        bezier2Path.close()
        fillColor.setFill()
        bezier2Path.fill()
        bezier2Path.resizeTo(width: width)
        return bezier2Path
    }
}
