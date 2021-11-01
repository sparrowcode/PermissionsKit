// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
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

#if os(iOS)

enum DrawService {
    
    public static func drawClose(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 28, height: 28), resizing: ResizingBehavior = .aspectFit, background: UIColor = UIColor(red: 0.937, green: 0.937, blue: 0.941, alpha: 1.000), element: UIColor = UIColor(red: 0.518, green: 0.518, blue: 0.533, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 28, height: 28), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 28, y: resizedFrame.height / 28)
        
        
        //// Rect Drawing
        let rectPath = UIBezierPath()
        rectPath.move(to: CGPoint(x: 14, y: 28))
        rectPath.addCurve(to: CGPoint(x: 0, y: 14), controlPoint1: CGPoint(x: 6.32, y: 28), controlPoint2: CGPoint(x: 0, y: 21.66))
        rectPath.addCurve(to: CGPoint(x: 13.99, y: 0), controlPoint1: CGPoint(x: 0, y: 6.34), controlPoint2: CGPoint(x: 6.32, y: 0))
        rectPath.addCurve(to: CGPoint(x: 28, y: 14), controlPoint1: CGPoint(x: 21.65, y: 0), controlPoint2: CGPoint(x: 28, y: 6.34))
        rectPath.addCurve(to: CGPoint(x: 14, y: 28), controlPoint1: CGPoint(x: 28, y: 21.66), controlPoint2: CGPoint(x: 21.66, y: 28))
        rectPath.close()
        background.setFill()
        rectPath.fill()
        
        
        //// Icon Drawing
        let iconPath = UIBezierPath()
        iconPath.move(to: CGPoint(x: 8.88, y: 20.03))
        iconPath.addCurve(to: CGPoint(x: 9.55, y: 19.75), controlPoint1: CGPoint(x: 9.14, y: 20.03), controlPoint2: CGPoint(x: 9.37, y: 19.93))
        iconPath.addLine(to: CGPoint(x: 13.99, y: 15.3))
        iconPath.addLine(to: CGPoint(x: 18.44, y: 19.75))
        iconPath.addCurve(to: CGPoint(x: 19.11, y: 20.03), controlPoint1: CGPoint(x: 18.61, y: 19.92), controlPoint2: CGPoint(x: 18.84, y: 20.03))
        iconPath.addCurve(to: CGPoint(x: 20.03, y: 19.12), controlPoint1: CGPoint(x: 19.63, y: 20.03), controlPoint2: CGPoint(x: 20.03, y: 19.63))
        iconPath.addCurve(to: CGPoint(x: 19.75, y: 18.45), controlPoint1: CGPoint(x: 20.03, y: 18.86), controlPoint2: CGPoint(x: 19.93, y: 18.63))
        iconPath.addLine(to: CGPoint(x: 15.3, y: 14))
        iconPath.addLine(to: CGPoint(x: 19.75, y: 9.53))
        iconPath.addCurve(to: CGPoint(x: 20.04, y: 8.88), controlPoint1: CGPoint(x: 19.96, y: 9.34), controlPoint2: CGPoint(x: 20.04, y: 9.13))
        iconPath.addCurve(to: CGPoint(x: 19.11, y: 7.97), controlPoint1: CGPoint(x: 20.04, y: 8.37), controlPoint2: CGPoint(x: 19.63, y: 7.97))
        iconPath.addCurve(to: CGPoint(x: 18.47, y: 8.26), controlPoint1: CGPoint(x: 18.87, y: 7.97), controlPoint2: CGPoint(x: 18.66, y: 8.05))
        iconPath.addLine(to: CGPoint(x: 13.99, y: 12.72))
        iconPath.addLine(to: CGPoint(x: 9.53, y: 8.26))
        iconPath.addCurve(to: CGPoint(x: 8.88, y: 7.98), controlPoint1: CGPoint(x: 9.35, y: 8.08), controlPoint2: CGPoint(x: 9.14, y: 7.98))
        iconPath.addCurve(to: CGPoint(x: 7.96, y: 8.89), controlPoint1: CGPoint(x: 8.36, y: 7.98), controlPoint2: CGPoint(x: 7.96, y: 8.37))
        iconPath.addCurve(to: CGPoint(x: 8.24, y: 9.53), controlPoint1: CGPoint(x: 7.96, y: 9.14), controlPoint2: CGPoint(x: 8.05, y: 9.37))
        iconPath.addLine(to: CGPoint(x: 12.69, y: 14))
        iconPath.addLine(to: CGPoint(x: 8.24, y: 18.47))
        iconPath.addCurve(to: CGPoint(x: 7.96, y: 19.12), controlPoint1: CGPoint(x: 8.05, y: 18.65), controlPoint2: CGPoint(x: 7.96, y: 18.86))
        iconPath.addCurve(to: CGPoint(x: 8.88, y: 20.03), controlPoint1: CGPoint(x: 7.96, y: 19.63), controlPoint2: CGPoint(x: 8.36, y: 20.03))
        iconPath.close()
        element.setFill()
        iconPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawCalendar(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 41.33, y: 120.89))
        bezierPath.addLine(to: CGPoint(x: 108.03, y: 120.89))
        bezierPath.addCurve(to: CGPoint(x: 123.31, y: 105.76), controlPoint1: CGPoint(x: 118.24, y: 120.89), controlPoint2: CGPoint(x: 123.31, y: 115.81))
        bezierPath.addLine(to: CGPoint(x: 123.31, y: 46.14))
        bezierPath.addCurve(to: CGPoint(x: 108.03, y: 31), controlPoint1: CGPoint(x: 123.31, y: 36.08), controlPoint2: CGPoint(x: 118.24, y: 31))
        bezierPath.addLine(to: CGPoint(x: 41.33, y: 31))
        bezierPath.addCurve(to: CGPoint(x: 26, y: 46.14), controlPoint1: CGPoint(x: 31.13, y: 31), controlPoint2: CGPoint(x: 26, y: 36.03))
        bezierPath.addLine(to: CGPoint(x: 26, y: 105.76))
        bezierPath.addCurve(to: CGPoint(x: 41.33, y: 120.89), controlPoint1: CGPoint(x: 26, y: 115.86), controlPoint2: CGPoint(x: 31.13, y: 120.89))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 40.6, y: 113.03))
        bezierPath.addCurve(to: CGPoint(x: 33.86, y: 106.2), controlPoint1: CGPoint(x: 36.25, y: 113.03), controlPoint2: CGPoint(x: 33.86, y: 110.74))
        bezierPath.addLine(to: CGPoint(x: 33.86, y: 60.15))
        bezierPath.addCurve(to: CGPoint(x: 40.6, y: 53.31), controlPoint1: CGPoint(x: 33.86, y: 55.66), controlPoint2: CGPoint(x: 36.25, y: 53.31))
        bezierPath.addLine(to: CGPoint(x: 108.67, y: 53.31))
        bezierPath.addCurve(to: CGPoint(x: 115.45, y: 60.15), controlPoint1: CGPoint(x: 113.01, y: 53.31), controlPoint2: CGPoint(x: 115.45, y: 55.66))
        bezierPath.addLine(to: CGPoint(x: 115.45, y: 106.2))
        bezierPath.addCurve(to: CGPoint(x: 108.67, y: 113.03), controlPoint1: CGPoint(x: 115.45, y: 110.74), controlPoint2: CGPoint(x: 113.01, y: 113.03))
        bezierPath.addLine(to: CGPoint(x: 40.6, y: 113.03))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 65.11, y: 70.84))
        bezierPath.addLine(to: CGPoint(x: 67.99, y: 70.84))
        bezierPath.addCurve(to: CGPoint(x: 70.29, y: 68.65), controlPoint1: CGPoint(x: 69.7, y: 70.84), controlPoint2: CGPoint(x: 70.29, y: 70.36))
        bezierPath.addLine(to: CGPoint(x: 70.29, y: 65.77))
        bezierPath.addCurve(to: CGPoint(x: 67.99, y: 63.52), controlPoint1: CGPoint(x: 70.29, y: 64.06), controlPoint2: CGPoint(x: 69.7, y: 63.52))
        bezierPath.addLine(to: CGPoint(x: 65.11, y: 63.52))
        bezierPath.addCurve(to: CGPoint(x: 62.82, y: 65.77), controlPoint1: CGPoint(x: 63.4, y: 63.52), controlPoint2: CGPoint(x: 62.82, y: 64.06))
        bezierPath.addLine(to: CGPoint(x: 62.82, y: 68.65))
        bezierPath.addCurve(to: CGPoint(x: 65.11, y: 70.84), controlPoint1: CGPoint(x: 62.82, y: 70.36), controlPoint2: CGPoint(x: 63.4, y: 70.84))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 81.37, y: 70.84))
        bezierPath.addLine(to: CGPoint(x: 84.2, y: 70.84))
        bezierPath.addCurve(to: CGPoint(x: 86.5, y: 68.65), controlPoint1: CGPoint(x: 85.91, y: 70.84), controlPoint2: CGPoint(x: 86.5, y: 70.36))
        bezierPath.addLine(to: CGPoint(x: 86.5, y: 65.77))
        bezierPath.addCurve(to: CGPoint(x: 84.2, y: 63.52), controlPoint1: CGPoint(x: 86.5, y: 64.06), controlPoint2: CGPoint(x: 85.91, y: 63.52))
        bezierPath.addLine(to: CGPoint(x: 81.37, y: 63.52))
        bezierPath.addCurve(to: CGPoint(x: 79.08, y: 65.77), controlPoint1: CGPoint(x: 79.61, y: 63.52), controlPoint2: CGPoint(x: 79.08, y: 64.06))
        bezierPath.addLine(to: CGPoint(x: 79.08, y: 68.65))
        bezierPath.addCurve(to: CGPoint(x: 81.37, y: 70.84), controlPoint1: CGPoint(x: 79.08, y: 70.36), controlPoint2: CGPoint(x: 79.61, y: 70.84))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 97.58, y: 70.84))
        bezierPath.addLine(to: CGPoint(x: 100.46, y: 70.84))
        bezierPath.addCurve(to: CGPoint(x: 102.71, y: 68.65), controlPoint1: CGPoint(x: 102.17, y: 70.84), controlPoint2: CGPoint(x: 102.71, y: 70.36))
        bezierPath.addLine(to: CGPoint(x: 102.71, y: 65.77))
        bezierPath.addCurve(to: CGPoint(x: 100.46, y: 63.52), controlPoint1: CGPoint(x: 102.71, y: 64.06), controlPoint2: CGPoint(x: 102.17, y: 63.52))
        bezierPath.addLine(to: CGPoint(x: 97.58, y: 63.52))
        bezierPath.addCurve(to: CGPoint(x: 95.29, y: 65.77), controlPoint1: CGPoint(x: 95.87, y: 63.52), controlPoint2: CGPoint(x: 95.29, y: 64.06))
        bezierPath.addLine(to: CGPoint(x: 95.29, y: 68.65))
        bezierPath.addCurve(to: CGPoint(x: 97.58, y: 70.84), controlPoint1: CGPoint(x: 95.29, y: 70.36), controlPoint2: CGPoint(x: 95.87, y: 70.84))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 48.9, y: 86.81))
        bezierPath.addLine(to: CGPoint(x: 51.78, y: 86.81))
        bezierPath.addCurve(to: CGPoint(x: 54.03, y: 84.61), controlPoint1: CGPoint(x: 53.49, y: 86.81), controlPoint2: CGPoint(x: 54.03, y: 86.32))
        bezierPath.addLine(to: CGPoint(x: 54.03, y: 81.73))
        bezierPath.addCurve(to: CGPoint(x: 51.78, y: 79.54), controlPoint1: CGPoint(x: 54.03, y: 80.02), controlPoint2: CGPoint(x: 53.49, y: 79.54))
        bezierPath.addLine(to: CGPoint(x: 48.9, y: 79.54))
        bezierPath.addCurve(to: CGPoint(x: 46.61, y: 81.73), controlPoint1: CGPoint(x: 47.19, y: 79.54), controlPoint2: CGPoint(x: 46.61, y: 80.02))
        bezierPath.addLine(to: CGPoint(x: 46.61, y: 84.61))
        bezierPath.addCurve(to: CGPoint(x: 48.9, y: 86.81), controlPoint1: CGPoint(x: 46.61, y: 86.32), controlPoint2: CGPoint(x: 47.19, y: 86.81))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 65.11, y: 86.81))
        bezierPath.addLine(to: CGPoint(x: 67.99, y: 86.81))
        bezierPath.addCurve(to: CGPoint(x: 70.29, y: 84.61), controlPoint1: CGPoint(x: 69.7, y: 86.81), controlPoint2: CGPoint(x: 70.29, y: 86.32))
        bezierPath.addLine(to: CGPoint(x: 70.29, y: 81.73))
        bezierPath.addCurve(to: CGPoint(x: 67.99, y: 79.54), controlPoint1: CGPoint(x: 70.29, y: 80.02), controlPoint2: CGPoint(x: 69.7, y: 79.54))
        bezierPath.addLine(to: CGPoint(x: 65.11, y: 79.54))
        bezierPath.addCurve(to: CGPoint(x: 62.82, y: 81.73), controlPoint1: CGPoint(x: 63.4, y: 79.54), controlPoint2: CGPoint(x: 62.82, y: 80.02))
        bezierPath.addLine(to: CGPoint(x: 62.82, y: 84.61))
        bezierPath.addCurve(to: CGPoint(x: 65.11, y: 86.81), controlPoint1: CGPoint(x: 62.82, y: 86.32), controlPoint2: CGPoint(x: 63.4, y: 86.81))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 81.37, y: 86.81))
        bezierPath.addLine(to: CGPoint(x: 84.2, y: 86.81))
        bezierPath.addCurve(to: CGPoint(x: 86.5, y: 84.61), controlPoint1: CGPoint(x: 85.91, y: 86.81), controlPoint2: CGPoint(x: 86.5, y: 86.32))
        bezierPath.addLine(to: CGPoint(x: 86.5, y: 81.73))
        bezierPath.addCurve(to: CGPoint(x: 84.2, y: 79.54), controlPoint1: CGPoint(x: 86.5, y: 80.02), controlPoint2: CGPoint(x: 85.91, y: 79.54))
        bezierPath.addLine(to: CGPoint(x: 81.37, y: 79.54))
        bezierPath.addCurve(to: CGPoint(x: 79.08, y: 81.73), controlPoint1: CGPoint(x: 79.61, y: 79.54), controlPoint2: CGPoint(x: 79.08, y: 80.02))
        bezierPath.addLine(to: CGPoint(x: 79.08, y: 84.61))
        bezierPath.addCurve(to: CGPoint(x: 81.37, y: 86.81), controlPoint1: CGPoint(x: 79.08, y: 86.32), controlPoint2: CGPoint(x: 79.61, y: 86.81))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 97.58, y: 86.81))
        bezierPath.addLine(to: CGPoint(x: 100.46, y: 86.81))
        bezierPath.addCurve(to: CGPoint(x: 102.71, y: 84.61), controlPoint1: CGPoint(x: 102.17, y: 86.81), controlPoint2: CGPoint(x: 102.71, y: 86.32))
        bezierPath.addLine(to: CGPoint(x: 102.71, y: 81.73))
        bezierPath.addCurve(to: CGPoint(x: 100.46, y: 79.54), controlPoint1: CGPoint(x: 102.71, y: 80.02), controlPoint2: CGPoint(x: 102.17, y: 79.54))
        bezierPath.addLine(to: CGPoint(x: 97.58, y: 79.54))
        bezierPath.addCurve(to: CGPoint(x: 95.29, y: 81.73), controlPoint1: CGPoint(x: 95.87, y: 79.54), controlPoint2: CGPoint(x: 95.29, y: 80.02))
        bezierPath.addLine(to: CGPoint(x: 95.29, y: 84.61))
        bezierPath.addCurve(to: CGPoint(x: 97.58, y: 86.81), controlPoint1: CGPoint(x: 95.29, y: 86.32), controlPoint2: CGPoint(x: 95.87, y: 86.81))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 48.9, y: 102.83))
        bezierPath.addLine(to: CGPoint(x: 51.78, y: 102.83))
        bezierPath.addCurve(to: CGPoint(x: 54.03, y: 100.58), controlPoint1: CGPoint(x: 53.49, y: 102.83), controlPoint2: CGPoint(x: 54.03, y: 102.29))
        bezierPath.addLine(to: CGPoint(x: 54.03, y: 97.7))
        bezierPath.addCurve(to: CGPoint(x: 51.96, y: 95.5), controlPoint1: CGPoint(x: 54.03, y: 96.05), controlPoint2: CGPoint(x: 53.53, y: 95.54))
        bezierPath.addLine(to: CGPoint(x: 48.9, y: 95.5))
        bezierPath.addCurve(to: CGPoint(x: 46.61, y: 97.7), controlPoint1: CGPoint(x: 47.19, y: 95.5), controlPoint2: CGPoint(x: 46.61, y: 95.99))
        bezierPath.addLine(to: CGPoint(x: 46.61, y: 100.58))
        bezierPath.addCurve(to: CGPoint(x: 48.9, y: 102.83), controlPoint1: CGPoint(x: 46.61, y: 102.29), controlPoint2: CGPoint(x: 47.19, y: 102.83))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 65.11, y: 102.83))
        bezierPath.addLine(to: CGPoint(x: 67.99, y: 102.83))
        bezierPath.addCurve(to: CGPoint(x: 70.29, y: 100.58), controlPoint1: CGPoint(x: 69.7, y: 102.83), controlPoint2: CGPoint(x: 70.29, y: 102.29))
        bezierPath.addLine(to: CGPoint(x: 70.29, y: 97.7))
        bezierPath.addCurve(to: CGPoint(x: 68.17, y: 95.5), controlPoint1: CGPoint(x: 70.29, y: 96.05), controlPoint2: CGPoint(x: 69.74, y: 95.54))
        bezierPath.addLine(to: CGPoint(x: 65.11, y: 95.5))
        bezierPath.addCurve(to: CGPoint(x: 62.82, y: 97.7), controlPoint1: CGPoint(x: 63.4, y: 95.5), controlPoint2: CGPoint(x: 62.82, y: 95.99))
        bezierPath.addLine(to: CGPoint(x: 62.82, y: 100.58))
        bezierPath.addCurve(to: CGPoint(x: 65.11, y: 102.83), controlPoint1: CGPoint(x: 62.82, y: 102.29), controlPoint2: CGPoint(x: 63.4, y: 102.83))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 81.37, y: 102.83))
        bezierPath.addCurve(to: CGPoint(x: 79.08, y: 100.58), controlPoint1: CGPoint(x: 79.61, y: 102.83), controlPoint2: CGPoint(x: 79.08, y: 102.29))
        bezierPath.addLine(to: CGPoint(x: 79.08, y: 97.7))
        bezierPath.addCurve(to: CGPoint(x: 81.19, y: 95.5), controlPoint1: CGPoint(x: 79.08, y: 96.05), controlPoint2: CGPoint(x: 79.58, y: 95.54))
        bezierPath.addLine(to: CGPoint(x: 84.2, y: 95.5))
        bezierPath.addCurve(to: CGPoint(x: 86.5, y: 97.7), controlPoint1: CGPoint(x: 85.91, y: 95.5), controlPoint2: CGPoint(x: 86.5, y: 95.99))
        bezierPath.addLine(to: CGPoint(x: 86.5, y: 100.58))
        bezierPath.addCurve(to: CGPoint(x: 84.2, y: 102.83), controlPoint1: CGPoint(x: 86.5, y: 102.29), controlPoint2: CGPoint(x: 85.91, y: 102.83))
        bezierPath.addLine(to: CGPoint(x: 81.37, y: 102.83))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawCamera(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 32.33, y: 122.12))
        bezierPath.addLine(to: CGPoint(x: 116.41, y: 122.12))
        bezierPath.addCurve(to: CGPoint(x: 131.75, y: 106.98), controlPoint1: CGPoint(x: 126.62, y: 122.12), controlPoint2: CGPoint(x: 131.75, y: 117.04))
        bezierPath.addLine(to: CGPoint(x: 131.75, y: 55.86))
        bezierPath.addCurve(to: CGPoint(x: 116.41, y: 40.77), controlPoint1: CGPoint(x: 131.75, y: 45.8), controlPoint2: CGPoint(x: 126.62, y: 40.77))
        bezierPath.addLine(to: CGPoint(x: 105.04, y: 40.77))
        bezierPath.addCurve(to: CGPoint(x: 97.86, y: 37.54), controlPoint1: CGPoint(x: 101.23, y: 40.77), controlPoint2: CGPoint(x: 100.01, y: 39.99))
        bezierPath.addLine(to: CGPoint(x: 93.9, y: 33.15))
        bezierPath.addCurve(to: CGPoint(x: 83.94, y: 29), controlPoint1: CGPoint(x: 91.46, y: 30.46), controlPoint2: CGPoint(x: 88.97, y: 29))
        bezierPath.addLine(to: CGPoint(x: 64.46, y: 29))
        bezierPath.addCurve(to: CGPoint(x: 54.5, y: 33.15), controlPoint1: CGPoint(x: 59.43, y: 29), controlPoint2: CGPoint(x: 56.94, y: 30.46))
        bezierPath.addLine(to: CGPoint(x: 50.59, y: 37.54))
        bezierPath.addCurve(to: CGPoint(x: 43.42, y: 40.77), controlPoint1: CGPoint(x: 48.45, y: 39.94), controlPoint2: CGPoint(x: 47.22, y: 40.77))
        bezierPath.addLine(to: CGPoint(x: 32.33, y: 40.77))
        bezierPath.addCurve(to: CGPoint(x: 17, y: 55.86), controlPoint1: CGPoint(x: 22.13, y: 40.77), controlPoint2: CGPoint(x: 17, y: 45.8))
        bezierPath.addLine(to: CGPoint(x: 17, y: 106.98))
        bezierPath.addCurve(to: CGPoint(x: 32.33, y: 122.12), controlPoint1: CGPoint(x: 17, y: 117.04), controlPoint2: CGPoint(x: 22.13, y: 122.12))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 74.37, y: 106.49))
        bezierPath.addCurve(to: CGPoint(x: 47.76, y: 79.78), controlPoint1: CGPoint(x: 59.63, y: 106.49), controlPoint2: CGPoint(x: 47.76, y: 94.62))
        bezierPath.addCurve(to: CGPoint(x: 74.37, y: 53.07), controlPoint1: CGPoint(x: 47.76, y: 64.94), controlPoint2: CGPoint(x: 59.63, y: 53.07))
        bezierPath.addCurve(to: CGPoint(x: 101.03, y: 79.78), controlPoint1: CGPoint(x: 89.17, y: 53.07), controlPoint2: CGPoint(x: 101.03, y: 64.94))
        bezierPath.addCurve(to: CGPoint(x: 74.37, y: 106.49), controlPoint1: CGPoint(x: 101.03, y: 94.62), controlPoint2: CGPoint(x: 89.17, y: 106.49))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 109.48, y: 67.87))
        bezierPath.addCurve(to: CGPoint(x: 103.43, y: 61.86), controlPoint1: CGPoint(x: 106.16, y: 67.87), controlPoint2: CGPoint(x: 103.43, y: 65.18))
        bezierPath.addCurve(to: CGPoint(x: 109.48, y: 55.81), controlPoint1: CGPoint(x: 103.43, y: 58.49), controlPoint2: CGPoint(x: 106.16, y: 55.81))
        bezierPath.addCurve(to: CGPoint(x: 115.54, y: 61.86), controlPoint1: CGPoint(x: 112.8, y: 55.81), controlPoint2: CGPoint(x: 115.54, y: 58.49))
        bezierPath.addCurve(to: CGPoint(x: 109.48, y: 67.87), controlPoint1: CGPoint(x: 115.54, y: 65.18), controlPoint2: CGPoint(x: 112.8, y: 67.87))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 74.37, y: 99.07))
        bezierPath.addCurve(to: CGPoint(x: 55.13, y: 79.78), controlPoint1: CGPoint(x: 63.78, y: 99.07), controlPoint2: CGPoint(x: 55.13, y: 90.47))
        bezierPath.addCurve(to: CGPoint(x: 74.37, y: 60.49), controlPoint1: CGPoint(x: 55.13, y: 69.09), controlPoint2: CGPoint(x: 63.73, y: 60.49))
        bezierPath.addCurve(to: CGPoint(x: 93.66, y: 79.78), controlPoint1: CGPoint(x: 85.02, y: 60.49), controlPoint2: CGPoint(x: 93.66, y: 69.09))
        bezierPath.addCurve(to: CGPoint(x: 74.37, y: 99.07), controlPoint1: CGPoint(x: 93.66, y: 90.47), controlPoint2: CGPoint(x: 85.02, y: 99.07))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawContacts(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 52.15, y: 110.78))
        bezierPath.addCurve(to: CGPoint(x: 68.12, y: 115.52), controlPoint1: CGPoint(x: 60.3, y: 110.78), controlPoint2: CGPoint(x: 65.72, y: 113.81))
        bezierPath.addLine(to: CGPoint(x: 69.24, y: 116.17))
        bezierPath.addCurve(to: CGPoint(x: 72.02, y: 117.52), controlPoint1: CGPoint(x: 70.31, y: 116.77), controlPoint2: CGPoint(x: 71.65, y: 117.49))
        bezierPath.addLine(to: CGPoint(x: 72.02, y: 43.69))
        bezierPath.addCurve(to: CGPoint(x: 49.8, y: 33), controlPoint1: CGPoint(x: 68.85, y: 37.79), controlPoint2: CGPoint(x: 59.47, y: 33))
        bezierPath.addCurve(to: CGPoint(x: 25, y: 44.77), controlPoint1: CGPoint(x: 37.65, y: 33), controlPoint2: CGPoint(x: 27.29, y: 40.03))
        bezierPath.addLine(to: CGPoint(x: 25, y: 113.71))
        bezierPath.addCurve(to: CGPoint(x: 29.2, y: 118.16), controlPoint1: CGPoint(x: 25, y: 116.94), controlPoint2: CGPoint(x: 26.86, y: 118.16))
        bezierPath.addCurve(to: CGPoint(x: 33.45, y: 116.54), controlPoint1: CGPoint(x: 31.01, y: 118.16), controlPoint2: CGPoint(x: 32.28, y: 117.52))
        bezierPath.addCurve(to: CGPoint(x: 52.15, y: 110.78), controlPoint1: CGPoint(x: 36.33, y: 113.96), controlPoint2: CGPoint(x: 43.12, y: 110.78))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 97.71, y: 110.78))
        bezierPath.addCurve(to: CGPoint(x: 81.79, y: 115.52), controlPoint1: CGPoint(x: 89.6, y: 110.78), controlPoint2: CGPoint(x: 84.18, y: 113.81))
        bezierPath.addLine(to: CGPoint(x: 81.02, y: 115.98))
        bezierPath.addCurve(to: CGPoint(x: 77.88, y: 117.62), controlPoint1: CGPoint(x: 79.92, y: 116.65), controlPoint2: CGPoint(x: 78.3, y: 117.58))
        bezierPath.addLine(to: CGPoint(x: 77.88, y: 43.69))
        bezierPath.addCurve(to: CGPoint(x: 100.05, y: 33), controlPoint1: CGPoint(x: 81.01, y: 37.79), controlPoint2: CGPoint(x: 90.38, y: 33))
        bezierPath.addCurve(to: CGPoint(x: 124.85, y: 44.77), controlPoint1: CGPoint(x: 112.21, y: 33), controlPoint2: CGPoint(x: 122.56, y: 40.03))
        bezierPath.addLine(to: CGPoint(x: 124.85, y: 113.71))
        bezierPath.addCurve(to: CGPoint(x: 120.61, y: 118.16), controlPoint1: CGPoint(x: 124.85, y: 116.94), controlPoint2: CGPoint(x: 122.95, y: 118.16))
        bezierPath.addCurve(to: CGPoint(x: 116.46, y: 116.54), controlPoint1: CGPoint(x: 118.8, y: 118.16), controlPoint2: CGPoint(x: 117.58, y: 117.47))
        bezierPath.addCurve(to: CGPoint(x: 97.71, y: 110.78), controlPoint1: CGPoint(x: 113.48, y: 113.96), controlPoint2: CGPoint(x: 106.79, y: 110.78))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawLocations(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 33.4, y: 78.1))
        bezierPath.addCurve(to: CGPoint(x: 25, y: 72.19), controlPoint1: CGPoint(x: 28.61, y: 78.1), controlPoint2: CGPoint(x: 25, y: 75.95))
        bezierPath.addCurve(to: CGPoint(x: 32.32, y: 64.67), controlPoint1: CGPoint(x: 25, y: 68.43), controlPoint2: CGPoint(x: 28.61, y: 66.38))
        bezierPath.addLine(to: CGPoint(x: 112.89, y: 27.32))
        bezierPath.addCurve(to: CGPoint(x: 117.97, y: 26), controlPoint1: CGPoint(x: 114.79, y: 26.39), controlPoint2: CGPoint(x: 116.5, y: 26))
        bezierPath.addCurve(to: CGPoint(x: 123.63, y: 31.66), controlPoint1: CGPoint(x: 121.24, y: 26), controlPoint2: CGPoint(x: 123.63, y: 28.44))
        bezierPath.addCurve(to: CGPoint(x: 122.27, y: 36.69), controlPoint1: CGPoint(x: 123.63, y: 33.08), controlPoint2: CGPoint(x: 123.19, y: 34.79))
        bezierPath.addLine(to: CGPoint(x: 84.49, y: 118.06))
        bezierPath.addCurve(to: CGPoint(x: 77.39, y: 124.58), controlPoint1: CGPoint(x: 82.82, y: 121.58), controlPoint2: CGPoint(x: 80.84, y: 124.58))
        bezierPath.addCurve(to: CGPoint(x: 71.49, y: 116.41), controlPoint1: CGPoint(x: 73.61, y: 124.58), controlPoint2: CGPoint(x: 71.57, y: 120.93))
        bezierPath.addLine(to: CGPoint(x: 71.39, y: 79.27))
        bezierPath.addCurve(to: CGPoint(x: 70.36, y: 78.25), controlPoint1: CGPoint(x: 71.39, y: 78.54), controlPoint2: CGPoint(x: 71.04, y: 78.25))
        bezierPath.addLine(to: CGPoint(x: 33.4, y: 78.1))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawMedia(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 22.55, y: 107.05))
        bezierPath.addLine(to: CGPoint(x: 126.31, y: 107.05))
        bezierPath.addCurve(to: CGPoint(x: 138.86, y: 94.51), controlPoint1: CGPoint(x: 134.66, y: 107.05), controlPoint2: CGPoint(x: 138.86, y: 103.05))
        bezierPath.addLine(to: CGPoint(x: 138.86, y: 38.55))
        bezierPath.addCurve(to: CGPoint(x: 126.31, y: 26), controlPoint1: CGPoint(x: 138.86, y: 30), controlPoint2: CGPoint(x: 134.66, y: 26))
        bezierPath.addLine(to: CGPoint(x: 22.55, y: 26))
        bezierPath.addCurve(to: CGPoint(x: 10, y: 38.55), controlPoint1: CGPoint(x: 14.2, y: 26), controlPoint2: CGPoint(x: 10, y: 30))
        bezierPath.addLine(to: CGPoint(x: 10, y: 94.51))
        bezierPath.addCurve(to: CGPoint(x: 22.55, y: 107.05), controlPoint1: CGPoint(x: 10, y: 103.05), controlPoint2: CGPoint(x: 14.2, y: 107.05))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 89, y: 55.69))
        bezierPath.addLine(to: CGPoint(x: 76.99, y: 58.57))
        bezierPath.addCurve(to: CGPoint(x: 75.43, y: 61.25), controlPoint1: CGPoint(x: 75.82, y: 58.86), controlPoint2: CGPoint(x: 75.43, y: 59.35))
        bezierPath.addLine(to: CGPoint(x: 75.43, y: 78.78))
        bezierPath.addCurve(to: CGPoint(x: 63.12, y: 91.43), controlPoint1: CGPoint(x: 75.43, y: 86.21), controlPoint2: CGPoint(x: 70.45, y: 91.43))
        bezierPath.addCurve(to: CGPoint(x: 54.68, y: 83.96), controlPoint1: CGPoint(x: 57.95, y: 91.43), controlPoint2: CGPoint(x: 54.68, y: 88.3))
        bezierPath.addCurve(to: CGPoint(x: 63.22, y: 74.93), controlPoint1: CGPoint(x: 54.68, y: 78.93), controlPoint2: CGPoint(x: 58.58, y: 76.15))
        bezierPath.addLine(to: CGPoint(x: 67.96, y: 73.71))
        bezierPath.addLine(to: CGPoint(x: 68.39, y: 73.59))
        bezierPath.addCurve(to: CGPoint(x: 70.74, y: 70.29), controlPoint1: CGPoint(x: 70.57, y: 72.96), controlPoint2: CGPoint(x: 70.74, y: 72.45))
        bezierPath.addLine(to: CGPoint(x: 70.74, y: 47.24))
        bezierPath.addCurve(to: CGPoint(x: 73.61, y: 43.14), controlPoint1: CGPoint(x: 70.74, y: 44.3), controlPoint2: CGPoint(x: 71.25, y: 43.75))
        bezierPath.addLine(to: CGPoint(x: 88.81, y: 39.33))
        bezierPath.addCurve(to: CGPoint(x: 92.22, y: 41.31), controlPoint1: CGPoint(x: 91.46, y: 38.67), controlPoint2: CGPoint(x: 92.19, y: 39.48))
        bezierPath.addLine(to: CGPoint(x: 92.23, y: 51.54))
        bezierPath.addCurve(to: CGPoint(x: 89, y: 55.69), controlPoint1: CGPoint(x: 92.23, y: 54.52), controlPoint2: CGPoint(x: 91.49, y: 55.05))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 109.9, y: 120.63))
        bezierPath.addCurve(to: CGPoint(x: 105.41, y: 125.22), controlPoint1: CGPoint(x: 109.9, y: 123.17), controlPoint2: CGPoint(x: 107.9, y: 125.22))
        bezierPath.addLine(to: CGPoint(x: 43.35, y: 125.22))
        bezierPath.addCurve(to: CGPoint(x: 38.81, y: 120.63), controlPoint1: CGPoint(x: 40.86, y: 125.22), controlPoint2: CGPoint(x: 38.81, y: 123.17))
        bezierPath.addCurve(to: CGPoint(x: 43.35, y: 116.04), controlPoint1: CGPoint(x: 38.81, y: 118.09), controlPoint2: CGPoint(x: 40.86, y: 116.04))
        bezierPath.addLine(to: CGPoint(x: 105.41, y: 116.04))
        bezierPath.addCurve(to: CGPoint(x: 109.9, y: 120.63), controlPoint1: CGPoint(x: 107.9, y: 116.04), controlPoint2: CGPoint(x: 109.9, y: 118.09))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawMicrophone(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 89.37, y: 32.61))
        bezierPath.addLine(to: CGPoint(x: 116.27, y: 59.51))
        bezierPath.addCurve(to: CGPoint(x: 116.96, y: 31.92), controlPoint1: CGPoint(x: 124.87, y: 50.97), controlPoint2: CGPoint(x: 125.21, y: 40.13))
        bezierPath.addCurve(to: CGPoint(x: 89.37, y: 32.61), controlPoint1: CGPoint(x: 108.75, y: 23.82), controlPoint2: CGPoint(x: 97.96, y: 24.01))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 84.49, y: 37.54))
        bezierPath.addCurve(to: CGPoint(x: 77.89, y: 54.04), controlPoint1: CGPoint(x: 79.31, y: 42.62), controlPoint2: CGPoint(x: 77.16, y: 48.43))
        bezierPath.addLine(to: CGPoint(x: 32.53, y: 102.92))
        bezierPath.addCurve(to: CGPoint(x: 32.68, y: 110), controlPoint1: CGPoint(x: 30.68, y: 104.92), controlPoint2: CGPoint(x: 30.38, y: 107.71))
        bezierPath.addLine(to: CGPoint(x: 26.43, y: 118.06))
        bezierPath.addCurve(to: CGPoint(x: 26.67, y: 120.84), controlPoint1: CGPoint(x: 25.84, y: 118.84), controlPoint2: CGPoint(x: 25.79, y: 119.96))
        bezierPath.addLine(to: CGPoint(x: 28.09, y: 122.31))
        bezierPath.addCurve(to: CGPoint(x: 30.92, y: 122.5), controlPoint1: CGPoint(x: 28.92, y: 123.14), controlPoint2: CGPoint(x: 30.04, y: 123.18))
        bezierPath.addLine(to: CGPoint(x: 38.98, y: 116.2))
        bezierPath.addCurve(to: CGPoint(x: 45.8, y: 116.5), controlPoint1: CGPoint(x: 41.12, y: 118.43), controlPoint2: CGPoint(x: 43.86, y: 118.22))
        bezierPath.addLine(to: CGPoint(x: 71.3, y: 92.91))
        bezierPath.addLine(to: CGPoint(x: 71.3, y: 120.79))
        bezierPath.addCurve(to: CGPoint(x: 75.75, y: 125.24), controlPoint1: CGPoint(x: 71.3, y: 123.28), controlPoint2: CGPoint(x: 73.26, y: 125.24))
        bezierPath.addCurve(to: CGPoint(x: 80.19, y: 120.79), controlPoint1: CGPoint(x: 78.24, y: 125.24), controlPoint2: CGPoint(x: 80.19, y: 123.28))
        bezierPath.addLine(to: CGPoint(x: 80.19, y: 91.93))
        bezierPath.addLine(to: CGPoint(x: 79.85, y: 84.95))
        bezierPath.addLine(to: CGPoint(x: 94.74, y: 71.13))
        bezierPath.addCurve(to: CGPoint(x: 111.34, y: 64.44), controlPoint1: CGPoint(x: 100.36, y: 71.87), controlPoint2: CGPoint(x: 106.26, y: 69.57))
        bezierPath.addLine(to: CGPoint(x: 84.49, y: 37.54))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 37.56, y: 106.92))
        bezierPath.addLine(to: CGPoint(x: 80.58, y: 61.32))
        bezierPath.addCurve(to: CGPoint(x: 83.66, y: 65.27), controlPoint1: CGPoint(x: 81.41, y: 62.69), controlPoint2: CGPoint(x: 82.44, y: 64))
        bezierPath.addCurve(to: CGPoint(x: 87.46, y: 68.45), controlPoint1: CGPoint(x: 84.88, y: 66.5), controlPoint2: CGPoint(x: 86.15, y: 67.57))
        bezierPath.addLine(to: CGPoint(x: 42.05, y: 111.42))
        bezierPath.addLine(to: CGPoint(x: 37.56, y: 106.92))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawMotion(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 78.12, y: 119.17))
        bezierPath.addCurve(to: CGPoint(x: 89.54, y: 117.73), controlPoint1: CGPoint(x: 81.16, y: 119.17), controlPoint2: CGPoint(x: 83.85, y: 117.73))
        bezierPath.addCurve(to: CGPoint(x: 101.08, y: 119.17), controlPoint1: CGPoint(x: 95.26, y: 117.73), controlPoint2: CGPoint(x: 96.83, y: 119.17))
        bezierPath.addCurve(to: CGPoint(x: 110.88, y: 112.01), controlPoint1: CGPoint(x: 107.5, y: 119.17), controlPoint2: CGPoint(x: 110.88, y: 116.48))
        bezierPath.addCurve(to: CGPoint(x: 89.49, y: 99.25), controlPoint1: CGPoint(x: 110.88, y: 104.37), controlPoint2: CGPoint(x: 102.6, y: 99.25))
        bezierPath.addCurve(to: CGPoint(x: 76.56, y: 100.77), controlPoint1: CGPoint(x: 83.07, y: 99.25), controlPoint2: CGPoint(x: 80.21, y: 99.86))
        bezierPath.addLine(to: CGPoint(x: 71.88, y: 90.09))
        bezierPath.addCurve(to: CGPoint(x: 49.36, y: 73.17), controlPoint1: CGPoint(x: 67.28, y: 79.85), controlPoint2: CGPoint(x: 59.86, y: 73.17))
        bezierPath.addLine(to: CGPoint(x: 44.24, y: 73.17))
        bezierPath.addCurve(to: CGPoint(x: 41.42, y: 70.79), controlPoint1: CGPoint(x: 42.54, y: 73.17), controlPoint2: CGPoint(x: 41.42, y: 72.43))
        bezierPath.addCurve(to: CGPoint(x: 48.97, y: 67.44), controlPoint1: CGPoint(x: 41.42, y: 68.1), controlPoint2: CGPoint(x: 45.02, y: 67.44))
        bezierPath.addCurve(to: CGPoint(x: 76.59, y: 88.03), controlPoint1: CGPoint(x: 61.54, y: 67.44), controlPoint2: CGPoint(x: 70.85, y: 74.28))
        bezierPath.addLine(to: CGPoint(x: 79.77, y: 95.74))
        bezierPath.addCurve(to: CGPoint(x: 89.06, y: 94.82), controlPoint1: CGPoint(x: 82.68, y: 95.13), controlPoint2: CGPoint(x: 85.85, y: 94.82))
        bezierPath.addCurve(to: CGPoint(x: 96.44, y: 95.35), controlPoint1: CGPoint(x: 91.62, y: 94.82), controlPoint2: CGPoint(x: 93.96, y: 95))
        bezierPath.addLine(to: CGPoint(x: 97.08, y: 94.87))
        bezierPath.addCurve(to: CGPoint(x: 106.46, y: 89.44), controlPoint1: CGPoint(x: 99.57, y: 93.07), controlPoint2: CGPoint(x: 102.43, y: 91.2))
        bezierPath.addCurve(to: CGPoint(x: 122.64, y: 94.87), controlPoint1: CGPoint(x: 111.32, y: 92.74), controlPoint2: CGPoint(x: 116.87, y: 94.87))
        bezierPath.addLine(to: CGPoint(x: 123.35, y: 94.86))
        bezierPath.addCurve(to: CGPoint(x: 140, y: 80.94), controlPoint1: CGPoint(x: 134.83, y: 94.76), controlPoint2: CGPoint(x: 140, y: 92.04))
        bezierPath.addCurve(to: CGPoint(x: 116.96, y: 57.07), controlPoint1: CGPoint(x: 140, y: 67.27), controlPoint2: CGPoint(x: 130.11, y: 57.03))
        bezierPath.addLine(to: CGPoint(x: 105.33, y: 41.58))
        bezierPath.addCurve(to: CGPoint(x: 83.29, y: 29), controlPoint1: CGPoint(x: 98.78, y: 33.08), controlPoint2: CGPoint(x: 91.01, y: 29))
        bezierPath.addCurve(to: CGPoint(x: 67.54, y: 37.77), controlPoint1: CGPoint(x: 76.95, y: 29), controlPoint2: CGPoint(x: 67.54, y: 32.64))
        bezierPath.addCurve(to: CGPoint(x: 79.71, y: 49.27), controlPoint1: CGPoint(x: 67.54, y: 41.18), controlPoint2: CGPoint(x: 74.33, y: 45.93))
        bezierPath.addLine(to: CGPoint(x: 104.98, y: 64.71))
        bezierPath.addCurve(to: CGPoint(x: 99.13, y: 67.57), controlPoint1: CGPoint(x: 103.03, y: 66.58), controlPoint2: CGPoint(x: 101.3, y: 67.57))
        bezierPath.addCurve(to: CGPoint(x: 87.02, y: 62.5), controlPoint1: CGPoint(x: 95.78, y: 67.57), controlPoint2: CGPoint(x: 92.27, y: 65.54))
        bezierPath.addLine(to: CGPoint(x: 85.24, y: 61.46))
        bezierPath.addCurve(to: CGPoint(x: 49.44, y: 47.53), controlPoint1: CGPoint(x: 72.72, y: 54.14), controlPoint2: CGPoint(x: 62.71, y: 47.53))
        bezierPath.addCurve(to: CGPoint(x: 18.16, y: 71.96), controlPoint1: CGPoint(x: 34.99, y: 47.53), controlPoint2: CGPoint(x: 24.02, y: 55.82))
        bezierPath.addCurve(to: CGPoint(x: 10, y: 79.46), controlPoint1: CGPoint(x: 13.51, y: 71.96), controlPoint2: CGPoint(x: 10, y: 74.99))
        bezierPath.addCurve(to: CGPoint(x: 19.46, y: 87.66), controlPoint1: CGPoint(x: 10, y: 84.5), controlPoint2: CGPoint(x: 13.99, y: 87.66))
        bezierPath.addCurve(to: CGPoint(x: 48.44, y: 100.07), controlPoint1: CGPoint(x: 25.79, y: 96.52), controlPoint2: CGPoint(x: 36.16, y: 100.07))
        bezierPath.addCurve(to: CGPoint(x: 50.4, y: 100.03), controlPoint1: CGPoint(x: 49.1, y: 100.07), controlPoint2: CGPoint(x: 49.75, y: 100.03))
        bezierPath.addLine(to: CGPoint(x: 67.97, y: 114.61))
        bezierPath.addCurve(to: CGPoint(x: 78.12, y: 119.17), controlPoint1: CGPoint(x: 72.31, y: 118.56), controlPoint2: CGPoint(x: 74.83, y: 119.17))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 121.65, y: 78.86))
        bezierPath.addCurve(to: CGPoint(x: 118.13, y: 75.3), controlPoint1: CGPoint(x: 119.69, y: 78.86), controlPoint2: CGPoint(x: 118.13, y: 77.21))
        bezierPath.addCurve(to: CGPoint(x: 121.69, y: 71.61), controlPoint1: CGPoint(x: 118.13, y: 73.35), controlPoint2: CGPoint(x: 119.74, y: 71.61))
        bezierPath.addCurve(to: CGPoint(x: 125.25, y: 75.12), controlPoint1: CGPoint(x: 123.68, y: 71.61), controlPoint2: CGPoint(x: 125.25, y: 73.17))
        bezierPath.addCurve(to: CGPoint(x: 121.65, y: 78.86), controlPoint1: CGPoint(x: 125.25, y: 77.08), controlPoint2: CGPoint(x: 123.64, y: 78.86))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 46.75, y: 122.59))
        bezierPath.addCurve(to: CGPoint(x: 31.65, y: 112.92), controlPoint1: CGPoint(x: 37.55, y: 122.59), controlPoint2: CGPoint(x: 31.65, y: 118.73))
        bezierPath.addCurve(to: CGPoint(x: 39.51, y: 106.41), controlPoint1: CGPoint(x: 31.65, y: 109.01), controlPoint2: CGPoint(x: 34.65, y: 106.41))
        bezierPath.addCurve(to: CGPoint(x: 48.7, y: 107.06), controlPoint1: CGPoint(x: 43.32, y: 106.41), controlPoint2: CGPoint(x: 46.54, y: 107.06))
        bezierPath.addCurve(to: CGPoint(x: 50.96, y: 106.93), controlPoint1: CGPoint(x: 49.62, y: 107.06), controlPoint2: CGPoint(x: 50.35, y: 106.97))
        bezierPath.addLine(to: CGPoint(x: 64.41, y: 118.13))
        bezierPath.addCurve(to: CGPoint(x: 46.75, y: 122.59), controlPoint1: CGPoint(x: 60.25, y: 120.99), controlPoint2: CGPoint(x: 55.13, y: 122.59))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawNotifications(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 35.37, y: 107.25))
        bezierPath.addLine(to: CGPoint(x: 112.77, y: 107.25))
        bezierPath.addCurve(to: CGPoint(x: 120.14, y: 101.34), controlPoint1: CGPoint(x: 117.36, y: 107.25), controlPoint2: CGPoint(x: 120.14, y: 104.86))
        bezierPath.addCurve(to: CGPoint(x: 110.96, y: 87.72), controlPoint1: CGPoint(x: 120.14, y: 96.46), controlPoint2: CGPoint(x: 115.16, y: 92.07))
        bezierPath.addCurve(to: CGPoint(x: 106.47, y: 71.8), controlPoint1: CGPoint(x: 107.74, y: 84.35), controlPoint2: CGPoint(x: 106.86, y: 77.42))
        bezierPath.addLine(to: CGPoint(x: 106.44, y: 70.68))
        bezierPath.addCurve(to: CGPoint(x: 88.16, y: 35.43), controlPoint1: CGPoint(x: 105.92, y: 52.54), controlPoint2: CGPoint(x: 100.88, y: 40.02))
        bezierPath.addCurve(to: CGPoint(x: 74.04, y: 24), controlPoint1: CGPoint(x: 86.3, y: 29.08), controlPoint2: CGPoint(x: 81.27, y: 24))
        bezierPath.addCurve(to: CGPoint(x: 59.98, y: 35.43), controlPoint1: CGPoint(x: 66.87, y: 24), controlPoint2: CGPoint(x: 61.79, y: 29.08))
        bezierPath.addCurve(to: CGPoint(x: 41.67, y: 71.8), controlPoint1: CGPoint(x: 46.99, y: 40.11), controlPoint2: CGPoint(x: 42.01, y: 53.05))
        bezierPath.addLine(to: CGPoint(x: 41.58, y: 73.05))
        bezierPath.addCurve(to: CGPoint(x: 37.18, y: 87.72), controlPoint1: CGPoint(x: 41.14, y: 78.41), controlPoint2: CGPoint(x: 40.17, y: 84.6))
        bezierPath.addLine(to: CGPoint(x: 36.06, y: 88.86))
        bezierPath.addCurve(to: CGPoint(x: 28, y: 101.34), controlPoint1: CGPoint(x: 32.11, y: 92.83), controlPoint2: CGPoint(x: 28, y: 96.89))
        bezierPath.addCurve(to: CGPoint(x: 35.37, y: 107.25), controlPoint1: CGPoint(x: 28, y: 104.86), controlPoint2: CGPoint(x: 30.73, y: 107.25))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 74.04, y: 126.78))
        bezierPath.addCurve(to: CGPoint(x: 59.1, y: 113.89), controlPoint1: CGPoint(x: 65.79, y: 126.78), controlPoint2: CGPoint(x: 59.74, y: 120.73))
        bezierPath.addLine(to: CGPoint(x: 89.04, y: 113.89))
        bezierPath.addCurve(to: CGPoint(x: 74.04, y: 126.78), controlPoint1: CGPoint(x: 88.4, y: 120.73), controlPoint2: CGPoint(x: 82.35, y: 126.78))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawPhotos(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 32.33, y: 120.89))
        bezierPath.addLine(to: CGPoint(x: 116.8, y: 120.89))
        bezierPath.addCurve(to: CGPoint(x: 132.14, y: 105.76), controlPoint1: CGPoint(x: 127.06, y: 120.89), controlPoint2: CGPoint(x: 132.14, y: 115.81))
        bezierPath.addLine(to: CGPoint(x: 132.14, y: 46.14))
        bezierPath.addCurve(to: CGPoint(x: 116.8, y: 31), controlPoint1: CGPoint(x: 132.14, y: 36.08), controlPoint2: CGPoint(x: 127.06, y: 31))
        bezierPath.addLine(to: CGPoint(x: 32.33, y: 31))
        bezierPath.addCurve(to: CGPoint(x: 17, y: 46.14), controlPoint1: CGPoint(x: 22.13, y: 31), controlPoint2: CGPoint(x: 17, y: 36.03))
        bezierPath.addLine(to: CGPoint(x: 17, y: 105.76))
        bezierPath.addCurve(to: CGPoint(x: 32.33, y: 120.89), controlPoint1: CGPoint(x: 17, y: 115.86), controlPoint2: CGPoint(x: 22.13, y: 120.89))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 53.62, y: 77.14))
        bezierPath.addCurve(to: CGPoint(x: 41.56, y: 65.08), controlPoint1: CGPoint(x: 46.98, y: 77.14), controlPoint2: CGPoint(x: 41.56, y: 71.72))
        bezierPath.addCurve(to: CGPoint(x: 53.62, y: 53.02), controlPoint1: CGPoint(x: 41.56, y: 58.49), controlPoint2: CGPoint(x: 46.98, y: 53.02))
        bezierPath.addCurve(to: CGPoint(x: 65.63, y: 65.08), controlPoint1: CGPoint(x: 60.21, y: 53.02), controlPoint2: CGPoint(x: 65.63, y: 58.49))
        bezierPath.addCurve(to: CGPoint(x: 53.62, y: 77.14), controlPoint1: CGPoint(x: 65.63, y: 71.72), controlPoint2: CGPoint(x: 60.21, y: 77.14))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 32.43, y: 113.03))
        bezierPath.addCurve(to: CGPoint(x: 24.86, y: 105.41), controlPoint1: CGPoint(x: 27.69, y: 113.03), controlPoint2: CGPoint(x: 24.86, y: 110.2))
        bezierPath.addLine(to: CGPoint(x: 24.86, y: 102.44))
        bezierPath.addLine(to: CGPoint(x: 39.85, y: 89.35))
        bezierPath.addCurve(to: CGPoint(x: 46.49, y: 86.47), controlPoint1: CGPoint(x: 42, y: 87.45), controlPoint2: CGPoint(x: 44.34, y: 86.47))
        bezierPath.addCurve(to: CGPoint(x: 53.52, y: 89.45), controlPoint1: CGPoint(x: 48.88, y: 86.47), controlPoint2: CGPoint(x: 51.38, y: 87.45))
        bezierPath.addLine(to: CGPoint(x: 62.85, y: 97.85))
        bezierPath.addLine(to: CGPoint(x: 86.19, y: 77.14))
        bezierPath.addCurve(to: CGPoint(x: 94.05, y: 74.02), controlPoint1: CGPoint(x: 88.58, y: 74.99), controlPoint2: CGPoint(x: 91.27, y: 74.02))
        bezierPath.addCurve(to: CGPoint(x: 101.81, y: 77.19), controlPoint1: CGPoint(x: 96.74, y: 74.02), controlPoint2: CGPoint(x: 99.52, y: 75.04))
        bezierPath.addLine(to: CGPoint(x: 124.28, y: 97.99))
        bezierPath.addLine(to: CGPoint(x: 124.28, y: 105.51))
        bezierPath.addCurve(to: CGPoint(x: 116.76, y: 113.03), controlPoint1: CGPoint(x: 124.28, y: 110.2), controlPoint2: CGPoint(x: 121.39, y: 113.03))
        bezierPath.addLine(to: CGPoint(x: 32.43, y: 113.03))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawReminders(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 31.33, y: 117.35))
        bezierPath.addLine(to: CGPoint(x: 115.8, y: 117.35))
        bezierPath.addCurve(to: CGPoint(x: 131.14, y: 102.21), controlPoint1: CGPoint(x: 126.06, y: 117.35), controlPoint2: CGPoint(x: 131.14, y: 112.27))
        bezierPath.addLine(to: CGPoint(x: 131.14, y: 75.26))
        bezierPath.addCurve(to: CGPoint(x: 128.35, y: 65.98), controlPoint1: CGPoint(x: 131.14, y: 70.87), controlPoint2: CGPoint(x: 130.45, y: 68.81))
        bezierPath.addLine(to: CGPoint(x: 111.51, y: 43.18))
        bezierPath.addCurve(to: CGPoint(x: 94.97, y: 34), controlPoint1: CGPoint(x: 106.27, y: 36.02), controlPoint2: CGPoint(x: 103.35, y: 34.06))
        bezierPath.addLine(to: CGPoint(x: 52.57, y: 34))
        bezierPath.addCurve(to: CGPoint(x: 35.68, y: 43.18), controlPoint1: CGPoint(x: 43.88, y: 34), controlPoint2: CGPoint(x: 41, y: 35.9))
        bezierPath.addLine(to: CGPoint(x: 18.78, y: 65.98))
        bezierPath.addCurve(to: CGPoint(x: 16, y: 75.26), controlPoint1: CGPoint(x: 16.73, y: 68.81), controlPoint2: CGPoint(x: 16, y: 70.87))
        bezierPath.addLine(to: CGPoint(x: 16, y: 102.21))
        bezierPath.addCurve(to: CGPoint(x: 31.33, y: 117.35), controlPoint1: CGPoint(x: 16, y: 112.32), controlPoint2: CGPoint(x: 21.13, y: 117.35))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 73.57, y: 89.08))
        bezierPath.addCurve(to: CGPoint(x: 61.56, y: 77), controlPoint1: CGPoint(x: 66.36, y: 89.08), controlPoint2: CGPoint(x: 61.7, y: 82.92))
        bezierPath.addLine(to: CGPoint(x: 61.56, y: 76.58))
        bezierPath.addCurve(to: CGPoint(x: 57.5, y: 72.33), controlPoint1: CGPoint(x: 61.56, y: 74.38), controlPoint2: CGPoint(x: 60.24, y: 72.33))
        bezierPath.addLine(to: CGPoint(x: 26.4, y: 72.33))
        bezierPath.addCurve(to: CGPoint(x: 25.23, y: 69.89), controlPoint1: CGPoint(x: 24.79, y: 72.33), controlPoint2: CGPoint(x: 24.45, y: 70.96))
        bezierPath.addLine(to: CGPoint(x: 43.29, y: 45.08))
        bezierPath.addCurve(to: CGPoint(x: 51.99, y: 40.84), controlPoint1: CGPoint(x: 45.54, y: 41.96), controlPoint2: CGPoint(x: 48.42, y: 40.84))
        bezierPath.addLine(to: CGPoint(x: 95.15, y: 40.84))
        bezierPath.addCurve(to: CGPoint(x: 103.84, y: 45.08), controlPoint1: CGPoint(x: 98.71, y: 40.84), controlPoint2: CGPoint(x: 101.6, y: 41.96))
        bezierPath.addLine(to: CGPoint(x: 121.91, y: 69.89))
        bezierPath.addCurve(to: CGPoint(x: 120.74, y: 72.33), controlPoint1: CGPoint(x: 122.64, y: 70.96), controlPoint2: CGPoint(x: 122.35, y: 72.33))
        bezierPath.addLine(to: CGPoint(x: 89.63, y: 72.33))
        bezierPath.addCurve(to: CGPoint(x: 85.63, y: 76.38), controlPoint1: CGPoint(x: 86.98, y: 72.33), controlPoint2: CGPoint(x: 85.71, y: 74.26))
        bezierPath.addLine(to: CGPoint(x: 85.63, y: 76.72))
        bezierPath.addCurve(to: CGPoint(x: 73.57, y: 89.08), controlPoint1: CGPoint(x: 85.63, y: 82.73), controlPoint2: CGPoint(x: 80.94, y: 89.08))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 94.12, y: 48.01))
        bezierPath.addLine(to: CGPoint(x: 53.06, y: 48.01))
        bezierPath.addCurve(to: CGPoint(x: 50.72, y: 50.36), controlPoint1: CGPoint(x: 51.74, y: 48.01), controlPoint2: CGPoint(x: 50.72, y: 49.04))
        bezierPath.addCurve(to: CGPoint(x: 53.06, y: 52.7), controlPoint1: CGPoint(x: 50.72, y: 51.68), controlPoint2: CGPoint(x: 51.74, y: 52.7))
        bezierPath.addLine(to: CGPoint(x: 94.12, y: 52.7))
        bezierPath.addCurve(to: CGPoint(x: 96.42, y: 50.36), controlPoint1: CGPoint(x: 95.44, y: 52.7), controlPoint2: CGPoint(x: 96.42, y: 51.68))
        bezierPath.addCurve(to: CGPoint(x: 94.12, y: 48.01), controlPoint1: CGPoint(x: 96.42, y: 49.04), controlPoint2: CGPoint(x: 95.44, y: 48.01))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 100.57, y: 59.05))
        bezierPath.addCurve(to: CGPoint(x: 103.01, y: 61.59), controlPoint1: CGPoint(x: 101.94, y: 59.05), controlPoint2: CGPoint(x: 103.01, y: 60.27))
        bezierPath.addCurve(to: CGPoint(x: 100.57, y: 64.03), controlPoint1: CGPoint(x: 103.01, y: 62.91), controlPoint2: CGPoint(x: 101.94, y: 64.03))
        bezierPath.addLine(to: CGPoint(x: 46.57, y: 64.03))
        bezierPath.addCurve(to: CGPoint(x: 44.17, y: 61.59), controlPoint1: CGPoint(x: 45.2, y: 64.03), controlPoint2: CGPoint(x: 44.17, y: 62.91))
        bezierPath.addCurve(to: CGPoint(x: 46.57, y: 59.05), controlPoint1: CGPoint(x: 44.17, y: 60.27), controlPoint2: CGPoint(x: 45.2, y: 59.05))
        bezierPath.addLine(to: CGPoint(x: 100.57, y: 59.05))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawSpeech(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 89.37, y: 32.61))
        bezierPath.addLine(to: CGPoint(x: 116.27, y: 59.51))
        bezierPath.addCurve(to: CGPoint(x: 116.96, y: 31.92), controlPoint1: CGPoint(x: 124.87, y: 50.97), controlPoint2: CGPoint(x: 125.21, y: 40.13))
        bezierPath.addCurve(to: CGPoint(x: 89.37, y: 32.61), controlPoint1: CGPoint(x: 108.75, y: 23.82), controlPoint2: CGPoint(x: 97.96, y: 24.01))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 84.49, y: 37.54))
        bezierPath.addCurve(to: CGPoint(x: 77.89, y: 54.04), controlPoint1: CGPoint(x: 79.31, y: 42.62), controlPoint2: CGPoint(x: 77.16, y: 48.43))
        bezierPath.addLine(to: CGPoint(x: 32.53, y: 102.92))
        bezierPath.addCurve(to: CGPoint(x: 32.68, y: 110), controlPoint1: CGPoint(x: 30.68, y: 104.92), controlPoint2: CGPoint(x: 30.38, y: 107.71))
        bezierPath.addLine(to: CGPoint(x: 26.43, y: 118.06))
        bezierPath.addCurve(to: CGPoint(x: 26.67, y: 120.84), controlPoint1: CGPoint(x: 25.84, y: 118.84), controlPoint2: CGPoint(x: 25.79, y: 119.96))
        bezierPath.addLine(to: CGPoint(x: 28.09, y: 122.31))
        bezierPath.addCurve(to: CGPoint(x: 30.92, y: 122.5), controlPoint1: CGPoint(x: 28.92, y: 123.14), controlPoint2: CGPoint(x: 30.04, y: 123.18))
        bezierPath.addLine(to: CGPoint(x: 38.98, y: 116.2))
        bezierPath.addCurve(to: CGPoint(x: 45.8, y: 116.5), controlPoint1: CGPoint(x: 41.12, y: 118.43), controlPoint2: CGPoint(x: 43.86, y: 118.22))
        bezierPath.addLine(to: CGPoint(x: 71.3, y: 92.91))
        bezierPath.addLine(to: CGPoint(x: 71.3, y: 120.79))
        bezierPath.addCurve(to: CGPoint(x: 75.75, y: 125.24), controlPoint1: CGPoint(x: 71.3, y: 123.28), controlPoint2: CGPoint(x: 73.26, y: 125.24))
        bezierPath.addCurve(to: CGPoint(x: 80.19, y: 120.79), controlPoint1: CGPoint(x: 78.24, y: 125.24), controlPoint2: CGPoint(x: 80.19, y: 123.28))
        bezierPath.addLine(to: CGPoint(x: 80.19, y: 91.93))
        bezierPath.addLine(to: CGPoint(x: 79.85, y: 84.95))
        bezierPath.addLine(to: CGPoint(x: 94.74, y: 71.13))
        bezierPath.addCurve(to: CGPoint(x: 111.34, y: 64.44), controlPoint1: CGPoint(x: 100.36, y: 71.87), controlPoint2: CGPoint(x: 106.26, y: 69.57))
        bezierPath.addLine(to: CGPoint(x: 84.49, y: 37.54))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 37.56, y: 106.92))
        bezierPath.addLine(to: CGPoint(x: 80.58, y: 61.32))
        bezierPath.addCurve(to: CGPoint(x: 83.66, y: 65.27), controlPoint1: CGPoint(x: 81.41, y: 62.69), controlPoint2: CGPoint(x: 82.44, y: 64))
        bezierPath.addCurve(to: CGPoint(x: 87.46, y: 68.45), controlPoint1: CGPoint(x: 84.88, y: 66.5), controlPoint2: CGPoint(x: 86.15, y: 67.57))
        bezierPath.addLine(to: CGPoint(x: 42.05, y: 111.42))
        bezierPath.addLine(to: CGPoint(x: 37.56, y: 106.92))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawBluetooth(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 102.34, y: 94.92))
        bezierPath.addLine(to: CGPoint(x: 78.9, y: 75.5))
        bezierPath.addLine(to: CGPoint(x: 102.34, y: 56.08))
        bezierPath.addCurve(to: CGPoint(x: 102.34, y: 49.02), controlPoint1: CGPoint(x: 104.55, y: 54.24), controlPoint2: CGPoint(x: 104.55, y: 50.86))
        bezierPath.addLine(to: CGPoint(x: 74.65, y: 26.07))
        bezierPath.addCurve(to: CGPoint(x: 67.08, y: 29.6), controlPoint1: CGPoint(x: 71.64, y: 23.58), controlPoint2: CGPoint(x: 67.08, y: 25.71))
        bezierPath.addLine(to: CGPoint(x: 67.08, y: 64.42))
        bezierPath.addLine(to: CGPoint(x: 51.88, y: 49.3))
        bezierPath.addCurve(to: CGPoint(x: 45.35, y: 49.3), controlPoint1: CGPoint(x: 50.08, y: 47.51), controlPoint2: CGPoint(x: 47.15, y: 47.51))
        bezierPath.addCurve(to: CGPoint(x: 45.35, y: 55.8), controlPoint1: CGPoint(x: 43.55, y: 51.1), controlPoint2: CGPoint(x: 43.55, y: 54))
        bezierPath.addLine(to: CGPoint(x: 65.17, y: 75.5))
        bezierPath.addLine(to: CGPoint(x: 45.35, y: 95.2))
        bezierPath.addCurve(to: CGPoint(x: 45.35, y: 101.7), controlPoint1: CGPoint(x: 43.55, y: 97), controlPoint2: CGPoint(x: 43.55, y: 99.9))
        bezierPath.addCurve(to: CGPoint(x: 51.88, y: 101.7), controlPoint1: CGPoint(x: 47.15, y: 103.49), controlPoint2: CGPoint(x: 50.08, y: 103.49))
        bezierPath.addLine(to: CGPoint(x: 67.08, y: 86.58))
        bezierPath.addLine(to: CGPoint(x: 67.08, y: 121.4))
        bezierPath.addCurve(to: CGPoint(x: 74.65, y: 124.93), controlPoint1: CGPoint(x: 67.08, y: 125.29), controlPoint2: CGPoint(x: 71.64, y: 127.42))
        bezierPath.addLine(to: CGPoint(x: 102.34, y: 101.98))
        bezierPath.addCurve(to: CGPoint(x: 102.34, y: 94.92), controlPoint1: CGPoint(x: 104.55, y: 100.14), controlPoint2: CGPoint(x: 104.55, y: 96.76))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 76, y: 39))
        bezierPath.addLine(to: CGPoint(x: 92, y: 52))
        bezierPath.addLine(to: CGPoint(x: 76, y: 65))
        bezierPath.addLine(to: CGPoint(x: 76, y: 39))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 76, y: 111))
        bezierPath.addLine(to: CGPoint(x: 76, y: 85))
        bezierPath.addLine(to: CGPoint(x: 92, y: 98))
        bezierPath.addLine(to: CGPoint(x: 76, y: 111))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        context.restoreGState()
        
    }
    
    public static func drawTracking(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 150), resizing: ResizingBehavior = .aspectFit, color: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        
        let context = UIGraphicsGetCurrentContext()!
        
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 150, height: 150), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 150, y: resizedFrame.height / 150)
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 75, y: 127.43))
        bezierPath.addCurve(to: CGPoint(x: 83.2, y: 124.32), controlPoint1: CGPoint(x: 77.52, y: 127.43), controlPoint2: CGPoint(x: 80.31, y: 126.31))
        bezierPath.addCurve(to: CGPoint(x: 131, y: 59.89), controlPoint1: CGPoint(x: 112.19, y: 105.49), controlPoint2: CGPoint(x: 131, y: 82.53))
        bezierPath.addCurve(to: CGPoint(x: 98.69, y: 24), controlPoint1: CGPoint(x: 131, y: 38.38), controlPoint2: CGPoint(x: 116.69, y: 24))
        bezierPath.addCurve(to: CGPoint(x: 75, y: 38.97), controlPoint1: CGPoint(x: 88.29, y: 24), controlPoint2: CGPoint(x: 80.31, y: 29.15))
        bezierPath.addCurve(to: CGPoint(x: 51.31, y: 24), controlPoint1: CGPoint(x: 69.69, y: 29.15), controlPoint2: CGPoint(x: 61.71, y: 24))
        bezierPath.addCurve(to: CGPoint(x: 19, y: 59.89), controlPoint1: CGPoint(x: 33.31, y: 24), controlPoint2: CGPoint(x: 19, y: 38.38))
        bezierPath.addCurve(to: CGPoint(x: 66.75, y: 124.32), controlPoint1: CGPoint(x: 19, y: 82.53), controlPoint2: CGPoint(x: 37.76, y: 105.49))
        bezierPath.addCurve(to: CGPoint(x: 75, y: 127.43), controlPoint1: CGPoint(x: 69.69, y: 126.31), controlPoint2: CGPoint(x: 72.48, y: 127.43))
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
}

#endif
