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
    
    class SocialIconPack : NSObject {
        
        @objc dynamic class func drawInstagram(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)) {

            let context = UIGraphicsGetCurrentContext()!
            

            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 40, height: 40), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 40, y: resizedFrame.height / 40)

            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 19.9, y: 0.99))
            bezierPath.addCurve(to: CGPoint(x: 12.12, y: 1.1), controlPoint1: CGPoint(x: 14.77, y: 0.99), controlPoint2: CGPoint(x: 14.13, y: 1.01))
            bezierPath.addCurve(to: CGPoint(x: 7.54, y: 1.98), controlPoint1: CGPoint(x: 10.11, y: 1.19), controlPoint2: CGPoint(x: 8.74, y: 1.51))
            bezierPath.addCurve(to: CGPoint(x: 4.19, y: 4.15), controlPoint1: CGPoint(x: 6.29, y: 2.46), controlPoint2: CGPoint(x: 5.24, y: 3.1))
            bezierPath.addCurve(to: CGPoint(x: 2.02, y: 7.5), controlPoint1: CGPoint(x: 3.14, y: 5.2), controlPoint2: CGPoint(x: 2.5, y: 6.26))
            bezierPath.addCurve(to: CGPoint(x: 1.14, y: 12.08), controlPoint1: CGPoint(x: 1.55, y: 8.7), controlPoint2: CGPoint(x: 1.23, y: 10.07))
            bezierPath.addCurve(to: CGPoint(x: 1.03, y: 19.86), controlPoint1: CGPoint(x: 1.05, y: 14.09), controlPoint2: CGPoint(x: 1.03, y: 14.73))
            bezierPath.addCurve(to: CGPoint(x: 1.14, y: 27.64), controlPoint1: CGPoint(x: 1.03, y: 24.98), controlPoint2: CGPoint(x: 1.05, y: 25.63))
            bezierPath.addCurve(to: CGPoint(x: 2.02, y: 32.22), controlPoint1: CGPoint(x: 1.23, y: 29.65), controlPoint2: CGPoint(x: 1.55, y: 31.02))
            bezierPath.addCurve(to: CGPoint(x: 4.19, y: 35.56), controlPoint1: CGPoint(x: 2.5, y: 33.46), controlPoint2: CGPoint(x: 3.14, y: 34.51))
            bezierPath.addCurve(to: CGPoint(x: 7.54, y: 37.74), controlPoint1: CGPoint(x: 5.24, y: 36.61), controlPoint2: CGPoint(x: 6.29, y: 37.26))
            bezierPath.addCurve(to: CGPoint(x: 12.12, y: 38.62), controlPoint1: CGPoint(x: 8.74, y: 38.21), controlPoint2: CGPoint(x: 10.11, y: 38.52))
            bezierPath.addCurve(to: CGPoint(x: 19.9, y: 38.73), controlPoint1: CGPoint(x: 14.13, y: 38.71), controlPoint2: CGPoint(x: 14.77, y: 38.73))
            bezierPath.addCurve(to: CGPoint(x: 27.68, y: 38.62), controlPoint1: CGPoint(x: 25.02, y: 38.73), controlPoint2: CGPoint(x: 25.67, y: 38.71))
            bezierPath.addCurve(to: CGPoint(x: 32.26, y: 37.74), controlPoint1: CGPoint(x: 29.69, y: 38.52), controlPoint2: CGPoint(x: 31.06, y: 38.21))
            bezierPath.addCurve(to: CGPoint(x: 35.6, y: 35.56), controlPoint1: CGPoint(x: 33.5, y: 37.26), controlPoint2: CGPoint(x: 34.55, y: 36.61))
            bezierPath.addCurve(to: CGPoint(x: 37.78, y: 32.22), controlPoint1: CGPoint(x: 36.65, y: 34.51), controlPoint2: CGPoint(x: 37.3, y: 33.46))
            bezierPath.addCurve(to: CGPoint(x: 38.66, y: 27.64), controlPoint1: CGPoint(x: 38.25, y: 31.02), controlPoint2: CGPoint(x: 38.56, y: 29.65))
            bezierPath.addCurve(to: CGPoint(x: 38.77, y: 19.86), controlPoint1: CGPoint(x: 38.75, y: 25.63), controlPoint2: CGPoint(x: 38.77, y: 24.98))
            bezierPath.addCurve(to: CGPoint(x: 38.66, y: 12.08), controlPoint1: CGPoint(x: 38.77, y: 14.73), controlPoint2: CGPoint(x: 38.75, y: 14.09))
            bezierPath.addCurve(to: CGPoint(x: 37.78, y: 7.5), controlPoint1: CGPoint(x: 38.56, y: 10.07), controlPoint2: CGPoint(x: 38.25, y: 8.7))
            bezierPath.addCurve(to: CGPoint(x: 35.6, y: 4.15), controlPoint1: CGPoint(x: 37.3, y: 6.26), controlPoint2: CGPoint(x: 36.65, y: 5.2))
            bezierPath.addCurve(to: CGPoint(x: 32.26, y: 1.98), controlPoint1: CGPoint(x: 34.55, y: 3.1), controlPoint2: CGPoint(x: 33.5, y: 2.46))
            bezierPath.addCurve(to: CGPoint(x: 27.68, y: 1.1), controlPoint1: CGPoint(x: 31.06, y: 1.51), controlPoint2: CGPoint(x: 29.69, y: 1.19))
            bezierPath.addCurve(to: CGPoint(x: 19.9, y: 0.99), controlPoint1: CGPoint(x: 25.67, y: 1.01), controlPoint2: CGPoint(x: 25.02, y: 0.99))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 19.9, y: 4.39))
            bezierPath.addCurve(to: CGPoint(x: 27.52, y: 4.5), controlPoint1: CGPoint(x: 24.94, y: 4.39), controlPoint2: CGPoint(x: 25.53, y: 4.41))
            bezierPath.addCurve(to: CGPoint(x: 31.03, y: 5.15), controlPoint1: CGPoint(x: 29.36, y: 4.58), controlPoint2: CGPoint(x: 30.36, y: 4.89))
            bezierPath.addCurve(to: CGPoint(x: 33.2, y: 6.56), controlPoint1: CGPoint(x: 31.91, y: 5.49), controlPoint2: CGPoint(x: 32.54, y: 5.9))
            bezierPath.addCurve(to: CGPoint(x: 34.61, y: 8.73), controlPoint1: CGPoint(x: 33.86, y: 7.22), controlPoint2: CGPoint(x: 34.27, y: 7.85))
            bezierPath.addCurve(to: CGPoint(x: 35.26, y: 12.23), controlPoint1: CGPoint(x: 34.87, y: 9.39), controlPoint2: CGPoint(x: 35.18, y: 10.39))
            bezierPath.addCurve(to: CGPoint(x: 35.37, y: 19.86), controlPoint1: CGPoint(x: 35.35, y: 14.22), controlPoint2: CGPoint(x: 35.37, y: 14.82))
            bezierPath.addCurve(to: CGPoint(x: 35.26, y: 27.48), controlPoint1: CGPoint(x: 35.37, y: 24.9), controlPoint2: CGPoint(x: 35.35, y: 25.49))
            bezierPath.addCurve(to: CGPoint(x: 34.61, y: 30.99), controlPoint1: CGPoint(x: 35.18, y: 29.32), controlPoint2: CGPoint(x: 34.87, y: 30.32))
            bezierPath.addCurve(to: CGPoint(x: 33.2, y: 33.16), controlPoint1: CGPoint(x: 34.27, y: 31.87), controlPoint2: CGPoint(x: 33.86, y: 32.5))
            bezierPath.addCurve(to: CGPoint(x: 31.03, y: 34.57), controlPoint1: CGPoint(x: 32.54, y: 33.82), controlPoint2: CGPoint(x: 31.91, y: 34.23))
            bezierPath.addCurve(to: CGPoint(x: 27.52, y: 35.22), controlPoint1: CGPoint(x: 30.36, y: 34.83), controlPoint2: CGPoint(x: 29.36, y: 35.14))
            bezierPath.addCurve(to: CGPoint(x: 19.9, y: 35.33), controlPoint1: CGPoint(x: 25.53, y: 35.31), controlPoint2: CGPoint(x: 24.94, y: 35.33))
            bezierPath.addCurve(to: CGPoint(x: 12.27, y: 35.22), controlPoint1: CGPoint(x: 14.86, y: 35.33), controlPoint2: CGPoint(x: 14.26, y: 35.31))
            bezierPath.addCurve(to: CGPoint(x: 8.77, y: 34.57), controlPoint1: CGPoint(x: 10.43, y: 35.14), controlPoint2: CGPoint(x: 9.43, y: 34.83))
            bezierPath.addCurve(to: CGPoint(x: 6.6, y: 33.16), controlPoint1: CGPoint(x: 7.89, y: 34.23), controlPoint2: CGPoint(x: 7.26, y: 33.82))
            bezierPath.addCurve(to: CGPoint(x: 5.19, y: 30.99), controlPoint1: CGPoint(x: 5.94, y: 32.5), controlPoint2: CGPoint(x: 5.53, y: 31.87))
            bezierPath.addCurve(to: CGPoint(x: 4.54, y: 27.48), controlPoint1: CGPoint(x: 4.93, y: 30.32), controlPoint2: CGPoint(x: 4.62, y: 29.32))
            bezierPath.addCurve(to: CGPoint(x: 4.43, y: 19.86), controlPoint1: CGPoint(x: 4.45, y: 25.49), controlPoint2: CGPoint(x: 4.43, y: 24.9))
            bezierPath.addCurve(to: CGPoint(x: 4.54, y: 12.23), controlPoint1: CGPoint(x: 4.43, y: 14.82), controlPoint2: CGPoint(x: 4.45, y: 14.22))
            bezierPath.addCurve(to: CGPoint(x: 5.19, y: 8.73), controlPoint1: CGPoint(x: 4.62, y: 10.39), controlPoint2: CGPoint(x: 4.93, y: 9.39))
            bezierPath.addCurve(to: CGPoint(x: 6.6, y: 6.56), controlPoint1: CGPoint(x: 5.53, y: 7.85), controlPoint2: CGPoint(x: 5.94, y: 7.22))
            bezierPath.addCurve(to: CGPoint(x: 8.77, y: 5.15), controlPoint1: CGPoint(x: 7.26, y: 5.9), controlPoint2: CGPoint(x: 7.89, y: 5.49))
            bezierPath.addCurve(to: CGPoint(x: 12.27, y: 4.5), controlPoint1: CGPoint(x: 9.43, y: 4.89), controlPoint2: CGPoint(x: 10.43, y: 4.58))
            bezierPath.addCurve(to: CGPoint(x: 19.9, y: 4.39), controlPoint1: CGPoint(x: 14.26, y: 4.41), controlPoint2: CGPoint(x: 14.86, y: 4.39))
            bezierPath.addLine(to: CGPoint(x: 19.9, y: 4.39))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 19.9, y: 26.15))
            bezierPath.addCurve(to: CGPoint(x: 13.61, y: 19.86), controlPoint1: CGPoint(x: 16.42, y: 26.15), controlPoint2: CGPoint(x: 13.61, y: 23.33))
            bezierPath.addCurve(to: CGPoint(x: 19.9, y: 13.57), controlPoint1: CGPoint(x: 13.61, y: 16.38), controlPoint2: CGPoint(x: 16.42, y: 13.57))
            bezierPath.addCurve(to: CGPoint(x: 26.19, y: 19.86), controlPoint1: CGPoint(x: 23.37, y: 13.57), controlPoint2: CGPoint(x: 26.19, y: 16.38))
            bezierPath.addCurve(to: CGPoint(x: 19.9, y: 26.15), controlPoint1: CGPoint(x: 26.19, y: 23.33), controlPoint2: CGPoint(x: 23.37, y: 26.15))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 19.9, y: 10.17))
            bezierPath.addCurve(to: CGPoint(x: 10.21, y: 19.86), controlPoint1: CGPoint(x: 14.55, y: 10.17), controlPoint2: CGPoint(x: 10.21, y: 14.51))
            bezierPath.addCurve(to: CGPoint(x: 19.9, y: 29.55), controlPoint1: CGPoint(x: 10.21, y: 25.21), controlPoint2: CGPoint(x: 14.55, y: 29.55))
            bezierPath.addCurve(to: CGPoint(x: 29.59, y: 19.86), controlPoint1: CGPoint(x: 25.25, y: 29.55), controlPoint2: CGPoint(x: 29.59, y: 25.21))
            bezierPath.addCurve(to: CGPoint(x: 19.9, y: 10.17), controlPoint1: CGPoint(x: 29.59, y: 14.51), controlPoint2: CGPoint(x: 25.25, y: 10.17))
            bezierPath.addLine(to: CGPoint(x: 19.9, y: 10.17))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 32.43, y: 9.57))
            bezierPath.addCurve(to: CGPoint(x: 30.23, y: 11.77), controlPoint1: CGPoint(x: 32.43, y: 10.79), controlPoint2: CGPoint(x: 31.44, y: 11.77))
            bezierPath.addCurve(to: CGPoint(x: 28.03, y: 9.57), controlPoint1: CGPoint(x: 29.01, y: 11.77), controlPoint2: CGPoint(x: 28.03, y: 10.79))
            bezierPath.addCurve(to: CGPoint(x: 30.23, y: 7.38), controlPoint1: CGPoint(x: 28.03, y: 8.36), controlPoint2: CGPoint(x: 29.01, y: 7.38))
            bezierPath.addCurve(to: CGPoint(x: 32.43, y: 9.57), controlPoint1: CGPoint(x: 31.44, y: 7.38), controlPoint2: CGPoint(x: 32.43, y: 8.36))
            bezierPath.close()
            fillColor.setFill()
            bezierPath.fill()
            
            context.restoreGState()
            
        }
        
        @objc dynamic class func drawVK(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)) {
            //// General Declarations
            let context = UIGraphicsGetCurrentContext()!
            
            //// Resize to Target Frame
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 40, height: 40), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 40, y: resizedFrame.height / 40)
            
            
            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 32.57, y: 19.79))
            bezierPath.addCurve(to: CGPoint(x: 38.07, y: 10.51), controlPoint1: CGPoint(x: 32.57, y: 19.79), controlPoint2: CGPoint(x: 37.57, y: 12.8))
            bezierPath.addCurve(to: CGPoint(x: 37.01, y: 9.23), controlPoint1: CGPoint(x: 38.24, y: 9.69), controlPoint2: CGPoint(x: 37.87, y: 9.23))
            bezierPath.addCurve(to: CGPoint(x: 32.67, y: 9.23), controlPoint1: CGPoint(x: 37.01, y: 9.23), controlPoint2: CGPoint(x: 34.13, y: 9.23))
            bezierPath.addCurve(to: CGPoint(x: 31.01, y: 10.28), controlPoint1: CGPoint(x: 31.67, y: 9.23), controlPoint2: CGPoint(x: 31.31, y: 9.66))
            bezierPath.addCurve(to: CGPoint(x: 25.8, y: 18.34), controlPoint1: CGPoint(x: 31.01, y: 10.28), controlPoint2: CGPoint(x: 28.66, y: 15.23))
            bezierPath.addCurve(to: CGPoint(x: 23.91, y: 19.66), controlPoint1: CGPoint(x: 24.89, y: 19.35), controlPoint2: CGPoint(x: 24.42, y: 19.66))
            bezierPath.addCurve(to: CGPoint(x: 23.32, y: 18.41), controlPoint1: CGPoint(x: 23.5, y: 19.66), controlPoint2: CGPoint(x: 23.32, y: 19.32))
            bezierPath.addLine(to: CGPoint(x: 23.32, y: 10.44))
            bezierPath.addCurve(to: CGPoint(x: 22.25, y: 9), controlPoint1: CGPoint(x: 23.32, y: 9.33), controlPoint2: CGPoint(x: 23.18, y: 9))
            bezierPath.addLine(to: CGPoint(x: 15.29, y: 9))
            bezierPath.addCurve(to: CGPoint(x: 14.43, y: 9.72), controlPoint1: CGPoint(x: 14.76, y: 9), controlPoint2: CGPoint(x: 14.43, y: 9.31))
            bezierPath.addCurve(to: CGPoint(x: 16.05, y: 13.85), controlPoint1: CGPoint(x: 14.43, y: 10.77), controlPoint2: CGPoint(x: 16.05, y: 11.01))
            bezierPath.addLine(to: CGPoint(x: 16.05, y: 19.72))
            bezierPath.addCurve(to: CGPoint(x: 15.42, y: 21.36), controlPoint1: CGPoint(x: 16.05, y: 20.9), controlPoint2: CGPoint(x: 15.99, y: 21.36))
            bezierPath.addCurve(to: CGPoint(x: 8.39, y: 10.51), controlPoint1: CGPoint(x: 13.93, y: 21.36), controlPoint2: CGPoint(x: 10.38, y: 16.28))
            bezierPath.addCurve(to: CGPoint(x: 6.44, y: 9), controlPoint1: CGPoint(x: 8, y: 9.33), controlPoint2: CGPoint(x: 7.57, y: 9))
            bezierPath.addLine(to: CGPoint(x: 2.09, y: 9))
            bezierPath.addCurve(to: CGPoint(x: 1, y: 10.05), controlPoint1: CGPoint(x: 1.46, y: 9), controlPoint2: CGPoint(x: 1, y: 9.43))
            bezierPath.addCurve(to: CGPoint(x: 7.7, y: 23.62), controlPoint1: CGPoint(x: 1, y: 11.2), controlPoint2: CGPoint(x: 2.36, y: 16.51))
            bezierPath.addCurve(to: CGPoint(x: 20.23, y: 31), controlPoint1: CGPoint(x: 11.28, y: 28.41), controlPoint2: CGPoint(x: 15.99, y: 31))
            bezierPath.addCurve(to: CGPoint(x: 23.45, y: 29.49), controlPoint1: CGPoint(x: 22.82, y: 31), controlPoint2: CGPoint(x: 23.45, y: 30.57))
            bezierPath.addLine(to: CGPoint(x: 23.45, y: 25.82))
            bezierPath.addCurve(to: CGPoint(x: 24.34, y: 24.51), controlPoint1: CGPoint(x: 23.45, y: 24.9), controlPoint2: CGPoint(x: 23.81, y: 24.51))
            bezierPath.addCurve(to: CGPoint(x: 28.46, y: 27.1), controlPoint1: CGPoint(x: 24.94, y: 24.51), controlPoint2: CGPoint(x: 25.99, y: 24.7))
            bezierPath.addCurve(to: CGPoint(x: 33.16, y: 31), controlPoint1: CGPoint(x: 31.37, y: 29.85), controlPoint2: CGPoint(x: 31.57, y: 31))
            bezierPath.addLine(to: CGPoint(x: 38.04, y: 31))
            bezierPath.addCurve(to: CGPoint(x: 39, y: 29.95), controlPoint1: CGPoint(x: 38.54, y: 31), controlPoint2: CGPoint(x: 39, y: 30.77))
            bezierPath.addCurve(to: CGPoint(x: 35.39, y: 24.64), controlPoint1: CGPoint(x: 39, y: 28.87), controlPoint2: CGPoint(x: 37.57, y: 26.93))
            bezierPath.addCurve(to: CGPoint(x: 32.57, y: 21.59), controlPoint1: CGPoint(x: 34.49, y: 23.46), controlPoint2: CGPoint(x: 33.03, y: 22.18))
            bezierPath.addCurve(to: CGPoint(x: 32.57, y: 19.79), controlPoint1: CGPoint(x: 31.9, y: 20.9), controlPoint2: CGPoint(x: 32.1, y: 20.51))
            bezierPath.close()
            bezierPath.usesEvenOddFillRule = true
            fillColor.setFill()
            bezierPath.fill()
            
            context.restoreGState()
        }
        
        @objc dynamic class func drawWhatsapp(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)) {
            //// General Declarations
            let context = UIGraphicsGetCurrentContext()!
            
            //// Resize to Target Frame
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 40, height: 40), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 40, y: resizedFrame.height / 40)
            
            
            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 28.52, y: 22.97))
            bezierPath.addCurve(to: CGPoint(x: 25.54, y: 21.56), controlPoint1: CGPoint(x: 28.08, y: 22.76), controlPoint2: CGPoint(x: 25.94, y: 21.71))
            bezierPath.addCurve(to: CGPoint(x: 24.56, y: 21.78), controlPoint1: CGPoint(x: 25.14, y: 21.42), controlPoint2: CGPoint(x: 24.85, y: 21.35))
            bezierPath.addCurve(to: CGPoint(x: 23.18, y: 23.48), controlPoint1: CGPoint(x: 24.27, y: 22.21), controlPoint2: CGPoint(x: 23.44, y: 23.19))
            bezierPath.addCurve(to: CGPoint(x: 22.24, y: 23.59), controlPoint1: CGPoint(x: 22.93, y: 23.77), controlPoint2: CGPoint(x: 22.68, y: 23.81))
            bezierPath.addCurve(to: CGPoint(x: 18.74, y: 21.44), controlPoint1: CGPoint(x: 21.81, y: 23.37), controlPoint2: CGPoint(x: 20.4, y: 22.91))
            bezierPath.addCurve(to: CGPoint(x: 16.32, y: 18.44), controlPoint1: CGPoint(x: 17.44, y: 20.29), controlPoint2: CGPoint(x: 16.57, y: 18.87))
            bezierPath.addCurve(to: CGPoint(x: 16.51, y: 17.55), controlPoint1: CGPoint(x: 16.06, y: 18), controlPoint2: CGPoint(x: 16.29, y: 17.77))
            bezierPath.addCurve(to: CGPoint(x: 17.16, y: 16.79), controlPoint1: CGPoint(x: 16.7, y: 17.36), controlPoint2: CGPoint(x: 16.94, y: 17.05))
            bezierPath.addCurve(to: CGPoint(x: 17.6, y: 16.07), controlPoint1: CGPoint(x: 17.38, y: 16.54), controlPoint2: CGPoint(x: 17.45, y: 16.36))
            bezierPath.addCurve(to: CGPoint(x: 17.56, y: 15.31), controlPoint1: CGPoint(x: 17.74, y: 15.78), controlPoint2: CGPoint(x: 17.67, y: 15.53))
            bezierPath.addCurve(to: CGPoint(x: 16.22, y: 12.09), controlPoint1: CGPoint(x: 17.45, y: 15.09), controlPoint2: CGPoint(x: 16.58, y: 12.96))
            bezierPath.addCurve(to: CGPoint(x: 15.24, y: 11.35), controlPoint1: CGPoint(x: 15.86, y: 11.25), controlPoint2: CGPoint(x: 15.51, y: 11.36))
            bezierPath.addCurve(to: CGPoint(x: 14.4, y: 11.33), controlPoint1: CGPoint(x: 14.98, y: 11.34), controlPoint2: CGPoint(x: 14.69, y: 11.33))
            bezierPath.addCurve(to: CGPoint(x: 13.24, y: 11.88), controlPoint1: CGPoint(x: 14.11, y: 11.33), controlPoint2: CGPoint(x: 13.64, y: 11.44))
            bezierPath.addCurve(to: CGPoint(x: 11.72, y: 15.49), controlPoint1: CGPoint(x: 12.84, y: 12.31), controlPoint2: CGPoint(x: 11.72, y: 13.36))
            bezierPath.addCurve(to: CGPoint(x: 13.5, y: 19.97), controlPoint1: CGPoint(x: 11.72, y: 17.62), controlPoint2: CGPoint(x: 13.28, y: 19.68))
            bezierPath.addCurve(to: CGPoint(x: 20.93, y: 26.52), controlPoint1: CGPoint(x: 13.71, y: 20.26), controlPoint2: CGPoint(x: 16.57, y: 24.64))
            bezierPath.addCurve(to: CGPoint(x: 23.42, y: 27.43), controlPoint1: CGPoint(x: 21.97, y: 26.96), controlPoint2: CGPoint(x: 22.78, y: 27.23))
            bezierPath.addCurve(to: CGPoint(x: 26.16, y: 27.6), controlPoint1: CGPoint(x: 24.46, y: 27.76), controlPoint2: CGPoint(x: 25.41, y: 27.71))
            bezierPath.addCurve(to: CGPoint(x: 29.1, y: 25.54), controlPoint1: CGPoint(x: 27, y: 27.48), controlPoint2: CGPoint(x: 28.74, y: 26.55))
            bezierPath.addCurve(to: CGPoint(x: 29.35, y: 23.48), controlPoint1: CGPoint(x: 29.46, y: 24.53), controlPoint2: CGPoint(x: 29.46, y: 23.66))
            bezierPath.addCurve(to: CGPoint(x: 28.52, y: 22.97), controlPoint1: CGPoint(x: 29.24, y: 23.3), controlPoint2: CGPoint(x: 28.95, y: 23.19))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 20.57, y: 33.77))
            bezierPath.addLine(to: CGPoint(x: 20.57, y: 33.77))
            bezierPath.addCurve(to: CGPoint(x: 13.2, y: 31.76), controlPoint1: CGPoint(x: 17.97, y: 33.77), controlPoint2: CGPoint(x: 15.42, y: 33.07))
            bezierPath.addLine(to: CGPoint(x: 12.67, y: 31.45))
            bezierPath.addLine(to: CGPoint(x: 7.18, y: 32.88))
            bezierPath.addLine(to: CGPoint(x: 8.65, y: 27.56))
            bezierPath.addLine(to: CGPoint(x: 8.3, y: 27.01))
            bezierPath.addCurve(to: CGPoint(x: 6.09, y: 19.34), controlPoint1: CGPoint(x: 6.85, y: 24.72), controlPoint2: CGPoint(x: 6.09, y: 22.07))
            bezierPath.addCurve(to: CGPoint(x: 20.58, y: 4.93), controlPoint1: CGPoint(x: 6.09, y: 11.4), controlPoint2: CGPoint(x: 12.59, y: 4.93))
            bezierPath.addCurve(to: CGPoint(x: 30.82, y: 9.16), controlPoint1: CGPoint(x: 24.45, y: 4.93), controlPoint2: CGPoint(x: 28.08, y: 6.43))
            bezierPath.addCurve(to: CGPoint(x: 35.06, y: 19.35), controlPoint1: CGPoint(x: 33.55, y: 11.88), controlPoint2: CGPoint(x: 35.06, y: 15.5))
            bezierPath.addCurve(to: CGPoint(x: 20.57, y: 33.77), controlPoint1: CGPoint(x: 35.05, y: 27.3), controlPoint2: CGPoint(x: 28.56, y: 33.77))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 32.9, y: 7.09))
            bezierPath.addCurve(to: CGPoint(x: 20.57, y: 2), controlPoint1: CGPoint(x: 29.61, y: 3.81), controlPoint2: CGPoint(x: 25.23, y: 2))
            bezierPath.addCurve(to: CGPoint(x: 3.15, y: 19.34), controlPoint1: CGPoint(x: 10.97, y: 2), controlPoint2: CGPoint(x: 3.15, y: 9.78))
            bezierPath.addCurve(to: CGPoint(x: 5.47, y: 28.01), controlPoint1: CGPoint(x: 3.14, y: 22.4), controlPoint2: CGPoint(x: 3.95, y: 25.38))
            bezierPath.addLine(to: CGPoint(x: 3, y: 37))
            bezierPath.addLine(to: CGPoint(x: 12.24, y: 34.59))
            bezierPath.addCurve(to: CGPoint(x: 20.57, y: 36.7), controlPoint1: CGPoint(x: 14.78, y: 35.97), controlPoint2: CGPoint(x: 17.65, y: 36.7))
            bezierPath.addLine(to: CGPoint(x: 20.57, y: 36.7))
            bezierPath.addLine(to: CGPoint(x: 20.57, y: 36.7))
            bezierPath.addCurve(to: CGPoint(x: 38, y: 19.36), controlPoint1: CGPoint(x: 30.18, y: 36.7), controlPoint2: CGPoint(x: 38, y: 28.92))
            bezierPath.addCurve(to: CGPoint(x: 32.9, y: 7.09), controlPoint1: CGPoint(x: 38, y: 14.72), controlPoint2: CGPoint(x: 36.19, y: 10.36))
            bezierPath.close()
            bezierPath.usesEvenOddFillRule = true
            fillColor.setFill()
            bezierPath.fill()
            
            context.restoreGState()
            
        }
        
        @objc dynamic class func drawTelegram(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 40, height: 40), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)) {
            //// General Declarations
            let context = UIGraphicsGetCurrentContext()!
            
            //// Resize to Target Frame
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 40, height: 40), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 40, y: resizedFrame.height / 40)
            
            
            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 35.15, y: 4.5))
            bezierPath.addCurve(to: CGPoint(x: 33.94, y: 4.79), controlPoint1: CGPoint(x: 34.74, y: 4.51), controlPoint2: CGPoint(x: 34.32, y: 4.62))
            bezierPath.addCurve(to: CGPoint(x: 18.74, y: 10.7), controlPoint1: CGPoint(x: 33.25, y: 5.06), controlPoint2: CGPoint(x: 26, y: 7.88))
            bezierPath.addCurve(to: CGPoint(x: 8.69, y: 14.6), controlPoint1: CGPoint(x: 15.11, y: 12.12), controlPoint2: CGPoint(x: 11.49, y: 13.52))
            bezierPath.addCurve(to: CGPoint(x: 3.67, y: 16.54), controlPoint1: CGPoint(x: 5.9, y: 15.69), controlPoint2: CGPoint(x: 3.87, y: 16.47))
            bezierPath.addCurve(to: CGPoint(x: 1.4, y: 17.91), controlPoint1: CGPoint(x: 3.01, y: 16.77), controlPoint2: CGPoint(x: 2.05, y: 17.15))
            bezierPath.addCurve(to: CGPoint(x: 1.12, y: 19.55), controlPoint1: CGPoint(x: 1.08, y: 18.28), controlPoint2: CGPoint(x: 0.84, y: 18.97))
            bezierPath.addCurve(to: CGPoint(x: 2.72, y: 20.75), controlPoint1: CGPoint(x: 1.41, y: 20.13), controlPoint2: CGPoint(x: 1.95, y: 20.46))
            bezierPath.addLine(to: CGPoint(x: 2.74, y: 20.76))
            bezierPath.addLine(to: CGPoint(x: 2.76, y: 20.77))
            bezierPath.addCurve(to: CGPoint(x: 10.35, y: 23.15), controlPoint1: CGPoint(x: 5.56, y: 21.64), controlPoint2: CGPoint(x: 9.78, y: 22.97))
            bezierPath.addCurve(to: CGPoint(x: 13.25, y: 32.72), controlPoint1: CGPoint(x: 10.5, y: 23.63), controlPoint2: CGPoint(x: 12.28, y: 29.53))
            bezierPath.addCurve(to: CGPoint(x: 14.93, y: 33.73), controlPoint1: CGPoint(x: 13.5, y: 33.38), controlPoint2: CGPoint(x: 14.24, y: 33.82))
            bezierPath.addCurve(to: CGPoint(x: 15.53, y: 33.67), controlPoint1: CGPoint(x: 15.05, y: 33.73), controlPoint2: CGPoint(x: 15.28, y: 33.73))
            bezierPath.addCurve(to: CGPoint(x: 16.83, y: 32.94), controlPoint1: CGPoint(x: 15.9, y: 33.58), controlPoint2: CGPoint(x: 16.38, y: 33.37))
            bezierPath.addLine(to: CGPoint(x: 16.83, y: 32.94))
            bezierPath.addCurve(to: CGPoint(x: 20.46, y: 29.4), controlPoint1: CGPoint(x: 17.48, y: 32.33), controlPoint2: CGPoint(x: 19.78, y: 30.07))
            bezierPath.addLine(to: CGPoint(x: 27.96, y: 34.96))
            bezierPath.addLine(to: CGPoint(x: 27.99, y: 34.98))
            bezierPath.addCurve(to: CGPoint(x: 29.57, y: 35.49), controlPoint1: CGPoint(x: 27.99, y: 34.98), controlPoint2: CGPoint(x: 28.67, y: 35.43))
            bezierPath.addCurve(to: CGPoint(x: 31.04, y: 35.09), controlPoint1: CGPoint(x: 30.01, y: 35.52), controlPoint2: CGPoint(x: 30.56, y: 35.44))
            bezierPath.addCurve(to: CGPoint(x: 32.02, y: 33.42), controlPoint1: CGPoint(x: 31.51, y: 34.75), controlPoint2: CGPoint(x: 31.85, y: 34.17))
            bezierPath.addCurve(to: CGPoint(x: 37.28, y: 8.61), controlPoint1: CGPoint(x: 32.61, y: 30.86), controlPoint2: CGPoint(x: 36.6, y: 11.79))
            bezierPath.addCurve(to: CGPoint(x: 36.71, y: 5.03), controlPoint1: CGPoint(x: 37.71, y: 6.99), controlPoint2: CGPoint(x: 37.51, y: 5.73))
            bezierPath.addCurve(to: CGPoint(x: 35.33, y: 4.5), controlPoint1: CGPoint(x: 36.3, y: 4.68), controlPoint2: CGPoint(x: 35.82, y: 4.52))
            bezierPath.addCurve(to: CGPoint(x: 35.15, y: 4.5), controlPoint1: CGPoint(x: 35.27, y: 4.5), controlPoint2: CGPoint(x: 35.21, y: 4.5))
            bezierPath.addLine(to: CGPoint(x: 35.15, y: 4.5))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 35.24, y: 6.07))
            bezierPath.addCurve(to: CGPoint(x: 35.68, y: 6.21), controlPoint1: CGPoint(x: 35.43, y: 6.07), controlPoint2: CGPoint(x: 35.59, y: 6.12))
            bezierPath.addCurve(to: CGPoint(x: 35.77, y: 8.23), controlPoint1: CGPoint(x: 35.88, y: 6.38), controlPoint2: CGPoint(x: 36.13, y: 6.89))
            bezierPath.addCurve(to: CGPoint(x: 30.51, y: 33.07), controlPoint1: CGPoint(x: 33.84, y: 16.86), controlPoint2: CGPoint(x: 32.16, y: 25.68))
            bezierPath.addCurve(to: CGPoint(x: 30.12, y: 33.83), controlPoint1: CGPoint(x: 30.4, y: 33.57), controlPoint2: CGPoint(x: 30.24, y: 33.75))
            bezierPath.addCurve(to: CGPoint(x: 29.67, y: 33.94), controlPoint1: CGPoint(x: 30, y: 33.92), controlPoint2: CGPoint(x: 29.87, y: 33.95))
            bezierPath.addCurve(to: CGPoint(x: 28.82, y: 33.66), controlPoint1: CGPoint(x: 29.28, y: 33.91), controlPoint2: CGPoint(x: 28.84, y: 33.67))
            bezierPath.addLine(to: CGPoint(x: 16.66, y: 24.63))
            bezierPath.addCurve(to: CGPoint(x: 30.24, y: 11.88), controlPoint1: CGPoint(x: 17.86, y: 23.5), controlPoint2: CGPoint(x: 25.86, y: 15.9))
            bezierPath.addCurve(to: CGPoint(x: 29.69, y: 10.6), controlPoint1: CGPoint(x: 30.72, y: 11.42), controlPoint2: CGPoint(x: 30.33, y: 10.59))
            bezierPath.addCurve(to: CGPoint(x: 27.45, y: 11.72), controlPoint1: CGPoint(x: 28.87, y: 10.76), controlPoint2: CGPoint(x: 28.19, y: 11.35))
            bezierPath.addCurve(to: CGPoint(x: 10.91, y: 21.68), controlPoint1: CGPoint(x: 22.04, y: 14.9), controlPoint2: CGPoint(x: 11.81, y: 21.13))
            bezierPath.addCurve(to: CGPoint(x: 3.26, y: 19.29), controlPoint1: CGPoint(x: 10.44, y: 21.53), controlPoint2: CGPoint(x: 6.11, y: 20.17))
            bezierPath.addCurve(to: CGPoint(x: 2.59, y: 18.92), controlPoint1: CGPoint(x: 2.81, y: 19.11), controlPoint2: CGPoint(x: 2.65, y: 18.97))
            bezierPath.addCurve(to: CGPoint(x: 2.59, y: 18.92), controlPoint1: CGPoint(x: 2.59, y: 18.92), controlPoint2: CGPoint(x: 2.59, y: 18.92))
            bezierPath.addCurve(to: CGPoint(x: 4.19, y: 18.01), controlPoint1: CGPoint(x: 2.8, y: 18.67), controlPoint2: CGPoint(x: 3.67, y: 18.19))
            bezierPath.addCurve(to: CGPoint(x: 9.25, y: 16.06), controlPoint1: CGPoint(x: 4.57, y: 17.87), controlPoint2: CGPoint(x: 6.46, y: 17.14))
            bezierPath.addCurve(to: CGPoint(x: 19.3, y: 12.16), controlPoint1: CGPoint(x: 12.05, y: 14.98), controlPoint2: CGPoint(x: 15.67, y: 13.57))
            bezierPath.addCurve(to: CGPoint(x: 34.56, y: 6.23), controlPoint1: CGPoint(x: 24.39, y: 10.19), controlPoint2: CGPoint(x: 29.48, y: 8.21))
            bezierPath.addCurve(to: CGPoint(x: 35.24, y: 6.07), controlPoint1: CGPoint(x: 34.81, y: 6.11), controlPoint2: CGPoint(x: 35.04, y: 6.06))
            bezierPath.addLine(to: CGPoint(x: 35.24, y: 6.07))
            bezierPath.close()
            bezierPath.move(to: CGPoint(x: 16.15, y: 26.2))
            bezierPath.addLine(to: CGPoint(x: 19.19, y: 28.45))
            bezierPath.addCurve(to: CGPoint(x: 15.79, y: 31.79), controlPoint1: CGPoint(x: 18.35, y: 29.29), controlPoint2: CGPoint(x: 16.35, y: 31.26))
            bezierPath.addLine(to: CGPoint(x: 16.15, y: 26.2))
            bezierPath.addLine(to: CGPoint(x: 16.15, y: 26.2))
            bezierPath.close()
            fillColor.setFill()
            bezierPath.fill()
            
            context.restoreGState()
            
        }
        
        @objc dynamic class func drawFacebook(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 41, height: 40), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)) {
            //// General Declarations
            let context = UIGraphicsGetCurrentContext()!
            
            //// Resize to Target Frame
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 41, height: 40), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 41, y: resizedFrame.height / 40)
            
            
            //// Bezier Drawing
            let bezierPath = UIBezierPath()
            bezierPath.move(to: CGPoint(x: 22.36, y: 21.49))
            bezierPath.addLine(to: CGPoint(x: 27.52, y: 21.49))
            bezierPath.addLine(to: CGPoint(x: 28.29, y: 15.45))
            bezierPath.addLine(to: CGPoint(x: 22.36, y: 15.45))
            bezierPath.addLine(to: CGPoint(x: 22.36, y: 11.59))
            bezierPath.addCurve(to: CGPoint(x: 25.33, y: 8.65), controlPoint1: CGPoint(x: 22.36, y: 9.84), controlPoint2: CGPoint(x: 22.84, y: 8.65))
            bezierPath.addLine(to: CGPoint(x: 28.5, y: 8.64))
            bezierPath.addLine(to: CGPoint(x: 28.5, y: 3.24))
            bezierPath.addCurve(to: CGPoint(x: 23.88, y: 3), controlPoint1: CGPoint(x: 27.95, y: 3.16), controlPoint2: CGPoint(x: 26.07, y: 3))
            bezierPath.addCurve(to: CGPoint(x: 16.17, y: 10.99), controlPoint1: CGPoint(x: 19.3, y: 3), controlPoint2: CGPoint(x: 16.17, y: 5.82))
            bezierPath.addLine(to: CGPoint(x: 16.17, y: 15.45))
            bezierPath.addLine(to: CGPoint(x: 11, y: 15.45))
            bezierPath.addLine(to: CGPoint(x: 11, y: 21.49))
            bezierPath.addLine(to: CGPoint(x: 16.17, y: 21.49))
            bezierPath.addLine(to: CGPoint(x: 16.17, y: 37))
            bezierPath.addLine(to: CGPoint(x: 22.36, y: 37))
            bezierPath.addLine(to: CGPoint(x: 22.36, y: 21.49))
            bezierPath.close()
            bezierPath.usesEvenOddFillRule = true
            fillColor.setFill()
            bezierPath.fill()
            
            context.restoreGState()
            
        }
        
        @objc dynamic class func drawViber(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 41, height: 40), resizing: ResizingBehavior = .aspectFit, fillColor: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000)) {
            //// General Declarations
            let context = UIGraphicsGetCurrentContext()!
            
            //// Resize to Target Frame
            context.saveGState()
            let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 41, height: 40), target: targetFrame)
            context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
            context.scaleBy(x: resizedFrame.width / 41, y: resizedFrame.height / 40)
            
            
            //// Bezier 5 Drawing
            let bezier5Path = UIBezierPath()
            bezier5Path.move(to: CGPoint(x: 34, y: 16.95))
            bezier5Path.addCurve(to: CGPoint(x: 23.83, y: 6), controlPoint1: CGPoint(x: 34.05, y: 11.59), controlPoint2: CGPoint(x: 29.49, y: 6.68))
            bezier5Path.addCurve(to: CGPoint(x: 23.47, y: 5.94), controlPoint1: CGPoint(x: 23.72, y: 5.98), controlPoint2: CGPoint(x: 23.6, y: 5.96))
            bezier5Path.addCurve(to: CGPoint(x: 22.61, y: 5.85), controlPoint1: CGPoint(x: 23.19, y: 5.9), controlPoint2: CGPoint(x: 22.9, y: 5.85))
            bezier5Path.addCurve(to: CGPoint(x: 21.06, y: 7.15), controlPoint1: CGPoint(x: 21.45, y: 5.85), controlPoint2: CGPoint(x: 21.14, y: 6.66))
            bezier5Path.addCurve(to: CGPoint(x: 21.28, y: 8.33), controlPoint1: CGPoint(x: 20.98, y: 7.62), controlPoint2: CGPoint(x: 21.05, y: 8.02))
            bezier5Path.addCurve(to: CGPoint(x: 22.88, y: 9.02), controlPoint1: CGPoint(x: 21.67, y: 8.85), controlPoint2: CGPoint(x: 22.34, y: 8.94))
            bezier5Path.addCurve(to: CGPoint(x: 23.32, y: 9.09), controlPoint1: CGPoint(x: 23.04, y: 9.04), controlPoint2: CGPoint(x: 23.19, y: 9.06))
            bezier5Path.addCurve(to: CGPoint(x: 30.94, y: 17.04), controlPoint1: CGPoint(x: 28.4, y: 10.22), controlPoint2: CGPoint(x: 30.11, y: 12.01))
            bezier5Path.addCurve(to: CGPoint(x: 30.98, y: 17.48), controlPoint1: CGPoint(x: 30.96, y: 17.17), controlPoint2: CGPoint(x: 30.97, y: 17.32))
            bezier5Path.addCurve(to: CGPoint(x: 32.44, y: 19.33), controlPoint1: CGPoint(x: 31.02, y: 18.08), controlPoint2: CGPoint(x: 31.1, y: 19.33))
            bezier5Path.addLine(to: CGPoint(x: 32.44, y: 19.33))
            bezier5Path.addCurve(to: CGPoint(x: 32.8, y: 19.3), controlPoint1: CGPoint(x: 32.55, y: 19.33), controlPoint2: CGPoint(x: 32.68, y: 19.32))
            bezier5Path.addCurve(to: CGPoint(x: 34, y: 17.42), controlPoint1: CGPoint(x: 34.05, y: 19.11), controlPoint2: CGPoint(x: 34.02, y: 17.97))
            bezier5Path.addCurve(to: CGPoint(x: 34, y: 17.02), controlPoint1: CGPoint(x: 33.99, y: 17.26), controlPoint2: CGPoint(x: 33.99, y: 17.12))
            bezier5Path.addCurve(to: CGPoint(x: 34, y: 16.95), controlPoint1: CGPoint(x: 34, y: 17), controlPoint2: CGPoint(x: 34, y: 16.97))
            bezier5Path.close()
            bezier5Path.move(to: CGPoint(x: 22.28, y: 4.03))
            bezier5Path.addCurve(to: CGPoint(x: 22.69, y: 4.07), controlPoint1: CGPoint(x: 22.43, y: 4.04), controlPoint2: CGPoint(x: 22.57, y: 4.05))
            bezier5Path.addCurve(to: CGPoint(x: 35.93, y: 17.71), controlPoint1: CGPoint(x: 31.03, y: 5.35), controlPoint2: CGPoint(x: 34.87, y: 9.31))
            bezier5Path.addCurve(to: CGPoint(x: 35.95, y: 18.22), controlPoint1: CGPoint(x: 35.95, y: 17.86), controlPoint2: CGPoint(x: 35.95, y: 18.03))
            bezier5Path.addCurve(to: CGPoint(x: 37.45, y: 20.27), controlPoint1: CGPoint(x: 35.97, y: 18.87), controlPoint2: CGPoint(x: 35.99, y: 20.24))
            bezier5Path.addLine(to: CGPoint(x: 37.5, y: 20.27))
            bezier5Path.addCurve(to: CGPoint(x: 38.59, y: 19.85), controlPoint1: CGPoint(x: 37.96, y: 20.27), controlPoint2: CGPoint(x: 38.33, y: 20.13))
            bezier5Path.addCurve(to: CGPoint(x: 38.99, y: 18.1), controlPoint1: CGPoint(x: 39.04, y: 19.38), controlPoint2: CGPoint(x: 39.01, y: 18.67))
            bezier5Path.addCurve(to: CGPoint(x: 38.98, y: 17.71), controlPoint1: CGPoint(x: 38.98, y: 17.96), controlPoint2: CGPoint(x: 38.98, y: 17.82))
            bezier5Path.addCurve(to: CGPoint(x: 23.05, y: 1.02), controlPoint1: CGPoint(x: 39.08, y: 9.11), controlPoint2: CGPoint(x: 31.64, y: 1.31))
            bezier5Path.addCurve(to: CGPoint(x: 22.95, y: 1.03), controlPoint1: CGPoint(x: 23.01, y: 1.02), controlPoint2: CGPoint(x: 22.98, y: 1.02))
            bezier5Path.addCurve(to: CGPoint(x: 22.84, y: 1.03), controlPoint1: CGPoint(x: 22.93, y: 1.03), controlPoint2: CGPoint(x: 22.9, y: 1.03))
            bezier5Path.addCurve(to: CGPoint(x: 22.54, y: 1.02), controlPoint1: CGPoint(x: 22.76, y: 1.03), controlPoint2: CGPoint(x: 22.65, y: 1.03))
            bezier5Path.addCurve(to: CGPoint(x: 22.1, y: 1), controlPoint1: CGPoint(x: 22.41, y: 1.01), controlPoint2: CGPoint(x: 22.25, y: 1))
            bezier5Path.addCurve(to: CGPoint(x: 20.44, y: 2.55), controlPoint1: CGPoint(x: 20.73, y: 1), controlPoint2: CGPoint(x: 20.47, y: 1.97))
            bezier5Path.addCurve(to: CGPoint(x: 22.28, y: 4.03), controlPoint1: CGPoint(x: 20.36, y: 3.89), controlPoint2: CGPoint(x: 21.66, y: 3.99))
            bezier5Path.close()
            bezier5Path.move(to: CGPoint(x: 35.53, y: 28.58))
            bezier5Path.addCurve(to: CGPoint(x: 35, y: 28.17), controlPoint1: CGPoint(x: 35.35, y: 28.44), controlPoint2: CGPoint(x: 35.17, y: 28.3))
            bezier5Path.addCurve(to: CGPoint(x: 32.18, y: 26.1), controlPoint1: CGPoint(x: 34.09, y: 27.43), controlPoint2: CGPoint(x: 33.12, y: 26.76))
            bezier5Path.addCurve(to: CGPoint(x: 31.6, y: 25.7), controlPoint1: CGPoint(x: 31.98, y: 25.97), controlPoint2: CGPoint(x: 31.79, y: 25.83))
            bezier5Path.addCurve(to: CGPoint(x: 28.3, y: 24.44), controlPoint1: CGPoint(x: 30.4, y: 24.85), controlPoint2: CGPoint(x: 29.32, y: 24.44))
            bezier5Path.addCurve(to: CGPoint(x: 24.74, y: 26.7), controlPoint1: CGPoint(x: 26.92, y: 24.44), controlPoint2: CGPoint(x: 25.73, y: 25.2))
            bezier5Path.addCurve(to: CGPoint(x: 23.12, y: 27.68), controlPoint1: CGPoint(x: 24.3, y: 27.36), controlPoint2: CGPoint(x: 23.77, y: 27.68))
            bezier5Path.addCurve(to: CGPoint(x: 21.81, y: 27.36), controlPoint1: CGPoint(x: 22.73, y: 27.68), controlPoint2: CGPoint(x: 22.29, y: 27.57))
            bezier5Path.addCurve(to: CGPoint(x: 13.59, y: 19.35), controlPoint1: CGPoint(x: 17.93, y: 25.6), controlPoint2: CGPoint(x: 15.17, y: 22.91))
            bezier5Path.addCurve(to: CGPoint(x: 14.42, y: 15.59), controlPoint1: CGPoint(x: 12.82, y: 17.63), controlPoint2: CGPoint(x: 13.07, y: 16.51))
            bezier5Path.addCurve(to: CGPoint(x: 16.5, y: 12.26), controlPoint1: CGPoint(x: 15.18, y: 15.07), controlPoint2: CGPoint(x: 16.6, y: 14.11))
            bezier5Path.addCurve(to: CGPoint(x: 9.8, y: 3.12), controlPoint1: CGPoint(x: 16.39, y: 10.16), controlPoint2: CGPoint(x: 11.75, y: 3.84))
            bezier5Path.addCurve(to: CGPoint(x: 7.22, y: 3.11), controlPoint1: CGPoint(x: 8.97, y: 2.82), controlPoint2: CGPoint(x: 8.11, y: 2.81))
            bezier5Path.addCurve(to: CGPoint(x: 2.56, y: 6.95), controlPoint1: CGPoint(x: 4.97, y: 3.87), controlPoint2: CGPoint(x: 3.36, y: 5.19))
            bezier5Path.addCurve(to: CGPoint(x: 2.66, y: 12.7), controlPoint1: CGPoint(x: 1.78, y: 8.64), controlPoint2: CGPoint(x: 1.82, y: 10.63))
            bezier5Path.addCurve(to: CGPoint(x: 12.84, y: 28.19), controlPoint1: CGPoint(x: 5.09, y: 18.67), controlPoint2: CGPoint(x: 8.52, y: 23.89))
            bezier5Path.addCurve(to: CGPoint(x: 28.27, y: 38.44), controlPoint1: CGPoint(x: 17.06, y: 32.4), controlPoint2: CGPoint(x: 22.26, y: 35.85))
            bezier5Path.addCurve(to: CGPoint(x: 29.8, y: 38.9), controlPoint1: CGPoint(x: 28.82, y: 38.68), controlPoint2: CGPoint(x: 29.39, y: 38.8))
            bezier5Path.addCurve(to: CGPoint(x: 30.15, y: 38.98), controlPoint1: CGPoint(x: 29.94, y: 38.93), controlPoint2: CGPoint(x: 30.07, y: 38.95))
            bezier5Path.addCurve(to: CGPoint(x: 30.3, y: 39), controlPoint1: CGPoint(x: 30.2, y: 38.99), controlPoint2: CGPoint(x: 30.25, y: 39))
            bezier5Path.addLine(to: CGPoint(x: 30.35, y: 39))
            bezier5Path.addLine(to: CGPoint(x: 30.35, y: 39))
            bezier5Path.addCurve(to: CGPoint(x: 37.63, y: 33.46), controlPoint1: CGPoint(x: 33.18, y: 39), controlPoint2: CGPoint(x: 36.58, y: 36.41))
            bezier5Path.addCurve(to: CGPoint(x: 35.53, y: 28.58), controlPoint1: CGPoint(x: 38.54, y: 30.88), controlPoint2: CGPoint(x: 36.87, y: 29.61))
            bezier5Path.close()
            bezier5Path.move(to: CGPoint(x: 23.53, y: 10.86))
            bezier5Path.addCurve(to: CGPoint(x: 21.68, y: 11.93), controlPoint1: CGPoint(x: 23.05, y: 10.87), controlPoint2: CGPoint(x: 22.04, y: 10.9))
            bezier5Path.addCurve(to: CGPoint(x: 21.74, y: 13.16), controlPoint1: CGPoint(x: 21.52, y: 12.41), controlPoint2: CGPoint(x: 21.54, y: 12.82))
            bezier5Path.addCurve(to: CGPoint(x: 23.14, y: 13.9), controlPoint1: CGPoint(x: 22.04, y: 13.67), controlPoint2: CGPoint(x: 22.62, y: 13.82))
            bezier5Path.addCurve(to: CGPoint(x: 26.21, y: 17.21), controlPoint1: CGPoint(x: 25.04, y: 14.21), controlPoint2: CGPoint(x: 26.02, y: 15.26))
            bezier5Path.addCurve(to: CGPoint(x: 27.7, y: 18.75), controlPoint1: CGPoint(x: 26.3, y: 18.12), controlPoint2: CGPoint(x: 26.91, y: 18.75))
            bezier5Path.addLine(to: CGPoint(x: 27.7, y: 18.75))
            bezier5Path.addCurve(to: CGPoint(x: 27.88, y: 18.74), controlPoint1: CGPoint(x: 27.76, y: 18.75), controlPoint2: CGPoint(x: 27.82, y: 18.75))
            bezier5Path.addCurve(to: CGPoint(x: 29.24, y: 16.68), controlPoint1: CGPoint(x: 28.82, y: 18.63), controlPoint2: CGPoint(x: 29.28, y: 17.94))
            bezier5Path.addCurve(to: CGPoint(x: 27.4, y: 12.69), controlPoint1: CGPoint(x: 29.25, y: 15.37), controlPoint2: CGPoint(x: 28.57, y: 13.88))
            bezier5Path.addCurve(to: CGPoint(x: 23.53, y: 10.86), controlPoint1: CGPoint(x: 26.23, y: 11.5), controlPoint2: CGPoint(x: 24.82, y: 10.83))
            bezier5Path.close()
            fillColor.setFill()
            bezier5Path.fill()
            
            context.restoreGState()
        }
        
        @objc(SocialIconStyleKitResizingBehavior)
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
