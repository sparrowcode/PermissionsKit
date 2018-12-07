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

extension SPPermissionDraw {
    
public class PermissionPack : NSObject {

    @objc dynamic public class func drawCamera(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 1000, height: 1000), resizing: ResizingBehavior = .aspectFit, white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), light: UIColor = UIColor(red: 0.769, green: 0.847, blue: 0.984, alpha: 1.000), medium: UIColor = UIColor(red: 0.478, green: 0.663, blue: 0.973, alpha: 1.000), dark: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 1000, height: 1000), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 1000, y: resizedFrame.height / 1000)


        //// Group 2
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 62, y: 750))
        bezierPath.addLine(to: CGPoint(x: 62, y: 764))
        bezierPath.addCurve(to: CGPoint(x: 75.89, y: 778), controlPoint1: CGPoint(x: 62, y: 771.7), controlPoint2: CGPoint(x: 68.25, y: 778))
        bezierPath.addLine(to: CGPoint(x: 923.11, y: 778))
        bezierPath.addCurve(to: CGPoint(x: 937, y: 764), controlPoint1: CGPoint(x: 930.75, y: 778), controlPoint2: CGPoint(x: 937, y: 771.7))
        bezierPath.addLine(to: CGPoint(x: 937, y: 750))
        bezierPath.addLine(to: CGPoint(x: 62, y: 750))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        light.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 90, y: 764))
        bezier2Path.addLine(to: CGPoint(x: 90, y: 750))
        bezier2Path.addLine(to: CGPoint(x: 62, y: 750))
        bezier2Path.addLine(to: CGPoint(x: 62, y: 764))
        bezier2Path.addCurve(to: CGPoint(x: 76, y: 778), controlPoint1: CGPoint(x: 62, y: 771.7), controlPoint2: CGPoint(x: 68.3, y: 778))
        bezier2Path.addLine(to: CGPoint(x: 104, y: 778))
        bezier2Path.addCurve(to: CGPoint(x: 90, y: 764), controlPoint1: CGPoint(x: 96.3, y: 778), controlPoint2: CGPoint(x: 90, y: 771.7))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        white.setFill()
        bezier2Path.fill()


        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 756, y: 250, width: 139, height: 56))
        medium.setFill()
        rectanglePath.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 756.44, y: 305.51))
        bezier3Path.addLine(to: CGPoint(x: 895.33, y: 305.51))
        bezier3Path.addLine(to: CGPoint(x: 895.33, y: 249.84))
        bezier3Path.addLine(to: CGPoint(x: 756.44, y: 249.84))
        bezier3Path.addLine(to: CGPoint(x: 756.44, y: 305.51))
        bezier3Path.close()
        bezier3Path.move(to: CGPoint(x: 478.66, y: 305.51))
        bezier3Path.addLine(to: CGPoint(x: 617.55, y: 305.51))
        bezier3Path.addLine(to: CGPoint(x: 617.55, y: 277.68))
        bezier3Path.addLine(to: CGPoint(x: 478.66, y: 277.68))
        bezier3Path.addLine(to: CGPoint(x: 478.66, y: 305.51))
        bezier3Path.close()
        bezier3Path.move(to: CGPoint(x: 923.11, y: 222))
        bezier3Path.addLine(to: CGPoint(x: 450.89, y: 222))
        bezier3Path.addLine(to: CGPoint(x: 450.89, y: 277.68))
        bezier3Path.addLine(to: CGPoint(x: 75.89, y: 277.68))
        bezier3Path.addCurve(to: CGPoint(x: 62, y: 291.59), controlPoint1: CGPoint(x: 68.25, y: 277.68), controlPoint2: CGPoint(x: 62, y: 283.94))
        bezier3Path.addLine(to: CGPoint(x: 62, y: 333.35))
        bezier3Path.addLine(to: CGPoint(x: 284.22, y: 333.35))
        bezier3Path.addLine(to: CGPoint(x: 296.44, y: 352))
        bezier3Path.addCurve(to: CGPoint(x: 312, y: 347.27), controlPoint1: CGPoint(x: 300.89, y: 348.94), controlPoint2: CGPoint(x: 306.3, y: 347.27))
        bezier3Path.addLine(to: CGPoint(x: 312, y: 333.35))
        bezier3Path.addLine(to: CGPoint(x: 937, y: 333.35))
        bezier3Path.addLine(to: CGPoint(x: 937, y: 235.92))
        bezier3Path.addCurve(to: CGPoint(x: 923.11, y: 222), controlPoint1: CGPoint(x: 937, y: 228.26), controlPoint2: CGPoint(x: 930.74, y: 222))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        light.setFill()
        bezier3Path.fill()


        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 90, y: 291))
        bezier4Path.addCurve(to: CGPoint(x: 104, y: 277), controlPoint1: CGPoint(x: 90, y: 283.3), controlPoint2: CGPoint(x: 96.3, y: 277))
        bezier4Path.addLine(to: CGPoint(x: 76, y: 277))
        bezier4Path.addCurve(to: CGPoint(x: 62, y: 291), controlPoint1: CGPoint(x: 68.3, y: 277), controlPoint2: CGPoint(x: 62, y: 283.3))
        bezier4Path.addLine(to: CGPoint(x: 62, y: 333))
        bezier4Path.addLine(to: CGPoint(x: 90, y: 333))
        bezier4Path.addLine(to: CGPoint(x: 90, y: 291))
        bezier4Path.addLine(to: CGPoint(x: 90, y: 291))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        white.setFill()
        bezier4Path.fill()


        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: 62, y: 333, width: 875, height: 417))
        medium.setFill()
        rectangle2Path.fill()


        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 367, y: 347, width: 431, height: 431))
        light.setFill()
        ovalPath.fill()


        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 381.87, y: 562.5))
        bezier5Path.addCurve(to: CGPoint(x: 590, y: 347.35), controlPoint1: CGPoint(x: 381.87, y: 445.83), controlPoint2: CGPoint(x: 474.46, y: 351.05))
        bezier5Path.addCurve(to: CGPoint(x: 583.06, y: 347), controlPoint1: CGPoint(x: 587.67, y: 347.28), controlPoint2: CGPoint(x: 585.41, y: 347))
        bezier5Path.addCurve(to: CGPoint(x: 368, y: 562.5), controlPoint1: CGPoint(x: 464.28, y: 347), controlPoint2: CGPoint(x: 368, y: 443.48))
        bezier5Path.addCurve(to: CGPoint(x: 583.06, y: 778), controlPoint1: CGPoint(x: 368, y: 681.52), controlPoint2: CGPoint(x: 464.28, y: 778))
        bezier5Path.addCurve(to: CGPoint(x: 590, y: 777.65), controlPoint1: CGPoint(x: 585.41, y: 778), controlPoint2: CGPoint(x: 587.67, y: 777.73))
        bezier5Path.addCurve(to: CGPoint(x: 381.87, y: 562.5), controlPoint1: CGPoint(x: 474.46, y: 773.95), controlPoint2: CGPoint(x: 381.87, y: 679.17))
        bezier5Path.close()
        bezier5Path.usesEvenOddFillRule = true
        white.setFill()
        bezier5Path.fill()


        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 786.13, y: 562.5))
        bezier6Path.addCurve(to: CGPoint(x: 578, y: 777.65), controlPoint1: CGPoint(x: 786.13, y: 679.17), controlPoint2: CGPoint(x: 693.54, y: 773.95))
        bezier6Path.addCurve(to: CGPoint(x: 584.94, y: 778), controlPoint1: CGPoint(x: 580.32, y: 777.71), controlPoint2: CGPoint(x: 582.59, y: 778))
        bezier6Path.addCurve(to: CGPoint(x: 800, y: 562.5), controlPoint1: CGPoint(x: 703.72, y: 778), controlPoint2: CGPoint(x: 800, y: 681.52))
        bezier6Path.addCurve(to: CGPoint(x: 584.94, y: 347), controlPoint1: CGPoint(x: 800, y: 443.48), controlPoint2: CGPoint(x: 703.72, y: 347))
        bezier6Path.addCurve(to: CGPoint(x: 578, y: 347.35), controlPoint1: CGPoint(x: 582.59, y: 347), controlPoint2: CGPoint(x: 580.32, y: 347.27))
        bezier6Path.addCurve(to: CGPoint(x: 786.13, y: 562.5), controlPoint1: CGPoint(x: 693.54, y: 351.05), controlPoint2: CGPoint(x: 786.13, y: 445.83))
        bezier6Path.close()
        bezier6Path.usesEvenOddFillRule = true
        white.setFill()
        bezier6Path.fill()


        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: 408.5, y: 389.5, width: 348, height: 347))
        light.setFill()
        oval2Path.fill()


        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 436.85, y: 563))
        bezier7Path.addCurve(to: CGPoint(x: 597, y: 389.7), controlPoint1: CGPoint(x: 436.85, y: 471.61), controlPoint2: CGPoint(x: 507.4, y: 396.82))
        bezier7Path.addCurve(to: CGPoint(x: 583.08, y: 389), controlPoint1: CGPoint(x: 592.39, y: 389.34), controlPoint2: CGPoint(x: 587.78, y: 389))
        bezier7Path.addCurve(to: CGPoint(x: 409, y: 563), controlPoint1: CGPoint(x: 486.95, y: 389), controlPoint2: CGPoint(x: 409, y: 466.91))
        bezier7Path.addCurve(to: CGPoint(x: 583.08, y: 737), controlPoint1: CGPoint(x: 409, y: 659.08), controlPoint2: CGPoint(x: 486.95, y: 737))
        bezier7Path.addCurve(to: CGPoint(x: 597, y: 736.29), controlPoint1: CGPoint(x: 587.78, y: 737), controlPoint2: CGPoint(x: 592.39, y: 736.66))
        bezier7Path.addCurve(to: CGPoint(x: 436.85, y: 563), controlPoint1: CGPoint(x: 507.4, y: 729.18), controlPoint2: CGPoint(x: 436.85, y: 654.38))
        bezier7Path.close()
        bezier7Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier7Path.fill()


        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalIn: CGRect(x: 478.45, y: 458.45, width: 209.1, height: 208))
        medium.setFill()
        oval3Path.fill()


        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 506.76, y: 562.5))
        bezier8Path.addCurve(to: CGPoint(x: 597, y: 459.03), controlPoint1: CGPoint(x: 506.76, y: 509.54), controlPoint2: CGPoint(x: 546.08, y: 465.86))
        bezier8Path.addCurve(to: CGPoint(x: 583.12, y: 458), controlPoint1: CGPoint(x: 592.45, y: 458.42), controlPoint2: CGPoint(x: 587.84, y: 458))
        bezier8Path.addCurve(to: CGPoint(x: 479, y: 562.5), controlPoint1: CGPoint(x: 525.61, y: 458), controlPoint2: CGPoint(x: 479, y: 504.8))
        bezier8Path.addCurve(to: CGPoint(x: 583.12, y: 667), controlPoint1: CGPoint(x: 479, y: 620.14), controlPoint2: CGPoint(x: 525.61, y: 667))
        bezier8Path.addCurve(to: CGPoint(x: 597, y: 665.97), controlPoint1: CGPoint(x: 587.84, y: 667), controlPoint2: CGPoint(x: 592.45, y: 666.58))
        bezier8Path.addCurve(to: CGPoint(x: 506.76, y: 562.5), controlPoint1: CGPoint(x: 546.08, y: 659.12), controlPoint2: CGPoint(x: 506.76, y: 615.4))
        bezier8Path.close()
        bezier8Path.usesEvenOddFillRule = true
        white.setFill()
        bezier8Path.fill()


        //// Oval 4 Drawing
        let oval4Path = UIBezierPath(ovalIn: CGRect(x: 665.95, y: 271.05, width: 14, height: 13.9))
        dark.setFill()
        oval4Path.fill()


        //// Oval 5 Drawing
        let oval5Path = UIBezierPath(ovalIn: CGRect(x: 665.95, y: 298.05, width: 14, height: 13.9))
        dark.setFill()
        oval5Path.fill()


        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: 423, y: 222, width: 28, height: 56))
        light.setFill()
        rectangle3Path.fill()


        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(rect: CGRect(x: 76, y: 250, width: 69, height: 28))
        light.setFill()
        rectangle4Path.fill()


        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(rect: CGRect(x: 187, y: 250, width: 56, height: 28))
        light.setFill()
        rectangle5Path.fill()


        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(rect: CGRect(x: 284, y: 250, width: 111, height: 28))
        light.setFill()
        rectangle6Path.fill()


        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 215, y: 229))
        bezier9Path.addCurve(to: CGPoint(x: 187, y: 236), controlPoint1: CGPoint(x: 194, y: 229), controlPoint2: CGPoint(x: 187, y: 236))
        bezier9Path.addLine(to: CGPoint(x: 187, y: 250))
        bezier9Path.addLine(to: CGPoint(x: 243, y: 250))
        bezier9Path.addLine(to: CGPoint(x: 243, y: 236))
        bezier9Path.addCurve(to: CGPoint(x: 215, y: 229), controlPoint1: CGPoint(x: 243, y: 236), controlPoint2: CGPoint(x: 236, y: 229))
        bezier9Path.close()
        bezier9Path.usesEvenOddFillRule = true
        light.setFill()
        bezier9Path.fill()


        //// Oval 6 Drawing
        let oval6Path = UIBezierPath(ovalIn: CGRect(x: 283.9, y: 347, width: 56.1, height: 55.9))
        white.setFill()
        oval6Path.fill()


        //// Oval 7 Drawing
        let oval7Path = UIBezierPath(ovalIn: CGRect(x: 366.9, y: 361, width: 42.1, height: 41.9))
        white.setFill()
        oval7Path.fill()


        //// Rectangle 7 Drawing
        let rectangle7Path = UIBezierPath(rect: CGRect(x: 479, y: 278, width: 139, height: 28))
        light.setFill()
        rectangle7Path.fill()


        //// Oval 8 Drawing
        let oval8Path = UIBezierPath(ovalIn: CGRect(x: 798, y: 250, width: 56, height: 56))
        white.setFill()
        oval8Path.fill()


        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 62, y: 750))
        bezier10Path.addLine(to: CGPoint(x: 90, y: 750))
        bezier10Path.addLine(to: CGPoint(x: 90, y: 333))
        bezier10Path.addLine(to: CGPoint(x: 62, y: 333))
        bezier10Path.addLine(to: CGPoint(x: 62, y: 750))
        bezier10Path.close()
        bezier10Path.usesEvenOddFillRule = true
        light.setFill()
        bezier10Path.fill()


        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(rect: CGRect(x: 76, y: 250, width: 14, height: 14))
        white.setFill()
        rectangle8Path.fill()


        //// Rectangle 9 Drawing
        let rectangle9Path = UIBezierPath(rect: CGRect(x: 284, y: 250, width: 14, height: 14))
        white.setFill()
        rectangle9Path.fill()


        //// Rectangle 10 Drawing
        let rectangle10Path = UIBezierPath(rect: CGRect(x: 187, y: 250, width: 14, height: 14))
        white.setFill()
        rectangle10Path.fill()


        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        bezier11Path.move(to: CGPoint(x: 936.96, y: 757.2))
        bezier11Path.addCurve(to: CGPoint(x: 930.01, y: 750.25), controlPoint1: CGPoint(x: 933.12, y: 757.2), controlPoint2: CGPoint(x: 930.01, y: 754.09))
        bezier11Path.addLine(to: CGPoint(x: 930.01, y: 333.22))
        bezier11Path.addCurve(to: CGPoint(x: 936.96, y: 326.27), controlPoint1: CGPoint(x: 930.01, y: 329.38), controlPoint2: CGPoint(x: 933.12, y: 326.27))
        bezier11Path.addCurve(to: CGPoint(x: 943.9, y: 333.22), controlPoint1: CGPoint(x: 940.79, y: 326.27), controlPoint2: CGPoint(x: 943.9, y: 329.38))
        bezier11Path.addLine(to: CGPoint(x: 943.9, y: 750.25))
        bezier11Path.addCurve(to: CGPoint(x: 936.96, y: 757.2), controlPoint1: CGPoint(x: 943.9, y: 754.09), controlPoint2: CGPoint(x: 940.79, y: 757.2))
        bezier11Path.close()
        bezier11Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier11Path.fill()


        //// Bezier 12 Drawing
        let bezier12Path = UIBezierPath()
        bezier12Path.move(to: CGPoint(x: 61.95, y: 757.2))
        bezier12Path.addCurve(to: CGPoint(x: 55, y: 750.25), controlPoint1: CGPoint(x: 58.11, y: 757.2), controlPoint2: CGPoint(x: 55, y: 754.09))
        bezier12Path.addLine(to: CGPoint(x: 55, y: 333.22))
        bezier12Path.addCurve(to: CGPoint(x: 61.95, y: 326.27), controlPoint1: CGPoint(x: 55, y: 329.38), controlPoint2: CGPoint(x: 58.11, y: 326.27))
        bezier12Path.addCurve(to: CGPoint(x: 68.89, y: 333.22), controlPoint1: CGPoint(x: 65.78, y: 326.27), controlPoint2: CGPoint(x: 68.89, y: 329.38))
        bezier12Path.addLine(to: CGPoint(x: 68.89, y: 750.25))
        bezier12Path.addCurve(to: CGPoint(x: 61.95, y: 757.2), controlPoint1: CGPoint(x: 68.89, y: 754.09), controlPoint2: CGPoint(x: 65.78, y: 757.2))
        bezier12Path.close()
        bezier12Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier12Path.fill()


        //// Bezier 13 Drawing
        let bezier13Path = UIBezierPath()
        bezier13Path.move(to: CGPoint(x: 75.83, y: 785))
        bezier13Path.addCurve(to: CGPoint(x: 55, y: 764.15), controlPoint1: CGPoint(x: 64.34, y: 785), controlPoint2: CGPoint(x: 55, y: 775.65))
        bezier13Path.addCurve(to: CGPoint(x: 61.95, y: 757.2), controlPoint1: CGPoint(x: 55, y: 760.31), controlPoint2: CGPoint(x: 58.11, y: 757.2))
        bezier13Path.addCurve(to: CGPoint(x: 68.89, y: 764.15), controlPoint1: CGPoint(x: 65.78, y: 757.2), controlPoint2: CGPoint(x: 68.89, y: 760.31))
        bezier13Path.addCurve(to: CGPoint(x: 75.84, y: 771.1), controlPoint1: CGPoint(x: 68.89, y: 767.98), controlPoint2: CGPoint(x: 72, y: 771.1))
        bezier13Path.addCurve(to: CGPoint(x: 82.78, y: 778.05), controlPoint1: CGPoint(x: 79.67, y: 771.1), controlPoint2: CGPoint(x: 82.78, y: 774.21))
        bezier13Path.addCurve(to: CGPoint(x: 75.83, y: 785), controlPoint1: CGPoint(x: 82.78, y: 781.89), controlPoint2: CGPoint(x: 79.67, y: 785))
        bezier13Path.close()
        bezier13Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier13Path.fill()


        //// Bezier 14 Drawing
        let bezier14Path = UIBezierPath()
        bezier14Path.move(to: CGPoint(x: 923.07, y: 785))
        bezier14Path.addCurve(to: CGPoint(x: 916.12, y: 778.05), controlPoint1: CGPoint(x: 919.23, y: 785), controlPoint2: CGPoint(x: 916.12, y: 781.89))
        bezier14Path.addCurve(to: CGPoint(x: 923.07, y: 771.1), controlPoint1: CGPoint(x: 916.12, y: 774.21), controlPoint2: CGPoint(x: 919.23, y: 771.1))
        bezier14Path.addCurve(to: CGPoint(x: 930.01, y: 764.15), controlPoint1: CGPoint(x: 926.89, y: 771.1), controlPoint2: CGPoint(x: 930.01, y: 767.98))
        bezier14Path.addCurve(to: CGPoint(x: 936.96, y: 757.2), controlPoint1: CGPoint(x: 930.01, y: 760.31), controlPoint2: CGPoint(x: 933.12, y: 757.2))
        bezier14Path.addCurve(to: CGPoint(x: 943.9, y: 764.15), controlPoint1: CGPoint(x: 940.79, y: 757.2), controlPoint2: CGPoint(x: 943.9, y: 760.31))
        bezier14Path.addCurve(to: CGPoint(x: 923.07, y: 785), controlPoint1: CGPoint(x: 943.9, y: 775.65), controlPoint2: CGPoint(x: 934.55, y: 785))
        bezier14Path.close()
        bezier14Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier14Path.fill()


        //// Bezier 15 Drawing
        let bezier15Path = UIBezierPath()
        bezier15Path.move(to: CGPoint(x: 936.96, y: 242.87))
        bezier15Path.addCurve(to: CGPoint(x: 930.01, y: 235.92), controlPoint1: CGPoint(x: 933.12, y: 242.87), controlPoint2: CGPoint(x: 930.01, y: 239.76))
        bezier15Path.addCurve(to: CGPoint(x: 923.07, y: 228.97), controlPoint1: CGPoint(x: 930.01, y: 232.08), controlPoint2: CGPoint(x: 926.89, y: 228.97))
        bezier15Path.addCurve(to: CGPoint(x: 916.12, y: 222.02), controlPoint1: CGPoint(x: 919.23, y: 228.97), controlPoint2: CGPoint(x: 916.12, y: 225.86))
        bezier15Path.addCurve(to: CGPoint(x: 923.07, y: 215.07), controlPoint1: CGPoint(x: 916.12, y: 218.17), controlPoint2: CGPoint(x: 919.23, y: 215.07))
        bezier15Path.addCurve(to: CGPoint(x: 943.9, y: 235.92), controlPoint1: CGPoint(x: 934.55, y: 215.07), controlPoint2: CGPoint(x: 943.9, y: 224.42))
        bezier15Path.addCurve(to: CGPoint(x: 936.96, y: 242.87), controlPoint1: CGPoint(x: 943.9, y: 239.76), controlPoint2: CGPoint(x: 940.79, y: 242.87))
        bezier15Path.close()
        bezier15Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier15Path.fill()


        //// Bezier 16 Drawing
        let bezier16Path = UIBezierPath()
        bezier16Path.move(to: CGPoint(x: 923.07, y: 785))
        bezier16Path.addLine(to: CGPoint(x: 75.83, y: 785))
        bezier16Path.addCurve(to: CGPoint(x: 68.89, y: 778.05), controlPoint1: CGPoint(x: 72, y: 785), controlPoint2: CGPoint(x: 68.89, y: 781.89))
        bezier16Path.addCurve(to: CGPoint(x: 75.83, y: 771.1), controlPoint1: CGPoint(x: 68.89, y: 774.21), controlPoint2: CGPoint(x: 72, y: 771.1))
        bezier16Path.addLine(to: CGPoint(x: 923.07, y: 771.1))
        bezier16Path.addCurve(to: CGPoint(x: 930.01, y: 778.05), controlPoint1: CGPoint(x: 926.9, y: 771.1), controlPoint2: CGPoint(x: 930.01, y: 774.21))
        bezier16Path.addCurve(to: CGPoint(x: 923.07, y: 785), controlPoint1: CGPoint(x: 930.01, y: 781.89), controlPoint2: CGPoint(x: 926.9, y: 785))
        bezier16Path.close()
        bezier16Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier16Path.fill()


        //// Group 3
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        //// Clip Clip
        let clipPath = UIBezierPath()
        clipPath.move(to: CGPoint(x: 298.06, y: 340.17))
        clipPath.addLine(to: CGPoint(x: 61.95, y: 340.17))
        clipPath.addCurve(to: CGPoint(x: 55, y: 333.22), controlPoint1: CGPoint(x: 58.11, y: 340.17), controlPoint2: CGPoint(x: 55, y: 337.07))
        clipPath.addCurve(to: CGPoint(x: 61.95, y: 326.27), controlPoint1: CGPoint(x: 55, y: 329.38), controlPoint2: CGPoint(x: 58.11, y: 326.27))
        clipPath.addLine(to: CGPoint(x: 298.06, y: 326.27))
        clipPath.addCurve(to: CGPoint(x: 305, y: 333.22), controlPoint1: CGPoint(x: 301.9, y: 326.27), controlPoint2: CGPoint(x: 305, y: 329.38))
        clipPath.addCurve(to: CGPoint(x: 298.06, y: 340.17), controlPoint1: CGPoint(x: 305, y: 337.07), controlPoint2: CGPoint(x: 301.9, y: 340.17))
        clipPath.close()
        clipPath.usesEvenOddFillRule = true
        clipPath.addClip()


        //// Bezier 17 Drawing
        let bezier17Path = UIBezierPath()
        bezier17Path.move(to: CGPoint(x: 50, y: 321.27))
        bezier17Path.addLine(to: CGPoint(x: 310, y: 321.27))
        bezier17Path.addLine(to: CGPoint(x: 310, y: 345.17))
        bezier17Path.addLine(to: CGPoint(x: 50, y: 345.17))
        bezier17Path.addLine(to: CGPoint(x: 50, y: 321.27))
        bezier17Path.close()
        dark.setFill()
        bezier17Path.fill()


        context.endTransparencyLayer()
        context.restoreGState()


        //// Bezier 19 Drawing
        let bezier19Path = UIBezierPath()
        bezier19Path.move(to: CGPoint(x: 583, y: 353.91))
        bezier19Path.addCurve(to: CGPoint(x: 374.87, y: 562.5), controlPoint1: CGPoint(x: 468.24, y: 353.91), controlPoint2: CGPoint(x: 374.87, y: 447.48))
        bezier19Path.addCurve(to: CGPoint(x: 480.68, y: 744.18), controlPoint1: CGPoint(x: 374.87, y: 637.55), controlPoint2: CGPoint(x: 415.42, y: 707.16))
        bezier19Path.addCurve(to: CGPoint(x: 685.33, y: 744.18), controlPoint1: CGPoint(x: 542.95, y: 779.41), controlPoint2: CGPoint(x: 623.05, y: 779.41))
        bezier19Path.addCurve(to: CGPoint(x: 791.13, y: 562.5), controlPoint1: CGPoint(x: 750.58, y: 707.16), controlPoint2: CGPoint(x: 791.13, y: 637.55))
        bezier19Path.addCurve(to: CGPoint(x: 583, y: 353.91), controlPoint1: CGPoint(x: 791.13, y: 447.48), controlPoint2: CGPoint(x: 697.77, y: 353.91))
        bezier19Path.close()
        bezier19Path.move(to: CGPoint(x: 583, y: 785))
        bezier19Path.addCurve(to: CGPoint(x: 473.86, y: 756.29), controlPoint1: CGPoint(x: 544.82, y: 785), controlPoint2: CGPoint(x: 507.07, y: 775.07))
        bezier19Path.addCurve(to: CGPoint(x: 361, y: 562.5), controlPoint1: CGPoint(x: 404.24, y: 716.8), controlPoint2: CGPoint(x: 361, y: 642.54))
        bezier19Path.addCurve(to: CGPoint(x: 583, y: 340), controlPoint1: CGPoint(x: 361, y: 439.81), controlPoint2: CGPoint(x: 460.59, y: 340))
        bezier19Path.addCurve(to: CGPoint(x: 805, y: 562.5), controlPoint1: CGPoint(x: 705.41, y: 340), controlPoint2: CGPoint(x: 805, y: 439.81))
        bezier19Path.addCurve(to: CGPoint(x: 692.14, y: 756.29), controlPoint1: CGPoint(x: 805, y: 642.54), controlPoint2: CGPoint(x: 761.75, y: 716.8))
        bezier19Path.addCurve(to: CGPoint(x: 583, y: 785), controlPoint1: CGPoint(x: 658.93, y: 775.07), controlPoint2: CGPoint(x: 621.19, y: 785))
        bezier19Path.close()
        bezier19Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier19Path.fill()


        //// Bezier 20 Drawing
        let bezier20Path = UIBezierPath()
        bezier20Path.move(to: CGPoint(x: 821.13, y: 618))
        bezier20Path.addCurve(to: CGPoint(x: 819.74, y: 617.86), controlPoint1: CGPoint(x: 820.67, y: 618), controlPoint2: CGPoint(x: 820.21, y: 617.96))
        bezier20Path.addCurve(to: CGPoint(x: 814.29, y: 609.64), controlPoint1: CGPoint(x: 815.95, y: 617.09), controlPoint2: CGPoint(x: 813.52, y: 613.41))
        bezier20Path.addCurve(to: CGPoint(x: 819.03, y: 562.21), controlPoint1: CGPoint(x: 817.44, y: 594.18), controlPoint2: CGPoint(x: 819.03, y: 578.22))
        bezier20Path.addCurve(to: CGPoint(x: 814.15, y: 514.4), controlPoint1: CGPoint(x: 819.03, y: 545.87), controlPoint2: CGPoint(x: 817.4, y: 529.78))
        bezier20Path.addCurve(to: CGPoint(x: 819.55, y: 506.15), controlPoint1: CGPoint(x: 813.36, y: 510.64), controlPoint2: CGPoint(x: 815.79, y: 506.94))
        bezier20Path.addCurve(to: CGPoint(x: 827.82, y: 511.54), controlPoint1: CGPoint(x: 823.32, y: 505.37), controlPoint2: CGPoint(x: 827.03, y: 507.76))
        bezier20Path.addCurve(to: CGPoint(x: 833, y: 562.21), controlPoint1: CGPoint(x: 831.25, y: 527.86), controlPoint2: CGPoint(x: 833, y: 544.9))
        bezier20Path.addCurve(to: CGPoint(x: 827.97, y: 612.42), controlPoint1: CGPoint(x: 833, y: 579.16), controlPoint2: CGPoint(x: 831.31, y: 596.05))
        bezier20Path.addCurve(to: CGPoint(x: 821.13, y: 618), controlPoint1: CGPoint(x: 827.3, y: 615.73), controlPoint2: CGPoint(x: 824.38, y: 618))
        bezier20Path.close()
        bezier20Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier20Path.fill()


        //// Bezier 21 Drawing
        let bezier21Path = UIBezierPath()
        bezier21Path.move(to: CGPoint(x: 345.01, y: 618))
        bezier21Path.addCurve(to: CGPoint(x: 338.18, y: 612.46), controlPoint1: CGPoint(x: 341.78, y: 618), controlPoint2: CGPoint(x: 338.87, y: 615.75))
        bezier21Path.addCurve(to: CGPoint(x: 333, y: 561.78), controlPoint1: CGPoint(x: 334.74, y: 596.15), controlPoint2: CGPoint(x: 333, y: 579.11))
        bezier21Path.addCurve(to: CGPoint(x: 338.04, y: 511.58), controlPoint1: CGPoint(x: 333, y: 544.84), controlPoint2: CGPoint(x: 334.69, y: 527.95))
        bezier21Path.addCurve(to: CGPoint(x: 346.27, y: 506.14), controlPoint1: CGPoint(x: 338.8, y: 507.81), controlPoint2: CGPoint(x: 342.5, y: 505.39))
        bezier21Path.addCurve(to: CGPoint(x: 351.72, y: 514.36), controlPoint1: CGPoint(x: 350.05, y: 506.91), controlPoint2: CGPoint(x: 352.49, y: 510.58))
        bezier21Path.addCurve(to: CGPoint(x: 346.97, y: 561.78), controlPoint1: CGPoint(x: 348.57, y: 529.82), controlPoint2: CGPoint(x: 346.97, y: 545.78))
        bezier21Path.addCurve(to: CGPoint(x: 351.85, y: 609.6), controlPoint1: CGPoint(x: 346.97, y: 578.14), controlPoint2: CGPoint(x: 348.62, y: 594.23))
        bezier21Path.addCurve(to: CGPoint(x: 346.45, y: 617.85), controlPoint1: CGPoint(x: 352.64, y: 613.35), controlPoint2: CGPoint(x: 350.23, y: 617.06))
        bezier21Path.addCurve(to: CGPoint(x: 345.01, y: 618), controlPoint1: CGPoint(x: 345.97, y: 617.96), controlPoint2: CGPoint(x: 345.49, y: 618))
        bezier21Path.close()
        bezier21Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier21Path.fill()


        //// Bezier 22 Drawing
        let bezier22Path = UIBezierPath()
        bezier22Path.move(to: CGPoint(x: 582.5, y: 395.88))
        bezier22Path.addCurve(to: CGPoint(x: 415.88, y: 562.5), controlPoint1: CGPoint(x: 490.63, y: 395.88), controlPoint2: CGPoint(x: 415.88, y: 470.63))
        bezier22Path.addCurve(to: CGPoint(x: 582.5, y: 729.12), controlPoint1: CGPoint(x: 415.88, y: 654.38), controlPoint2: CGPoint(x: 490.63, y: 729.12))
        bezier22Path.addCurve(to: CGPoint(x: 749.12, y: 562.5), controlPoint1: CGPoint(x: 674.38, y: 729.12), controlPoint2: CGPoint(x: 749.12, y: 654.38))
        bezier22Path.addCurve(to: CGPoint(x: 582.5, y: 395.88), controlPoint1: CGPoint(x: 749.12, y: 470.63), controlPoint2: CGPoint(x: 674.38, y: 395.88))
        bezier22Path.close()
        bezier22Path.move(to: CGPoint(x: 582.5, y: 743))
        bezier22Path.addCurve(to: CGPoint(x: 402, y: 562.5), controlPoint1: CGPoint(x: 482.97, y: 743), controlPoint2: CGPoint(x: 402, y: 662.02))
        bezier22Path.addCurve(to: CGPoint(x: 582.5, y: 382), controlPoint1: CGPoint(x: 402, y: 462.97), controlPoint2: CGPoint(x: 482.97, y: 382))
        bezier22Path.addCurve(to: CGPoint(x: 763, y: 562.5), controlPoint1: CGPoint(x: 682.03, y: 382), controlPoint2: CGPoint(x: 763, y: 462.97))
        bezier22Path.addCurve(to: CGPoint(x: 582.5, y: 743), controlPoint1: CGPoint(x: 763, y: 662.02), controlPoint2: CGPoint(x: 682.03, y: 743))
        bezier22Path.close()
        bezier22Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier22Path.fill()


        //// Bezier 23 Drawing
        let bezier23Path = UIBezierPath()
        bezier23Path.move(to: CGPoint(x: 583, y: 465.87))
        bezier23Path.addCurve(to: CGPoint(x: 485.87, y: 563), controlPoint1: CGPoint(x: 529.45, y: 465.87), controlPoint2: CGPoint(x: 485.87, y: 509.45))
        bezier23Path.addCurve(to: CGPoint(x: 583, y: 660.13), controlPoint1: CGPoint(x: 485.87, y: 616.55), controlPoint2: CGPoint(x: 529.45, y: 660.13))
        bezier23Path.addCurve(to: CGPoint(x: 680.13, y: 563), controlPoint1: CGPoint(x: 636.55, y: 660.13), controlPoint2: CGPoint(x: 680.13, y: 616.55))
        bezier23Path.addCurve(to: CGPoint(x: 583, y: 465.87), controlPoint1: CGPoint(x: 680.13, y: 509.45), controlPoint2: CGPoint(x: 636.55, y: 465.87))
        bezier23Path.close()
        bezier23Path.move(to: CGPoint(x: 583, y: 674))
        bezier23Path.addCurve(to: CGPoint(x: 472, y: 563), controlPoint1: CGPoint(x: 521.8, y: 674), controlPoint2: CGPoint(x: 472, y: 624.21))
        bezier23Path.addCurve(to: CGPoint(x: 583, y: 452), controlPoint1: CGPoint(x: 472, y: 501.8), controlPoint2: CGPoint(x: 521.8, y: 452))
        bezier23Path.addCurve(to: CGPoint(x: 694, y: 563), controlPoint1: CGPoint(x: 644.2, y: 452), controlPoint2: CGPoint(x: 694, y: 501.8))
        bezier23Path.addCurve(to: CGPoint(x: 583, y: 674), controlPoint1: CGPoint(x: 694, y: 624.21), controlPoint2: CGPoint(x: 644.2, y: 674))
        bezier23Path.close()
        bezier23Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier23Path.fill()


        //// Bezier 24 Drawing
        let bezier24Path = UIBezierPath()
        bezier24Path.move(to: CGPoint(x: 936.96, y: 757.23))
        bezier24Path.addLine(to: CGPoint(x: 688.62, y: 757.23))
        bezier24Path.addCurve(to: CGPoint(x: 681.68, y: 750.11), controlPoint1: CGPoint(x: 684.78, y: 757.23), controlPoint2: CGPoint(x: 681.68, y: 754.05))
        bezier24Path.addCurve(to: CGPoint(x: 688.62, y: 743.01), controlPoint1: CGPoint(x: 681.68, y: 746.19), controlPoint2: CGPoint(x: 684.78, y: 743.01))
        bezier24Path.addLine(to: CGPoint(x: 936.95, y: 743.01))
        bezier24Path.addCurve(to: CGPoint(x: 943.9, y: 750.11), controlPoint1: CGPoint(x: 940.79, y: 743.01), controlPoint2: CGPoint(x: 943.9, y: 746.19))
        bezier24Path.addCurve(to: CGPoint(x: 936.96, y: 757.23), controlPoint1: CGPoint(x: 943.9, y: 754.05), controlPoint2: CGPoint(x: 940.79, y: 757.23))
        bezier24Path.close()
        bezier24Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier24Path.fill()


        //// Bezier 25 Drawing
        let bezier25Path = UIBezierPath()
        bezier25Path.move(to: CGPoint(x: 476.95, y: 757.23))
        bezier25Path.addLine(to: CGPoint(x: 61.95, y: 757.23))
        bezier25Path.addCurve(to: CGPoint(x: 55, y: 750.11), controlPoint1: CGPoint(x: 58.11, y: 757.23), controlPoint2: CGPoint(x: 55, y: 754.05))
        bezier25Path.addCurve(to: CGPoint(x: 61.95, y: 743.01), controlPoint1: CGPoint(x: 55, y: 746.19), controlPoint2: CGPoint(x: 58.11, y: 743.01))
        bezier25Path.addLine(to: CGPoint(x: 476.95, y: 743.01))
        bezier25Path.addCurve(to: CGPoint(x: 483.89, y: 750.11), controlPoint1: CGPoint(x: 480.79, y: 743.01), controlPoint2: CGPoint(x: 483.89, y: 746.19))
        bezier25Path.addCurve(to: CGPoint(x: 476.95, y: 757.23), controlPoint1: CGPoint(x: 483.89, y: 754.05), controlPoint2: CGPoint(x: 480.79, y: 757.23))
        bezier25Path.close()
        bezier25Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier25Path.fill()


        //// Rectangle 11 Drawing
        let rectangle11Path = UIBezierPath(roundedRect: CGRect(x: 930, y: 229, width: 14, height: 97), cornerRadius: 7)
        dark.setFill()
        rectangle11Path.fill()


        //// Bezier 26 Drawing
        let bezier26Path = UIBezierPath()
        bezier26Path.move(to: CGPoint(x: 763.2, y: 298.43))
        bezier26Path.addLine(to: CGPoint(x: 888.22, y: 298.43))
        bezier26Path.addLine(to: CGPoint(x: 888.22, y: 256.75))
        bezier26Path.addLine(to: CGPoint(x: 763.2, y: 256.75))
        bezier26Path.addLine(to: CGPoint(x: 763.2, y: 298.43))
        bezier26Path.close()
        bezier26Path.move(to: CGPoint(x: 895.17, y: 312.32))
        bezier26Path.addLine(to: CGPoint(x: 756.26, y: 312.32))
        bezier26Path.addCurve(to: CGPoint(x: 749.31, y: 305.37), controlPoint1: CGPoint(x: 752.42, y: 312.32), controlPoint2: CGPoint(x: 749.31, y: 309.21))
        bezier26Path.addLine(to: CGPoint(x: 749.31, y: 249.8))
        bezier26Path.addCurve(to: CGPoint(x: 756.26, y: 242.85), controlPoint1: CGPoint(x: 749.31, y: 245.96), controlPoint2: CGPoint(x: 752.42, y: 242.85))
        bezier26Path.addLine(to: CGPoint(x: 895.17, y: 242.85))
        bezier26Path.addCurve(to: CGPoint(x: 902.12, y: 249.8), controlPoint1: CGPoint(x: 899.01, y: 242.85), controlPoint2: CGPoint(x: 902.12, y: 245.96))
        bezier26Path.addLine(to: CGPoint(x: 902.12, y: 305.37))
        bezier26Path.addCurve(to: CGPoint(x: 895.17, y: 312.32), controlPoint1: CGPoint(x: 902.12, y: 309.21), controlPoint2: CGPoint(x: 899.01, y: 312.32))
        bezier26Path.close()
        bezier26Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier26Path.fill()


        //// Bezier 27 Drawing
        let bezier27Path = UIBezierPath()
        bezier27Path.move(to: CGPoint(x: 922.95, y: 228.96))
        bezier27Path.addLine(to: CGPoint(x: 450.64, y: 228.96))
        bezier27Path.addCurve(to: CGPoint(x: 443.69, y: 222.01), controlPoint1: CGPoint(x: 446.8, y: 228.96), controlPoint2: CGPoint(x: 443.69, y: 225.85))
        bezier27Path.addCurve(to: CGPoint(x: 450.64, y: 215.07), controlPoint1: CGPoint(x: 443.69, y: 218.17), controlPoint2: CGPoint(x: 446.8, y: 215.07))
        bezier27Path.addLine(to: CGPoint(x: 922.95, y: 215.07))
        bezier27Path.addCurve(to: CGPoint(x: 929.9, y: 222.01), controlPoint1: CGPoint(x: 926.79, y: 215.07), controlPoint2: CGPoint(x: 929.9, y: 218.17))
        bezier27Path.addCurve(to: CGPoint(x: 922.95, y: 228.96), controlPoint1: CGPoint(x: 929.9, y: 225.85), controlPoint2: CGPoint(x: 926.79, y: 228.96))
        bezier27Path.close()
        bezier27Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier27Path.fill()


        //// Rectangle 12 Drawing
        let rectangle12Path = UIBezierPath(roundedRect: CGRect(x: 443.7, y: 215.07, width: 13.9, height: 69.45), cornerRadius: 6.95)
        dark.setFill()
        rectangle12Path.fill()


        //// Bezier 28 Drawing
        let bezier28Path = UIBezierPath()
        bezier28Path.move(to: CGPoint(x: 451.05, y: 285))
        bezier28Path.addLine(to: CGPoint(x: 75.95, y: 285))
        bezier28Path.addCurve(to: CGPoint(x: 69, y: 278), controlPoint1: CGPoint(x: 72.11, y: 285), controlPoint2: CGPoint(x: 69, y: 281.87))
        bezier28Path.addCurve(to: CGPoint(x: 75.95, y: 271), controlPoint1: CGPoint(x: 69, y: 274.13), controlPoint2: CGPoint(x: 72.11, y: 271))
        bezier28Path.addLine(to: CGPoint(x: 451.05, y: 271))
        bezier28Path.addCurve(to: CGPoint(x: 458, y: 278), controlPoint1: CGPoint(x: 454.89, y: 271), controlPoint2: CGPoint(x: 458, y: 274.13))
        bezier28Path.addCurve(to: CGPoint(x: 451.05, y: 285), controlPoint1: CGPoint(x: 458, y: 281.87), controlPoint2: CGPoint(x: 454.89, y: 285))
        bezier28Path.close()
        bezier28Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier28Path.fill()


        //// Bezier 29 Drawing
        let bezier29Path = UIBezierPath()
        bezier29Path.move(to: CGPoint(x: 485.91, y: 299))
        bezier29Path.addLine(to: CGPoint(x: 611.09, y: 299))
        bezier29Path.addLine(to: CGPoint(x: 611.09, y: 285))
        bezier29Path.addLine(to: CGPoint(x: 485.91, y: 285))
        bezier29Path.addLine(to: CGPoint(x: 485.91, y: 299))
        bezier29Path.close()
        bezier29Path.move(to: CGPoint(x: 618.05, y: 313))
        bezier29Path.addLine(to: CGPoint(x: 478.96, y: 313))
        bezier29Path.addCurve(to: CGPoint(x: 472, y: 306), controlPoint1: CGPoint(x: 475.11, y: 313), controlPoint2: CGPoint(x: 472, y: 309.87))
        bezier29Path.addLine(to: CGPoint(x: 472, y: 278))
        bezier29Path.addCurve(to: CGPoint(x: 478.96, y: 271), controlPoint1: CGPoint(x: 472, y: 274.13), controlPoint2: CGPoint(x: 475.11, y: 271))
        bezier29Path.addLine(to: CGPoint(x: 618.05, y: 271))
        bezier29Path.addCurve(to: CGPoint(x: 625, y: 278), controlPoint1: CGPoint(x: 621.89, y: 271), controlPoint2: CGPoint(x: 625, y: 274.13))
        bezier29Path.addLine(to: CGPoint(x: 625, y: 306))
        bezier29Path.addCurve(to: CGPoint(x: 618.05, y: 313), controlPoint1: CGPoint(x: 625, y: 309.87), controlPoint2: CGPoint(x: 621.89, y: 313))
        bezier29Path.close()
        bezier29Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier29Path.fill()


        //// Rectangle 13 Drawing
        let rectangle13Path = UIBezierPath(roundedRect: CGRect(x: 499, y: 271, width: 14, height: 42), cornerRadius: 7)
        dark.setFill()
        rectangle13Path.fill()


        //// Rectangle 14 Drawing
        let rectangle14Path = UIBezierPath(roundedRect: CGRect(x: 541, y: 271, width: 14, height: 42), cornerRadius: 7)
        dark.setFill()
        rectangle14Path.fill()


        //// Rectangle 15 Drawing
        let rectangle15Path = UIBezierPath(roundedRect: CGRect(x: 583, y: 271, width: 14, height: 42), cornerRadius: 7)
        dark.setFill()
        rectangle15Path.fill()


        //// Bezier 30 Drawing
        let bezier30Path = UIBezierPath()
        bezier30Path.move(to: CGPoint(x: 388, y: 368))
        bezier30Path.addCurve(to: CGPoint(x: 374, y: 382), controlPoint1: CGPoint(x: 380.28, y: 368), controlPoint2: CGPoint(x: 374, y: 374.28))
        bezier30Path.addCurve(to: CGPoint(x: 388, y: 396), controlPoint1: CGPoint(x: 374, y: 389.72), controlPoint2: CGPoint(x: 380.28, y: 396))
        bezier30Path.addCurve(to: CGPoint(x: 402, y: 382), controlPoint1: CGPoint(x: 395.72, y: 396), controlPoint2: CGPoint(x: 402, y: 389.72))
        bezier30Path.addCurve(to: CGPoint(x: 388, y: 368), controlPoint1: CGPoint(x: 402, y: 374.28), controlPoint2: CGPoint(x: 395.72, y: 368))
        bezier30Path.close()
        bezier30Path.move(to: CGPoint(x: 388, y: 410))
        bezier30Path.addCurve(to: CGPoint(x: 360, y: 382), controlPoint1: CGPoint(x: 372.56, y: 410), controlPoint2: CGPoint(x: 360, y: 397.44))
        bezier30Path.addCurve(to: CGPoint(x: 388, y: 354), controlPoint1: CGPoint(x: 360, y: 366.56), controlPoint2: CGPoint(x: 372.56, y: 354))
        bezier30Path.addCurve(to: CGPoint(x: 416, y: 382), controlPoint1: CGPoint(x: 403.44, y: 354), controlPoint2: CGPoint(x: 416, y: 366.56))
        bezier30Path.addCurve(to: CGPoint(x: 388, y: 410), controlPoint1: CGPoint(x: 416, y: 397.44), controlPoint2: CGPoint(x: 403.44, y: 410))
        bezier30Path.close()
        bezier30Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier30Path.fill()


        //// Bezier 31 Drawing
        let bezier31Path = UIBezierPath()
        bezier31Path.move(to: CGPoint(x: 311.5, y: 354))
        bezier31Path.addCurve(to: CGPoint(x: 299.94, y: 357.53), controlPoint1: CGPoint(x: 307.26, y: 354), controlPoint2: CGPoint(x: 303.27, y: 355.22))
        bezier31Path.addCurve(to: CGPoint(x: 290.8, y: 375), controlPoint1: CGPoint(x: 294.21, y: 361.49), controlPoint2: CGPoint(x: 290.8, y: 368.01))
        bezier31Path.addCurve(to: CGPoint(x: 311.5, y: 396), controlPoint1: CGPoint(x: 290.8, y: 386.58), controlPoint2: CGPoint(x: 300.09, y: 396))
        bezier31Path.addCurve(to: CGPoint(x: 332.2, y: 375), controlPoint1: CGPoint(x: 322.91, y: 396), controlPoint2: CGPoint(x: 332.2, y: 386.58))
        bezier31Path.addCurve(to: CGPoint(x: 311.5, y: 354), controlPoint1: CGPoint(x: 332.2, y: 363.42), controlPoint2: CGPoint(x: 322.91, y: 354))
        bezier31Path.close()
        bezier31Path.move(to: CGPoint(x: 311.5, y: 410))
        bezier31Path.addCurve(to: CGPoint(x: 277, y: 375), controlPoint1: CGPoint(x: 292.48, y: 410), controlPoint2: CGPoint(x: 277, y: 394.3))
        bezier31Path.addCurve(to: CGPoint(x: 292.16, y: 345.97), controlPoint1: CGPoint(x: 277, y: 363.37), controlPoint2: CGPoint(x: 282.67, y: 352.52))
        bezier31Path.addCurve(to: CGPoint(x: 311.5, y: 340), controlPoint1: CGPoint(x: 297.77, y: 342.07), controlPoint2: CGPoint(x: 304.46, y: 340))
        bezier31Path.addCurve(to: CGPoint(x: 346, y: 375), controlPoint1: CGPoint(x: 330.52, y: 340), controlPoint2: CGPoint(x: 346, y: 355.7))
        bezier31Path.addCurve(to: CGPoint(x: 311.5, y: 410), controlPoint1: CGPoint(x: 346, y: 394.3), controlPoint2: CGPoint(x: 330.52, y: 410))
        bezier31Path.close()
        bezier31Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier31Path.fill()


        //// Rectangle 16 Drawing
        let rectangle16Path = UIBezierPath(roundedRect: CGRect(x: 305, y: 312, width: 14, height: 42), cornerRadius: 7)
        dark.setFill()
        rectangle16Path.fill()


        //// Bezier 32 Drawing
        let bezier32Path = UIBezierPath()
        bezier32Path.move(to: CGPoint(x: 936.95, y: 340.31))
        bezier32Path.addLine(to: CGPoint(x: 325.65, y: 340.31))
        bezier32Path.addCurve(to: CGPoint(x: 318.71, y: 333.35), controlPoint1: CGPoint(x: 321.81, y: 340.31), controlPoint2: CGPoint(x: 318.71, y: 337.2))
        bezier32Path.addCurve(to: CGPoint(x: 325.65, y: 326.4), controlPoint1: CGPoint(x: 318.71, y: 329.51), controlPoint2: CGPoint(x: 321.81, y: 326.4))
        bezier32Path.addLine(to: CGPoint(x: 936.95, y: 326.4))
        bezier32Path.addCurve(to: CGPoint(x: 943.9, y: 333.35), controlPoint1: CGPoint(x: 940.79, y: 326.4), controlPoint2: CGPoint(x: 943.9, y: 329.51))
        bezier32Path.addCurve(to: CGPoint(x: 936.95, y: 340.31), controlPoint1: CGPoint(x: 943.9, y: 337.2), controlPoint2: CGPoint(x: 940.79, y: 340.31))
        bezier32Path.close()
        bezier32Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier32Path.fill()


        //// Rectangle 17 Drawing
        let rectangle17Path = UIBezierPath(roundedRect: CGRect(x: 415.95, y: 215.05, width: 13.9, height: 69.6), cornerRadius: 6.95)
        dark.setFill()
        rectangle17Path.fill()


        //// Rectangle 18 Drawing
        let rectangle18Path = UIBezierPath(roundedRect: CGRect(x: 415.95, y: 215.05, width: 41.7, height: 13.9), cornerRadius: 6.95)
        dark.setFill()
        rectangle18Path.fill()


        //// Bezier 33 Drawing
        let bezier33Path = UIBezierPath()
        bezier33Path.move(to: CGPoint(x: 284, y: 271))
        bezier33Path.addCurve(to: CGPoint(x: 277, y: 264), controlPoint1: CGPoint(x: 280.13, y: 271), controlPoint2: CGPoint(x: 277, y: 267.87))
        bezier33Path.addLine(to: CGPoint(x: 277, y: 250))
        bezier33Path.addCurve(to: CGPoint(x: 284, y: 243), controlPoint1: CGPoint(x: 277, y: 246.13), controlPoint2: CGPoint(x: 280.13, y: 243))
        bezier33Path.addCurve(to: CGPoint(x: 291, y: 250), controlPoint1: CGPoint(x: 287.87, y: 243), controlPoint2: CGPoint(x: 291, y: 246.13))
        bezier33Path.addLine(to: CGPoint(x: 291, y: 264))
        bezier33Path.addCurve(to: CGPoint(x: 284, y: 271), controlPoint1: CGPoint(x: 291, y: 267.87), controlPoint2: CGPoint(x: 287.87, y: 271))
        bezier33Path.close()
        bezier33Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier33Path.fill()


        //// Bezier 34 Drawing
        let bezier34Path = UIBezierPath()
        bezier34Path.move(to: CGPoint(x: 395.05, y: 257))
        bezier34Path.addLine(to: CGPoint(x: 283.95, y: 257))
        bezier34Path.addCurve(to: CGPoint(x: 277, y: 250), controlPoint1: CGPoint(x: 280.11, y: 257), controlPoint2: CGPoint(x: 277, y: 253.87))
        bezier34Path.addCurve(to: CGPoint(x: 283.95, y: 243), controlPoint1: CGPoint(x: 277, y: 246.13), controlPoint2: CGPoint(x: 280.11, y: 243))
        bezier34Path.addLine(to: CGPoint(x: 395.05, y: 243))
        bezier34Path.addCurve(to: CGPoint(x: 402, y: 250), controlPoint1: CGPoint(x: 398.89, y: 243), controlPoint2: CGPoint(x: 402, y: 246.13))
        bezier34Path.addCurve(to: CGPoint(x: 395.05, y: 257), controlPoint1: CGPoint(x: 402, y: 253.87), controlPoint2: CGPoint(x: 398.89, y: 257))
        bezier34Path.close()
        bezier34Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier34Path.fill()


        //// Rectangle 19 Drawing
        let rectangle19Path = UIBezierPath(roundedRect: CGRect(x: 388, y: 243, width: 14, height: 28), cornerRadius: 7)
        dark.setFill()
        rectangle19Path.fill()


        //// Rectangle 20 Drawing
        let rectangle20Path = UIBezierPath(roundedRect: CGRect(x: 305, y: 243, width: 14, height: 21), cornerRadius: 7)
        dark.setFill()
        rectangle20Path.fill()


        //// Rectangle 21 Drawing
        let rectangle21Path = UIBezierPath(roundedRect: CGRect(x: 333, y: 243, width: 14, height: 21), cornerRadius: 7)
        dark.setFill()
        rectangle21Path.fill()


        //// Rectangle 22 Drawing
        let rectangle22Path = UIBezierPath(roundedRect: CGRect(x: 361, y: 243, width: 14, height: 21), cornerRadius: 7)
        dark.setFill()
        rectangle22Path.fill()


        //// Rectangle 23 Drawing
        let rectangle23Path = UIBezierPath(roundedRect: CGRect(x: 166, y: 243, width: 97, height: 14), cornerRadius: 7)
        dark.setFill()
        rectangle23Path.fill()


        //// Rectangle 24 Drawing
        let rectangle24Path = UIBezierPath(roundedRect: CGRect(x: 69, y: 243, width: 14, height: 28), cornerRadius: 7)
        dark.setFill()
        rectangle24Path.fill()


        //// Rectangle 25 Drawing
        let rectangle25Path = UIBezierPath(roundedRect: CGRect(x: 69, y: 243, width: 83, height: 14), cornerRadius: 7)
        dark.setFill()
        rectangle25Path.fill()


        //// Rectangle 26 Drawing
        let rectangle26Path = UIBezierPath(roundedRect: CGRect(x: 138, y: 243, width: 14, height: 28), cornerRadius: 7)
        dark.setFill()
        rectangle26Path.fill()


        //// Rectangle 27 Drawing
        let rectangle27Path = UIBezierPath(roundedRect: CGRect(x: 180, y: 243, width: 14, height: 28), cornerRadius: 7)
        dark.setFill()
        rectangle27Path.fill()


        //// Rectangle 28 Drawing
        let rectangle28Path = UIBezierPath(roundedRect: CGRect(x: 236, y: 243, width: 14, height: 28), cornerRadius: 7)
        dark.setFill()
        rectangle28Path.fill()


        //// Bezier 35 Drawing
        let bezier35Path = UIBezierPath()
        bezier35Path.move(to: CGPoint(x: 242.05, y: 242.91))
        bezier35Path.addCurve(to: CGPoint(x: 237.15, y: 240.88), controlPoint1: CGPoint(x: 240.28, y: 242.91), controlPoint2: CGPoint(x: 238.51, y: 242.24))
        bezier35Path.addCurve(to: CGPoint(x: 214.34, y: 235.97), controlPoint1: CGPoint(x: 237.13, y: 240.88), controlPoint2: CGPoint(x: 231.08, y: 235.97))
        bezier35Path.addCurve(to: CGPoint(x: 191.35, y: 241.05), controlPoint1: CGPoint(x: 197.41, y: 235.97), controlPoint2: CGPoint(x: 191.41, y: 241))
        bezier35Path.addCurve(to: CGPoint(x: 181.65, y: 240.62), controlPoint1: CGPoint(x: 188.52, y: 243.48), controlPoint2: CGPoint(x: 184.2, y: 243.34))
        bezier35Path.addCurve(to: CGPoint(x: 181.73, y: 231.05), controlPoint1: CGPoint(x: 179.11, y: 237.87), controlPoint2: CGPoint(x: 179.09, y: 233.7))
        bezier35Path.addCurve(to: CGPoint(x: 214.34, y: 222.07), controlPoint1: CGPoint(x: 183.23, y: 229.55), controlPoint2: CGPoint(x: 191.83, y: 222.07))
        bezier35Path.addCurve(to: CGPoint(x: 246.95, y: 231.05), controlPoint1: CGPoint(x: 236.86, y: 222.07), controlPoint2: CGPoint(x: 245.46, y: 229.55))
        bezier35Path.addCurve(to: CGPoint(x: 246.95, y: 240.88), controlPoint1: CGPoint(x: 249.66, y: 233.77), controlPoint2: CGPoint(x: 249.66, y: 238.17))
        bezier35Path.addCurve(to: CGPoint(x: 242.05, y: 242.91), controlPoint1: CGPoint(x: 245.59, y: 242.24), controlPoint2: CGPoint(x: 243.82, y: 242.91))
        bezier35Path.close()
        bezier35Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier35Path.fill()


        //// Bezier 36 Drawing
        let bezier36Path = UIBezierPath()
        bezier36Path.move(to: CGPoint(x: 61.93, y: 298.52))
        bezier36Path.addCurve(to: CGPoint(x: 55, y: 291.57), controlPoint1: CGPoint(x: 58.1, y: 298.52), controlPoint2: CGPoint(x: 55, y: 295.41))
        bezier36Path.addCurve(to: CGPoint(x: 75.78, y: 270.72), controlPoint1: CGPoint(x: 55, y: 280.07), controlPoint2: CGPoint(x: 64.32, y: 270.72))
        bezier36Path.addCurve(to: CGPoint(x: 82.71, y: 277.67), controlPoint1: CGPoint(x: 79.61, y: 270.72), controlPoint2: CGPoint(x: 82.71, y: 273.82))
        bezier36Path.addCurve(to: CGPoint(x: 75.78, y: 284.62), controlPoint1: CGPoint(x: 82.71, y: 281.51), controlPoint2: CGPoint(x: 79.61, y: 284.62))
        bezier36Path.addCurve(to: CGPoint(x: 68.86, y: 291.57), controlPoint1: CGPoint(x: 71.96, y: 284.62), controlPoint2: CGPoint(x: 68.86, y: 287.73))
        bezier36Path.addCurve(to: CGPoint(x: 61.93, y: 298.52), controlPoint1: CGPoint(x: 68.86, y: 295.41), controlPoint2: CGPoint(x: 65.76, y: 298.52))
        bezier36Path.close()
        bezier36Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier36Path.fill()


        //// Bezier 37 Drawing
        let bezier37Path = UIBezierPath()
        bezier37Path.move(to: CGPoint(x: 61.93, y: 326.32))
        bezier37Path.addCurve(to: CGPoint(x: 55, y: 319.37), controlPoint1: CGPoint(x: 58.1, y: 326.32), controlPoint2: CGPoint(x: 55, y: 323.21))
        bezier37Path.addLine(to: CGPoint(x: 55, y: 291.57))
        bezier37Path.addCurve(to: CGPoint(x: 61.93, y: 284.62), controlPoint1: CGPoint(x: 55, y: 287.72), controlPoint2: CGPoint(x: 58.1, y: 284.62))
        bezier37Path.addCurve(to: CGPoint(x: 68.86, y: 291.57), controlPoint1: CGPoint(x: 65.76, y: 284.62), controlPoint2: CGPoint(x: 68.86, y: 287.72))
        bezier37Path.addLine(to: CGPoint(x: 68.86, y: 319.37))
        bezier37Path.addCurve(to: CGPoint(x: 61.93, y: 326.32), controlPoint1: CGPoint(x: 68.86, y: 323.21), controlPoint2: CGPoint(x: 65.76, y: 326.32))
        bezier37Path.close()
        bezier37Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier37Path.fill()


        //// Bezier 38 Drawing
        let bezier38Path = UIBezierPath()
        bezier38Path.move(to: CGPoint(x: 825.5, y: 257))
        bezier38Path.addCurve(to: CGPoint(x: 804.8, y: 278), controlPoint1: CGPoint(x: 814.09, y: 257), controlPoint2: CGPoint(x: 804.8, y: 266.42))
        bezier38Path.addCurve(to: CGPoint(x: 825.5, y: 299), controlPoint1: CGPoint(x: 804.8, y: 289.58), controlPoint2: CGPoint(x: 814.09, y: 299))
        bezier38Path.addCurve(to: CGPoint(x: 846.2, y: 278), controlPoint1: CGPoint(x: 836.91, y: 299), controlPoint2: CGPoint(x: 846.2, y: 289.58))
        bezier38Path.addCurve(to: CGPoint(x: 825.5, y: 257), controlPoint1: CGPoint(x: 846.2, y: 266.42), controlPoint2: CGPoint(x: 836.91, y: 257))
        bezier38Path.close()
        bezier38Path.move(to: CGPoint(x: 825.5, y: 313))
        bezier38Path.addCurve(to: CGPoint(x: 791, y: 278), controlPoint1: CGPoint(x: 806.47, y: 313), controlPoint2: CGPoint(x: 791, y: 297.3))
        bezier38Path.addCurve(to: CGPoint(x: 825.5, y: 243), controlPoint1: CGPoint(x: 791, y: 258.7), controlPoint2: CGPoint(x: 806.47, y: 243))
        bezier38Path.addCurve(to: CGPoint(x: 860, y: 278), controlPoint1: CGPoint(x: 844.53, y: 243), controlPoint2: CGPoint(x: 860, y: 258.7))
        bezier38Path.addCurve(to: CGPoint(x: 825.5, y: 313), controlPoint1: CGPoint(x: 860, y: 297.3), controlPoint2: CGPoint(x: 844.53, y: 313))
        bezier38Path.close()
        bezier38Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier38Path.fill()


        //// Oval 9 Drawing
        let oval9Path = UIBezierPath(ovalIn: CGRect(x: 82.95, y: 688.05, width: 14, height: 13.9))
        dark.setFill()
        oval9Path.fill()


        //// Oval 10 Drawing
        let oval10Path = UIBezierPath(ovalIn: CGRect(x: 110.95, y: 715.05, width: 14, height: 13.9))
        dark.setFill()
        oval10Path.fill()


        //// Oval 11 Drawing
        let oval11Path = UIBezierPath(ovalIn: CGRect(x: 82.95, y: 632.05, width: 14, height: 13.9))
        dark.setFill()
        oval11Path.fill()


        //// Oval 12 Drawing
        let oval12Path = UIBezierPath(ovalIn: CGRect(x: 110.95, y: 660.05, width: 14, height: 13.9))
        dark.setFill()
        oval12Path.fill()


        //// Oval 13 Drawing
        let oval13Path = UIBezierPath(ovalIn: CGRect(x: 138.95, y: 688.05, width: 14, height: 13.9))
        dark.setFill()
        oval13Path.fill()


        //// Oval 14 Drawing
        let oval14Path = UIBezierPath(ovalIn: CGRect(x: 165.95, y: 715.05, width: 14, height: 13.9))
        dark.setFill()
        oval14Path.fill()


        //// Oval 15 Drawing
        let oval15Path = UIBezierPath(ovalIn: CGRect(x: 82.95, y: 576.05, width: 14, height: 13.9))
        dark.setFill()
        oval15Path.fill()


        //// Oval 16 Drawing
        let oval16Path = UIBezierPath(ovalIn: CGRect(x: 110.95, y: 604.05, width: 14, height: 13.9))
        dark.setFill()
        oval16Path.fill()


        //// Oval 17 Drawing
        let oval17Path = UIBezierPath(ovalIn: CGRect(x: 138.95, y: 632.05, width: 14, height: 13.9))
        dark.setFill()
        oval17Path.fill()


        //// Oval 18 Drawing
        let oval18Path = UIBezierPath(ovalIn: CGRect(x: 165.95, y: 660.05, width: 14, height: 13.9))
        dark.setFill()
        oval18Path.fill()


        //// Oval 19 Drawing
        let oval19Path = UIBezierPath(ovalIn: CGRect(x: 193.95, y: 688.05, width: 14, height: 13.9))
        dark.setFill()
        oval19Path.fill()


        //// Oval 20 Drawing
        let oval20Path = UIBezierPath(ovalIn: CGRect(x: 221.95, y: 715.05, width: 14, height: 13.9))
        dark.setFill()
        oval20Path.fill()


        //// Oval 21 Drawing
        let oval21Path = UIBezierPath(ovalIn: CGRect(x: 82.95, y: 521.05, width: 14, height: 13.9))
        dark.setFill()
        oval21Path.fill()


        //// Oval 22 Drawing
        let oval22Path = UIBezierPath(ovalIn: CGRect(x: 110.95, y: 549.05, width: 14, height: 13.9))
        dark.setFill()
        oval22Path.fill()


        //// Oval 23 Drawing
        let oval23Path = UIBezierPath(ovalIn: CGRect(x: 138.95, y: 576.05, width: 14, height: 13.9))
        dark.setFill()
        oval23Path.fill()


        //// Oval 24 Drawing
        let oval24Path = UIBezierPath(ovalIn: CGRect(x: 165.95, y: 604.05, width: 14, height: 13.9))
        dark.setFill()
        oval24Path.fill()


        //// Oval 25 Drawing
        let oval25Path = UIBezierPath(ovalIn: CGRect(x: 193.95, y: 632.05, width: 14, height: 13.9))
        dark.setFill()
        oval25Path.fill()


        //// Oval 26 Drawing
        let oval26Path = UIBezierPath(ovalIn: CGRect(x: 221.95, y: 660.05, width: 14, height: 13.9))
        dark.setFill()
        oval26Path.fill()


        //// Oval 27 Drawing
        let oval27Path = UIBezierPath(ovalIn: CGRect(x: 249.95, y: 688.05, width: 14, height: 13.9))
        dark.setFill()
        oval27Path.fill()


        //// Oval 28 Drawing
        let oval28Path = UIBezierPath(ovalIn: CGRect(x: 277.95, y: 715.05, width: 14, height: 13.9))
        dark.setFill()
        oval28Path.fill()


        //// Oval 29 Drawing
        let oval29Path = UIBezierPath(ovalIn: CGRect(x: 82.95, y: 465.05, width: 14, height: 13.9))
        dark.setFill()
        oval29Path.fill()


        //// Oval 30 Drawing
        let oval30Path = UIBezierPath(ovalIn: CGRect(x: 110.95, y: 493.05, width: 14, height: 13.9))
        dark.setFill()
        oval30Path.fill()


        //// Oval 31 Drawing
        let oval31Path = UIBezierPath(ovalIn: CGRect(x: 138.95, y: 521.05, width: 14, height: 13.9))
        dark.setFill()
        oval31Path.fill()


        //// Oval 32 Drawing
        let oval32Path = UIBezierPath(ovalIn: CGRect(x: 165.95, y: 549.05, width: 14, height: 13.9))
        dark.setFill()
        oval32Path.fill()


        //// Oval 33 Drawing
        let oval33Path = UIBezierPath(ovalIn: CGRect(x: 193.95, y: 576.05, width: 14, height: 13.9))
        dark.setFill()
        oval33Path.fill()


        //// Oval 34 Drawing
        let oval34Path = UIBezierPath(ovalIn: CGRect(x: 221.95, y: 604.05, width: 14, height: 13.9))
        dark.setFill()
        oval34Path.fill()


        //// Oval 35 Drawing
        let oval35Path = UIBezierPath(ovalIn: CGRect(x: 249.95, y: 632.05, width: 14, height: 13.9))
        dark.setFill()
        oval35Path.fill()


        //// Oval 36 Drawing
        let oval36Path = UIBezierPath(ovalIn: CGRect(x: 277.95, y: 660.05, width: 14, height: 13.9))
        dark.setFill()
        oval36Path.fill()


        //// Oval 37 Drawing
        let oval37Path = UIBezierPath(ovalIn: CGRect(x: 304.95, y: 688.05, width: 14, height: 13.9))
        dark.setFill()
        oval37Path.fill()


        //// Oval 38 Drawing
        let oval38Path = UIBezierPath(ovalIn: CGRect(x: 332.95, y: 715.05, width: 14, height: 13.9))
        dark.setFill()
        oval38Path.fill()


        //// Oval 39 Drawing
        let oval39Path = UIBezierPath(ovalIn: CGRect(x: 82.95, y: 410.05, width: 14, height: 13.9))
        dark.setFill()
        oval39Path.fill()


        //// Oval 40 Drawing
        let oval40Path = UIBezierPath(ovalIn: CGRect(x: 110.95, y: 437.05, width: 14, height: 13.9))
        dark.setFill()
        oval40Path.fill()


        //// Oval 41 Drawing
        let oval41Path = UIBezierPath(ovalIn: CGRect(x: 138.95, y: 465.05, width: 14, height: 13.9))
        dark.setFill()
        oval41Path.fill()


        //// Oval 42 Drawing
        let oval42Path = UIBezierPath(ovalIn: CGRect(x: 165.95, y: 493.05, width: 14, height: 13.9))
        dark.setFill()
        oval42Path.fill()


        //// Oval 43 Drawing
        let oval43Path = UIBezierPath(ovalIn: CGRect(x: 193.95, y: 521.05, width: 14, height: 13.9))
        dark.setFill()
        oval43Path.fill()


        //// Oval 44 Drawing
        let oval44Path = UIBezierPath(ovalIn: CGRect(x: 221.95, y: 549.05, width: 14, height: 13.9))
        dark.setFill()
        oval44Path.fill()


        //// Oval 45 Drawing
        let oval45Path = UIBezierPath(ovalIn: CGRect(x: 249.95, y: 576.05, width: 14, height: 13.9))
        dark.setFill()
        oval45Path.fill()


        //// Oval 46 Drawing
        let oval46Path = UIBezierPath(ovalIn: CGRect(x: 277.95, y: 604.05, width: 14, height: 13.9))
        dark.setFill()
        oval46Path.fill()


        //// Oval 47 Drawing
        let oval47Path = UIBezierPath(ovalIn: CGRect(x: 304.95, y: 632.05, width: 14, height: 13.9))
        dark.setFill()
        oval47Path.fill()


        //// Oval 48 Drawing
        let oval48Path = UIBezierPath(ovalIn: CGRect(x: 332.95, y: 660.05, width: 14, height: 13.9))
        dark.setFill()
        oval48Path.fill()


        //// Oval 49 Drawing
        let oval49Path = UIBezierPath(ovalIn: CGRect(x: 360.95, y: 688.05, width: 14, height: 13.9))
        dark.setFill()
        oval49Path.fill()


        //// Oval 50 Drawing
        let oval50Path = UIBezierPath(ovalIn: CGRect(x: 388.95, y: 715.05, width: 14, height: 13.9))
        dark.setFill()
        oval50Path.fill()


        //// Oval 51 Drawing
        let oval51Path = UIBezierPath(ovalIn: CGRect(x: 110.95, y: 382.05, width: 14, height: 13.9))
        dark.setFill()
        oval51Path.fill()


        //// Oval 52 Drawing
        let oval52Path = UIBezierPath(ovalIn: CGRect(x: 138.95, y: 410.05, width: 14, height: 13.9))
        dark.setFill()
        oval52Path.fill()


        //// Oval 53 Drawing
        let oval53Path = UIBezierPath(ovalIn: CGRect(x: 165.95, y: 437.05, width: 14, height: 13.9))
        dark.setFill()
        oval53Path.fill()


        //// Oval 54 Drawing
        let oval54Path = UIBezierPath(ovalIn: CGRect(x: 193.95, y: 465.05, width: 14, height: 13.9))
        dark.setFill()
        oval54Path.fill()


        //// Oval 55 Drawing
        let oval55Path = UIBezierPath(ovalIn: CGRect(x: 221.95, y: 493.05, width: 14, height: 13.9))
        dark.setFill()
        oval55Path.fill()


        //// Oval 56 Drawing
        let oval56Path = UIBezierPath(ovalIn: CGRect(x: 249.95, y: 521.05, width: 14, height: 13.9))
        dark.setFill()
        oval56Path.fill()


        //// Oval 57 Drawing
        let oval57Path = UIBezierPath(ovalIn: CGRect(x: 277.95, y: 549.05, width: 14, height: 13.9))
        dark.setFill()
        oval57Path.fill()


        //// Oval 58 Drawing
        let oval58Path = UIBezierPath(ovalIn: CGRect(x: 304.95, y: 576.05, width: 14, height: 13.9))
        dark.setFill()
        oval58Path.fill()


        //// Oval 59 Drawing
        let oval59Path = UIBezierPath(ovalIn: CGRect(x: 165.95, y: 382.05, width: 14, height: 13.9))
        dark.setFill()
        oval59Path.fill()


        //// Oval 60 Drawing
        let oval60Path = UIBezierPath(ovalIn: CGRect(x: 193.95, y: 410.05, width: 14, height: 13.9))
        dark.setFill()
        oval60Path.fill()


        //// Oval 61 Drawing
        let oval61Path = UIBezierPath(ovalIn: CGRect(x: 221.95, y: 437.05, width: 14, height: 13.9))
        dark.setFill()
        oval61Path.fill()


        //// Oval 62 Drawing
        let oval62Path = UIBezierPath(ovalIn: CGRect(x: 249.95, y: 465.05, width: 14, height: 13.9))
        dark.setFill()
        oval62Path.fill()


        //// Oval 63 Drawing
        let oval63Path = UIBezierPath(ovalIn: CGRect(x: 277.95, y: 493.05, width: 14, height: 13.9))
        dark.setFill()
        oval63Path.fill()


        //// Oval 64 Drawing
        let oval64Path = UIBezierPath(ovalIn: CGRect(x: 304.95, y: 521.05, width: 14, height: 13.9))
        dark.setFill()
        oval64Path.fill()


        //// Oval 65 Drawing
        let oval65Path = UIBezierPath(ovalIn: CGRect(x: 221.95, y: 382.05, width: 14, height: 13.9))
        dark.setFill()
        oval65Path.fill()


        //// Oval 66 Drawing
        let oval66Path = UIBezierPath(ovalIn: CGRect(x: 249.95, y: 410.05, width: 14, height: 13.9))
        dark.setFill()
        oval66Path.fill()


        //// Oval 67 Drawing
        let oval67Path = UIBezierPath(ovalIn: CGRect(x: 82.95, y: 354.05, width: 14, height: 13.9))
        dark.setFill()
        oval67Path.fill()


        //// Oval 68 Drawing
        let oval68Path = UIBezierPath(ovalIn: CGRect(x: 138.95, y: 354.05, width: 14, height: 13.9))
        dark.setFill()
        oval68Path.fill()


        //// Oval 69 Drawing
        let oval69Path = UIBezierPath(ovalIn: CGRect(x: 193.95, y: 354.05, width: 14, height: 13.9))
        dark.setFill()
        oval69Path.fill()


        //// Oval 70 Drawing
        let oval70Path = UIBezierPath(ovalIn: CGRect(x: 249.95, y: 354.05, width: 14, height: 13.9))
        dark.setFill()
        oval70Path.fill()


        //// Oval 71 Drawing
        let oval71Path = UIBezierPath(ovalIn: CGRect(x: 277.95, y: 437.05, width: 14, height: 13.9))
        dark.setFill()
        oval71Path.fill()


        //// Oval 72 Drawing
        let oval72Path = UIBezierPath(ovalIn: CGRect(x: 304.95, y: 465.05, width: 14, height: 13.9))
        dark.setFill()
        oval72Path.fill()


        //// Oval 73 Drawing
        let oval73Path = UIBezierPath(ovalIn: CGRect(x: 360.95, y: 465.05, width: 14, height: 13.9))
        dark.setFill()
        oval73Path.fill()


        //// Oval 74 Drawing
        let oval74Path = UIBezierPath(ovalIn: CGRect(x: 332.95, y: 437.05, width: 14, height: 13.9))
        dark.setFill()
        oval74Path.fill()


        //// Oval 75 Drawing
        let oval75Path = UIBezierPath(ovalIn: CGRect(x: 777.95, y: 715.05, width: 14, height: 13.9))
        dark.setFill()
        oval75Path.fill()


        //// Oval 76 Drawing
        let oval76Path = UIBezierPath(ovalIn: CGRect(x: 804.95, y: 688.05, width: 14, height: 13.9))
        dark.setFill()
        oval76Path.fill()


        //// Oval 77 Drawing
        let oval77Path = UIBezierPath(ovalIn: CGRect(x: 832.95, y: 715.05, width: 14, height: 13.9))
        dark.setFill()
        oval77Path.fill()


        //// Oval 78 Drawing
        let oval78Path = UIBezierPath(ovalIn: CGRect(x: 832.95, y: 660.05, width: 14, height: 13.9))
        dark.setFill()
        oval78Path.fill()


        //// Oval 79 Drawing
        let oval79Path = UIBezierPath(ovalIn: CGRect(x: 804.95, y: 632.05, width: 14, height: 13.9))
        dark.setFill()
        oval79Path.fill()


        //// Oval 80 Drawing
        let oval80Path = UIBezierPath(ovalIn: CGRect(x: 860.95, y: 688.05, width: 14, height: 13.9))
        dark.setFill()
        oval80Path.fill()


        //// Oval 81 Drawing
        let oval81Path = UIBezierPath(ovalIn: CGRect(x: 888.95, y: 715.05, width: 14, height: 13.9))
        dark.setFill()
        oval81Path.fill()


        //// Oval 82 Drawing
        let oval82Path = UIBezierPath(ovalIn: CGRect(x: 860.95, y: 632.05, width: 14, height: 13.9))
        dark.setFill()
        oval82Path.fill()


        //// Oval 83 Drawing
        let oval83Path = UIBezierPath(ovalIn: CGRect(x: 888.95, y: 660.05, width: 14, height: 13.9))
        dark.setFill()
        oval83Path.fill()


        //// Oval 84 Drawing
        let oval84Path = UIBezierPath(ovalIn: CGRect(x: 915.95, y: 688.05, width: 14, height: 13.9))
        dark.setFill()
        oval84Path.fill()


        //// Oval 85 Drawing
        let oval85Path = UIBezierPath(ovalIn: CGRect(x: 860.95, y: 576.05, width: 14, height: 13.9))
        dark.setFill()
        oval85Path.fill()


        //// Oval 86 Drawing
        let oval86Path = UIBezierPath(ovalIn: CGRect(x: 888.95, y: 604.05, width: 14, height: 13.9))
        dark.setFill()
        oval86Path.fill()


        //// Oval 87 Drawing
        let oval87Path = UIBezierPath(ovalIn: CGRect(x: 915.95, y: 632.05, width: 14, height: 13.9))
        dark.setFill()
        oval87Path.fill()


        //// Oval 88 Drawing
        let oval88Path = UIBezierPath(ovalIn: CGRect(x: 860.95, y: 521.05, width: 14, height: 13.9))
        dark.setFill()
        oval88Path.fill()


        //// Oval 89 Drawing
        let oval89Path = UIBezierPath(ovalIn: CGRect(x: 804.95, y: 465.05, width: 14, height: 13.9))
        dark.setFill()
        oval89Path.fill()


        //// Oval 90 Drawing
        let oval90Path = UIBezierPath(ovalIn: CGRect(x: 888.95, y: 549.05, width: 14, height: 13.9))
        dark.setFill()
        oval90Path.fill()


        //// Oval 91 Drawing
        let oval91Path = UIBezierPath(ovalIn: CGRect(x: 915.95, y: 576.05, width: 14, height: 13.9))
        dark.setFill()
        oval91Path.fill()


        //// Oval 92 Drawing
        let oval92Path = UIBezierPath(ovalIn: CGRect(x: 777.95, y: 382.05, width: 14, height: 13.9))
        dark.setFill()
        oval92Path.fill()


        //// Oval 93 Drawing
        let oval93Path = UIBezierPath(ovalIn: CGRect(x: 804.95, y: 410.05, width: 14, height: 13.9))
        dark.setFill()
        oval93Path.fill()


        //// Oval 94 Drawing
        let oval94Path = UIBezierPath(ovalIn: CGRect(x: 832.95, y: 437.05, width: 14, height: 13.9))
        dark.setFill()
        oval94Path.fill()


        //// Oval 95 Drawing
        let oval95Path = UIBezierPath(ovalIn: CGRect(x: 860.95, y: 465.05, width: 14, height: 13.9))
        dark.setFill()
        oval95Path.fill()


        //// Oval 96 Drawing
        let oval96Path = UIBezierPath(ovalIn: CGRect(x: 888.95, y: 493.05, width: 14, height: 13.9))
        dark.setFill()
        oval96Path.fill()


        //// Oval 97 Drawing
        let oval97Path = UIBezierPath(ovalIn: CGRect(x: 915.95, y: 521.05, width: 14, height: 13.9))
        dark.setFill()
        oval97Path.fill()


        //// Oval 98 Drawing
        let oval98Path = UIBezierPath(ovalIn: CGRect(x: 832.95, y: 382.05, width: 14, height: 13.9))
        dark.setFill()
        oval98Path.fill()


        //// Oval 99 Drawing
        let oval99Path = UIBezierPath(ovalIn: CGRect(x: 860.95, y: 410.05, width: 14, height: 13.9))
        dark.setFill()
        oval99Path.fill()


        //// Oval 100 Drawing
        let oval100Path = UIBezierPath(ovalIn: CGRect(x: 888.95, y: 437.05, width: 14, height: 13.9))
        dark.setFill()
        oval100Path.fill()


        //// Oval 101 Drawing
        let oval101Path = UIBezierPath(ovalIn: CGRect(x: 915.95, y: 465.05, width: 14, height: 13.9))
        dark.setFill()
        oval101Path.fill()


        //// Oval 102 Drawing
        let oval102Path = UIBezierPath(ovalIn: CGRect(x: 888.95, y: 382.05, width: 14, height: 13.9))
        dark.setFill()
        oval102Path.fill()


        //// Oval 103 Drawing
        let oval103Path = UIBezierPath(ovalIn: CGRect(x: 915.95, y: 410.05, width: 14, height: 13.9))
        dark.setFill()
        oval103Path.fill()


        //// Oval 104 Drawing
        let oval104Path = UIBezierPath(ovalIn: CGRect(x: 804.95, y: 354.05, width: 14, height: 13.9))
        dark.setFill()
        oval104Path.fill()


        //// Oval 105 Drawing
        let oval105Path = UIBezierPath(ovalIn: CGRect(x: 749.95, y: 354.05, width: 14, height: 13.9))
        dark.setFill()
        oval105Path.fill()


        //// Oval 106 Drawing
        let oval106Path = UIBezierPath(ovalIn: CGRect(x: 860.95, y: 354.05, width: 14, height: 13.9))
        dark.setFill()
        oval106Path.fill()


        //// Oval 107 Drawing
        let oval107Path = UIBezierPath(ovalIn: CGRect(x: 915.95, y: 354.05, width: 14, height: 13.9))
        dark.setFill()
        oval107Path.fill()
        
        context.restoreGState()

    }

    @objc dynamic public class func drawPhotoLibrary(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 1000, height: 1000), resizing: ResizingBehavior = .aspectFit, white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), light: UIColor = UIColor(red: 0.769, green: 0.847, blue: 0.984, alpha: 1.000), medium: UIColor = UIColor(red: 0.478, green: 0.663, blue: 0.973, alpha: 1.000), dark: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 1000, height: 1000), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 1000, y: resizedFrame.height / 1000)


        //// Group 2
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 726.66, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 776.92, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 776.92, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 726.66, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 726.66, y: 204.8))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 601.02, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 651.27, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 651.27, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 601.02, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 601.02, y: 204.8))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 475.37, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 525.63, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 525.63, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 475.37, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 475.37, y: 204.8))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 349.73, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 399.98, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 399.98, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 349.73, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 349.73, y: 204.8))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 224.08, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 274.34, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 274.34, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 224.08, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 224.08, y: 204.8))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 852.31, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 852.31, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 890, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 890, y: 104))
        bezierPath.addLine(to: CGPoint(x: 111, y: 104))
        bezierPath.addLine(to: CGPoint(x: 111, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 148.69, y: 129.2))
        bezierPath.addLine(to: CGPoint(x: 148.69, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 111, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 111, y: 230))
        bezierPath.addLine(to: CGPoint(x: 890, y: 230))
        bezierPath.addLine(to: CGPoint(x: 890, y: 204.8))
        bezierPath.addLine(to: CGPoint(x: 852.31, y: 204.8))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        medium.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 726.66, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 776.92, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 776.92, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 726.66, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 726.66, y: 870.8))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: 601.02, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 651.27, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 651.27, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 601.02, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 601.02, y: 870.8))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: 475.37, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 525.63, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 525.63, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 475.37, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 475.37, y: 870.8))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: 349.73, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 399.98, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 399.98, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 349.73, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 349.73, y: 870.8))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: 224.08, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 274.34, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 274.34, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 224.08, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 224.08, y: 870.8))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: 852.31, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 852.31, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 890, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 890, y: 770))
        bezier2Path.addLine(to: CGPoint(x: 111, y: 770))
        bezier2Path.addLine(to: CGPoint(x: 111, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 148.69, y: 795.2))
        bezier2Path.addLine(to: CGPoint(x: 148.69, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 111, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 111, y: 896))
        bezier2Path.addLine(to: CGPoint(x: 890, y: 896))
        bezier2Path.addLine(to: CGPoint(x: 890, y: 870.8))
        bezier2Path.addLine(to: CGPoint(x: 852.31, y: 870.8))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier2Path.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 111, y: 129))
        bezier3Path.addLine(to: CGPoint(x: 890, y: 129))
        bezier3Path.addLine(to: CGPoint(x: 890, y: 104))
        bezier3Path.addLine(to: CGPoint(x: 111, y: 104))
        bezier3Path.addLine(to: CGPoint(x: 111, y: 129))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        light.setFill()
        bezier3Path.fill()


        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 111, y: 230, width: 779, height: 540))
        light.setFill()
        rectanglePath.fill()


        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 427.35, y: 609.85))
        bezier4Path.addLine(to: CGPoint(x: 354.67, y: 537.1))
        bezier4Path.addCurve(to: CGPoint(x: 337.97, y: 513.33), controlPoint1: CGPoint(x: 347.64, y: 529.93), controlPoint2: CGPoint(x: 342.11, y: 522.01))
        bezier4Path.addCurve(to: CGPoint(x: 354.67, y: 417.7), controlPoint1: CGPoint(x: 323.28, y: 482.04), controlPoint2: CGPoint(x: 328.93, y: 443.58))
        bezier4Path.addCurve(to: CGPoint(x: 414.3, y: 393.05), controlPoint1: CGPoint(x: 371.24, y: 401.23), controlPoint2: CGPoint(x: 392.83, y: 393.05))
        bezier4Path.addCurve(to: CGPoint(x: 473.94, y: 417.7), controlPoint1: CGPoint(x: 435.89, y: 393.05), controlPoint2: CGPoint(x: 457.49, y: 401.23))
        bezier4Path.addLine(to: CGPoint(x: 499.54, y: 443.2))
        bezier4Path.addLine(to: CGPoint(x: 525.04, y: 417.7))
        bezier4Path.addCurve(to: CGPoint(x: 644.17, y: 417.7), controlPoint1: CGPoint(x: 558.04, y: 384.77), controlPoint2: CGPoint(x: 611.4, y: 384.77))
        bezier4Path.addCurve(to: CGPoint(x: 661.01, y: 513.46), controlPoint1: CGPoint(x: 670.17, y: 443.58), controlPoint2: CGPoint(x: 675.7, y: 482.04))
        bezier4Path.addCurve(to: CGPoint(x: 644.17, y: 537.1), controlPoint1: CGPoint(x: 656.99, y: 522.01), controlPoint2: CGPoint(x: 651.46, y: 530.05))
        bezier4Path.addLine(to: CGPoint(x: 499.54, y: 682))
        bezier4Path.addLine(to: CGPoint(x: 442.05, y: 624.44))
        bezier4Path.addLine(to: CGPoint(x: 427.35, y: 609.85))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        white.setFill()
        bezier4Path.fill()


        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 386, y: 686.45))
        bezier5Path.addLine(to: CGPoint(x: 324, y: 713))
        bezier5Path.addLine(to: CGPoint(x: 350.55, y: 651))
        bezier5Path.addLine(to: CGPoint(x: 386, y: 686.45))
        bezier5Path.close()
        bezier5Path.usesEvenOddFillRule = true
        white.setFill()
        bezier5Path.fill()


        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 701.65, y: 372))
        bezier6Path.addLine(to: CGPoint(x: 683.76, y: 372))
        bezier6Path.addLine(to: CGPoint(x: 666, y: 354.24))
        bezier6Path.addLine(to: CGPoint(x: 666, y: 336.35))
        bezier6Path.addLine(to: CGPoint(x: 728.36, y: 274))
        bezier6Path.addLine(to: CGPoint(x: 764, y: 309.65))
        bezier6Path.addLine(to: CGPoint(x: 701.65, y: 372))
        bezier6Path.close()
        bezier6Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier6Path.fill()


        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 116.57, y: 764.43))
        bezier7Path.addLine(to: CGPoint(x: 883.43, y: 764.43))
        bezier7Path.addLine(to: CGPoint(x: 883.43, y: 236.57))
        bezier7Path.addLine(to: CGPoint(x: 116.57, y: 236.57))
        bezier7Path.addLine(to: CGPoint(x: 116.57, y: 764.43))
        bezier7Path.close()
        bezier7Path.move(to: CGPoint(x: 889.71, y: 777))
        bezier7Path.addLine(to: CGPoint(x: 110.29, y: 777))
        bezier7Path.addCurve(to: CGPoint(x: 104, y: 770.72), controlPoint1: CGPoint(x: 106.81, y: 777), controlPoint2: CGPoint(x: 104, y: 774.19))
        bezier7Path.addLine(to: CGPoint(x: 104, y: 230.28))
        bezier7Path.addCurve(to: CGPoint(x: 110.29, y: 224), controlPoint1: CGPoint(x: 104, y: 226.81), controlPoint2: CGPoint(x: 106.81, y: 224))
        bezier7Path.addLine(to: CGPoint(x: 889.71, y: 224))
        bezier7Path.addCurve(to: CGPoint(x: 896, y: 230.28), controlPoint1: CGPoint(x: 893.19, y: 224), controlPoint2: CGPoint(x: 896, y: 226.81))
        bezier7Path.addLine(to: CGPoint(x: 896, y: 770.72))
        bezier7Path.addCurve(to: CGPoint(x: 889.71, y: 777), controlPoint1: CGPoint(x: 896, y: 774.19), controlPoint2: CGPoint(x: 893.19, y: 777))
        bezier7Path.close()
        bezier7Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier7Path.fill()


        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 889.75, y: 211))
        bezier8Path.addLine(to: CGPoint(x: 852.25, y: 211))
        bezier8Path.addCurve(to: CGPoint(x: 846, y: 204.71), controlPoint1: CGPoint(x: 848.8, y: 211), controlPoint2: CGPoint(x: 846, y: 208.19))
        bezier8Path.addLine(to: CGPoint(x: 846, y: 129.29))
        bezier8Path.addCurve(to: CGPoint(x: 852.25, y: 123), controlPoint1: CGPoint(x: 846, y: 125.81), controlPoint2: CGPoint(x: 848.8, y: 123))
        bezier8Path.addLine(to: CGPoint(x: 889.75, y: 123))
        bezier8Path.addCurve(to: CGPoint(x: 896, y: 129.29), controlPoint1: CGPoint(x: 893.2, y: 123), controlPoint2: CGPoint(x: 896, y: 125.81))
        bezier8Path.addCurve(to: CGPoint(x: 889.75, y: 135.57), controlPoint1: CGPoint(x: 896, y: 132.76), controlPoint2: CGPoint(x: 893.2, y: 135.57))
        bezier8Path.addLine(to: CGPoint(x: 858.5, y: 135.57))
        bezier8Path.addLine(to: CGPoint(x: 858.5, y: 198.43))
        bezier8Path.addLine(to: CGPoint(x: 889.75, y: 198.43))
        bezier8Path.addCurve(to: CGPoint(x: 896, y: 204.71), controlPoint1: CGPoint(x: 893.2, y: 198.43), controlPoint2: CGPoint(x: 896, y: 201.24))
        bezier8Path.addCurve(to: CGPoint(x: 889.75, y: 211), controlPoint1: CGPoint(x: 896, y: 208.19), controlPoint2: CGPoint(x: 893.2, y: 211))
        bezier8Path.close()
        bezier8Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier8Path.fill()


        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 732.6, y: 198.43))
        bezier9Path.addLine(to: CGPoint(x: 770.4, y: 198.43))
        bezier9Path.addLine(to: CGPoint(x: 770.4, y: 135.57))
        bezier9Path.addLine(to: CGPoint(x: 732.6, y: 135.57))
        bezier9Path.addLine(to: CGPoint(x: 732.6, y: 198.43))
        bezier9Path.close()
        bezier9Path.move(to: CGPoint(x: 776.7, y: 211))
        bezier9Path.addLine(to: CGPoint(x: 726.3, y: 211))
        bezier9Path.addCurve(to: CGPoint(x: 720, y: 204.71), controlPoint1: CGPoint(x: 722.82, y: 211), controlPoint2: CGPoint(x: 720, y: 208.19))
        bezier9Path.addLine(to: CGPoint(x: 720, y: 129.29))
        bezier9Path.addCurve(to: CGPoint(x: 726.3, y: 123), controlPoint1: CGPoint(x: 720, y: 125.81), controlPoint2: CGPoint(x: 722.82, y: 123))
        bezier9Path.addLine(to: CGPoint(x: 776.7, y: 123))
        bezier9Path.addCurve(to: CGPoint(x: 783, y: 129.29), controlPoint1: CGPoint(x: 780.18, y: 123), controlPoint2: CGPoint(x: 783, y: 125.81))
        bezier9Path.addLine(to: CGPoint(x: 783, y: 204.71))
        bezier9Path.addCurve(to: CGPoint(x: 776.7, y: 211), controlPoint1: CGPoint(x: 783, y: 208.19), controlPoint2: CGPoint(x: 780.18, y: 211))
        bezier9Path.close()
        bezier9Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier9Path.fill()


        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 606.6, y: 198.43))
        bezier10Path.addLine(to: CGPoint(x: 644.4, y: 198.43))
        bezier10Path.addLine(to: CGPoint(x: 644.4, y: 135.57))
        bezier10Path.addLine(to: CGPoint(x: 606.6, y: 135.57))
        bezier10Path.addLine(to: CGPoint(x: 606.6, y: 198.43))
        bezier10Path.close()
        bezier10Path.move(to: CGPoint(x: 650.7, y: 211))
        bezier10Path.addLine(to: CGPoint(x: 600.3, y: 211))
        bezier10Path.addCurve(to: CGPoint(x: 594, y: 204.71), controlPoint1: CGPoint(x: 596.82, y: 211), controlPoint2: CGPoint(x: 594, y: 208.19))
        bezier10Path.addLine(to: CGPoint(x: 594, y: 129.29))
        bezier10Path.addCurve(to: CGPoint(x: 600.3, y: 123), controlPoint1: CGPoint(x: 594, y: 125.81), controlPoint2: CGPoint(x: 596.82, y: 123))
        bezier10Path.addLine(to: CGPoint(x: 650.7, y: 123))
        bezier10Path.addCurve(to: CGPoint(x: 657, y: 129.29), controlPoint1: CGPoint(x: 654.18, y: 123), controlPoint2: CGPoint(x: 657, y: 125.81))
        bezier10Path.addLine(to: CGPoint(x: 657, y: 204.71))
        bezier10Path.addCurve(to: CGPoint(x: 650.7, y: 211), controlPoint1: CGPoint(x: 657, y: 208.19), controlPoint2: CGPoint(x: 654.18, y: 211))
        bezier10Path.close()
        bezier10Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier10Path.fill()


        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        bezier11Path.move(to: CGPoint(x: 481.6, y: 198.43))
        bezier11Path.addLine(to: CGPoint(x: 519.4, y: 198.43))
        bezier11Path.addLine(to: CGPoint(x: 519.4, y: 135.57))
        bezier11Path.addLine(to: CGPoint(x: 481.6, y: 135.57))
        bezier11Path.addLine(to: CGPoint(x: 481.6, y: 198.43))
        bezier11Path.close()
        bezier11Path.move(to: CGPoint(x: 525.7, y: 211))
        bezier11Path.addLine(to: CGPoint(x: 475.3, y: 211))
        bezier11Path.addCurve(to: CGPoint(x: 469, y: 204.71), controlPoint1: CGPoint(x: 471.82, y: 211), controlPoint2: CGPoint(x: 469, y: 208.19))
        bezier11Path.addLine(to: CGPoint(x: 469, y: 129.29))
        bezier11Path.addCurve(to: CGPoint(x: 475.3, y: 123), controlPoint1: CGPoint(x: 469, y: 125.81), controlPoint2: CGPoint(x: 471.82, y: 123))
        bezier11Path.addLine(to: CGPoint(x: 525.7, y: 123))
        bezier11Path.addCurve(to: CGPoint(x: 532, y: 129.29), controlPoint1: CGPoint(x: 529.18, y: 123), controlPoint2: CGPoint(x: 532, y: 125.81))
        bezier11Path.addLine(to: CGPoint(x: 532, y: 204.71))
        bezier11Path.addCurve(to: CGPoint(x: 525.7, y: 211), controlPoint1: CGPoint(x: 532, y: 208.19), controlPoint2: CGPoint(x: 529.18, y: 211))
        bezier11Path.close()
        bezier11Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier11Path.fill()


        //// Bezier 12 Drawing
        let bezier12Path = UIBezierPath()
        bezier12Path.move(to: CGPoint(x: 355.6, y: 198.43))
        bezier12Path.addLine(to: CGPoint(x: 393.4, y: 198.43))
        bezier12Path.addLine(to: CGPoint(x: 393.4, y: 135.57))
        bezier12Path.addLine(to: CGPoint(x: 355.6, y: 135.57))
        bezier12Path.addLine(to: CGPoint(x: 355.6, y: 198.43))
        bezier12Path.close()
        bezier12Path.move(to: CGPoint(x: 399.7, y: 211))
        bezier12Path.addLine(to: CGPoint(x: 349.3, y: 211))
        bezier12Path.addCurve(to: CGPoint(x: 343, y: 204.71), controlPoint1: CGPoint(x: 345.82, y: 211), controlPoint2: CGPoint(x: 343, y: 208.19))
        bezier12Path.addLine(to: CGPoint(x: 343, y: 129.29))
        bezier12Path.addCurve(to: CGPoint(x: 349.3, y: 123), controlPoint1: CGPoint(x: 343, y: 125.81), controlPoint2: CGPoint(x: 345.82, y: 123))
        bezier12Path.addLine(to: CGPoint(x: 399.7, y: 123))
        bezier12Path.addCurve(to: CGPoint(x: 406, y: 129.29), controlPoint1: CGPoint(x: 403.18, y: 123), controlPoint2: CGPoint(x: 406, y: 125.81))
        bezier12Path.addLine(to: CGPoint(x: 406, y: 204.71))
        bezier12Path.addCurve(to: CGPoint(x: 399.7, y: 211), controlPoint1: CGPoint(x: 406, y: 208.19), controlPoint2: CGPoint(x: 403.18, y: 211))
        bezier12Path.close()
        bezier12Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier12Path.fill()


        //// Bezier 13 Drawing
        let bezier13Path = UIBezierPath()
        bezier13Path.move(to: CGPoint(x: 229.6, y: 198.43))
        bezier13Path.addLine(to: CGPoint(x: 267.4, y: 198.43))
        bezier13Path.addLine(to: CGPoint(x: 267.4, y: 135.57))
        bezier13Path.addLine(to: CGPoint(x: 229.6, y: 135.57))
        bezier13Path.addLine(to: CGPoint(x: 229.6, y: 198.43))
        bezier13Path.close()
        bezier13Path.move(to: CGPoint(x: 273.7, y: 211))
        bezier13Path.addLine(to: CGPoint(x: 223.3, y: 211))
        bezier13Path.addCurve(to: CGPoint(x: 217, y: 204.71), controlPoint1: CGPoint(x: 219.82, y: 211), controlPoint2: CGPoint(x: 217, y: 208.19))
        bezier13Path.addLine(to: CGPoint(x: 217, y: 129.29))
        bezier13Path.addCurve(to: CGPoint(x: 223.3, y: 123), controlPoint1: CGPoint(x: 217, y: 125.81), controlPoint2: CGPoint(x: 219.82, y: 123))
        bezier13Path.addLine(to: CGPoint(x: 273.7, y: 123))
        bezier13Path.addCurve(to: CGPoint(x: 280, y: 129.29), controlPoint1: CGPoint(x: 277.18, y: 123), controlPoint2: CGPoint(x: 280, y: 125.81))
        bezier13Path.addLine(to: CGPoint(x: 280, y: 204.71))
        bezier13Path.addCurve(to: CGPoint(x: 273.7, y: 211), controlPoint1: CGPoint(x: 280, y: 208.19), controlPoint2: CGPoint(x: 277.18, y: 211))
        bezier13Path.close()
        bezier13Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier13Path.fill()


        //// Bezier 14 Drawing
        let bezier14Path = UIBezierPath()
        bezier14Path.move(to: CGPoint(x: 147.75, y: 211))
        bezier14Path.addLine(to: CGPoint(x: 110.25, y: 211))
        bezier14Path.addCurve(to: CGPoint(x: 104, y: 204.71), controlPoint1: CGPoint(x: 106.8, y: 211), controlPoint2: CGPoint(x: 104, y: 208.19))
        bezier14Path.addCurve(to: CGPoint(x: 110.25, y: 198.43), controlPoint1: CGPoint(x: 104, y: 201.24), controlPoint2: CGPoint(x: 106.8, y: 198.43))
        bezier14Path.addLine(to: CGPoint(x: 141.5, y: 198.43))
        bezier14Path.addLine(to: CGPoint(x: 141.5, y: 135.57))
        bezier14Path.addLine(to: CGPoint(x: 110.25, y: 135.57))
        bezier14Path.addCurve(to: CGPoint(x: 104, y: 129.29), controlPoint1: CGPoint(x: 106.8, y: 135.57), controlPoint2: CGPoint(x: 104, y: 132.76))
        bezier14Path.addCurve(to: CGPoint(x: 110.25, y: 123), controlPoint1: CGPoint(x: 104, y: 125.81), controlPoint2: CGPoint(x: 106.8, y: 123))
        bezier14Path.addLine(to: CGPoint(x: 147.75, y: 123))
        bezier14Path.addCurve(to: CGPoint(x: 154, y: 129.29), controlPoint1: CGPoint(x: 151.2, y: 123), controlPoint2: CGPoint(x: 154, y: 125.81))
        bezier14Path.addLine(to: CGPoint(x: 154, y: 204.71))
        bezier14Path.addCurve(to: CGPoint(x: 147.75, y: 211), controlPoint1: CGPoint(x: 154, y: 208.19), controlPoint2: CGPoint(x: 151.2, y: 211))
        bezier14Path.close()
        bezier14Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier14Path.fill()


        //// Bezier 15 Drawing
        let bezier15Path = UIBezierPath()
        bezier15Path.move(to: CGPoint(x: 889.71, y: 111))
        bezier15Path.addLine(to: CGPoint(x: 110.29, y: 111))
        bezier15Path.addCurve(to: CGPoint(x: 104, y: 104.5), controlPoint1: CGPoint(x: 106.81, y: 111), controlPoint2: CGPoint(x: 104, y: 108.09))
        bezier15Path.addCurve(to: CGPoint(x: 110.29, y: 98), controlPoint1: CGPoint(x: 104, y: 100.91), controlPoint2: CGPoint(x: 106.81, y: 98))
        bezier15Path.addLine(to: CGPoint(x: 889.71, y: 98))
        bezier15Path.addCurve(to: CGPoint(x: 896, y: 104.5), controlPoint1: CGPoint(x: 893.19, y: 98), controlPoint2: CGPoint(x: 896, y: 100.91))
        bezier15Path.addCurve(to: CGPoint(x: 889.71, y: 111), controlPoint1: CGPoint(x: 896, y: 108.09), controlPoint2: CGPoint(x: 893.19, y: 111))
        bezier15Path.close()
        bezier15Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier15Path.fill()


        //// Bezier 16 Drawing
        let bezier16Path = UIBezierPath()
        bezier16Path.move(to: CGPoint(x: 147.75, y: 877))
        bezier16Path.addLine(to: CGPoint(x: 110.25, y: 877))
        bezier16Path.addCurve(to: CGPoint(x: 104, y: 870.71), controlPoint1: CGPoint(x: 106.8, y: 877), controlPoint2: CGPoint(x: 104, y: 874.19))
        bezier16Path.addCurve(to: CGPoint(x: 110.25, y: 864.43), controlPoint1: CGPoint(x: 104, y: 867.24), controlPoint2: CGPoint(x: 106.8, y: 864.43))
        bezier16Path.addLine(to: CGPoint(x: 141.5, y: 864.43))
        bezier16Path.addLine(to: CGPoint(x: 141.5, y: 801.57))
        bezier16Path.addLine(to: CGPoint(x: 110.25, y: 801.57))
        bezier16Path.addCurve(to: CGPoint(x: 104, y: 795.29), controlPoint1: CGPoint(x: 106.8, y: 801.57), controlPoint2: CGPoint(x: 104, y: 798.76))
        bezier16Path.addCurve(to: CGPoint(x: 110.25, y: 789), controlPoint1: CGPoint(x: 104, y: 791.81), controlPoint2: CGPoint(x: 106.8, y: 789))
        bezier16Path.addLine(to: CGPoint(x: 147.75, y: 789))
        bezier16Path.addCurve(to: CGPoint(x: 154, y: 795.29), controlPoint1: CGPoint(x: 151.2, y: 789), controlPoint2: CGPoint(x: 154, y: 791.81))
        bezier16Path.addLine(to: CGPoint(x: 154, y: 870.71))
        bezier16Path.addCurve(to: CGPoint(x: 147.75, y: 877), controlPoint1: CGPoint(x: 154, y: 874.19), controlPoint2: CGPoint(x: 151.2, y: 877))
        bezier16Path.close()
        bezier16Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier16Path.fill()


        //// Bezier 17 Drawing
        let bezier17Path = UIBezierPath()
        bezier17Path.move(to: CGPoint(x: 229.6, y: 864.43))
        bezier17Path.addLine(to: CGPoint(x: 267.4, y: 864.43))
        bezier17Path.addLine(to: CGPoint(x: 267.4, y: 801.57))
        bezier17Path.addLine(to: CGPoint(x: 229.6, y: 801.57))
        bezier17Path.addLine(to: CGPoint(x: 229.6, y: 864.43))
        bezier17Path.close()
        bezier17Path.move(to: CGPoint(x: 273.7, y: 877))
        bezier17Path.addLine(to: CGPoint(x: 223.3, y: 877))
        bezier17Path.addCurve(to: CGPoint(x: 217, y: 870.71), controlPoint1: CGPoint(x: 219.82, y: 877), controlPoint2: CGPoint(x: 217, y: 874.19))
        bezier17Path.addLine(to: CGPoint(x: 217, y: 795.29))
        bezier17Path.addCurve(to: CGPoint(x: 223.3, y: 789), controlPoint1: CGPoint(x: 217, y: 791.81), controlPoint2: CGPoint(x: 219.82, y: 789))
        bezier17Path.addLine(to: CGPoint(x: 273.7, y: 789))
        bezier17Path.addCurve(to: CGPoint(x: 280, y: 795.29), controlPoint1: CGPoint(x: 277.18, y: 789), controlPoint2: CGPoint(x: 280, y: 791.81))
        bezier17Path.addLine(to: CGPoint(x: 280, y: 870.71))
        bezier17Path.addCurve(to: CGPoint(x: 273.7, y: 877), controlPoint1: CGPoint(x: 280, y: 874.19), controlPoint2: CGPoint(x: 277.18, y: 877))
        bezier17Path.close()
        bezier17Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier17Path.fill()


        //// Bezier 18 Drawing
        let bezier18Path = UIBezierPath()
        bezier18Path.move(to: CGPoint(x: 355.6, y: 864.43))
        bezier18Path.addLine(to: CGPoint(x: 393.4, y: 864.43))
        bezier18Path.addLine(to: CGPoint(x: 393.4, y: 801.57))
        bezier18Path.addLine(to: CGPoint(x: 355.6, y: 801.57))
        bezier18Path.addLine(to: CGPoint(x: 355.6, y: 864.43))
        bezier18Path.close()
        bezier18Path.move(to: CGPoint(x: 399.7, y: 877))
        bezier18Path.addLine(to: CGPoint(x: 349.3, y: 877))
        bezier18Path.addCurve(to: CGPoint(x: 343, y: 870.71), controlPoint1: CGPoint(x: 345.82, y: 877), controlPoint2: CGPoint(x: 343, y: 874.19))
        bezier18Path.addLine(to: CGPoint(x: 343, y: 795.29))
        bezier18Path.addCurve(to: CGPoint(x: 349.3, y: 789), controlPoint1: CGPoint(x: 343, y: 791.81), controlPoint2: CGPoint(x: 345.82, y: 789))
        bezier18Path.addLine(to: CGPoint(x: 399.7, y: 789))
        bezier18Path.addCurve(to: CGPoint(x: 406, y: 795.29), controlPoint1: CGPoint(x: 403.18, y: 789), controlPoint2: CGPoint(x: 406, y: 791.81))
        bezier18Path.addLine(to: CGPoint(x: 406, y: 870.71))
        bezier18Path.addCurve(to: CGPoint(x: 399.7, y: 877), controlPoint1: CGPoint(x: 406, y: 874.19), controlPoint2: CGPoint(x: 403.18, y: 877))
        bezier18Path.close()
        bezier18Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier18Path.fill()


        //// Bezier 19 Drawing
        let bezier19Path = UIBezierPath()
        bezier19Path.move(to: CGPoint(x: 481.6, y: 864.43))
        bezier19Path.addLine(to: CGPoint(x: 519.4, y: 864.43))
        bezier19Path.addLine(to: CGPoint(x: 519.4, y: 801.57))
        bezier19Path.addLine(to: CGPoint(x: 481.6, y: 801.57))
        bezier19Path.addLine(to: CGPoint(x: 481.6, y: 864.43))
        bezier19Path.close()
        bezier19Path.move(to: CGPoint(x: 525.7, y: 877))
        bezier19Path.addLine(to: CGPoint(x: 475.3, y: 877))
        bezier19Path.addCurve(to: CGPoint(x: 469, y: 870.71), controlPoint1: CGPoint(x: 471.82, y: 877), controlPoint2: CGPoint(x: 469, y: 874.19))
        bezier19Path.addLine(to: CGPoint(x: 469, y: 795.29))
        bezier19Path.addCurve(to: CGPoint(x: 475.3, y: 789), controlPoint1: CGPoint(x: 469, y: 791.81), controlPoint2: CGPoint(x: 471.82, y: 789))
        bezier19Path.addLine(to: CGPoint(x: 525.7, y: 789))
        bezier19Path.addCurve(to: CGPoint(x: 532, y: 795.29), controlPoint1: CGPoint(x: 529.18, y: 789), controlPoint2: CGPoint(x: 532, y: 791.81))
        bezier19Path.addLine(to: CGPoint(x: 532, y: 870.71))
        bezier19Path.addCurve(to: CGPoint(x: 525.7, y: 877), controlPoint1: CGPoint(x: 532, y: 874.19), controlPoint2: CGPoint(x: 529.18, y: 877))
        bezier19Path.close()
        bezier19Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier19Path.fill()


        //// Bezier 20 Drawing
        let bezier20Path = UIBezierPath()
        bezier20Path.move(to: CGPoint(x: 606.6, y: 864.43))
        bezier20Path.addLine(to: CGPoint(x: 644.4, y: 864.43))
        bezier20Path.addLine(to: CGPoint(x: 644.4, y: 801.57))
        bezier20Path.addLine(to: CGPoint(x: 606.6, y: 801.57))
        bezier20Path.addLine(to: CGPoint(x: 606.6, y: 864.43))
        bezier20Path.close()
        bezier20Path.move(to: CGPoint(x: 650.7, y: 877))
        bezier20Path.addLine(to: CGPoint(x: 600.3, y: 877))
        bezier20Path.addCurve(to: CGPoint(x: 594, y: 870.71), controlPoint1: CGPoint(x: 596.82, y: 877), controlPoint2: CGPoint(x: 594, y: 874.19))
        bezier20Path.addLine(to: CGPoint(x: 594, y: 795.29))
        bezier20Path.addCurve(to: CGPoint(x: 600.3, y: 789), controlPoint1: CGPoint(x: 594, y: 791.81), controlPoint2: CGPoint(x: 596.82, y: 789))
        bezier20Path.addLine(to: CGPoint(x: 650.7, y: 789))
        bezier20Path.addCurve(to: CGPoint(x: 657, y: 795.29), controlPoint1: CGPoint(x: 654.18, y: 789), controlPoint2: CGPoint(x: 657, y: 791.81))
        bezier20Path.addLine(to: CGPoint(x: 657, y: 870.71))
        bezier20Path.addCurve(to: CGPoint(x: 650.7, y: 877), controlPoint1: CGPoint(x: 657, y: 874.19), controlPoint2: CGPoint(x: 654.18, y: 877))
        bezier20Path.close()
        bezier20Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier20Path.fill()


        //// Bezier 21 Drawing
        let bezier21Path = UIBezierPath()
        bezier21Path.move(to: CGPoint(x: 732.6, y: 864.43))
        bezier21Path.addLine(to: CGPoint(x: 770.4, y: 864.43))
        bezier21Path.addLine(to: CGPoint(x: 770.4, y: 801.57))
        bezier21Path.addLine(to: CGPoint(x: 732.6, y: 801.57))
        bezier21Path.addLine(to: CGPoint(x: 732.6, y: 864.43))
        bezier21Path.close()
        bezier21Path.move(to: CGPoint(x: 776.7, y: 877))
        bezier21Path.addLine(to: CGPoint(x: 726.3, y: 877))
        bezier21Path.addCurve(to: CGPoint(x: 720, y: 870.71), controlPoint1: CGPoint(x: 722.82, y: 877), controlPoint2: CGPoint(x: 720, y: 874.19))
        bezier21Path.addLine(to: CGPoint(x: 720, y: 795.29))
        bezier21Path.addCurve(to: CGPoint(x: 726.3, y: 789), controlPoint1: CGPoint(x: 720, y: 791.81), controlPoint2: CGPoint(x: 722.82, y: 789))
        bezier21Path.addLine(to: CGPoint(x: 776.7, y: 789))
        bezier21Path.addCurve(to: CGPoint(x: 783, y: 795.29), controlPoint1: CGPoint(x: 780.18, y: 789), controlPoint2: CGPoint(x: 783, y: 791.81))
        bezier21Path.addLine(to: CGPoint(x: 783, y: 870.71))
        bezier21Path.addCurve(to: CGPoint(x: 776.7, y: 877), controlPoint1: CGPoint(x: 783, y: 874.19), controlPoint2: CGPoint(x: 780.18, y: 877))
        bezier21Path.close()
        bezier21Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier21Path.fill()


        //// Bezier 22 Drawing
        let bezier22Path = UIBezierPath()
        bezier22Path.move(to: CGPoint(x: 889.75, y: 877))
        bezier22Path.addLine(to: CGPoint(x: 852.25, y: 877))
        bezier22Path.addCurve(to: CGPoint(x: 846, y: 870.71), controlPoint1: CGPoint(x: 848.8, y: 877), controlPoint2: CGPoint(x: 846, y: 874.19))
        bezier22Path.addLine(to: CGPoint(x: 846, y: 795.29))
        bezier22Path.addCurve(to: CGPoint(x: 852.25, y: 789), controlPoint1: CGPoint(x: 846, y: 791.81), controlPoint2: CGPoint(x: 848.8, y: 789))
        bezier22Path.addLine(to: CGPoint(x: 889.75, y: 789))
        bezier22Path.addCurve(to: CGPoint(x: 896, y: 795.29), controlPoint1: CGPoint(x: 893.2, y: 789), controlPoint2: CGPoint(x: 896, y: 791.81))
        bezier22Path.addCurve(to: CGPoint(x: 889.75, y: 801.57), controlPoint1: CGPoint(x: 896, y: 798.76), controlPoint2: CGPoint(x: 893.2, y: 801.57))
        bezier22Path.addLine(to: CGPoint(x: 858.5, y: 801.57))
        bezier22Path.addLine(to: CGPoint(x: 858.5, y: 864.43))
        bezier22Path.addLine(to: CGPoint(x: 889.75, y: 864.43))
        bezier22Path.addCurve(to: CGPoint(x: 896, y: 870.71), controlPoint1: CGPoint(x: 893.2, y: 864.43), controlPoint2: CGPoint(x: 896, y: 867.24))
        bezier22Path.addCurve(to: CGPoint(x: 889.75, y: 877), controlPoint1: CGPoint(x: 896, y: 874.19), controlPoint2: CGPoint(x: 893.2, y: 877))
        bezier22Path.close()
        bezier22Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier22Path.fill()


        //// Bezier 23 Drawing
        let bezier23Path = UIBezierPath()
        bezier23Path.move(to: CGPoint(x: 889.71, y: 902))
        bezier23Path.addLine(to: CGPoint(x: 110.29, y: 902))
        bezier23Path.addCurve(to: CGPoint(x: 104, y: 895.5), controlPoint1: CGPoint(x: 106.81, y: 902), controlPoint2: CGPoint(x: 104, y: 899.09))
        bezier23Path.addCurve(to: CGPoint(x: 110.29, y: 889), controlPoint1: CGPoint(x: 104, y: 891.91), controlPoint2: CGPoint(x: 106.81, y: 889))
        bezier23Path.addLine(to: CGPoint(x: 889.71, y: 889))
        bezier23Path.addCurve(to: CGPoint(x: 896, y: 895.5), controlPoint1: CGPoint(x: 893.19, y: 889), controlPoint2: CGPoint(x: 896, y: 891.91))
        bezier23Path.addCurve(to: CGPoint(x: 889.71, y: 902), controlPoint1: CGPoint(x: 896, y: 899.09), controlPoint2: CGPoint(x: 893.19, y: 902))
        bezier23Path.close()
        bezier23Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier23Path.fill()


        //// Bezier 24 Drawing
        let bezier24Path = UIBezierPath()
        bezier24Path.move(to: CGPoint(x: 361.29, y: 682))
        bezier24Path.addCurve(to: CGPoint(x: 356.84, y: 680.16), controlPoint1: CGPoint(x: 359.68, y: 682), controlPoint2: CGPoint(x: 358.07, y: 681.38))
        bezier24Path.addCurve(to: CGPoint(x: 356.84, y: 671.26), controlPoint1: CGPoint(x: 354.39, y: 677.7), controlPoint2: CGPoint(x: 354.39, y: 673.72))
        bezier24Path.addLine(to: CGPoint(x: 495.26, y: 532.84))
        bezier24Path.addCurve(to: CGPoint(x: 504.16, y: 532.84), controlPoint1: CGPoint(x: 497.72, y: 530.39), controlPoint2: CGPoint(x: 501.7, y: 530.39))
        bezier24Path.addCurve(to: CGPoint(x: 504.16, y: 541.74), controlPoint1: CGPoint(x: 506.61, y: 535.3), controlPoint2: CGPoint(x: 506.61, y: 539.28))
        bezier24Path.addLine(to: CGPoint(x: 365.74, y: 680.16))
        bezier24Path.addCurve(to: CGPoint(x: 361.29, y: 682), controlPoint1: CGPoint(x: 364.51, y: 681.38), controlPoint2: CGPoint(x: 362.9, y: 682))
        bezier24Path.close()
        bezier24Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier24Path.fill()


        //// Bezier 25 Drawing
        let bezier25Path = UIBezierPath()
        bezier25Path.move(to: CGPoint(x: 324.3, y: 719))
        bezier25Path.addCurve(to: CGPoint(x: 318.51, y: 715.22), controlPoint1: CGPoint(x: 321.86, y: 719), controlPoint2: CGPoint(x: 319.53, y: 717.59))
        bezier25Path.addCurve(to: CGPoint(x: 321.82, y: 707.01), controlPoint1: CGPoint(x: 317.14, y: 712.05), controlPoint2: CGPoint(x: 318.62, y: 708.37))
        bezier25Path.addLine(to: CGPoint(x: 384.22, y: 680.51))
        bezier25Path.addCurve(to: CGPoint(x: 392.49, y: 683.79), controlPoint1: CGPoint(x: 387.39, y: 679.14), controlPoint2: CGPoint(x: 391.12, y: 680.62))
        bezier25Path.addCurve(to: CGPoint(x: 389.18, y: 692), controlPoint1: CGPoint(x: 393.86, y: 686.97), controlPoint2: CGPoint(x: 392.38, y: 690.64))
        bezier25Path.addLine(to: CGPoint(x: 326.78, y: 718.5))
        bezier25Path.addCurve(to: CGPoint(x: 324.3, y: 719), controlPoint1: CGPoint(x: 325.98, y: 718.84), controlPoint2: CGPoint(x: 325.13, y: 719))
        bezier25Path.close()
        bezier25Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier25Path.fill()


        //// Bezier 26 Drawing
        let bezier26Path = UIBezierPath()
        bezier26Path.move(to: CGPoint(x: 324.25, y: 720))
        bezier26Path.addCurve(to: CGPoint(x: 321.79, y: 719.5), controlPoint1: CGPoint(x: 323.43, y: 720), controlPoint2: CGPoint(x: 322.59, y: 719.84))
        bezier26Path.addCurve(to: CGPoint(x: 318.51, y: 711.21), controlPoint1: CGPoint(x: 318.62, y: 718.12), controlPoint2: CGPoint(x: 317.15, y: 714.41))
        bezier26Path.addLine(to: CGPoint(x: 345.01, y: 648.82))
        bezier26Path.addCurve(to: CGPoint(x: 353.21, y: 645.5), controlPoint1: CGPoint(x: 346.36, y: 645.62), controlPoint2: CGPoint(x: 350.06, y: 644.15))
        bezier26Path.addCurve(to: CGPoint(x: 356.49, y: 653.79), controlPoint1: CGPoint(x: 356.38, y: 646.88), controlPoint2: CGPoint(x: 357.85, y: 650.59))
        bezier26Path.addLine(to: CGPoint(x: 329.99, y: 716.18))
        bezier26Path.addCurve(to: CGPoint(x: 324.25, y: 720), controlPoint1: CGPoint(x: 328.98, y: 718.57), controlPoint2: CGPoint(x: 326.67, y: 720))
        bezier26Path.close()
        bezier26Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier26Path.fill()


        //// Bezier 27 Drawing
        let bezier27Path = UIBezierPath()
        bezier27Path.move(to: CGPoint(x: 652.31, y: 392))
        bezier27Path.addCurve(to: CGPoint(x: 647.85, y: 390.15), controlPoint1: CGPoint(x: 650.69, y: 392), controlPoint2: CGPoint(x: 649.08, y: 391.38))
        bezier27Path.addCurve(to: CGPoint(x: 647.85, y: 381.23), controlPoint1: CGPoint(x: 645.38, y: 387.69), controlPoint2: CGPoint(x: 645.38, y: 383.7))
        bezier27Path.addLine(to: CGPoint(x: 733.23, y: 295.85))
        bezier27Path.addCurve(to: CGPoint(x: 742.15, y: 295.85), controlPoint1: CGPoint(x: 735.7, y: 293.38), controlPoint2: CGPoint(x: 739.69, y: 293.38))
        bezier27Path.addCurve(to: CGPoint(x: 742.15, y: 304.77), controlPoint1: CGPoint(x: 744.62, y: 298.31), controlPoint2: CGPoint(x: 744.62, y: 302.3))
        bezier27Path.addLine(to: CGPoint(x: 656.77, y: 390.15))
        bezier27Path.addCurve(to: CGPoint(x: 652.31, y: 392), controlPoint1: CGPoint(x: 655.53, y: 391.38), controlPoint2: CGPoint(x: 653.92, y: 392))
        bezier27Path.close()
        bezier27Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier27Path.fill()


        //// Bezier 28 Drawing
        let bezier28Path = UIBezierPath()
        bezier28Path.move(to: CGPoint(x: 763.85, y: 316))
        bezier28Path.addCurve(to: CGPoint(x: 759.51, y: 314.2), controlPoint1: CGPoint(x: 762.28, y: 316), controlPoint2: CGPoint(x: 760.71, y: 315.4))
        bezier28Path.addLine(to: CGPoint(x: 750.8, y: 305.5))
        bezier28Path.addCurve(to: CGPoint(x: 750.79, y: 296.8), controlPoint1: CGPoint(x: 748.4, y: 303.1), controlPoint2: CGPoint(x: 748.4, y: 299.2))
        bezier28Path.addCurve(to: CGPoint(x: 759.49, y: 296.8), controlPoint1: CGPoint(x: 753.19, y: 294.4), controlPoint2: CGPoint(x: 757.09, y: 294.4))
        bezier28Path.addLine(to: CGPoint(x: 768.2, y: 305.5))
        bezier28Path.addCurve(to: CGPoint(x: 768.2, y: 314.2), controlPoint1: CGPoint(x: 770.6, y: 307.9), controlPoint2: CGPoint(x: 770.6, y: 311.8))
        bezier28Path.addCurve(to: CGPoint(x: 763.85, y: 316), controlPoint1: CGPoint(x: 767, y: 315.4), controlPoint2: CGPoint(x: 765.43, y: 316))
        bezier28Path.close()
        bezier28Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier28Path.fill()


        //// Bezier 29 Drawing
        let bezier29Path = UIBezierPath()
        bezier29Path.move(to: CGPoint(x: 701.3, y: 378))
        bezier29Path.addCurve(to: CGPoint(x: 696.85, y: 376.15), controlPoint1: CGPoint(x: 699.69, y: 378), controlPoint2: CGPoint(x: 698.08, y: 377.38))
        bezier29Path.addCurve(to: CGPoint(x: 696.85, y: 367.24), controlPoint1: CGPoint(x: 694.38, y: 373.69), controlPoint2: CGPoint(x: 694.38, y: 369.7))
        bezier29Path.addLine(to: CGPoint(x: 759.24, y: 304.85))
        bezier29Path.addCurve(to: CGPoint(x: 768.15, y: 304.85), controlPoint1: CGPoint(x: 761.7, y: 302.38), controlPoint2: CGPoint(x: 765.69, y: 302.38))
        bezier29Path.addCurve(to: CGPoint(x: 768.15, y: 313.76), controlPoint1: CGPoint(x: 770.62, y: 307.31), controlPoint2: CGPoint(x: 770.62, y: 311.3))
        bezier29Path.addLine(to: CGPoint(x: 705.76, y: 376.15))
        bezier29Path.addCurve(to: CGPoint(x: 701.3, y: 378), controlPoint1: CGPoint(x: 704.53, y: 377.38), controlPoint2: CGPoint(x: 702.91, y: 378))
        bezier29Path.close()
        bezier29Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier29Path.fill()


        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(roundedRect: CGRect(x: 678, y: 365, width: 30, height: 13), cornerRadius: 6.2)
        dark.setFill()
        rectangle2Path.fill()


        //// Bezier 30 Drawing
        let bezier30Path = UIBezierPath()
        bezier30Path.move(to: CGPoint(x: 736.85, y: 289))
        bezier30Path.addCurve(to: CGPoint(x: 732.5, y: 287.2), controlPoint1: CGPoint(x: 735.28, y: 289), controlPoint2: CGPoint(x: 733.7, y: 288.4))
        bezier30Path.addLine(to: CGPoint(x: 723.8, y: 278.5))
        bezier30Path.addCurve(to: CGPoint(x: 723.8, y: 269.8), controlPoint1: CGPoint(x: 721.4, y: 276.1), controlPoint2: CGPoint(x: 721.4, y: 272.2))
        bezier30Path.addCurve(to: CGPoint(x: 732.5, y: 269.8), controlPoint1: CGPoint(x: 726.2, y: 267.4), controlPoint2: CGPoint(x: 730.1, y: 267.4))
        bezier30Path.addLine(to: CGPoint(x: 741.2, y: 278.5))
        bezier30Path.addCurve(to: CGPoint(x: 741.2, y: 287.2), controlPoint1: CGPoint(x: 743.6, y: 280.9), controlPoint2: CGPoint(x: 743.6, y: 284.8))
        bezier30Path.addCurve(to: CGPoint(x: 736.85, y: 289), controlPoint1: CGPoint(x: 740, y: 288.4), controlPoint2: CGPoint(x: 738.42, y: 289))
        bezier30Path.close()
        bezier30Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier30Path.fill()


        //// Bezier 31 Drawing
        let bezier31Path = UIBezierPath()
        bezier31Path.move(to: CGPoint(x: 666.3, y: 343))
        bezier31Path.addCurve(to: CGPoint(x: 661.85, y: 341.15), controlPoint1: CGPoint(x: 664.69, y: 343), controlPoint2: CGPoint(x: 663.08, y: 342.38))
        bezier31Path.addCurve(to: CGPoint(x: 661.85, y: 332.24), controlPoint1: CGPoint(x: 659.38, y: 338.69), controlPoint2: CGPoint(x: 659.38, y: 334.7))
        bezier31Path.addLine(to: CGPoint(x: 724.24, y: 269.85))
        bezier31Path.addCurve(to: CGPoint(x: 733.15, y: 269.85), controlPoint1: CGPoint(x: 726.7, y: 267.38), controlPoint2: CGPoint(x: 730.69, y: 267.38))
        bezier31Path.addCurve(to: CGPoint(x: 733.15, y: 278.76), controlPoint1: CGPoint(x: 735.62, y: 272.31), controlPoint2: CGPoint(x: 735.62, y: 276.3))
        bezier31Path.addLine(to: CGPoint(x: 670.76, y: 341.15))
        bezier31Path.addCurve(to: CGPoint(x: 666.3, y: 343), controlPoint1: CGPoint(x: 669.53, y: 342.38), controlPoint2: CGPoint(x: 667.91, y: 343))
        bezier31Path.close()
        bezier31Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier31Path.fill()


        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(roundedRect: CGRect(x: 660, y: 330, width: 13, height: 30), cornerRadius: 6.5)
        dark.setFill()
        rectangle3Path.fill()


        //// Bezier 32 Drawing
        let bezier32Path = UIBezierPath()
        bezier32Path.move(to: CGPoint(x: 500.02, y: 689))
        bezier32Path.addCurve(to: CGPoint(x: 495.57, y: 687.16), controlPoint1: CGPoint(x: 498.35, y: 689), controlPoint2: CGPoint(x: 496.75, y: 688.34))
        bezier32Path.addLine(to: CGPoint(x: 437.97, y: 629.54))
        bezier32Path.addCurve(to: CGPoint(x: 437.97, y: 620.64), controlPoint1: CGPoint(x: 435.52, y: 627.08), controlPoint2: CGPoint(x: 435.52, y: 623.1))
        bezier32Path.addCurve(to: CGPoint(x: 446.86, y: 620.64), controlPoint1: CGPoint(x: 440.43, y: 618.18), controlPoint2: CGPoint(x: 444.41, y: 618.18))
        bezier32Path.addLine(to: CGPoint(x: 500.02, y: 673.81))
        bezier32Path.addLine(to: CGPoint(x: 640.52, y: 533.08))
        bezier32Path.addCurve(to: CGPoint(x: 656.07, y: 511.24), controlPoint1: CGPoint(x: 647.03, y: 526.72), controlPoint2: CGPoint(x: 652.24, y: 519.38))
        bezier32Path.addCurve(to: CGPoint(x: 640.52, y: 422.5), controlPoint1: CGPoint(x: 670.02, y: 481.39), controlPoint2: CGPoint(x: 663.78, y: 445.73))
        bezier32Path.addCurve(to: CGPoint(x: 585.32, y: 399.58), controlPoint1: CGPoint(x: 625.79, y: 407.72), controlPoint2: CGPoint(x: 606.19, y: 399.58))
        bezier32Path.addCurve(to: CGPoint(x: 530.03, y: 422.5), controlPoint1: CGPoint(x: 564.46, y: 399.58), controlPoint2: CGPoint(x: 544.81, y: 407.72))
        bezier32Path.addLine(to: CGPoint(x: 504.46, y: 448.09))
        bezier32Path.addCurve(to: CGPoint(x: 500.02, y: 449.93), controlPoint1: CGPoint(x: 503.28, y: 449.27), controlPoint2: CGPoint(x: 501.69, y: 449.93))
        bezier32Path.addCurve(to: CGPoint(x: 495.57, y: 448.09), controlPoint1: CGPoint(x: 498.35, y: 449.93), controlPoint2: CGPoint(x: 496.75, y: 449.27))
        bezier32Path.addLine(to: CGPoint(x: 470.02, y: 422.5))
        bezier32Path.addCurve(to: CGPoint(x: 414.71, y: 399.58), controlPoint1: CGPoint(x: 455.24, y: 407.72), controlPoint2: CGPoint(x: 435.61, y: 399.58))
        bezier32Path.addCurve(to: CGPoint(x: 359.42, y: 422.5), controlPoint1: CGPoint(x: 393.83, y: 399.58), controlPoint2: CGPoint(x: 374.19, y: 407.72))
        bezier32Path.addCurve(to: CGPoint(x: 343.95, y: 511.14), controlPoint1: CGPoint(x: 336.2, y: 445.75), controlPoint2: CGPoint(x: 329.98, y: 481.38))
        bezier32Path.addCurve(to: CGPoint(x: 359.42, y: 533.06), controlPoint1: CGPoint(x: 347.83, y: 519.31), controlPoint2: CGPoint(x: 353.03, y: 526.7))
        bezier32Path.addLine(to: CGPoint(x: 417.76, y: 591.47))
        bezier32Path.addCurve(to: CGPoint(x: 417.76, y: 600.36), controlPoint1: CGPoint(x: 420.21, y: 593.93), controlPoint2: CGPoint(x: 420.21, y: 597.91))
        bezier32Path.addCurve(to: CGPoint(x: 408.87, y: 600.36), controlPoint1: CGPoint(x: 415.3, y: 602.82), controlPoint2: CGPoint(x: 411.32, y: 602.82))
        bezier32Path.addLine(to: CGPoint(x: 350.54, y: 541.97))
        bezier32Path.addCurve(to: CGPoint(x: 332.58, y: 516.51), controlPoint1: CGPoint(x: 343.13, y: 534.59), controlPoint2: CGPoint(x: 337.09, y: 526.02))
        bezier32Path.addCurve(to: CGPoint(x: 350.53, y: 413.6), controlPoint1: CGPoint(x: 316.36, y: 481.94), controlPoint2: CGPoint(x: 323.57, y: 440.6))
        bezier32Path.addCurve(to: CGPoint(x: 414.71, y: 387), controlPoint1: CGPoint(x: 367.67, y: 396.45), controlPoint2: CGPoint(x: 390.47, y: 387))
        bezier32Path.addCurve(to: CGPoint(x: 478.9, y: 413.6), controlPoint1: CGPoint(x: 438.96, y: 387), controlPoint2: CGPoint(x: 461.76, y: 396.45))
        bezier32Path.addLine(to: CGPoint(x: 500.02, y: 434.74))
        bezier32Path.addLine(to: CGPoint(x: 521.14, y: 413.6))
        bezier32Path.addCurve(to: CGPoint(x: 585.32, y: 387), controlPoint1: CGPoint(x: 538.31, y: 396.45), controlPoint2: CGPoint(x: 561.1, y: 387))
        bezier32Path.addCurve(to: CGPoint(x: 649.41, y: 413.6), controlPoint1: CGPoint(x: 609.55, y: 387), controlPoint2: CGPoint(x: 632.32, y: 396.45))
        bezier32Path.addCurve(to: CGPoint(x: 667.44, y: 516.57), controlPoint1: CGPoint(x: 676.4, y: 440.55), controlPoint2: CGPoint(x: 683.65, y: 481.93))
        bezier32Path.addCurve(to: CGPoint(x: 649.36, y: 542.02), controlPoint1: CGPoint(x: 662.98, y: 526.1), controlPoint2: CGPoint(x: 656.9, y: 534.66))
        bezier32Path.addLine(to: CGPoint(x: 504.46, y: 687.16))
        bezier32Path.addCurve(to: CGPoint(x: 500.02, y: 689), controlPoint1: CGPoint(x: 503.28, y: 688.34), controlPoint2: CGPoint(x: 501.69, y: 689))
        bezier32Path.close()
        bezier32Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier32Path.fill()
        
        context.restoreGState()

    }

    @objc dynamic public class func drawBall(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 1000, height: 1000), resizing: ResizingBehavior = .aspectFit, white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), light: UIColor = UIColor(red: 0.769, green: 0.847, blue: 0.984, alpha: 1.000), medium: UIColor = UIColor(red: 0.478, green: 0.663, blue: 0.973, alpha: 1.000), dark: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 1000, height: 1000), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 1000, y: resizedFrame.height / 1000)


        //// Group 3
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 197, y: 789, width: 606, height: 70))
        light.setFill()
        ovalPath.fill()


        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: 450, y: 845, width: 99, height: 99))
        light.setFill()
        oval2Path.fill()


        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 465, y: 894.5))
        bezierPath.addCurve(to: CGPoint(x: 507, y: 845.72), controlPoint1: CGPoint(x: 465, y: 869.58), controlPoint2: CGPoint(x: 483.28, y: 849.17))
        bezierPath.addCurve(to: CGPoint(x: 500, y: 845), controlPoint1: CGPoint(x: 504.7, y: 845.39), controlPoint2: CGPoint(x: 502.4, y: 845))
        bezierPath.addCurve(to: CGPoint(x: 451, y: 894.5), controlPoint1: CGPoint(x: 472.94, y: 845), controlPoint2: CGPoint(x: 451, y: 867.15))
        bezierPath.addCurve(to: CGPoint(x: 500, y: 944), controlPoint1: CGPoint(x: 451, y: 921.85), controlPoint2: CGPoint(x: 472.94, y: 944))
        bezierPath.addCurve(to: CGPoint(x: 507, y: 943.28), controlPoint1: CGPoint(x: 502.4, y: 944), controlPoint2: CGPoint(x: 504.7, y: 943.61))
        bezierPath.addCurve(to: CGPoint(x: 465, y: 894.5), controlPoint1: CGPoint(x: 483.28, y: 939.83), controlPoint2: CGPoint(x: 465, y: 919.41))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        white.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 535, y: 894.5))
        bezier2Path.addCurve(to: CGPoint(x: 493, y: 845.72), controlPoint1: CGPoint(x: 535, y: 869.58), controlPoint2: CGPoint(x: 516.72, y: 849.17))
        bezier2Path.addCurve(to: CGPoint(x: 500, y: 845), controlPoint1: CGPoint(x: 495.3, y: 845.39), controlPoint2: CGPoint(x: 497.6, y: 845))
        bezier2Path.addCurve(to: CGPoint(x: 549, y: 894.5), controlPoint1: CGPoint(x: 527.06, y: 845), controlPoint2: CGPoint(x: 549, y: 867.15))
        bezier2Path.addCurve(to: CGPoint(x: 500, y: 944), controlPoint1: CGPoint(x: 549, y: 921.85), controlPoint2: CGPoint(x: 527.06, y: 944))
        bezier2Path.addCurve(to: CGPoint(x: 493, y: 943.28), controlPoint1: CGPoint(x: 497.6, y: 944), controlPoint2: CGPoint(x: 495.3, y: 943.61))
        bezier2Path.addCurve(to: CGPoint(x: 535, y: 894.5), controlPoint1: CGPoint(x: 516.72, y: 939.83), controlPoint2: CGPoint(x: 535, y: 919.41))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier2Path.fill()


        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: 479, y: 789, width: 42, height: 61))
        medium.setFill()
        rectangle2Path.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 291.42, y: 347.09))
        bezier3Path.addCurve(to: CGPoint(x: 471.27, y: 254.35), controlPoint1: CGPoint(x: 374.72, y: 327.39), controlPoint2: CGPoint(x: 471.27, y: 254.35))
        bezier3Path.addLine(to: CGPoint(x: 476.35, y: 249))
        bezier3Path.addCurve(to: CGPoint(x: 499.5, y: 254.06), controlPoint1: CGPoint(x: 483.27, y: 252.37), controlPoint2: CGPoint(x: 491.18, y: 254.06))
        bezier3Path.addLine(to: CGPoint(x: 520.67, y: 263.92))
        bezier3Path.addLine(to: CGPoint(x: 588.29, y: 293.89))
        bezier3Path.addCurve(to: CGPoint(x: 707.56, y: 346.95), controlPoint1: CGPoint(x: 622.45, y: 314.44), controlPoint2: CGPoint(x: 666.5, y: 337.24))
        bezier3Path.addLine(to: CGPoint(x: 704.19, y: 360.46))
        bezier3Path.addCurve(to: CGPoint(x: 803, y: 817), controlPoint1: CGPoint(x: 704.19, y: 654.59), controlPoint2: CGPoint(x: 803, y: 690.34))
        bezier3Path.addCurve(to: CGPoint(x: 499.5, y: 788.85), controlPoint1: CGPoint(x: 803, y: 817), controlPoint2: CGPoint(x: 690.07, y: 788.85))
        bezier3Path.addCurve(to: CGPoint(x: 196, y: 817), controlPoint1: CGPoint(x: 308.93, y: 788.85), controlPoint2: CGPoint(x: 196, y: 817))
        bezier3Path.addCurve(to: CGPoint(x: 294.81, y: 360.46), controlPoint1: CGPoint(x: 196, y: 690.34), controlPoint2: CGPoint(x: 294.81, y: 654.59))
        bezier3Path.addLine(to: CGPoint(x: 291.42, y: 347.09))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        light.setFill()
        bezier3Path.fill()


        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 238.51, y: 808.64))
        bezier4Path.addCurve(to: CGPoint(x: 337, y: 360.38), controlPoint1: CGPoint(x: 242.74, y: 688.64), controlPoint2: CGPoint(x: 337, y: 647.95))
        bezier4Path.addLine(to: CGPoint(x: 331.74, y: 334))
        bezier4Path.addLine(to: CGPoint(x: 291.31, y: 347.01))
        bezier4Path.addLine(to: CGPoint(x: 294.7, y: 360.39))
        bezier4Path.addCurve(to: CGPoint(x: 196, y: 817), controlPoint1: CGPoint(x: 294.7, y: 654.57), controlPoint2: CGPoint(x: 196, y: 690.32))
        bezier4Path.addCurve(to: CGPoint(x: 238.51, y: 808.64), controlPoint1: CGPoint(x: 196, y: 817), controlPoint2: CGPoint(x: 210.86, y: 813.33))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        white.setFill()
        bezier4Path.fill()


        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 759.49, y: 808.64))
        bezier5Path.addCurve(to: CGPoint(x: 661, y: 360.38), controlPoint1: CGPoint(x: 755.25, y: 688.64), controlPoint2: CGPoint(x: 661, y: 647.95))
        bezier5Path.addLine(to: CGPoint(x: 666.26, y: 334))
        bezier5Path.addLine(to: CGPoint(x: 706.69, y: 347.01))
        bezier5Path.addLine(to: CGPoint(x: 703.3, y: 360.39))
        bezier5Path.addCurve(to: CGPoint(x: 802, y: 817), controlPoint1: CGPoint(x: 703.3, y: 654.57), controlPoint2: CGPoint(x: 802, y: 690.32))
        bezier5Path.addCurve(to: CGPoint(x: 759.49, y: 808.64), controlPoint1: CGPoint(x: 802, y: 817), controlPoint2: CGPoint(x: 787.14, y: 813.33))
        bezier5Path.close()
        bezier5Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier5Path.fill()


        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 419.74, y: 302.87))
        bezier6Path.addLine(to: CGPoint(x: 380, y: 408.92))
        bezier6Path.addLine(to: CGPoint(x: 422.43, y: 394.83))
        bezier6Path.addLine(to: CGPoint(x: 464.86, y: 423))
        bezier6Path.addLine(to: CGPoint(x: 479, y: 263.86))
        bezier6Path.addLine(to: CGPoint(x: 471.36, y: 254))
        bezier6Path.addCurve(to: CGPoint(x: 411.26, y: 293.86), controlPoint1: CGPoint(x: 471.36, y: 254), controlPoint2: CGPoint(x: 446.61, y: 272.73))
        bezier6Path.addLine(to: CGPoint(x: 419.74, y: 302.87))
        bezier6Path.close()
        bezier6Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier6Path.fill()


        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 544.9, y: 183.29))
        bezier7Path.addCurve(to: CGPoint(x: 549, y: 204.5), controlPoint1: CGPoint(x: 547.58, y: 189.37), controlPoint2: CGPoint(x: 549, y: 196.58))
        bezier7Path.addCurve(to: CGPoint(x: 544.9, y: 225.71), controlPoint1: CGPoint(x: 549, y: 212.42), controlPoint2: CGPoint(x: 547.58, y: 219.63))
        bezier7Path.addCurve(to: CGPoint(x: 499.5, y: 254), controlPoint1: CGPoint(x: 537.12, y: 243.96), controlPoint2: CGPoint(x: 519.29, y: 254))
        bezier7Path.addCurve(to: CGPoint(x: 476.3, y: 248.91), controlPoint1: CGPoint(x: 491.16, y: 254), controlPoint2: CGPoint(x: 483.24, y: 252.3))
        bezier7Path.addCurve(to: CGPoint(x: 454.1, y: 225.71), controlPoint1: CGPoint(x: 466.54, y: 244.24), controlPoint2: CGPoint(x: 458.63, y: 236.32))
        bezier7Path.addCurve(to: CGPoint(x: 450, y: 204.5), controlPoint1: CGPoint(x: 451.41, y: 219.63), controlPoint2: CGPoint(x: 450, y: 212.42))
        bezier7Path.addCurve(to: CGPoint(x: 454.1, y: 183.29), controlPoint1: CGPoint(x: 450, y: 196.58), controlPoint2: CGPoint(x: 451.42, y: 189.37))
        bezier7Path.addCurve(to: CGPoint(x: 476.3, y: 160.09), controlPoint1: CGPoint(x: 458.63, y: 172.68), controlPoint2: CGPoint(x: 466.54, y: 164.76))
        bezier7Path.addCurve(to: CGPoint(x: 499.5, y: 155), controlPoint1: CGPoint(x: 483.24, y: 156.7), controlPoint2: CGPoint(x: 491.16, y: 155))
        bezier7Path.addCurve(to: CGPoint(x: 544.9, y: 183.29), controlPoint1: CGPoint(x: 519.29, y: 155), controlPoint2: CGPoint(x: 537.12, y: 165.04))
        bezier7Path.close()
        bezier7Path.usesEvenOddFillRule = true
        light.setFill()
        bezier7Path.fill()


        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 451, y: 204))
        bezier8Path.addCurve(to: CGPoint(x: 455.06, y: 183.18), controlPoint1: CGPoint(x: 451.04, y: 196.23), controlPoint2: CGPoint(x: 452.43, y: 189.16))
        bezier8Path.addCurve(to: CGPoint(x: 451, y: 204), controlPoint1: CGPoint(x: 452.43, y: 189.16), controlPoint2: CGPoint(x: 451.04, y: 196.23))
        bezier8Path.close()
        bezier8Path.move(to: CGPoint(x: 477.04, y: 160.07))
        bezier8Path.addCurve(to: CGPoint(x: 500, y: 155), controlPoint1: CGPoint(x: 483.9, y: 156.69), controlPoint2: CGPoint(x: 491.74, y: 155))
        bezier8Path.addCurve(to: CGPoint(x: 477.04, y: 160.07), controlPoint1: CGPoint(x: 491.74, y: 155), controlPoint2: CGPoint(x: 483.9, y: 156.69))
        bezier8Path.close()
        bezier8Path.usesEvenOddFillRule = true
        UIColor.red.setFill()
        bezier8Path.fill()


        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 499.73, y: 254))
        bezier9Path.addCurve(to: CGPoint(x: 476.43, y: 248.91), controlPoint1: CGPoint(x: 491.35, y: 254), controlPoint2: CGPoint(x: 483.39, y: 252.3))
        bezier9Path.addCurve(to: CGPoint(x: 454.12, y: 225.71), controlPoint1: CGPoint(x: 466.62, y: 244.24), controlPoint2: CGPoint(x: 458.67, y: 236.32))
        bezier9Path.addCurve(to: CGPoint(x: 450, y: 204.78), controlPoint1: CGPoint(x: 451.45, y: 219.7), controlPoint2: CGPoint(x: 450.03, y: 212.59))
        bezier9Path.addCurve(to: CGPoint(x: 450, y: 204.5), controlPoint1: CGPoint(x: 450, y: 204.69), controlPoint2: CGPoint(x: 450, y: 204.59))
        bezier9Path.addCurve(to: CGPoint(x: 450, y: 204.18), controlPoint1: CGPoint(x: 450, y: 204.4), controlPoint2: CGPoint(x: 450, y: 204.29))
        bezier9Path.addCurve(to: CGPoint(x: 454.12, y: 183.29), controlPoint1: CGPoint(x: 450.04, y: 196.39), controlPoint2: CGPoint(x: 451.46, y: 189.29))
        bezier9Path.addCurve(to: CGPoint(x: 476.43, y: 160.09), controlPoint1: CGPoint(x: 458.67, y: 172.68), controlPoint2: CGPoint(x: 466.62, y: 164.76))
        bezier9Path.addCurve(to: CGPoint(x: 499.73, y: 155), controlPoint1: CGPoint(x: 483.39, y: 156.7), controlPoint2: CGPoint(x: 491.35, y: 155))
        bezier9Path.addCurve(to: CGPoint(x: 500, y: 155), controlPoint1: CGPoint(x: 499.82, y: 155), controlPoint2: CGPoint(x: 499.91, y: 155))
        bezier9Path.addCurve(to: CGPoint(x: 492.09, y: 155.63), controlPoint1: CGPoint(x: 497.32, y: 155.02), controlPoint2: CGPoint(x: 494.68, y: 155.25))
        bezier9Path.addCurve(to: CGPoint(x: 500, y: 156.89), controlPoint1: CGPoint(x: 494.78, y: 155.91), controlPoint2: CGPoint(x: 497.43, y: 156.31))
        bezier9Path.addCurve(to: CGPoint(x: 490.64, y: 160.09), controlPoint1: CGPoint(x: 496.72, y: 157.63), controlPoint2: CGPoint(x: 493.58, y: 158.66))
        bezier9Path.addCurve(to: CGPoint(x: 468.33, y: 183.29), controlPoint1: CGPoint(x: 480.83, y: 164.76), controlPoint2: CGPoint(x: 472.88, y: 172.68))
        bezier9Path.addCurve(to: CGPoint(x: 464.21, y: 204.5), controlPoint1: CGPoint(x: 465.63, y: 189.37), controlPoint2: CGPoint(x: 464.21, y: 196.58))
        bezier9Path.addCurve(to: CGPoint(x: 468.33, y: 225.71), controlPoint1: CGPoint(x: 464.21, y: 212.42), controlPoint2: CGPoint(x: 465.63, y: 219.63))
        bezier9Path.addCurve(to: CGPoint(x: 490.64, y: 248.91), controlPoint1: CGPoint(x: 472.88, y: 236.32), controlPoint2: CGPoint(x: 480.83, y: 244.24))
        bezier9Path.addCurve(to: CGPoint(x: 500, y: 252.11), controlPoint1: CGPoint(x: 493.58, y: 250.34), controlPoint2: CGPoint(x: 496.72, y: 251.37))
        bezier9Path.addCurve(to: CGPoint(x: 492.09, y: 253.37), controlPoint1: CGPoint(x: 497.43, y: 252.69), controlPoint2: CGPoint(x: 494.78, y: 253.09))
        bezier9Path.addCurve(to: CGPoint(x: 500, y: 254), controlPoint1: CGPoint(x: 494.68, y: 253.75), controlPoint2: CGPoint(x: 497.32, y: 253.98))
        bezier9Path.addCurve(to: CGPoint(x: 499.73, y: 254), controlPoint1: CGPoint(x: 499.91, y: 254), controlPoint2: CGPoint(x: 499.82, y: 254))
        bezier9Path.close()
        bezier9Path.usesEvenOddFillRule = true
        white.setFill()
        bezier9Path.fill()


        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 500.25, y: 254))
        bezier10Path.addCurve(to: CGPoint(x: 500, y: 254), controlPoint1: CGPoint(x: 500.17, y: 254), controlPoint2: CGPoint(x: 500.09, y: 254))
        bezier10Path.addCurve(to: CGPoint(x: 545.35, y: 225.71), controlPoint1: CGPoint(x: 519.78, y: 253.9), controlPoint2: CGPoint(x: 537.57, y: 243.87))
        bezier10Path.addCurve(to: CGPoint(x: 549.47, y: 204.5), controlPoint1: CGPoint(x: 548.04, y: 219.63), controlPoint2: CGPoint(x: 549.47, y: 212.42))
        bezier10Path.addCurve(to: CGPoint(x: 545.35, y: 183.29), controlPoint1: CGPoint(x: 549.47, y: 196.58), controlPoint2: CGPoint(x: 548.04, y: 189.37))
        bezier10Path.addCurve(to: CGPoint(x: 500, y: 155), controlPoint1: CGPoint(x: 537.57, y: 165.13), controlPoint2: CGPoint(x: 519.78, y: 155.1))
        bezier10Path.addCurve(to: CGPoint(x: 500.25, y: 155), controlPoint1: CGPoint(x: 500.09, y: 155), controlPoint2: CGPoint(x: 500.17, y: 155))
        bezier10Path.addCurve(to: CGPoint(x: 523.57, y: 160.09), controlPoint1: CGPoint(x: 508.64, y: 155), controlPoint2: CGPoint(x: 516.6, y: 156.7))
        bezier10Path.addCurve(to: CGPoint(x: 545.88, y: 183.29), controlPoint1: CGPoint(x: 533.37, y: 164.76), controlPoint2: CGPoint(x: 541.34, y: 172.68))
        bezier10Path.addCurve(to: CGPoint(x: 550, y: 204.5), controlPoint1: CGPoint(x: 548.58, y: 189.37), controlPoint2: CGPoint(x: 550, y: 196.58))
        bezier10Path.addCurve(to: CGPoint(x: 545.88, y: 225.71), controlPoint1: CGPoint(x: 550, y: 212.42), controlPoint2: CGPoint(x: 548.58, y: 219.63))
        bezier10Path.addCurve(to: CGPoint(x: 523.57, y: 248.91), controlPoint1: CGPoint(x: 541.34, y: 236.32), controlPoint2: CGPoint(x: 533.37, y: 244.24))
        bezier10Path.addCurve(to: CGPoint(x: 500.25, y: 254), controlPoint1: CGPoint(x: 516.6, y: 252.3), controlPoint2: CGPoint(x: 508.64, y: 254))
        bezier10Path.close()
        bezier10Path.usesEvenOddFillRule = true
        UIColor.red.setFill()
        bezier10Path.fill()


        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        bezier11Path.move(to: CGPoint(x: 500.01, y: 254))
        bezier11Path.addCurve(to: CGPoint(x: 500, y: 254), controlPoint1: CGPoint(x: 500.01, y: 254), controlPoint2: CGPoint(x: 500.01, y: 254))
        bezier11Path.addCurve(to: CGPoint(x: 507.84, y: 253.37), controlPoint1: CGPoint(x: 502.66, y: 253.98), controlPoint2: CGPoint(x: 505.27, y: 253.75))
        bezier11Path.addCurve(to: CGPoint(x: 500, y: 252.11), controlPoint1: CGPoint(x: 505.17, y: 253.09), controlPoint2: CGPoint(x: 502.54, y: 252.69))
        bezier11Path.addCurve(to: CGPoint(x: 509.27, y: 248.91), controlPoint1: CGPoint(x: 503.25, y: 251.37), controlPoint2: CGPoint(x: 506.36, y: 250.34))
        bezier11Path.addCurve(to: CGPoint(x: 531.36, y: 225.71), controlPoint1: CGPoint(x: 518.98, y: 244.24), controlPoint2: CGPoint(x: 526.87, y: 236.32))
        bezier11Path.addCurve(to: CGPoint(x: 535.45, y: 204.5), controlPoint1: CGPoint(x: 534.05, y: 219.63), controlPoint2: CGPoint(x: 535.45, y: 212.42))
        bezier11Path.addCurve(to: CGPoint(x: 531.36, y: 183.29), controlPoint1: CGPoint(x: 535.45, y: 196.58), controlPoint2: CGPoint(x: 534.05, y: 189.37))
        bezier11Path.addCurve(to: CGPoint(x: 509.27, y: 160.09), controlPoint1: CGPoint(x: 526.87, y: 172.68), controlPoint2: CGPoint(x: 518.98, y: 164.76))
        bezier11Path.addCurve(to: CGPoint(x: 500, y: 156.89), controlPoint1: CGPoint(x: 506.36, y: 158.66), controlPoint2: CGPoint(x: 503.25, y: 157.63))
        bezier11Path.addCurve(to: CGPoint(x: 507.84, y: 155.63), controlPoint1: CGPoint(x: 502.54, y: 156.31), controlPoint2: CGPoint(x: 505.17, y: 155.91))
        bezier11Path.addCurve(to: CGPoint(x: 500, y: 155), controlPoint1: CGPoint(x: 505.27, y: 155.25), controlPoint2: CGPoint(x: 502.66, y: 155.02))
        bezier11Path.addCurve(to: CGPoint(x: 500.01, y: 155), controlPoint1: CGPoint(x: 500.01, y: 155), controlPoint2: CGPoint(x: 500.01, y: 155))
        bezier11Path.addCurve(to: CGPoint(x: 544.92, y: 183.29), controlPoint1: CGPoint(x: 519.6, y: 155.1), controlPoint2: CGPoint(x: 537.22, y: 165.13))
        bezier11Path.addCurve(to: CGPoint(x: 549, y: 204.5), controlPoint1: CGPoint(x: 547.59, y: 189.37), controlPoint2: CGPoint(x: 549, y: 196.58))
        bezier11Path.addCurve(to: CGPoint(x: 544.92, y: 225.71), controlPoint1: CGPoint(x: 549, y: 212.42), controlPoint2: CGPoint(x: 547.58, y: 219.63))
        bezier11Path.addCurve(to: CGPoint(x: 500.01, y: 254), controlPoint1: CGPoint(x: 537.22, y: 243.87), controlPoint2: CGPoint(x: 519.6, y: 253.9))
        bezier11Path.close()
        bezier11Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier11Path.fill()


        //// Bezier 12 Drawing
        let bezier12Path = UIBezierPath()
        bezier12Path.move(to: CGPoint(x: 454.45, y: 226.01))
        bezier12Path.addCurve(to: CGPoint(x: 476.6, y: 249.12), controlPoint1: CGPoint(x: 458.96, y: 236.58), controlPoint2: CGPoint(x: 466.86, y: 244.47))
        bezier12Path.addLine(to: CGPoint(x: 471.52, y: 254.48))
        bezier12Path.addCurve(to: CGPoint(x: 291.78, y: 347.34), controlPoint1: CGPoint(x: 471.52, y: 254.48), controlPoint2: CGPoint(x: 375.02, y: 327.61))
        bezier12Path.addCurve(to: CGPoint(x: 190.77, y: 322.54), controlPoint1: CGPoint(x: 250.45, y: 357.35), controlPoint2: CGPoint(x: 212.35, y: 354.11))
        bezier12Path.addCurve(to: CGPoint(x: 240.57, y: 56.9), controlPoint1: CGPoint(x: 158.74, y: 275.89), controlPoint2: CGPoint(x: 108.37, y: 56.9))
        bezier12Path.addCurve(to: CGPoint(x: 471.38, y: 155.26), controlPoint1: CGPoint(x: 399.85, y: 56.9), controlPoint2: CGPoint(x: 471.38, y: 155.26))
        bezier12Path.addLine(to: CGPoint(x: 476.6, y: 160.62))
        bezier12Path.addCurve(to: CGPoint(x: 454.45, y: 183.73), controlPoint1: CGPoint(x: 466.87, y: 165.27), controlPoint2: CGPoint(x: 458.97, y: 173.16))
        bezier12Path.addCurve(to: CGPoint(x: 450.36, y: 204.87), controlPoint1: CGPoint(x: 451.77, y: 189.79), controlPoint2: CGPoint(x: 450.36, y: 196.98))
        bezier12Path.addCurve(to: CGPoint(x: 454.45, y: 226.01), controlPoint1: CGPoint(x: 450.36, y: 212.76), controlPoint2: CGPoint(x: 451.77, y: 219.95))
        bezier12Path.close()
        bezier12Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier12Path.fill()


        //// Bezier 13 Drawing
        let bezier13Path = UIBezierPath()
        bezier13Path.move(to: CGPoint(x: 233.09, y: 322.54))
        bezier13Path.addCurve(to: CGPoint(x: 268.45, y: 57.97), controlPoint1: CGPoint(x: 202.31, y: 277.7), controlPoint2: CGPoint(x: 154.66, y: 73.69))
        bezier13Path.addCurve(to: CGPoint(x: 240.57, y: 56.9), controlPoint1: CGPoint(x: 259.46, y: 57.29), controlPoint2: CGPoint(x: 250.19, y: 56.9))
        bezier13Path.addCurve(to: CGPoint(x: 190.77, y: 322.54), controlPoint1: CGPoint(x: 108.37, y: 56.9), controlPoint2: CGPoint(x: 158.74, y: 275.89))
        bezier13Path.addCurve(to: CGPoint(x: 276.05, y: 350.49), controlPoint1: CGPoint(x: 209.58, y: 350.05), controlPoint2: CGPoint(x: 240.94, y: 356.02))
        bezier13Path.addCurve(to: CGPoint(x: 233.09, y: 322.54), controlPoint1: CGPoint(x: 258.73, y: 346.96), controlPoint2: CGPoint(x: 243.85, y: 338.28))
        bezier13Path.close()
        bezier13Path.usesEvenOddFillRule = true
        light.setFill()
        bezier13Path.fill()


        //// Bezier 14 Drawing
        let bezier14Path = UIBezierPath()
        bezier14Path.move(to: CGPoint(x: 499.74, y: 254.19))
        bezier14Path.addCurve(to: CGPoint(x: 545.02, y: 226.01), controlPoint1: CGPoint(x: 519.48, y: 254.19), controlPoint2: CGPoint(x: 537.27, y: 244.19))
        bezier14Path.addCurve(to: CGPoint(x: 549.12, y: 204.87), controlPoint1: CGPoint(x: 547.7, y: 219.95), controlPoint2: CGPoint(x: 549.12, y: 212.76))
        bezier14Path.addCurve(to: CGPoint(x: 545.02, y: 183.73), controlPoint1: CGPoint(x: 549.12, y: 196.98), controlPoint2: CGPoint(x: 547.7, y: 189.79))
        bezier14Path.addCurve(to: CGPoint(x: 499.74, y: 155.55), controlPoint1: CGPoint(x: 537.27, y: 165.55), controlPoint2: CGPoint(x: 519.48, y: 155.55))
        bezier14Path.addLine(to: CGPoint(x: 528.66, y: 155.55))
        bezier14Path.addCurve(to: CGPoint(x: 758.91, y: 56.9), controlPoint1: CGPoint(x: 528.66, y: 155.55), controlPoint2: CGPoint(x: 599.62, y: 56.9))
        bezier14Path.addCurve(to: CGPoint(x: 808.85, y: 322.54), controlPoint1: CGPoint(x: 891.09, y: 56.9), controlPoint2: CGPoint(x: 840.73, y: 275.89))
        bezier14Path.addCurve(to: CGPoint(x: 707.68, y: 347.2), controlPoint1: CGPoint(x: 787.26, y: 354.25), controlPoint2: CGPoint(x: 749.03, y: 357.35))
        bezier14Path.addCurve(to: CGPoint(x: 588.48, y: 294.07), controlPoint1: CGPoint(x: 666.64, y: 337.48), controlPoint2: CGPoint(x: 622.62, y: 314.65))
        bezier14Path.addCurve(to: CGPoint(x: 528.52, y: 254.19), controlPoint1: CGPoint(x: 553.21, y: 272.94), controlPoint2: CGPoint(x: 528.52, y: 254.19))
        bezier14Path.addLine(to: CGPoint(x: 520.9, y: 264.06))
        bezier14Path.addLine(to: CGPoint(x: 499.74, y: 254.19))
        bezier14Path.close()
        bezier14Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier14Path.fill()


        //// Bezier 15 Drawing
        let bezier15Path = UIBezierPath()
        bezier15Path.move(to: CGPoint(x: 580.25, y: 302.87))
        bezier15Path.addLine(to: CGPoint(x: 620, y: 408.92))
        bezier15Path.addLine(to: CGPoint(x: 577.57, y: 394.83))
        bezier15Path.addLine(to: CGPoint(x: 535.14, y: 423))
        bezier15Path.addLine(to: CGPoint(x: 521, y: 263.86))
        bezier15Path.addLine(to: CGPoint(x: 528.64, y: 254))
        bezier15Path.addCurve(to: CGPoint(x: 588.74, y: 293.86), controlPoint1: CGPoint(x: 528.64, y: 254), controlPoint2: CGPoint(x: 553.39, y: 272.73))
        bezier15Path.addLine(to: CGPoint(x: 580.25, y: 302.87))
        bezier15Path.close()
        bezier15Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier15Path.fill()


        //// Bezier 16 Drawing
        let bezier16Path = UIBezierPath()
        bezier16Path.move(to: CGPoint(x: 545.06, y: 866))
        bezier16Path.addCurve(to: CGPoint(x: 538, y: 859.09), controlPoint1: CGPoint(x: 541.24, y: 866), controlPoint2: CGPoint(x: 538.1, y: 862.94))
        bezier16Path.addCurve(to: CGPoint(x: 544.89, y: 851.82), controlPoint1: CGPoint(x: 537.92, y: 855.16), controlPoint2: CGPoint(x: 540.99, y: 851.92))
        bezier16Path.addCurve(to: CGPoint(x: 801.25, y: 824.2), controlPoint1: CGPoint(x: 704.01, y: 847.98), controlPoint2: CGPoint(x: 797.36, y: 825.17))
        bezier16Path.addCurve(to: CGPoint(x: 809.79, y: 829.4), controlPoint1: CGPoint(x: 805.01, y: 823.28), controlPoint2: CGPoint(x: 808.85, y: 825.57))
        bezier16Path.addCurve(to: CGPoint(x: 804.64, y: 837.98), controlPoint1: CGPoint(x: 810.73, y: 833.19), controlPoint2: CGPoint(x: 808.43, y: 837.04))
        bezier16Path.addCurve(to: CGPoint(x: 545.24, y: 866), controlPoint1: CGPoint(x: 800.68, y: 838.96), controlPoint2: CGPoint(x: 705.89, y: 862.11))
        bezier16Path.addLine(to: CGPoint(x: 545.06, y: 866))
        bezier16Path.close()
        bezier16Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier16Path.fill()


        //// Bezier 17 Drawing
        let bezier17Path = UIBezierPath()
        bezier17Path.move(to: CGPoint(x: 453.95, y: 866))
        bezier17Path.addLine(to: CGPoint(x: 453.77, y: 866))
        bezier17Path.addCurve(to: CGPoint(x: 194.36, y: 837.98), controlPoint1: CGPoint(x: 293.12, y: 862.11), controlPoint2: CGPoint(x: 198.32, y: 838.96))
        bezier17Path.addCurve(to: CGPoint(x: 189.21, y: 829.4), controlPoint1: CGPoint(x: 190.58, y: 837.04), controlPoint2: CGPoint(x: 188.27, y: 833.19))
        bezier17Path.addCurve(to: CGPoint(x: 197.75, y: 824.2), controlPoint1: CGPoint(x: 190.14, y: 825.58), controlPoint2: CGPoint(x: 193.95, y: 823.28))
        bezier17Path.addCurve(to: CGPoint(x: 454.12, y: 851.82), controlPoint1: CGPoint(x: 201.64, y: 825.18), controlPoint2: CGPoint(x: 294.98, y: 847.98))
        bezier17Path.addCurve(to: CGPoint(x: 461, y: 859.09), controlPoint1: CGPoint(x: 458.01, y: 851.92), controlPoint2: CGPoint(x: 461.09, y: 855.16))
        bezier17Path.addCurve(to: CGPoint(x: 453.95, y: 866), controlPoint1: CGPoint(x: 460.9, y: 862.94), controlPoint2: CGPoint(x: 457.77, y: 866))
        bezier17Path.close()
        bezier17Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier17Path.fill()


        //// Bezier 18 Drawing
        let bezier18Path = UIBezierPath()
        bezier18Path.move(to: CGPoint(x: 499.5, y: 852.09))
        bezier18Path.addCurve(to: CGPoint(x: 481.41, y: 856.18), controlPoint1: CGPoint(x: 493.05, y: 852.09), controlPoint2: CGPoint(x: 486.96, y: 853.47))
        bezier18Path.addCurve(to: CGPoint(x: 457.13, y: 894.48), controlPoint1: CGPoint(x: 466.63, y: 863.19), controlPoint2: CGPoint(x: 457.13, y: 878.23))
        bezier18Path.addCurve(to: CGPoint(x: 499.5, y: 936.87), controlPoint1: CGPoint(x: 457.13, y: 917.86), controlPoint2: CGPoint(x: 476.14, y: 936.87))
        bezier18Path.addCurve(to: CGPoint(x: 541.88, y: 894.48), controlPoint1: CGPoint(x: 522.87, y: 936.87), controlPoint2: CGPoint(x: 541.88, y: 917.86))
        bezier18Path.addCurve(to: CGPoint(x: 517.66, y: 856.21), controlPoint1: CGPoint(x: 541.88, y: 878.23), controlPoint2: CGPoint(x: 532.37, y: 863.19))
        bezier18Path.addCurve(to: CGPoint(x: 499.5, y: 852.09), controlPoint1: CGPoint(x: 512.04, y: 853.47), controlPoint2: CGPoint(x: 505.95, y: 852.09))
        bezier18Path.close()
        bezier18Path.move(to: CGPoint(x: 499.5, y: 951))
        bezier18Path.addCurve(to: CGPoint(x: 443, y: 894.48), controlPoint1: CGPoint(x: 468.35, y: 951), controlPoint2: CGPoint(x: 443, y: 925.64))
        bezier18Path.addCurve(to: CGPoint(x: 475.29, y: 843.46), controlPoint1: CGPoint(x: 443, y: 872.79), controlPoint2: CGPoint(x: 455.67, y: 852.76))
        bezier18Path.addCurve(to: CGPoint(x: 523.78, y: 843.48), controlPoint1: CGPoint(x: 490.14, y: 836.2), controlPoint2: CGPoint(x: 508.79, y: 836.16))
        bezier18Path.addCurve(to: CGPoint(x: 556, y: 894.48), controlPoint1: CGPoint(x: 543.33, y: 852.76), controlPoint2: CGPoint(x: 556, y: 872.79))
        bezier18Path.addCurve(to: CGPoint(x: 499.5, y: 951), controlPoint1: CGPoint(x: 556, y: 925.64), controlPoint2: CGPoint(x: 530.65, y: 951))
        bezier18Path.close()
        bezier18Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier18Path.fill()


        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(roundedRect: CGRect(x: 514, y: 796, width: 14, height: 61), cornerRadius: 7)
        dark.setFill()
        rectangle3Path.fill()


        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(roundedRect: CGRect(x: 472, y: 796, width: 14, height: 61), cornerRadius: 7)
        dark.setFill()
        rectangle4Path.fill()


        //// Bezier 19 Drawing
        let bezier19Path = UIBezierPath()
        bezier19Path.move(to: CGPoint(x: 196.06, y: 824))
        bezier19Path.addCurve(to: CGPoint(x: 189, y: 816.96), controlPoint1: CGPoint(x: 192.16, y: 824), controlPoint2: CGPoint(x: 189, y: 820.85))
        bezier19Path.addCurve(to: CGPoint(x: 223.84, y: 684.61), controlPoint1: CGPoint(x: 189, y: 765.28), controlPoint2: CGPoint(x: 205.15, y: 727.9))
        bezier19Path.addCurve(to: CGPoint(x: 287.88, y: 360.04), controlPoint1: CGPoint(x: 252.37, y: 618.54), controlPoint2: CGPoint(x: 287.88, y: 536.33))
        bezier19Path.addCurve(to: CGPoint(x: 294.94, y: 353), controlPoint1: CGPoint(x: 287.88, y: 356.15), controlPoint2: CGPoint(x: 291.03, y: 353))
        bezier19Path.addCurve(to: CGPoint(x: 302, y: 360.04), controlPoint1: CGPoint(x: 298.84, y: 353), controlPoint2: CGPoint(x: 302, y: 356.15))
        bezier19Path.addCurve(to: CGPoint(x: 236.82, y: 690.16), controlPoint1: CGPoint(x: 302, y: 539.23), controlPoint2: CGPoint(x: 265.86, y: 622.93))
        bezier19Path.addCurve(to: CGPoint(x: 203.12, y: 816.96), controlPoint1: CGPoint(x: 217.99, y: 733.75), controlPoint2: CGPoint(x: 203.12, y: 768.18))
        bezier19Path.addCurve(to: CGPoint(x: 196.06, y: 824), controlPoint1: CGPoint(x: 203.12, y: 820.85), controlPoint2: CGPoint(x: 199.97, y: 824))
        bezier19Path.close()
        bezier19Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier19Path.fill()


        //// Bezier 20 Drawing
        let bezier20Path = UIBezierPath()
        bezier20Path.move(to: CGPoint(x: 802.94, y: 824))
        bezier20Path.addCurve(to: CGPoint(x: 795.88, y: 816.96), controlPoint1: CGPoint(x: 799.03, y: 824), controlPoint2: CGPoint(x: 795.88, y: 820.85))
        bezier20Path.addCurve(to: CGPoint(x: 762.18, y: 690.17), controlPoint1: CGPoint(x: 795.88, y: 768.18), controlPoint2: CGPoint(x: 781.01, y: 733.75))
        bezier20Path.addCurve(to: CGPoint(x: 697, y: 360.04), controlPoint1: CGPoint(x: 733.14, y: 622.93), controlPoint2: CGPoint(x: 697, y: 539.23))
        bezier20Path.addCurve(to: CGPoint(x: 704.06, y: 353), controlPoint1: CGPoint(x: 697, y: 356.15), controlPoint2: CGPoint(x: 700.16, y: 353))
        bezier20Path.addCurve(to: CGPoint(x: 711.12, y: 360.04), controlPoint1: CGPoint(x: 707.97, y: 353), controlPoint2: CGPoint(x: 711.12, y: 356.15))
        bezier20Path.addCurve(to: CGPoint(x: 775.16, y: 684.61), controlPoint1: CGPoint(x: 711.12, y: 536.33), controlPoint2: CGPoint(x: 746.63, y: 618.55))
        bezier20Path.addCurve(to: CGPoint(x: 810, y: 816.96), controlPoint1: CGPoint(x: 793.85, y: 727.9), controlPoint2: CGPoint(x: 810, y: 765.28))
        bezier20Path.addCurve(to: CGPoint(x: 802.94, y: 824), controlPoint1: CGPoint(x: 810, y: 820.85), controlPoint2: CGPoint(x: 806.84, y: 824))
        bezier20Path.close()
        bezier20Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier20Path.fill()


        //// Bezier 21 Drawing
        let bezier21Path = UIBezierPath()
        bezier21Path.move(to: CGPoint(x: 802.95, y: 824))
        bezier21Path.addCurve(to: CGPoint(x: 801.24, y: 823.78), controlPoint1: CGPoint(x: 802.39, y: 824), controlPoint2: CGPoint(x: 801.81, y: 823.93))
        bezier21Path.addCurve(to: CGPoint(x: 499.5, y: 796), controlPoint1: CGPoint(x: 800.11, y: 823.51), controlPoint2: CGPoint(x: 686.81, y: 796))
        bezier21Path.addCurve(to: CGPoint(x: 197.76, y: 823.78), controlPoint1: CGPoint(x: 312.19, y: 796), controlPoint2: CGPoint(x: 198.89, y: 823.51))
        bezier21Path.addCurve(to: CGPoint(x: 189.21, y: 818.7), controlPoint1: CGPoint(x: 193.99, y: 824.73), controlPoint2: CGPoint(x: 190.15, y: 822.44))
        bezier21Path.addCurve(to: CGPoint(x: 194.35, y: 810.22), controlPoint1: CGPoint(x: 188.27, y: 814.95), controlPoint2: CGPoint(x: 190.56, y: 811.15))
        bezier21Path.addCurve(to: CGPoint(x: 499.5, y: 782), controlPoint1: CGPoint(x: 195.48, y: 809.92), controlPoint2: CGPoint(x: 310.29, y: 782))
        bezier21Path.addCurve(to: CGPoint(x: 804.66, y: 810.22), controlPoint1: CGPoint(x: 688.72, y: 782), controlPoint2: CGPoint(x: 803.51, y: 809.92))
        bezier21Path.addCurve(to: CGPoint(x: 809.79, y: 818.7), controlPoint1: CGPoint(x: 808.44, y: 811.15), controlPoint2: CGPoint(x: 810.74, y: 814.95))
        bezier21Path.addCurve(to: CGPoint(x: 802.95, y: 824), controlPoint1: CGPoint(x: 808.99, y: 821.87), controlPoint2: CGPoint(x: 806.12, y: 824))
        bezier21Path.close()
        bezier21Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier21Path.fill()


        //// Bezier 22 Drawing
        let bezier22Path = UIBezierPath()
        bezier22Path.move(to: CGPoint(x: 499.74, y: 162.61))
        bezier22Path.addCurve(to: CGPoint(x: 479.7, y: 166.96), controlPoint1: CGPoint(x: 492.35, y: 162.61), controlPoint2: CGPoint(x: 485.62, y: 164.07))
        bezier22Path.addCurve(to: CGPoint(x: 460.95, y: 186.5), controlPoint1: CGPoint(x: 471.13, y: 171.06), controlPoint2: CGPoint(x: 464.66, y: 177.81))
        bezier22Path.addCurve(to: CGPoint(x: 457.42, y: 204.87), controlPoint1: CGPoint(x: 458.62, y: 191.74), controlPoint2: CGPoint(x: 457.42, y: 198.07))
        bezier22Path.addCurve(to: CGPoint(x: 460.91, y: 223.15), controlPoint1: CGPoint(x: 457.42, y: 211.66), controlPoint2: CGPoint(x: 458.62, y: 217.99))
        bezier22Path.addCurve(to: CGPoint(x: 479.65, y: 242.75), controlPoint1: CGPoint(x: 464.66, y: 231.93), controlPoint2: CGPoint(x: 471.13, y: 238.68))
        bezier22Path.addCurve(to: CGPoint(x: 499.74, y: 247.13), controlPoint1: CGPoint(x: 485.62, y: 245.66), controlPoint2: CGPoint(x: 492.35, y: 247.13))
        bezier22Path.addCurve(to: CGPoint(x: 538.53, y: 223.24), controlPoint1: CGPoint(x: 517.64, y: 247.13), controlPoint2: CGPoint(x: 532.14, y: 238.2))
        bezier22Path.addCurve(to: CGPoint(x: 542.05, y: 204.87), controlPoint1: CGPoint(x: 540.84, y: 217.99), controlPoint2: CGPoint(x: 542.05, y: 211.66))
        bezier22Path.addCurve(to: CGPoint(x: 538.56, y: 186.58), controlPoint1: CGPoint(x: 542.05, y: 198.07), controlPoint2: CGPoint(x: 540.84, y: 191.74))
        bezier22Path.addCurve(to: CGPoint(x: 499.74, y: 162.61), controlPoint1: CGPoint(x: 532.14, y: 171.53), controlPoint2: CGPoint(x: 517.64, y: 162.61))
        bezier22Path.close()
        bezier22Path.move(to: CGPoint(x: 499.74, y: 261.22))
        bezier22Path.addCurve(to: CGPoint(x: 473.5, y: 255.43), controlPoint1: CGPoint(x: 490.19, y: 261.22), controlPoint2: CGPoint(x: 481.36, y: 259.27))
        bezier22Path.addCurve(to: CGPoint(x: 447.97, y: 228.77), controlPoint1: CGPoint(x: 461.9, y: 249.89), controlPoint2: CGPoint(x: 453.05, y: 240.66))
        bezier22Path.addCurve(to: CGPoint(x: 443.31, y: 204.87), controlPoint1: CGPoint(x: 444.89, y: 221.81), controlPoint2: CGPoint(x: 443.31, y: 213.74))
        bezier22Path.addCurve(to: CGPoint(x: 448, y: 180.89), controlPoint1: CGPoint(x: 443.31, y: 196), controlPoint2: CGPoint(x: 444.89, y: 187.94))
        bezier22Path.addCurve(to: CGPoint(x: 473.56, y: 154.27), controlPoint1: CGPoint(x: 453.05, y: 169.08), controlPoint2: CGPoint(x: 461.9, y: 159.85))
        bezier22Path.addCurve(to: CGPoint(x: 499.74, y: 148.52), controlPoint1: CGPoint(x: 481.36, y: 150.46), controlPoint2: CGPoint(x: 490.19, y: 148.52))
        bezier22Path.addCurve(to: CGPoint(x: 551.5, y: 180.98), controlPoint1: CGPoint(x: 523.13, y: 148.52), controlPoint2: CGPoint(x: 542.96, y: 160.95))
        bezier22Path.addCurve(to: CGPoint(x: 556.16, y: 204.87), controlPoint1: CGPoint(x: 554.58, y: 187.93), controlPoint2: CGPoint(x: 556.16, y: 196))
        bezier22Path.addCurve(to: CGPoint(x: 551.46, y: 228.85), controlPoint1: CGPoint(x: 556.16, y: 213.73), controlPoint2: CGPoint(x: 554.58, y: 221.8))
        bezier22Path.addCurve(to: CGPoint(x: 499.74, y: 261.22), controlPoint1: CGPoint(x: 542.96, y: 248.78), controlPoint2: CGPoint(x: 523.13, y: 261.22))
        bezier22Path.close()
        bezier22Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier22Path.fill()


        //// Bezier 23 Drawing
        let bezier23Path = UIBezierPath()
        bezier23Path.move(to: CGPoint(x: 746.49, y: 359.41))
        bezier23Path.addCurve(to: CGPoint(x: 705.97, y: 353.99), controlPoint1: CGPoint(x: 734.22, y: 359.41), controlPoint2: CGPoint(x: 720.69, y: 357.61))
        bezier23Path.addCurve(to: CGPoint(x: 584.81, y: 300.08), controlPoint1: CGPoint(x: 671.38, y: 345.8), controlPoint2: CGPoint(x: 630.59, y: 327.66))
        bezier23Path.addCurve(to: CGPoint(x: 524.24, y: 259.78), controlPoint1: CGPoint(x: 549.64, y: 279), controlPoint2: CGPoint(x: 524.49, y: 259.98))
        bezier23Path.addCurve(to: CGPoint(x: 522.89, y: 249.91), controlPoint1: CGPoint(x: 521.14, y: 257.43), controlPoint2: CGPoint(x: 520.54, y: 253.01))
        bezier23Path.addCurve(to: CGPoint(x: 532.78, y: 248.57), controlPoint1: CGPoint(x: 525.25, y: 246.82), controlPoint2: CGPoint(x: 529.66, y: 246.21))
        bezier23Path.addCurve(to: CGPoint(x: 592.09, y: 288.01), controlPoint1: CGPoint(x: 533.02, y: 248.76), controlPoint2: CGPoint(x: 557.61, y: 267.34))
        bezier23Path.addCurve(to: CGPoint(x: 709.28, y: 340.31), controlPoint1: CGPoint(x: 636.62, y: 314.84), controlPoint2: CGPoint(x: 676.05, y: 332.44))
        bezier23Path.addCurve(to: CGPoint(x: 802.96, y: 318.54), controlPoint1: CGPoint(x: 754.14, y: 351.3), controlPoint2: CGPoint(x: 785.65, y: 343.98))
        bezier23Path.addCurve(to: CGPoint(x: 824.03, y: 101.01), controlPoint1: CGPoint(x: 825.1, y: 286.16), controlPoint2: CGPoint(x: 857.52, y: 164.33))
        bezier23Path.addCurve(to: CGPoint(x: 758.86, y: 64), controlPoint1: CGPoint(x: 811.05, y: 76.45), controlPoint2: CGPoint(x: 789.12, y: 64))
        bezier23Path.addCurve(to: CGPoint(x: 534.38, y: 159.68), controlPoint1: CGPoint(x: 605.01, y: 64), controlPoint2: CGPoint(x: 535.07, y: 158.71))
        bezier23Path.addCurve(to: CGPoint(x: 524.53, y: 161.29), controlPoint1: CGPoint(x: 532.1, y: 162.83), controlPoint2: CGPoint(x: 527.69, y: 163.54))
        bezier23Path.addCurve(to: CGPoint(x: 522.92, y: 151.45), controlPoint1: CGPoint(x: 521.37, y: 159.02), controlPoint2: CGPoint(x: 520.65, y: 154.61))
        bezier23Path.addCurve(to: CGPoint(x: 758.86, y: 49.91), controlPoint1: CGPoint(x: 525.91, y: 147.31), controlPoint2: CGPoint(x: 597.84, y: 49.91))
        bezier23Path.addCurve(to: CGPoint(x: 836.5, y: 94.43), controlPoint1: CGPoint(x: 794.76, y: 49.91), controlPoint2: CGPoint(x: 820.88, y: 64.89))
        bezier23Path.addCurve(to: CGPoint(x: 814.63, y: 326.47), controlPoint1: CGPoint(x: 873.01, y: 163.44), controlPoint2: CGPoint(x: 838.82, y: 291.07))
        bezier23Path.addCurve(to: CGPoint(x: 746.49, y: 359.41), controlPoint1: CGPoint(x: 799.69, y: 348.4), controlPoint2: CGPoint(x: 776.85, y: 359.41))
        bezier23Path.close()
        bezier23Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier23Path.fill()


        //// Bezier 24 Drawing
        let bezier24Path = UIBezierPath()
        bezier24Path.move(to: CGPoint(x: 253.37, y: 359.42))
        bezier24Path.addCurve(to: CGPoint(x: 185, y: 326.48), controlPoint1: CGPoint(x: 222.92, y: 359.43), controlPoint2: CGPoint(x: 200, y: 348.41))
        bezier24Path.addCurve(to: CGPoint(x: 162.92, y: 94.52), controlPoint1: CGPoint(x: 160.76, y: 291.17), controlPoint2: CGPoint(x: 126.45, y: 163.67))
        bezier24Path.addCurve(to: CGPoint(x: 240.61, y: 49.91), controlPoint1: CGPoint(x: 178.54, y: 64.92), controlPoint2: CGPoint(x: 204.67, y: 49.91))
        bezier24Path.addCurve(to: CGPoint(x: 477.09, y: 151.14), controlPoint1: CGPoint(x: 401.61, y: 49.91), controlPoint2: CGPoint(x: 474.08, y: 147))
        bezier24Path.addCurve(to: CGPoint(x: 475.53, y: 160.97), controlPoint1: CGPoint(x: 479.38, y: 154.28), controlPoint2: CGPoint(x: 478.68, y: 158.68))
        bezier24Path.addCurve(to: CGPoint(x: 465.68, y: 159.43), controlPoint1: CGPoint(x: 472.4, y: 163.26), controlPoint2: CGPoint(x: 467.98, y: 162.57))
        bezier24Path.addCurve(to: CGPoint(x: 240.61, y: 63.99), controlPoint1: CGPoint(x: 464.98, y: 158.47), controlPoint2: CGPoint(x: 394.1, y: 63.99))
        bezier24Path.addCurve(to: CGPoint(x: 175.4, y: 101.08), controlPoint1: CGPoint(x: 210.32, y: 63.99), controlPoint2: CGPoint(x: 188.39, y: 76.47))
        bezier24Path.addCurve(to: CGPoint(x: 196.64, y: 318.52), controlPoint1: CGPoint(x: 141.94, y: 164.52), controlPoint2: CGPoint(x: 174.47, y: 286.23))
        bezier24Path.addCurve(to: CGPoint(x: 290.16, y: 340.45), controlPoint1: CGPoint(x: 214, y: 343.89), controlPoint2: CGPoint(x: 245.46, y: 351.26))
        bezier24Path.addCurve(to: CGPoint(x: 467.26, y: 248.84), controlPoint1: CGPoint(x: 370.98, y: 321.3), controlPoint2: CGPoint(x: 466.32, y: 249.57))
        bezier24Path.addCurve(to: CGPoint(x: 477.15, y: 250.2), controlPoint1: CGPoint(x: 470.37, y: 246.48), controlPoint2: CGPoint(x: 474.79, y: 247.1))
        bezier24Path.addCurve(to: CGPoint(x: 475.79, y: 260.07), controlPoint1: CGPoint(x: 479.5, y: 253.3), controlPoint2: CGPoint(x: 478.89, y: 257.72))
        bezier24Path.addCurve(to: CGPoint(x: 293.44, y: 354.14), controlPoint1: CGPoint(x: 471.8, y: 263.09), controlPoint2: CGPoint(x: 377.16, y: 334.31))
        bezier24Path.addCurve(to: CGPoint(x: 253.37, y: 359.42), controlPoint1: CGPoint(x: 278.9, y: 357.67), controlPoint2: CGPoint(x: 265.53, y: 359.42))
        bezier24Path.close()
        bezier24Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier24Path.fill()


        //// Bezier 25 Drawing
        let bezier25Path = UIBezierPath()
        bezier25Path.move(to: CGPoint(x: 545.07, y: 191))
        bezier25Path.addCurve(to: CGPoint(x: 538.34, y: 186.12), controlPoint1: CGPoint(x: 542.08, y: 191), controlPoint2: CGPoint(x: 539.29, y: 189.1))
        bezier25Path.addCurve(to: CGPoint(x: 542.93, y: 177.33), controlPoint1: CGPoint(x: 537.15, y: 182.44), controlPoint2: CGPoint(x: 539.2, y: 178.51))
        bezier25Path.addLine(to: CGPoint(x: 631.8, y: 149.34))
        bezier25Path.addCurve(to: CGPoint(x: 640.67, y: 153.89), controlPoint1: CGPoint(x: 635.49, y: 148.15), controlPoint2: CGPoint(x: 639.47, y: 150.2))
        bezier25Path.addCurve(to: CGPoint(x: 636.07, y: 162.68), controlPoint1: CGPoint(x: 641.84, y: 157.57), controlPoint2: CGPoint(x: 639.79, y: 161.5))
        bezier25Path.addLine(to: CGPoint(x: 547.21, y: 190.67))
        bezier25Path.addCurve(to: CGPoint(x: 545.07, y: 191), controlPoint1: CGPoint(x: 546.49, y: 190.9), controlPoint2: CGPoint(x: 545.77, y: 191))
        bezier25Path.close()
        bezier25Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier25Path.fill()


        //// Bezier 26 Drawing
        let bezier26Path = UIBezierPath()
        bezier26Path.move(to: CGPoint(x: 633.94, y: 261))
        bezier26Path.addCurve(to: CGPoint(x: 631.8, y: 260.67), controlPoint1: CGPoint(x: 633.22, y: 261), controlPoint2: CGPoint(x: 632.5, y: 260.9))
        bezier26Path.addLine(to: CGPoint(x: 542.93, y: 232.68))
        bezier26Path.addCurve(to: CGPoint(x: 538.34, y: 223.89), controlPoint1: CGPoint(x: 539.21, y: 231.5), controlPoint2: CGPoint(x: 537.15, y: 227.57))
        bezier26Path.addCurve(to: CGPoint(x: 547.21, y: 219.33), controlPoint1: CGPoint(x: 539.52, y: 220.2), controlPoint2: CGPoint(x: 543.5, y: 218.15))
        bezier26Path.addLine(to: CGPoint(x: 636.07, y: 247.33))
        bezier26Path.addCurve(to: CGPoint(x: 640.67, y: 256.12), controlPoint1: CGPoint(x: 639.79, y: 248.5), controlPoint2: CGPoint(x: 641.84, y: 252.43))
        bezier26Path.addCurve(to: CGPoint(x: 633.94, y: 261), controlPoint1: CGPoint(x: 639.7, y: 259.1), controlPoint2: CGPoint(x: 636.93, y: 261))
        bezier26Path.close()
        bezier26Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier26Path.fill()


        //// Bezier 27 Drawing
        let bezier27Path = UIBezierPath()
        bezier27Path.move(to: CGPoint(x: 454.93, y: 191))
        bezier27Path.addCurve(to: CGPoint(x: 452.79, y: 190.67), controlPoint1: CGPoint(x: 454.22, y: 191), controlPoint2: CGPoint(x: 453.51, y: 190.9))
        bezier27Path.addLine(to: CGPoint(x: 363.93, y: 162.67))
        bezier27Path.addCurve(to: CGPoint(x: 359.33, y: 153.89), controlPoint1: CGPoint(x: 360.21, y: 161.5), controlPoint2: CGPoint(x: 358.15, y: 157.57))
        bezier27Path.addCurve(to: CGPoint(x: 368.2, y: 149.33), controlPoint1: CGPoint(x: 360.51, y: 150.2), controlPoint2: CGPoint(x: 364.49, y: 148.16))
        bezier27Path.addLine(to: CGPoint(x: 457.07, y: 177.33))
        bezier27Path.addCurve(to: CGPoint(x: 461.67, y: 186.12), controlPoint1: CGPoint(x: 460.79, y: 178.5), controlPoint2: CGPoint(x: 462.85, y: 182.44))
        bezier27Path.addCurve(to: CGPoint(x: 454.93, y: 191), controlPoint1: CGPoint(x: 460.71, y: 189.1), controlPoint2: CGPoint(x: 457.93, y: 191))
        bezier27Path.close()
        bezier27Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier27Path.fill()


        //// Bezier 28 Drawing
        let bezier28Path = UIBezierPath()
        bezier28Path.move(to: CGPoint(x: 366.07, y: 261))
        bezier28Path.addCurve(to: CGPoint(x: 359.33, y: 256.12), controlPoint1: CGPoint(x: 363.07, y: 261), controlPoint2: CGPoint(x: 360.29, y: 259.1))
        bezier28Path.addCurve(to: CGPoint(x: 363.93, y: 247.33), controlPoint1: CGPoint(x: 358.15, y: 252.44), controlPoint2: CGPoint(x: 360.21, y: 248.51))
        bezier28Path.addLine(to: CGPoint(x: 452.79, y: 219.34))
        bezier28Path.addCurve(to: CGPoint(x: 461.67, y: 223.89), controlPoint1: CGPoint(x: 456.49, y: 218.15), controlPoint2: CGPoint(x: 460.48, y: 220.2))
        bezier28Path.addCurve(to: CGPoint(x: 457.07, y: 232.68), controlPoint1: CGPoint(x: 462.85, y: 227.57), controlPoint2: CGPoint(x: 460.79, y: 231.5))
        bezier28Path.addLine(to: CGPoint(x: 368.2, y: 260.67))
        bezier28Path.addCurve(to: CGPoint(x: 366.07, y: 261), controlPoint1: CGPoint(x: 367.49, y: 260.9), controlPoint2: CGPoint(x: 366.78, y: 261))
        bezier28Path.close()
        bezier28Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier28Path.fill()


        //// Bezier 29 Drawing
        let bezier29Path = UIBezierPath()
        bezier29Path.move(to: CGPoint(x: 535.19, y: 430))
        bezier29Path.addCurve(to: CGPoint(x: 532.13, y: 429.31), controlPoint1: CGPoint(x: 534.14, y: 430), controlPoint2: CGPoint(x: 533.1, y: 429.77))
        bezier29Path.addCurve(to: CGPoint(x: 528.15, y: 423.59), controlPoint1: CGPoint(x: 529.88, y: 428.23), controlPoint2: CGPoint(x: 528.37, y: 426.06))
        bezier29Path.addLine(to: CGPoint(x: 514.03, y: 264.66))
        bezier29Path.addCurve(to: CGPoint(x: 520.44, y: 257.03), controlPoint1: CGPoint(x: 513.68, y: 260.79), controlPoint2: CGPoint(x: 516.55, y: 257.38))
        bezier29Path.addCurve(to: CGPoint(x: 528.1, y: 263.42), controlPoint1: CGPoint(x: 524.28, y: 256.66), controlPoint2: CGPoint(x: 527.75, y: 259.55))
        bezier29Path.addLine(to: CGPoint(x: 541.18, y: 410.54))
        bezier29Path.addLine(to: CGPoint(x: 573.65, y: 388.98))
        bezier29Path.addCurve(to: CGPoint(x: 579.8, y: 388.17), controlPoint1: CGPoint(x: 575.47, y: 387.78), controlPoint2: CGPoint(x: 577.73, y: 387.47))
        bezier29Path.addLine(to: CGPoint(x: 608.16, y: 397.58))
        bezier29Path.addLine(to: CGPoint(x: 573.63, y: 305.46))
        bezier29Path.addCurve(to: CGPoint(x: 577.77, y: 296.41), controlPoint1: CGPoint(x: 572.27, y: 301.82), controlPoint2: CGPoint(x: 574.12, y: 297.76))
        bezier29Path.addCurve(to: CGPoint(x: 586.87, y: 300.54), controlPoint1: CGPoint(x: 581.42, y: 295.06), controlPoint2: CGPoint(x: 585.5, y: 296.9))
        bezier29Path.addLine(to: CGPoint(x: 626.55, y: 406.44))
        bezier29Path.addCurve(to: CGPoint(x: 625.02, y: 413.78), controlPoint1: CGPoint(x: 627.5, y: 408.98), controlPoint2: CGPoint(x: 626.91, y: 411.83))
        bezier29Path.addCurve(to: CGPoint(x: 617.71, y: 415.57), controlPoint1: CGPoint(x: 623.13, y: 415.72), controlPoint2: CGPoint(x: 620.29, y: 416.44))
        bezier29Path.addLine(to: CGPoint(x: 578.6, y: 402.6))
        bezier29Path.addLine(to: CGPoint(x: 539.11, y: 428.82))
        bezier29Path.addCurve(to: CGPoint(x: 535.19, y: 430), controlPoint1: CGPoint(x: 537.92, y: 429.6), controlPoint2: CGPoint(x: 536.55, y: 430))
        bezier29Path.close()
        bezier29Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier29Path.fill()


        //// Bezier 30 Drawing
        let bezier30Path = UIBezierPath()
        bezier30Path.move(to: CGPoint(x: 464.81, y: 430))
        bezier30Path.addCurve(to: CGPoint(x: 460.89, y: 428.82), controlPoint1: CGPoint(x: 463.44, y: 430), controlPoint2: CGPoint(x: 462.07, y: 429.6))
        bezier30Path.addLine(to: CGPoint(x: 421.39, y: 402.6))
        bezier30Path.addLine(to: CGPoint(x: 382.3, y: 415.57))
        bezier30Path.addCurve(to: CGPoint(x: 374.98, y: 413.79), controlPoint1: CGPoint(x: 379.71, y: 416.45), controlPoint2: CGPoint(x: 376.86, y: 415.73))
        bezier30Path.addCurve(to: CGPoint(x: 373.45, y: 406.44), controlPoint1: CGPoint(x: 373.09, y: 411.84), controlPoint2: CGPoint(x: 372.5, y: 408.98))
        bezier30Path.addLine(to: CGPoint(x: 413.14, y: 300.54))
        bezier30Path.addCurve(to: CGPoint(x: 422.22, y: 296.41), controlPoint1: CGPoint(x: 414.5, y: 296.9), controlPoint2: CGPoint(x: 418.57, y: 295.07))
        bezier30Path.addCurve(to: CGPoint(x: 426.37, y: 305.46), controlPoint1: CGPoint(x: 425.88, y: 297.77), controlPoint2: CGPoint(x: 427.73, y: 301.82))
        bezier30Path.addLine(to: CGPoint(x: 391.84, y: 397.58))
        bezier30Path.addLine(to: CGPoint(x: 420.2, y: 388.17))
        bezier30Path.addCurve(to: CGPoint(x: 426.35, y: 388.99), controlPoint1: CGPoint(x: 422.27, y: 387.46), controlPoint2: CGPoint(x: 424.54, y: 387.77))
        bezier30Path.addLine(to: CGPoint(x: 458.82, y: 410.54))
        bezier30Path.addLine(to: CGPoint(x: 471.9, y: 263.42))
        bezier30Path.addCurve(to: CGPoint(x: 479.56, y: 257.04), controlPoint1: CGPoint(x: 472.25, y: 259.56), controlPoint2: CGPoint(x: 475.77, y: 256.64))
        bezier30Path.addCurve(to: CGPoint(x: 485.97, y: 264.66), controlPoint1: CGPoint(x: 483.45, y: 257.38), controlPoint2: CGPoint(x: 486.32, y: 260.79))
        bezier30Path.addLine(to: CGPoint(x: 471.85, y: 423.59))
        bezier30Path.addCurve(to: CGPoint(x: 467.87, y: 429.31), controlPoint1: CGPoint(x: 471.63, y: 426.06), controlPoint2: CGPoint(x: 470.12, y: 428.24))
        bezier30Path.addCurve(to: CGPoint(x: 464.81, y: 430), controlPoint1: CGPoint(x: 466.9, y: 429.77), controlPoint2: CGPoint(x: 465.85, y: 430))
        bezier30Path.close()
        bezier30Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier30Path.fill()
        
        context.restoreGState()

    }

    @objc dynamic public class func drawCompass(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 1000, height: 1000), resizing: ResizingBehavior = .aspectFit, white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), light: UIColor = UIColor(red: 0.769, green: 0.847, blue: 0.984, alpha: 1.000), medium: UIColor = UIColor(red: 0.478, green: 0.663, blue: 0.973, alpha: 1.000), dark: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 1000, height: 1000), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 1000, y: resizedFrame.height / 1000)


        //// Group 2
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 173.5, y: 285.5, width: 653, height: 652))
        medium.setFill()
        ovalPath.fill()


        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: 173.5, y: 243.5, width: 653, height: 652))
        light.setFill()
        oval2Path.fill()


        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 479, y: 201.85))
        bezierPath.addLine(to: CGPoint(x: 479, y: 244))
        bezierPath.addLine(to: CGPoint(x: 521, y: 244))
        bezierPath.addLine(to: CGPoint(x: 521, y: 201.85))
        bezierPath.addCurve(to: CGPoint(x: 500, y: 181), controlPoint1: CGPoint(x: 521, y: 190.34), controlPoint2: CGPoint(x: 511.59, y: 181))
        bezierPath.addCurve(to: CGPoint(x: 479, y: 201.85), controlPoint1: CGPoint(x: 488.41, y: 181), controlPoint2: CGPoint(x: 479, y: 190.34))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        medium.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 492.99, y: 215.64))
        bezier2Path.addCurve(to: CGPoint(x: 513.99, y: 194.86), controlPoint1: CGPoint(x: 492.99, y: 204.17), controlPoint2: CGPoint(x: 502.4, y: 194.86))
        bezier2Path.addCurve(to: CGPoint(x: 520, y: 195.83), controlPoint1: CGPoint(x: 516.09, y: 194.86), controlPoint2: CGPoint(x: 518.09, y: 195.26))
        bezier2Path.addCurve(to: CGPoint(x: 499.99, y: 181), controlPoint1: CGPoint(x: 517.41, y: 187.28), controlPoint2: CGPoint(x: 509.48, y: 181))
        bezier2Path.addCurve(to: CGPoint(x: 479, y: 201.78), controlPoint1: CGPoint(x: 488.4, y: 181), controlPoint2: CGPoint(x: 479, y: 190.31))
        bezier2Path.addLine(to: CGPoint(x: 479, y: 230))
        bezier2Path.addLine(to: CGPoint(x: 493, y: 229.28))
        bezier2Path.addLine(to: CGPoint(x: 493, y: 215.64))
        bezier2Path.addLine(to: CGPoint(x: 492.99, y: 215.64))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        light.setFill()
        bezier2Path.fill()


        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalIn: CGRect(x: 215, y: 286, width: 570, height: 568))
        white.setFill()
        oval3Path.fill()


        //// Oval 4 Drawing
        let oval4Path = UIBezierPath(ovalIn: CGRect(x: 242.45, y: 313.45, width: 514.1, height: 513))
        light.setFill()
        oval4Path.fill()


        //// Oval 5 Drawing
        let oval5Path = UIBezierPath(ovalIn: CGRect(x: 353.5, y: 424.5, width: 292.1, height: 290.9))
        white.setFill()
        oval5Path.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 524.03, y: 594))
        bezier3Path.addLine(to: CGPoint(x: 475, y: 544.96))
        bezier3Path.addLine(to: CGPoint(x: 651, y: 418))
        bezier3Path.addLine(to: CGPoint(x: 524.03, y: 594))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        light.setFill()
        bezier3Path.fill()


        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 474.97, y: 545))
        bezier4Path.addLine(to: CGPoint(x: 524, y: 594.04))
        bezier4Path.addLine(to: CGPoint(x: 348, y: 721))
        bezier4Path.addLine(to: CGPoint(x: 474.97, y: 545))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier4Path.fill()


        //// Oval 6 Drawing
        let oval6Path = UIBezierPath(ovalIn: CGRect(x: 486, y: 556, width: 28, height: 28))
        white.setFill()
        oval6Path.fill()


        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 499.5, y: 249.9))
        bezier5Path.addCurve(to: CGPoint(x: 180.85, y: 569.5), controlPoint1: CGPoint(x: 323.79, y: 249.9), controlPoint2: CGPoint(x: 180.85, y: 393.27))
        bezier5Path.addCurve(to: CGPoint(x: 499.5, y: 889.1), controlPoint1: CGPoint(x: 180.85, y: 745.75), controlPoint2: CGPoint(x: 323.79, y: 889.1))
        bezier5Path.addCurve(to: CGPoint(x: 724.82, y: 795.5), controlPoint1: CGPoint(x: 584.61, y: 889.1), controlPoint2: CGPoint(x: 664.64, y: 855.86))
        bezier5Path.addCurve(to: CGPoint(x: 818.15, y: 569.5), controlPoint1: CGPoint(x: 785.01, y: 735.13), controlPoint2: CGPoint(x: 818.15, y: 654.88))
        bezier5Path.addCurve(to: CGPoint(x: 724.82, y: 343.5), controlPoint1: CGPoint(x: 818.15, y: 484.13), controlPoint2: CGPoint(x: 785.01, y: 403.88))
        bezier5Path.addCurve(to: CGPoint(x: 499.5, y: 249.9), controlPoint1: CGPoint(x: 664.64, y: 283.14), controlPoint2: CGPoint(x: 584.61, y: 249.9))
        bezier5Path.close()
        bezier5Path.move(to: CGPoint(x: 499.5, y: 903))
        bezier5Path.addCurve(to: CGPoint(x: 167, y: 569.5), controlPoint1: CGPoint(x: 316.16, y: 903), controlPoint2: CGPoint(x: 167, y: 753.4))
        bezier5Path.addCurve(to: CGPoint(x: 499.5, y: 236), controlPoint1: CGPoint(x: 167, y: 385.61), controlPoint2: CGPoint(x: 316.16, y: 236))
        bezier5Path.addCurve(to: CGPoint(x: 734.62, y: 333.68), controlPoint1: CGPoint(x: 588.32, y: 236), controlPoint2: CGPoint(x: 671.81, y: 270.69))
        bezier5Path.addCurve(to: CGPoint(x: 832, y: 569.5), controlPoint1: CGPoint(x: 797.42, y: 396.67), controlPoint2: CGPoint(x: 832, y: 480.43))
        bezier5Path.addCurve(to: CGPoint(x: 734.62, y: 805.32), controlPoint1: CGPoint(x: 832, y: 658.57), controlPoint2: CGPoint(x: 797.42, y: 742.33))
        bezier5Path.addCurve(to: CGPoint(x: 499.5, y: 903), controlPoint1: CGPoint(x: 671.81, y: 868.31), controlPoint2: CGPoint(x: 588.32, y: 903))
        bezier5Path.close()
        bezier5Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier5Path.fill()


        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 500, y: 291.91))
        bezier6Path.addCurve(to: CGPoint(x: 222.86, y: 570), controlPoint1: CGPoint(x: 347.19, y: 291.91), controlPoint2: CGPoint(x: 222.87, y: 416.66))
        bezier6Path.addCurve(to: CGPoint(x: 500, y: 848.1), controlPoint1: CGPoint(x: 222.86, y: 723.36), controlPoint2: CGPoint(x: 347.18, y: 848.1))
        bezier6Path.addCurve(to: CGPoint(x: 695.97, y: 766.65), controlPoint1: CGPoint(x: 574.02, y: 848.1), controlPoint2: CGPoint(x: 643.62, y: 819.17))
        bezier6Path.addCurve(to: CGPoint(x: 777.14, y: 570), controlPoint1: CGPoint(x: 748.32, y: 714.1), controlPoint2: CGPoint(x: 777.14, y: 644.27))
        bezier6Path.addCurve(to: CGPoint(x: 500, y: 291.91), controlPoint1: CGPoint(x: 777.14, y: 416.66), controlPoint2: CGPoint(x: 652.82, y: 291.91))
        bezier6Path.close()
        bezier6Path.move(to: CGPoint(x: 500, y: 862))
        bezier6Path.addCurve(to: CGPoint(x: 209, y: 570), controlPoint1: CGPoint(x: 339.55, y: 862), controlPoint2: CGPoint(x: 209, y: 731.02))
        bezier6Path.addCurve(to: CGPoint(x: 500, y: 278), controlPoint1: CGPoint(x: 209.01, y: 409), controlPoint2: CGPoint(x: 339.56, y: 278))
        bezier6Path.addCurve(to: CGPoint(x: 791, y: 570), controlPoint1: CGPoint(x: 660.45, y: 278), controlPoint2: CGPoint(x: 791, y: 409))
        bezier6Path.addCurve(to: CGPoint(x: 705.77, y: 776.48), controlPoint1: CGPoint(x: 791.01, y: 647.99), controlPoint2: CGPoint(x: 760.74, y: 721.32))
        bezier6Path.addCurve(to: CGPoint(x: 500, y: 862), controlPoint1: CGPoint(x: 650.8, y: 831.64), controlPoint2: CGPoint(x: 577.73, y: 862))
        bezier6Path.close()
        bezier6Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier6Path.fill()


        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 499.5, y: 319.89))
        bezier7Path.addCurve(to: CGPoint(x: 249.87, y: 570), controlPoint1: CGPoint(x: 361.86, y: 319.89), controlPoint2: CGPoint(x: 249.87, y: 432.1))
        bezier7Path.addCurve(to: CGPoint(x: 499.5, y: 820.1), controlPoint1: CGPoint(x: 249.87, y: 707.91), controlPoint2: CGPoint(x: 361.86, y: 820.1))
        bezier7Path.addCurve(to: CGPoint(x: 749.13, y: 570), controlPoint1: CGPoint(x: 637.14, y: 820.1), controlPoint2: CGPoint(x: 749.13, y: 707.88))
        bezier7Path.addCurve(to: CGPoint(x: 499.5, y: 319.89), controlPoint1: CGPoint(x: 749.13, y: 432.1), controlPoint2: CGPoint(x: 637.14, y: 319.89))
        bezier7Path.close()
        bezier7Path.move(to: CGPoint(x: 499.5, y: 834))
        bezier7Path.addCurve(to: CGPoint(x: 236, y: 570), controlPoint1: CGPoint(x: 354.21, y: 834), controlPoint2: CGPoint(x: 236, y: 715.57))
        bezier7Path.addCurve(to: CGPoint(x: 499.5, y: 306), controlPoint1: CGPoint(x: 236, y: 424.43), controlPoint2: CGPoint(x: 354.21, y: 306))
        bezier7Path.addCurve(to: CGPoint(x: 763, y: 570), controlPoint1: CGPoint(x: 644.8, y: 306), controlPoint2: CGPoint(x: 763, y: 424.43))
        bezier7Path.addCurve(to: CGPoint(x: 499.5, y: 834), controlPoint1: CGPoint(x: 763, y: 715.57), controlPoint2: CGPoint(x: 644.79, y: 834))
        bezier7Path.close()
        bezier7Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier7Path.fill()


        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 375.61, y: 653))
        bezier8Path.addCurve(to: CGPoint(x: 369.7, y: 649.69), controlPoint1: CGPoint(x: 373.29, y: 653), controlPoint2: CGPoint(x: 371.01, y: 651.83))
        bezier8Path.addCurve(to: CGPoint(x: 347, y: 569.64), controlPoint1: CGPoint(x: 354.85, y: 625.66), controlPoint2: CGPoint(x: 347, y: 597.98))
        bezier8Path.addCurve(to: CGPoint(x: 499.73, y: 417), controlPoint1: CGPoint(x: 347, y: 485.47), controlPoint2: CGPoint(x: 415.51, y: 417))
        bezier8Path.addCurve(to: CGPoint(x: 579.71, y: 439.59), controlPoint1: CGPoint(x: 528.04, y: 417), controlPoint2: CGPoint(x: 555.69, y: 424.81))
        bezier8Path.addCurve(to: CGPoint(x: 581.97, y: 449.14), controlPoint1: CGPoint(x: 582.96, y: 441.6), controlPoint2: CGPoint(x: 583.98, y: 445.88))
        bezier8Path.addCurve(to: CGPoint(x: 572.41, y: 451.41), controlPoint1: CGPoint(x: 579.95, y: 452.43), controlPoint2: CGPoint(x: 575.68, y: 453.43))
        bezier8Path.addCurve(to: CGPoint(x: 499.73, y: 430.88), controlPoint1: CGPoint(x: 550.61, y: 437.98), controlPoint2: CGPoint(x: 525.47, y: 430.88))
        bezier8Path.addCurve(to: CGPoint(x: 360.89, y: 569.64), controlPoint1: CGPoint(x: 423.18, y: 430.88), controlPoint2: CGPoint(x: 360.89, y: 493.13))
        bezier8Path.addCurve(to: CGPoint(x: 381.52, y: 642.41), controlPoint1: CGPoint(x: 360.89, y: 595.38), controlPoint2: CGPoint(x: 368.02, y: 620.56))
        bezier8Path.addCurve(to: CGPoint(x: 379.26, y: 651.97), controlPoint1: CGPoint(x: 383.53, y: 645.69), controlPoint2: CGPoint(x: 382.53, y: 649.94))
        bezier8Path.addCurve(to: CGPoint(x: 375.61, y: 653), controlPoint1: CGPoint(x: 378.12, y: 652.65), controlPoint2: CGPoint(x: 376.86, y: 653))
        bezier8Path.close()
        bezier8Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier8Path.fill()


        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 499.28, y: 723))
        bezier9Path.addCurve(to: CGPoint(x: 419.3, y: 700.39), controlPoint1: CGPoint(x: 470.94, y: 723), controlPoint2: CGPoint(x: 443.28, y: 715.19))
        bezier9Path.addCurve(to: CGPoint(x: 417.03, y: 690.81), controlPoint1: CGPoint(x: 416.03, y: 698.35), controlPoint2: CGPoint(x: 415.03, y: 694.1))
        bezier9Path.addCurve(to: CGPoint(x: 426.59, y: 688.56), controlPoint1: CGPoint(x: 419.05, y: 687.53), controlPoint2: CGPoint(x: 423.34, y: 686.58))
        bezier9Path.addCurve(to: CGPoint(x: 499.28, y: 709.12), controlPoint1: CGPoint(x: 448.38, y: 702.01), controlPoint2: CGPoint(x: 473.52, y: 709.12))
        bezier9Path.addCurve(to: CGPoint(x: 638.12, y: 570.29), controlPoint1: CGPoint(x: 575.83, y: 709.12), controlPoint2: CGPoint(x: 638.12, y: 646.83))
        bezier9Path.addCurve(to: CGPoint(x: 617.55, y: 497.58), controlPoint1: CGPoint(x: 638.12, y: 544.53), controlPoint2: CGPoint(x: 631.01, y: 519.39))
        bezier9Path.addCurve(to: CGPoint(x: 619.81, y: 488.02), controlPoint1: CGPoint(x: 615.54, y: 494.31), controlPoint2: CGPoint(x: 616.54, y: 490.04))
        bezier9Path.addCurve(to: CGPoint(x: 629.37, y: 490.29), controlPoint1: CGPoint(x: 623.07, y: 486.04), controlPoint2: CGPoint(x: 627.34, y: 487.01))
        bezier9Path.addCurve(to: CGPoint(x: 652, y: 570.29), controlPoint1: CGPoint(x: 644.18, y: 514.27), controlPoint2: CGPoint(x: 652, y: 541.95))
        bezier9Path.addCurve(to: CGPoint(x: 499.28, y: 723), controlPoint1: CGPoint(x: 652, y: 654.51), controlPoint2: CGPoint(x: 583.49, y: 723))
        bezier9Path.close()
        bezier9Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier9Path.fill()


        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 499.52, y: 945))
        bezier10Path.addCurve(to: CGPoint(x: 499.49, y: 945), controlPoint1: CGPoint(x: 499.5, y: 945), controlPoint2: CGPoint(x: 499.5, y: 945))
        bezier10Path.addLine(to: CGPoint(x: 499.46, y: 945))
        bezier10Path.addCurve(to: CGPoint(x: 264.37, y: 847.45), controlPoint1: CGPoint(x: 410.65, y: 945), controlPoint2: CGPoint(x: 327.18, y: 910.36))
        bezier10Path.addCurve(to: CGPoint(x: 167, y: 611.94), controlPoint1: CGPoint(x: 201.58, y: 784.54), controlPoint2: CGPoint(x: 167, y: 700.9))
        bezier10Path.addCurve(to: CGPoint(x: 173.93, y: 605), controlPoint1: CGPoint(x: 167, y: 608.12), controlPoint2: CGPoint(x: 170.1, y: 605))
        bezier10Path.addCurve(to: CGPoint(x: 180.85, y: 611.94), controlPoint1: CGPoint(x: 177.76, y: 605), controlPoint2: CGPoint(x: 180.85, y: 608.12))
        bezier10Path.addCurve(to: CGPoint(x: 274.17, y: 837.64), controlPoint1: CGPoint(x: 180.85, y: 697.21), controlPoint2: CGPoint(x: 213.99, y: 777.36))
        bezier10Path.addCurve(to: CGPoint(x: 499.47, y: 931.12), controlPoint1: CGPoint(x: 334.35, y: 897.92), controlPoint2: CGPoint(x: 414.36, y: 931.12))
        bezier10Path.addCurve(to: CGPoint(x: 499.49, y: 931.12), controlPoint1: CGPoint(x: 499.48, y: 931.12), controlPoint2: CGPoint(x: 499.48, y: 931.12))
        bezier10Path.addCurve(to: CGPoint(x: 499.52, y: 931.12), controlPoint1: CGPoint(x: 499.49, y: 931.12), controlPoint2: CGPoint(x: 499.51, y: 931.12))
        bezier10Path.addCurve(to: CGPoint(x: 724.82, y: 837.64), controlPoint1: CGPoint(x: 584.62, y: 931.12), controlPoint2: CGPoint(x: 664.64, y: 897.92))
        bezier10Path.addCurve(to: CGPoint(x: 818.14, y: 611.94), controlPoint1: CGPoint(x: 785.01, y: 777.36), controlPoint2: CGPoint(x: 818.14, y: 697.21))
        bezier10Path.addCurve(to: CGPoint(x: 825.07, y: 605), controlPoint1: CGPoint(x: 818.14, y: 608.12), controlPoint2: CGPoint(x: 821.24, y: 605))
        bezier10Path.addCurve(to: CGPoint(x: 832, y: 611.94), controlPoint1: CGPoint(x: 828.9, y: 605), controlPoint2: CGPoint(x: 832, y: 608.12))
        bezier10Path.addCurve(to: CGPoint(x: 734.61, y: 847.45), controlPoint1: CGPoint(x: 832, y: 700.89), controlPoint2: CGPoint(x: 797.42, y: 784.54))
        bezier10Path.addCurve(to: CGPoint(x: 499.52, y: 945), controlPoint1: CGPoint(x: 671.82, y: 910.36), controlPoint2: CGPoint(x: 588.31, y: 945))
        bezier10Path.close()
        bezier10Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier10Path.fill()


        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        bezier11Path.move(to: CGPoint(x: 174.01, y: 619))
        bezier11Path.addCurve(to: CGPoint(x: 167.01, y: 612), controlPoint1: CGPoint(x: 170.14, y: 619), controlPoint2: CGPoint(x: 167.01, y: 615.88))
        bezier11Path.addLine(to: CGPoint(x: 167, y: 570))
        bezier11Path.addCurve(to: CGPoint(x: 173.99, y: 563), controlPoint1: CGPoint(x: 167, y: 566.15), controlPoint2: CGPoint(x: 170.13, y: 563))
        bezier11Path.addCurve(to: CGPoint(x: 180.99, y: 570), controlPoint1: CGPoint(x: 177.86, y: 563), controlPoint2: CGPoint(x: 180.99, y: 566.15))
        bezier11Path.addLine(to: CGPoint(x: 181, y: 612))
        bezier11Path.addCurve(to: CGPoint(x: 174.01, y: 619), controlPoint1: CGPoint(x: 181, y: 615.88), controlPoint2: CGPoint(x: 177.87, y: 619))
        bezier11Path.close()
        bezier11Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier11Path.fill()


        //// Bezier 12 Drawing
        let bezier12Path = UIBezierPath()
        bezier12Path.move(to: CGPoint(x: 826, y: 619))
        bezier12Path.addCurve(to: CGPoint(x: 819, y: 612), controlPoint1: CGPoint(x: 822.13, y: 619), controlPoint2: CGPoint(x: 819, y: 615.88))
        bezier12Path.addLine(to: CGPoint(x: 819, y: 570))
        bezier12Path.addCurve(to: CGPoint(x: 826, y: 563), controlPoint1: CGPoint(x: 819, y: 566.15), controlPoint2: CGPoint(x: 822.13, y: 563))
        bezier12Path.addCurve(to: CGPoint(x: 833, y: 570), controlPoint1: CGPoint(x: 829.87, y: 563), controlPoint2: CGPoint(x: 833, y: 566.15))
        bezier12Path.addLine(to: CGPoint(x: 833, y: 612))
        bezier12Path.addCurve(to: CGPoint(x: 826, y: 619), controlPoint1: CGPoint(x: 833, y: 615.88), controlPoint2: CGPoint(x: 829.87, y: 619))
        bezier12Path.close()
        bezier12Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier12Path.fill()


        //// Bezier 13 Drawing
        let bezier13Path = UIBezierPath()
        bezier13Path.move(to: CGPoint(x: 479.01, y: 237))
        bezier13Path.addCurve(to: CGPoint(x: 472.01, y: 230), controlPoint1: CGPoint(x: 475.14, y: 237), controlPoint2: CGPoint(x: 472.01, y: 233.87))
        bezier13Path.addLine(to: CGPoint(x: 472, y: 202))
        bezier13Path.addCurve(to: CGPoint(x: 478.99, y: 195), controlPoint1: CGPoint(x: 472, y: 198.13), controlPoint2: CGPoint(x: 475.13, y: 195))
        bezier13Path.addCurve(to: CGPoint(x: 485.99, y: 202), controlPoint1: CGPoint(x: 482.86, y: 195), controlPoint2: CGPoint(x: 485.99, y: 198.13))
        bezier13Path.addLine(to: CGPoint(x: 486, y: 230))
        bezier13Path.addCurve(to: CGPoint(x: 479.01, y: 237), controlPoint1: CGPoint(x: 486, y: 233.87), controlPoint2: CGPoint(x: 482.87, y: 237))
        bezier13Path.close()
        bezier13Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier13Path.fill()


        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 514, y: 195, width: 14, height: 42), cornerRadius: 7)
        dark.setFill()
        rectanglePath.fill()


        //// Bezier 14 Drawing
        let bezier14Path = UIBezierPath()
        bezier14Path.move(to: CGPoint(x: 520.13, y: 209))
        bezier14Path.addCurve(to: CGPoint(x: 513.25, y: 202), controlPoint1: CGPoint(x: 516.33, y: 209), controlPoint2: CGPoint(x: 513.25, y: 205.87))
        bezier14Path.addCurve(to: CGPoint(x: 499.49, y: 188), controlPoint1: CGPoint(x: 513.25, y: 194.27), controlPoint2: CGPoint(x: 507.08, y: 188))
        bezier14Path.addCurve(to: CGPoint(x: 485.75, y: 202), controlPoint1: CGPoint(x: 491.91, y: 188), controlPoint2: CGPoint(x: 485.75, y: 194.27))
        bezier14Path.addCurve(to: CGPoint(x: 478.87, y: 209), controlPoint1: CGPoint(x: 485.75, y: 205.87), controlPoint2: CGPoint(x: 482.67, y: 209))
        bezier14Path.addCurve(to: CGPoint(x: 472, y: 202), controlPoint1: CGPoint(x: 475.07, y: 209), controlPoint2: CGPoint(x: 472, y: 205.87))
        bezier14Path.addCurve(to: CGPoint(x: 499.49, y: 174), controlPoint1: CGPoint(x: 472, y: 186.56), controlPoint2: CGPoint(x: 484.34, y: 174))
        bezier14Path.addCurve(to: CGPoint(x: 527, y: 202), controlPoint1: CGPoint(x: 514.66, y: 174), controlPoint2: CGPoint(x: 527, y: 186.56))
        bezier14Path.addCurve(to: CGPoint(x: 520.13, y: 209), controlPoint1: CGPoint(x: 527, y: 205.87), controlPoint2: CGPoint(x: 523.93, y: 209))
        bezier14Path.close()
        bezier14Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier14Path.fill()


        //// Bezier 15 Drawing
        let bezier15Path = UIBezierPath()
        bezier15Path.move(to: CGPoint(x: 451.61, y: 205))
        bezier15Path.addCurve(to: CGPoint(x: 447.21, y: 203.41), controlPoint1: CGPoint(x: 450.06, y: 205), controlPoint2: CGPoint(x: 448.5, y: 204.49))
        bezier15Path.addCurve(to: CGPoint(x: 417, y: 139.21), controlPoint1: CGPoint(x: 428.01, y: 187.53), controlPoint2: CGPoint(x: 417, y: 164.13))
        bezier15Path.addCurve(to: CGPoint(x: 500, y: 56), controlPoint1: CGPoint(x: 417, y: 93.33), controlPoint2: CGPoint(x: 454.23, y: 56))
        bezier15Path.addCurve(to: CGPoint(x: 583, y: 139.21), controlPoint1: CGPoint(x: 545.77, y: 56), controlPoint2: CGPoint(x: 583, y: 93.33))
        bezier15Path.addCurve(to: CGPoint(x: 554.25, y: 202.18), controlPoint1: CGPoint(x: 583, y: 163.41), controlPoint2: CGPoint(x: 572.52, y: 186.35))
        bezier15Path.addCurve(to: CGPoint(x: 544.5, y: 201.46), controlPoint1: CGPoint(x: 551.38, y: 204.66), controlPoint2: CGPoint(x: 547, y: 204.36))
        bezier15Path.addCurve(to: CGPoint(x: 545.2, y: 191.67), controlPoint1: CGPoint(x: 542, y: 198.57), controlPoint2: CGPoint(x: 542.31, y: 194.18))
        bezier15Path.addCurve(to: CGPoint(x: 569.17, y: 139.21), controlPoint1: CGPoint(x: 560.44, y: 178.49), controlPoint2: CGPoint(x: 569.17, y: 159.37))
        bezier15Path.addCurve(to: CGPoint(x: 500, y: 69.87), controlPoint1: CGPoint(x: 569.17, y: 100.98), controlPoint2: CGPoint(x: 538.14, y: 69.87))
        bezier15Path.addCurve(to: CGPoint(x: 430.83, y: 139.21), controlPoint1: CGPoint(x: 461.86, y: 69.87), controlPoint2: CGPoint(x: 430.83, y: 100.98))
        bezier15Path.addCurve(to: CGPoint(x: 456.02, y: 192.72), controlPoint1: CGPoint(x: 430.83, y: 159.98), controlPoint2: CGPoint(x: 440.01, y: 179.48))
        bezier15Path.addCurve(to: CGPoint(x: 456.95, y: 202.48), controlPoint1: CGPoint(x: 458.96, y: 195.15), controlPoint2: CGPoint(x: 459.38, y: 199.53))
        bezier15Path.addCurve(to: CGPoint(x: 451.61, y: 205), controlPoint1: CGPoint(x: 455.58, y: 204.15), controlPoint2: CGPoint(x: 453.6, y: 205))
        bezier15Path.close()
        bezier15Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier15Path.fill()


        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(roundedRect: CGRect(x: 493, y: 278, width: 14, height: 56), cornerRadius: 7)
        dark.setFill()
        rectangle2Path.fill()


        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(roundedRect: CGRect(x: 493, y: 806, width: 14, height: 56), cornerRadius: 7)
        dark.setFill()
        rectangle3Path.fill()


        //// Bezier 16 Drawing
        let bezier16Path = UIBezierPath()
        bezier16Path.move(to: CGPoint(x: 379, y: 366))
        bezier16Path.addCurve(to: CGPoint(x: 372.94, y: 362.53), controlPoint1: CGPoint(x: 376.59, y: 366), controlPoint2: CGPoint(x: 374.23, y: 364.75))
        bezier16Path.addLine(to: CGPoint(x: 351.94, y: 326.44))
        bezier16Path.addCurve(to: CGPoint(x: 354.5, y: 316.95), controlPoint1: CGPoint(x: 350, y: 323.11), controlPoint2: CGPoint(x: 351.15, y: 318.87))
        bezier16Path.addCurve(to: CGPoint(x: 364.06, y: 319.49), controlPoint1: CGPoint(x: 357.85, y: 315), controlPoint2: CGPoint(x: 362.14, y: 316.15))
        bezier16Path.addLine(to: CGPoint(x: 385.06, y: 355.58))
        bezier16Path.addCurve(to: CGPoint(x: 382.5, y: 365.06), controlPoint1: CGPoint(x: 387, y: 358.91), controlPoint2: CGPoint(x: 385.85, y: 363.15))
        bezier16Path.addCurve(to: CGPoint(x: 379, y: 366), controlPoint1: CGPoint(x: 381.39, y: 365.7), controlPoint2: CGPoint(x: 380.19, y: 366))
        bezier16Path.close()
        bezier16Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier16Path.fill()


        //// Bezier 17 Drawing
        let bezier17Path = UIBezierPath()
        bezier17Path.move(to: CGPoint(x: 642, y: 823))
        bezier17Path.addCurve(to: CGPoint(x: 635.94, y: 819.53), controlPoint1: CGPoint(x: 639.59, y: 823), controlPoint2: CGPoint(x: 637.23, y: 821.75))
        bezier17Path.addLine(to: CGPoint(x: 614.94, y: 783.42))
        bezier17Path.addCurve(to: CGPoint(x: 617.5, y: 773.94), controlPoint1: CGPoint(x: 613, y: 780.11), controlPoint2: CGPoint(x: 614.15, y: 775.84))
        bezier17Path.addCurve(to: CGPoint(x: 627.06, y: 776.47), controlPoint1: CGPoint(x: 620.85, y: 772.02), controlPoint2: CGPoint(x: 625.14, y: 773.13))
        bezier17Path.addLine(to: CGPoint(x: 648.06, y: 812.58))
        bezier17Path.addCurve(to: CGPoint(x: 645.5, y: 822.08), controlPoint1: CGPoint(x: 650, y: 815.92), controlPoint2: CGPoint(x: 648.85, y: 820.15))
        bezier17Path.addCurve(to: CGPoint(x: 642, y: 823), controlPoint1: CGPoint(x: 644.39, y: 822.7), controlPoint2: CGPoint(x: 643.19, y: 823))
        bezier17Path.close()
        bezier17Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier17Path.fill()


        //// Bezier 18 Drawing
        let bezier18Path = UIBezierPath()
        bezier18Path.move(to: CGPoint(x: 290.05, y: 455))
        bezier18Path.addCurve(to: CGPoint(x: 286.57, y: 454.06), controlPoint1: CGPoint(x: 288.87, y: 455), controlPoint2: CGPoint(x: 287.67, y: 454.7))
        bezier18Path.addLine(to: CGPoint(x: 250.47, y: 433.05))
        bezier18Path.addCurve(to: CGPoint(x: 247.94, y: 423.49), controlPoint1: CGPoint(x: 247.15, y: 431.12), controlPoint2: CGPoint(x: 246.01, y: 426.84))
        bezier18Path.addCurve(to: CGPoint(x: 257.42, y: 420.94), controlPoint1: CGPoint(x: 249.85, y: 420.16), controlPoint2: CGPoint(x: 254.11, y: 419.01))
        bezier18Path.addLine(to: CGPoint(x: 293.52, y: 441.94))
        bezier18Path.addCurve(to: CGPoint(x: 296.06, y: 451.5), controlPoint1: CGPoint(x: 296.85, y: 443.87), controlPoint2: CGPoint(x: 297.99, y: 448.15))
        bezier18Path.addCurve(to: CGPoint(x: 290.05, y: 455), controlPoint1: CGPoint(x: 294.78, y: 453.74), controlPoint2: CGPoint(x: 292.44, y: 455))
        bezier18Path.close()
        bezier18Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier18Path.fill()


        //// Bezier 19 Drawing
        let bezier19Path = UIBezierPath()
        bezier19Path.move(to: CGPoint(x: 746.05, y: 719))
        bezier19Path.addCurve(to: CGPoint(x: 742.58, y: 718.07), controlPoint1: CGPoint(x: 744.87, y: 719), controlPoint2: CGPoint(x: 743.68, y: 718.7))
        bezier19Path.addLine(to: CGPoint(x: 706.47, y: 697.06))
        bezier19Path.addCurve(to: CGPoint(x: 703.94, y: 687.52), controlPoint1: CGPoint(x: 703.15, y: 695.15), controlPoint2: CGPoint(x: 702.01, y: 690.85))
        bezier19Path.addCurve(to: CGPoint(x: 713.43, y: 684.94), controlPoint1: CGPoint(x: 705.85, y: 684.15), controlPoint2: CGPoint(x: 710.13, y: 683))
        bezier19Path.addLine(to: CGPoint(x: 749.52, y: 705.95))
        bezier19Path.addCurve(to: CGPoint(x: 752.06, y: 715.5), controlPoint1: CGPoint(x: 752.85, y: 707.87), controlPoint2: CGPoint(x: 753.99, y: 712.16))
        bezier19Path.addCurve(to: CGPoint(x: 746.05, y: 719), controlPoint1: CGPoint(x: 750.79, y: 717.74), controlPoint2: CGPoint(x: 748.44, y: 719))
        bezier19Path.close()
        bezier19Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier19Path.fill()


        //// Bezier 20 Drawing
        let bezier20Path = UIBezierPath()
        bezier20Path.move(to: CGPoint(x: 257.12, y: 577))
        bezier20Path.addLine(to: CGPoint(x: 215.88, y: 577))
        bezier20Path.addCurve(to: CGPoint(x: 209, y: 570), controlPoint1: CGPoint(x: 212.08, y: 577), controlPoint2: CGPoint(x: 209, y: 573.88))
        bezier20Path.addCurve(to: CGPoint(x: 215.88, y: 563), controlPoint1: CGPoint(x: 209, y: 566.15), controlPoint2: CGPoint(x: 212.07, y: 563))
        bezier20Path.addLine(to: CGPoint(x: 257.12, y: 563))
        bezier20Path.addCurve(to: CGPoint(x: 264, y: 570), controlPoint1: CGPoint(x: 260.92, y: 563), controlPoint2: CGPoint(x: 264, y: 566.15))
        bezier20Path.addCurve(to: CGPoint(x: 257.12, y: 577), controlPoint1: CGPoint(x: 264, y: 573.88), controlPoint2: CGPoint(x: 260.92, y: 577))
        bezier20Path.close()
        bezier20Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier20Path.fill()


        //// Bezier 21 Drawing
        let bezier21Path = UIBezierPath()
        bezier21Path.move(to: CGPoint(x: 784.12, y: 577))
        bezier21Path.addLine(to: CGPoint(x: 742.87, y: 577))
        bezier21Path.addCurve(to: CGPoint(x: 736, y: 570), controlPoint1: CGPoint(x: 739.07, y: 577), controlPoint2: CGPoint(x: 736, y: 573.88))
        bezier21Path.addCurve(to: CGPoint(x: 742.87, y: 563), controlPoint1: CGPoint(x: 736, y: 566.15), controlPoint2: CGPoint(x: 739.07, y: 563))
        bezier21Path.addLine(to: CGPoint(x: 784.12, y: 563))
        bezier21Path.addCurve(to: CGPoint(x: 791, y: 570), controlPoint1: CGPoint(x: 787.92, y: 563), controlPoint2: CGPoint(x: 791, y: 566.15))
        bezier21Path.addCurve(to: CGPoint(x: 784.12, y: 577), controlPoint1: CGPoint(x: 791, y: 573.88), controlPoint2: CGPoint(x: 787.92, y: 577))
        bezier21Path.close()
        bezier21Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier21Path.fill()


        //// Bezier 22 Drawing
        let bezier22Path = UIBezierPath()
        bezier22Path.move(to: CGPoint(x: 253.95, y: 719))
        bezier22Path.addCurve(to: CGPoint(x: 247.94, y: 715.5), controlPoint1: CGPoint(x: 251.56, y: 719), controlPoint2: CGPoint(x: 249.21, y: 717.74))
        bezier22Path.addCurve(to: CGPoint(x: 250.47, y: 705.96), controlPoint1: CGPoint(x: 246.01, y: 712.17), controlPoint2: CGPoint(x: 247.15, y: 707.87))
        bezier22Path.addLine(to: CGPoint(x: 286.58, y: 684.94))
        bezier22Path.addCurve(to: CGPoint(x: 296.06, y: 687.51), controlPoint1: CGPoint(x: 289.89, y: 683), controlPoint2: CGPoint(x: 294.15, y: 684.15))
        bezier22Path.addCurve(to: CGPoint(x: 293.53, y: 697.05), controlPoint1: CGPoint(x: 297.99, y: 690.85), controlPoint2: CGPoint(x: 296.85, y: 695.14))
        bezier22Path.addLine(to: CGPoint(x: 257.42, y: 718.07))
        bezier22Path.addCurve(to: CGPoint(x: 253.95, y: 719), controlPoint1: CGPoint(x: 256.32, y: 718.7), controlPoint2: CGPoint(x: 255.13, y: 719))
        bezier22Path.close()
        bezier22Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier22Path.fill()


        //// Bezier 23 Drawing
        let bezier23Path = UIBezierPath()
        bezier23Path.move(to: CGPoint(x: 709.95, y: 455))
        bezier23Path.addCurve(to: CGPoint(x: 703.94, y: 451.5), controlPoint1: CGPoint(x: 707.56, y: 455), controlPoint2: CGPoint(x: 705.23, y: 453.74))
        bezier23Path.addCurve(to: CGPoint(x: 706.48, y: 441.94), controlPoint1: CGPoint(x: 702.01, y: 448.15), controlPoint2: CGPoint(x: 703.15, y: 443.87))
        bezier23Path.addLine(to: CGPoint(x: 742.57, y: 420.94))
        bezier23Path.addCurve(to: CGPoint(x: 752.06, y: 423.5), controlPoint1: CGPoint(x: 745.88, y: 419), controlPoint2: CGPoint(x: 750.12, y: 420.15))
        bezier23Path.addCurve(to: CGPoint(x: 749.52, y: 433.06), controlPoint1: CGPoint(x: 753.99, y: 426.85), controlPoint2: CGPoint(x: 752.85, y: 431.13))
        bezier23Path.addLine(to: CGPoint(x: 713.43, y: 454.05))
        bezier23Path.addCurve(to: CGPoint(x: 709.95, y: 455), controlPoint1: CGPoint(x: 712.33, y: 454.7), controlPoint2: CGPoint(x: 711.13, y: 455))
        bezier23Path.close()
        bezier23Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier23Path.fill()


        //// Bezier 24 Drawing
        let bezier24Path = UIBezierPath()
        bezier24Path.move(to: CGPoint(x: 358, y: 823))
        bezier24Path.addCurve(to: CGPoint(x: 354.5, y: 822.08), controlPoint1: CGPoint(x: 356.81, y: 823), controlPoint2: CGPoint(x: 355.61, y: 822.7))
        bezier24Path.addCurve(to: CGPoint(x: 351.95, y: 812.58), controlPoint1: CGPoint(x: 351.15, y: 820.15), controlPoint2: CGPoint(x: 350, y: 815.92))
        bezier24Path.addLine(to: CGPoint(x: 372.94, y: 776.46))
        bezier24Path.addCurve(to: CGPoint(x: 382.5, y: 773.94), controlPoint1: CGPoint(x: 374.87, y: 773.15), controlPoint2: CGPoint(x: 379.16, y: 772.01))
        bezier24Path.addCurve(to: CGPoint(x: 385.06, y: 783.42), controlPoint1: CGPoint(x: 385.85, y: 775.84), controlPoint2: CGPoint(x: 387, y: 780.1))
        bezier24Path.addLine(to: CGPoint(x: 364.06, y: 819.53))
        bezier24Path.addCurve(to: CGPoint(x: 358, y: 823), controlPoint1: CGPoint(x: 362.77, y: 821.75), controlPoint2: CGPoint(x: 360.41, y: 823))
        bezier24Path.close()
        bezier24Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier24Path.fill()


        //// Bezier 25 Drawing
        let bezier25Path = UIBezierPath()
        bezier25Path.move(to: CGPoint(x: 621, y: 366))
        bezier25Path.addCurve(to: CGPoint(x: 617.5, y: 365.06), controlPoint1: CGPoint(x: 619.81, y: 366), controlPoint2: CGPoint(x: 618.61, y: 365.7))
        bezier25Path.addCurve(to: CGPoint(x: 614.94, y: 355.57), controlPoint1: CGPoint(x: 614.15, y: 363.15), controlPoint2: CGPoint(x: 613, y: 358.9))
        bezier25Path.addLine(to: CGPoint(x: 635.94, y: 319.47))
        bezier25Path.addCurve(to: CGPoint(x: 645.5, y: 316.93), controlPoint1: CGPoint(x: 637.87, y: 316.14), controlPoint2: CGPoint(x: 642.17, y: 315.02))
        bezier25Path.addCurve(to: CGPoint(x: 648.06, y: 326.42), controlPoint1: CGPoint(x: 648.85, y: 318.85), controlPoint2: CGPoint(x: 650, y: 323.1))
        bezier25Path.addLine(to: CGPoint(x: 627.06, y: 362.52))
        bezier25Path.addCurve(to: CGPoint(x: 621, y: 366), controlPoint1: CGPoint(x: 625.76, y: 364.75), controlPoint2: CGPoint(x: 623.41, y: 366))
        bezier25Path.close()
        bezier25Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier25Path.fill()


        //// Bezier 26 Drawing
        let bezier26Path = UIBezierPath()
        bezier26Path.move(to: CGPoint(x: 433.08, y: 329))
        bezier26Path.addCurve(to: CGPoint(x: 426.39, y: 323.81), controlPoint1: CGPoint(x: 430.03, y: 329), controlPoint2: CGPoint(x: 427.23, y: 326.94))
        bezier26Path.addLine(to: CGPoint(x: 419.24, y: 296.77))
        bezier26Path.addCurve(to: CGPoint(x: 424.14, y: 288.21), controlPoint1: CGPoint(x: 418.25, y: 293.04), controlPoint2: CGPoint(x: 420.44, y: 289.22))
        bezier26Path.addCurve(to: CGPoint(x: 432.61, y: 293.17), controlPoint1: CGPoint(x: 427.81, y: 287.3), controlPoint2: CGPoint(x: 431.61, y: 289.42))
        bezier26Path.addLine(to: CGPoint(x: 439.76, y: 320.2))
        bezier26Path.addCurve(to: CGPoint(x: 434.86, y: 328.77), controlPoint1: CGPoint(x: 440.75, y: 323.93), controlPoint2: CGPoint(x: 438.56, y: 327.75))
        bezier26Path.addCurve(to: CGPoint(x: 433.08, y: 329), controlPoint1: CGPoint(x: 434.27, y: 328.92), controlPoint2: CGPoint(x: 433.67, y: 329))
        bezier26Path.close()
        bezier26Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier26Path.fill()


        //// Bezier 27 Drawing
        let bezier27Path = UIBezierPath()
        bezier27Path.move(to: CGPoint(x: 573.08, y: 852))
        bezier27Path.addCurve(to: CGPoint(x: 566.39, y: 846.83), controlPoint1: CGPoint(x: 570.03, y: 852), controlPoint2: CGPoint(x: 567.23, y: 849.95))
        bezier27Path.addLine(to: CGPoint(x: 559.24, y: 819.8))
        bezier27Path.addCurve(to: CGPoint(x: 564.13, y: 811.22), controlPoint1: CGPoint(x: 558.25, y: 816.05), controlPoint2: CGPoint(x: 560.44, y: 812.23))
        bezier27Path.addCurve(to: CGPoint(x: 572.61, y: 816.16), controlPoint1: CGPoint(x: 567.85, y: 810.29), controlPoint2: CGPoint(x: 571.61, y: 812.45))
        bezier27Path.addLine(to: CGPoint(x: 579.76, y: 843.2))
        bezier27Path.addCurve(to: CGPoint(x: 574.87, y: 851.78), controlPoint1: CGPoint(x: 580.75, y: 846.94), controlPoint2: CGPoint(x: 578.56, y: 850.77))
        bezier27Path.addCurve(to: CGPoint(x: 573.08, y: 852), controlPoint1: CGPoint(x: 574.27, y: 851.92), controlPoint2: CGPoint(x: 573.67, y: 852))
        bezier27Path.close()
        bezier27Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier27Path.fill()


        //// Bezier 28 Drawing
        let bezier28Path = UIBezierPath()
        bezier28Path.move(to: CGPoint(x: 318.16, y: 395))
        bezier28Path.addCurve(to: CGPoint(x: 313.33, y: 392.94), controlPoint1: CGPoint(x: 316.42, y: 395), controlPoint2: CGPoint(x: 314.67, y: 394.31))
        bezier28Path.addLine(to: CGPoint(x: 294, y: 373.02))
        bezier28Path.addCurve(to: CGPoint(x: 294, y: 363.06), controlPoint1: CGPoint(x: 291.33, y: 370.27), controlPoint2: CGPoint(x: 291.33, y: 365.81))
        bezier28Path.addCurve(to: CGPoint(x: 303.67, y: 363.06), controlPoint1: CGPoint(x: 296.67, y: 360.31), controlPoint2: CGPoint(x: 301, y: 360.31))
        bezier28Path.addLine(to: CGPoint(x: 323, y: 382.98))
        bezier28Path.addCurve(to: CGPoint(x: 323, y: 392.94), controlPoint1: CGPoint(x: 325.67, y: 385.73), controlPoint2: CGPoint(x: 325.67, y: 390.19))
        bezier28Path.addCurve(to: CGPoint(x: 318.16, y: 395), controlPoint1: CGPoint(x: 321.66, y: 394.31), controlPoint2: CGPoint(x: 319.91, y: 395))
        bezier28Path.close()
        bezier28Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier28Path.fill()


        //// Bezier 29 Drawing
        let bezier29Path = UIBezierPath()
        bezier29Path.move(to: CGPoint(x: 700.17, y: 778))
        bezier29Path.addCurve(to: CGPoint(x: 695.33, y: 775.94), controlPoint1: CGPoint(x: 698.42, y: 778), controlPoint2: CGPoint(x: 696.67, y: 777.31))
        bezier29Path.addLine(to: CGPoint(x: 676, y: 756.02))
        bezier29Path.addCurve(to: CGPoint(x: 676, y: 746.06), controlPoint1: CGPoint(x: 673.33, y: 753.27), controlPoint2: CGPoint(x: 673.33, y: 748.81))
        bezier29Path.addCurve(to: CGPoint(x: 685.67, y: 746.06), controlPoint1: CGPoint(x: 678.67, y: 743.31), controlPoint2: CGPoint(x: 683, y: 743.31))
        bezier29Path.addLine(to: CGPoint(x: 705, y: 765.98))
        bezier29Path.addCurve(to: CGPoint(x: 705, y: 775.94), controlPoint1: CGPoint(x: 707.67, y: 768.73), controlPoint2: CGPoint(x: 707.67, y: 773.19))
        bezier29Path.addCurve(to: CGPoint(x: 700.17, y: 778), controlPoint1: CGPoint(x: 703.66, y: 777.31), controlPoint2: CGPoint(x: 701.91, y: 778))
        bezier29Path.close()
        bezier29Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier29Path.fill()


        //// Bezier 30 Drawing
        let bezier30Path = UIBezierPath()
        bezier30Path.move(to: CGPoint(x: 252.01, y: 510))
        bezier30Path.addCurve(to: CGPoint(x: 250.2, y: 509.76), controlPoint1: CGPoint(x: 251.41, y: 510), controlPoint2: CGPoint(x: 250.81, y: 509.92))
        bezier30Path.addLine(to: CGPoint(x: 223.17, y: 502.57))
        bezier30Path.addCurve(to: CGPoint(x: 218.24, y: 494.1), controlPoint1: CGPoint(x: 219.45, y: 501.58), controlPoint2: CGPoint(x: 217.23, y: 497.79))
        bezier30Path.addCurve(to: CGPoint(x: 226.8, y: 489.23), controlPoint1: CGPoint(x: 219.24, y: 490.43), controlPoint2: CGPoint(x: 223.05, y: 488.27))
        bezier30Path.addLine(to: CGPoint(x: 253.83, y: 496.41))
        bezier30Path.addCurve(to: CGPoint(x: 258.76, y: 504.88), controlPoint1: CGPoint(x: 257.55, y: 497.4), controlPoint2: CGPoint(x: 259.77, y: 501.19))
        bezier30Path.addCurve(to: CGPoint(x: 252.01, y: 510), controlPoint1: CGPoint(x: 257.92, y: 507.96), controlPoint2: CGPoint(x: 255.1, y: 510))
        bezier30Path.close()
        bezier30Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier30Path.fill()


        //// Bezier 31 Drawing
        let bezier31Path = UIBezierPath()
        bezier31Path.move(to: CGPoint(x: 774, y: 650))
        bezier31Path.addCurve(to: CGPoint(x: 772.18, y: 649.78), controlPoint1: CGPoint(x: 773.4, y: 650), controlPoint2: CGPoint(x: 772.8, y: 649.92))
        bezier31Path.addLine(to: CGPoint(x: 745.18, y: 642.61))
        bezier31Path.addCurve(to: CGPoint(x: 740.24, y: 634.1), controlPoint1: CGPoint(x: 741.45, y: 641.61), controlPoint2: CGPoint(x: 739.24, y: 637.81))
        bezier31Path.addCurve(to: CGPoint(x: 748.81, y: 629.2), controlPoint1: CGPoint(x: 741.25, y: 630.42), controlPoint2: CGPoint(x: 745.07, y: 628.31))
        bezier31Path.addLine(to: CGPoint(x: 775.82, y: 636.38))
        bezier31Path.addCurve(to: CGPoint(x: 780.76, y: 644.88), controlPoint1: CGPoint(x: 779.54, y: 637.38), controlPoint2: CGPoint(x: 781.76, y: 641.17))
        bezier31Path.addCurve(to: CGPoint(x: 774, y: 650), controlPoint1: CGPoint(x: 779.91, y: 647.97), controlPoint2: CGPoint(x: 777.09, y: 650))
        bezier31Path.close()
        bezier31Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier31Path.fill()


        //// Bezier 32 Drawing
        let bezier32Path = UIBezierPath()
        bezier32Path.move(to: CGPoint(x: 225, y: 650))
        bezier32Path.addCurve(to: CGPoint(x: 218.24, y: 644.86), controlPoint1: CGPoint(x: 221.9, y: 650), controlPoint2: CGPoint(x: 219.08, y: 647.94))
        bezier32Path.addCurve(to: CGPoint(x: 223.19, y: 636.36), controlPoint1: CGPoint(x: 217.24, y: 641.15), controlPoint2: CGPoint(x: 219.47, y: 637.36))
        bezier32Path.addLine(to: CGPoint(x: 250.2, y: 629.21))
        bezier32Path.addCurve(to: CGPoint(x: 258.76, y: 634.11), controlPoint1: CGPoint(x: 253.98, y: 628.29), controlPoint2: CGPoint(x: 257.75, y: 630.43))
        bezier32Path.addCurve(to: CGPoint(x: 253.81, y: 642.61), controlPoint1: CGPoint(x: 259.76, y: 637.82), controlPoint2: CGPoint(x: 257.53, y: 641.61))
        bezier32Path.addLine(to: CGPoint(x: 226.8, y: 649.76))
        bezier32Path.addCurve(to: CGPoint(x: 225, y: 650), controlPoint1: CGPoint(x: 226.2, y: 649.92), controlPoint2: CGPoint(x: 225.58, y: 650))
        bezier32Path.close()
        bezier32Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier32Path.fill()


        //// Bezier 33 Drawing
        let bezier33Path = UIBezierPath()
        bezier33Path.move(to: CGPoint(x: 747, y: 510))
        bezier33Path.addCurve(to: CGPoint(x: 740.24, y: 504.87), controlPoint1: CGPoint(x: 743.91, y: 510), controlPoint2: CGPoint(x: 741.08, y: 507.96))
        bezier33Path.addCurve(to: CGPoint(x: 745.18, y: 496.38), controlPoint1: CGPoint(x: 739.24, y: 501.17), controlPoint2: CGPoint(x: 741.45, y: 497.38))
        bezier33Path.addLine(to: CGPoint(x: 772.19, y: 489.21))
        bezier33Path.addCurve(to: CGPoint(x: 780.76, y: 494.11), controlPoint1: CGPoint(x: 775.98, y: 488.3), controlPoint2: CGPoint(x: 779.75, y: 490.43))
        bezier33Path.addCurve(to: CGPoint(x: 775.82, y: 502.6), controlPoint1: CGPoint(x: 781.76, y: 497.81), controlPoint2: CGPoint(x: 779.55, y: 501.6))
        bezier33Path.addLine(to: CGPoint(x: 748.81, y: 509.77))
        bezier33Path.addCurve(to: CGPoint(x: 747, y: 510), controlPoint1: CGPoint(x: 748.2, y: 509.92), controlPoint2: CGPoint(x: 747.6, y: 510))
        bezier33Path.close()
        bezier33Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier33Path.fill()


        //// Bezier 34 Drawing
        let bezier34Path = UIBezierPath()
        bezier34Path.move(to: CGPoint(x: 298.83, y: 778))
        bezier34Path.addCurve(to: CGPoint(x: 294, y: 775.94), controlPoint1: CGPoint(x: 297.08, y: 778), controlPoint2: CGPoint(x: 295.34, y: 777.31))
        bezier34Path.addCurve(to: CGPoint(x: 294, y: 765.98), controlPoint1: CGPoint(x: 291.33, y: 773.18), controlPoint2: CGPoint(x: 291.33, y: 768.7))
        bezier34Path.addLine(to: CGPoint(x: 313.34, y: 746.06))
        bezier34Path.addCurve(to: CGPoint(x: 323, y: 746.06), controlPoint1: CGPoint(x: 316.01, y: 743.31), controlPoint2: CGPoint(x: 320.33, y: 743.31))
        bezier34Path.addCurve(to: CGPoint(x: 323, y: 756.02), controlPoint1: CGPoint(x: 325.67, y: 748.81), controlPoint2: CGPoint(x: 325.67, y: 753.3))
        bezier34Path.addLine(to: CGPoint(x: 303.66, y: 775.94))
        bezier34Path.addCurve(to: CGPoint(x: 298.83, y: 778), controlPoint1: CGPoint(x: 302.32, y: 777.31), controlPoint2: CGPoint(x: 300.58, y: 778))
        bezier34Path.close()
        bezier34Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier34Path.fill()


        //// Bezier 35 Drawing
        let bezier35Path = UIBezierPath()
        bezier35Path.move(to: CGPoint(x: 680.83, y: 395))
        bezier35Path.addCurve(to: CGPoint(x: 676, y: 392.94), controlPoint1: CGPoint(x: 679.09, y: 395), controlPoint2: CGPoint(x: 677.34, y: 394.31))
        bezier35Path.addCurve(to: CGPoint(x: 676, y: 382.98), controlPoint1: CGPoint(x: 673.33, y: 390.19), controlPoint2: CGPoint(x: 673.33, y: 385.73))
        bezier35Path.addLine(to: CGPoint(x: 695.33, y: 363.06))
        bezier35Path.addCurve(to: CGPoint(x: 705, y: 363.06), controlPoint1: CGPoint(x: 698, y: 360.31), controlPoint2: CGPoint(x: 702.33, y: 360.31))
        bezier35Path.addCurve(to: CGPoint(x: 705, y: 373.02), controlPoint1: CGPoint(x: 707.67, y: 365.81), controlPoint2: CGPoint(x: 707.67, y: 370.27))
        bezier35Path.addLine(to: CGPoint(x: 685.67, y: 392.94))
        bezier35Path.addCurve(to: CGPoint(x: 680.83, y: 395), controlPoint1: CGPoint(x: 684.33, y: 394.31), controlPoint2: CGPoint(x: 682.58, y: 395))
        bezier35Path.close()
        bezier35Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier35Path.fill()


        //// Bezier 36 Drawing
        let bezier36Path = UIBezierPath()
        bezier36Path.move(to: CGPoint(x: 425.93, y: 852))
        bezier36Path.addCurve(to: CGPoint(x: 424.14, y: 851.78), controlPoint1: CGPoint(x: 425.34, y: 852), controlPoint2: CGPoint(x: 424.74, y: 851.92))
        bezier36Path.addCurve(to: CGPoint(x: 419.24, y: 843.2), controlPoint1: CGPoint(x: 420.45, y: 850.77), controlPoint2: CGPoint(x: 418.25, y: 846.94))
        bezier36Path.addLine(to: CGPoint(x: 426.38, y: 816.17))
        bezier36Path.addCurve(to: CGPoint(x: 434.86, y: 811.22), controlPoint1: CGPoint(x: 427.39, y: 812.46), controlPoint2: CGPoint(x: 431.11, y: 810.27))
        bezier36Path.addCurve(to: CGPoint(x: 439.76, y: 819.78), controlPoint1: CGPoint(x: 438.55, y: 812.21), controlPoint2: CGPoint(x: 440.75, y: 816.06))
        bezier36Path.addLine(to: CGPoint(x: 432.62, y: 846.81))
        bezier36Path.addCurve(to: CGPoint(x: 425.93, y: 852), controlPoint1: CGPoint(x: 431.78, y: 849.95), controlPoint2: CGPoint(x: 428.98, y: 852))
        bezier36Path.close()
        bezier36Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier36Path.fill()


        //// Bezier 37 Drawing
        let bezier37Path = UIBezierPath()
        bezier37Path.move(to: CGPoint(x: 565.92, y: 329))
        bezier37Path.addCurve(to: CGPoint(x: 564.13, y: 328.77), controlPoint1: CGPoint(x: 565.32, y: 329), controlPoint2: CGPoint(x: 564.73, y: 328.92))
        bezier37Path.addCurve(to: CGPoint(x: 559.24, y: 320.18), controlPoint1: CGPoint(x: 560.44, y: 327.76), controlPoint2: CGPoint(x: 558.25, y: 323.93))
        bezier37Path.addLine(to: CGPoint(x: 566.39, y: 293.15))
        bezier37Path.addCurve(to: CGPoint(x: 574.87, y: 288.2), controlPoint1: CGPoint(x: 567.41, y: 289.43), controlPoint2: CGPoint(x: 571.19, y: 287.31))
        bezier37Path.addCurve(to: CGPoint(x: 579.76, y: 296.78), controlPoint1: CGPoint(x: 578.56, y: 289.21), controlPoint2: CGPoint(x: 580.75, y: 293.04))
        bezier37Path.addLine(to: CGPoint(x: 572.61, y: 323.82))
        bezier37Path.addCurve(to: CGPoint(x: 565.92, y: 329), controlPoint1: CGPoint(x: 571.77, y: 326.94), controlPoint2: CGPoint(x: 568.97, y: 329))
        bezier37Path.close()
        bezier37Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier37Path.fill()


        //// Bezier 38 Drawing
        let bezier38Path = UIBezierPath()
        bezier38Path.move(to: CGPoint(x: 423.06, y: 577))
        bezier38Path.addLine(to: CGPoint(x: 391.94, y: 577))
        bezier38Path.addCurve(to: CGPoint(x: 385, y: 570), controlPoint1: CGPoint(x: 388.1, y: 577), controlPoint2: CGPoint(x: 385, y: 573.86))
        bezier38Path.addCurve(to: CGPoint(x: 391.94, y: 563), controlPoint1: CGPoint(x: 385, y: 566.12), controlPoint2: CGPoint(x: 388.1, y: 563))
        bezier38Path.addLine(to: CGPoint(x: 423.06, y: 563))
        bezier38Path.addCurve(to: CGPoint(x: 430, y: 570), controlPoint1: CGPoint(x: 426.9, y: 563), controlPoint2: CGPoint(x: 430, y: 566.12))
        bezier38Path.addCurve(to: CGPoint(x: 423.06, y: 577), controlPoint1: CGPoint(x: 430, y: 573.86), controlPoint2: CGPoint(x: 426.9, y: 577))
        bezier38Path.close()
        bezier38Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier38Path.fill()


        //// Bezier 39 Drawing
        let bezier39Path = UIBezierPath()
        bezier39Path.move(to: CGPoint(x: 608.06, y: 577))
        bezier39Path.addLine(to: CGPoint(x: 576.94, y: 577))
        bezier39Path.addCurve(to: CGPoint(x: 570, y: 570), controlPoint1: CGPoint(x: 573.1, y: 577), controlPoint2: CGPoint(x: 570, y: 573.86))
        bezier39Path.addCurve(to: CGPoint(x: 576.94, y: 563), controlPoint1: CGPoint(x: 570, y: 566.12), controlPoint2: CGPoint(x: 573.1, y: 563))
        bezier39Path.addLine(to: CGPoint(x: 608.06, y: 563))
        bezier39Path.addCurve(to: CGPoint(x: 615, y: 570), controlPoint1: CGPoint(x: 611.9, y: 563), controlPoint2: CGPoint(x: 615, y: 566.12))
        bezier39Path.addCurve(to: CGPoint(x: 608.06, y: 577), controlPoint1: CGPoint(x: 615, y: 573.86), controlPoint2: CGPoint(x: 611.9, y: 577))
        bezier39Path.close()
        bezier39Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier39Path.fill()


        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(roundedRect: CGRect(x: 493, y: 640, width: 14, height: 45), cornerRadius: 7)
        dark.setFill()
        rectangle4Path.fill()


        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(roundedRect: CGRect(x: 493, y: 455, width: 14, height: 45), cornerRadius: 7)
        dark.setFill()
        rectangle5Path.fill()


        //// Bezier 40 Drawing
        let bezier40Path = UIBezierPath()
        bezier40Path.move(to: CGPoint(x: 576.04, y: 653))
        bezier40Path.addCurve(to: CGPoint(x: 571.11, y: 650.96), controlPoint1: CGPoint(x: 574.25, y: 653), controlPoint2: CGPoint(x: 572.47, y: 652.32))
        bezier40Path.addLine(to: CGPoint(x: 549.04, y: 628.87))
        bezier40Path.addCurve(to: CGPoint(x: 549.04, y: 619.04), controlPoint1: CGPoint(x: 546.32, y: 626.16), controlPoint2: CGPoint(x: 546.32, y: 621.75))
        bezier40Path.addCurve(to: CGPoint(x: 558.89, y: 619.04), controlPoint1: CGPoint(x: 551.76, y: 616.32), controlPoint2: CGPoint(x: 556.17, y: 616.32))
        bezier40Path.addLine(to: CGPoint(x: 580.96, y: 641.13))
        bezier40Path.addCurve(to: CGPoint(x: 580.96, y: 650.96), controlPoint1: CGPoint(x: 583.68, y: 643.84), controlPoint2: CGPoint(x: 583.68, y: 648.25))
        bezier40Path.addCurve(to: CGPoint(x: 576.04, y: 653), controlPoint1: CGPoint(x: 579.6, y: 652.32), controlPoint2: CGPoint(x: 577.82, y: 653))
        bezier40Path.close()
        bezier40Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier40Path.fill()


        //// Bezier 41 Drawing
        let bezier41Path = UIBezierPath()
        bezier41Path.move(to: CGPoint(x: 445.03, y: 522))
        bezier41Path.addCurve(to: CGPoint(x: 440.11, y: 519.96), controlPoint1: CGPoint(x: 443.25, y: 522), controlPoint2: CGPoint(x: 441.47, y: 521.32))
        bezier41Path.addLine(to: CGPoint(x: 418.04, y: 497.89))
        bezier41Path.addCurve(to: CGPoint(x: 418.04, y: 488.04), controlPoint1: CGPoint(x: 415.32, y: 495.17), controlPoint2: CGPoint(x: 415.32, y: 490.76))
        bezier41Path.addCurve(to: CGPoint(x: 427.89, y: 488.04), controlPoint1: CGPoint(x: 420.76, y: 485.32), controlPoint2: CGPoint(x: 425.17, y: 485.32))
        bezier41Path.addLine(to: CGPoint(x: 449.96, y: 510.11))
        bezier41Path.addCurve(to: CGPoint(x: 449.96, y: 519.96), controlPoint1: CGPoint(x: 452.68, y: 512.84), controlPoint2: CGPoint(x: 452.68, y: 517.24))
        bezier41Path.addCurve(to: CGPoint(x: 445.03, y: 522), controlPoint1: CGPoint(x: 448.6, y: 521.32), controlPoint2: CGPoint(x: 446.82, y: 522))
        bezier41Path.close()
        bezier41Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier41Path.fill()


        //// Bezier 42 Drawing
        let bezier42Path = UIBezierPath()
        bezier42Path.move(to: CGPoint(x: 500, y: 563))
        bezier42Path.addCurve(to: CGPoint(x: 493, y: 570), controlPoint1: CGPoint(x: 496.15, y: 563), controlPoint2: CGPoint(x: 493, y: 566.14))
        bezier42Path.addCurve(to: CGPoint(x: 500, y: 577), controlPoint1: CGPoint(x: 493, y: 573.86), controlPoint2: CGPoint(x: 496.14, y: 577))
        bezier42Path.addLine(to: CGPoint(x: 500.03, y: 577))
        bezier42Path.addCurve(to: CGPoint(x: 507, y: 570), controlPoint1: CGPoint(x: 503.87, y: 577), controlPoint2: CGPoint(x: 507, y: 573.86))
        bezier42Path.addCurve(to: CGPoint(x: 500, y: 563), controlPoint1: CGPoint(x: 507, y: 566.14), controlPoint2: CGPoint(x: 503.86, y: 563))
        bezier42Path.close()
        bezier42Path.move(to: CGPoint(x: 500.03, y: 591))
        bezier42Path.addCurve(to: CGPoint(x: 479, y: 570), controlPoint1: CGPoint(x: 488.43, y: 591), controlPoint2: CGPoint(x: 479, y: 581.56))
        bezier42Path.addCurve(to: CGPoint(x: 500, y: 549), controlPoint1: CGPoint(x: 479, y: 558.43), controlPoint2: CGPoint(x: 488.42, y: 549))
        bezier42Path.addCurve(to: CGPoint(x: 521, y: 570), controlPoint1: CGPoint(x: 511.58, y: 549), controlPoint2: CGPoint(x: 521, y: 558.43))
        bezier42Path.addCurve(to: CGPoint(x: 500.03, y: 591), controlPoint1: CGPoint(x: 521, y: 581.56), controlPoint2: CGPoint(x: 511.59, y: 591))
        bezier42Path.close()
        bezier42Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier42Path.fill()


        //// Bezier 43 Drawing
        let bezier43Path = UIBezierPath()
        bezier43Path.move(to: CGPoint(x: 474.94, y: 551))
        bezier43Path.addCurve(to: CGPoint(x: 469.32, y: 548.13), controlPoint1: CGPoint(x: 472.79, y: 551), controlPoint2: CGPoint(x: 470.67, y: 550))
        bezier43Path.addCurve(to: CGPoint(x: 470.88, y: 538.45), controlPoint1: CGPoint(x: 467.07, y: 545.01), controlPoint2: CGPoint(x: 467.77, y: 540.67))
        bezier43Path.addLine(to: CGPoint(x: 646.99, y: 411.32))
        bezier43Path.addCurve(to: CGPoint(x: 656.68, y: 412.88), controlPoint1: CGPoint(x: 650.1, y: 409.06), controlPoint2: CGPoint(x: 654.43, y: 409.79))
        bezier43Path.addCurve(to: CGPoint(x: 655.12, y: 422.57), controlPoint1: CGPoint(x: 658.93, y: 416), controlPoint2: CGPoint(x: 658.23, y: 420.33))
        bezier43Path.addLine(to: CGPoint(x: 479.01, y: 549.7))
        bezier43Path.addCurve(to: CGPoint(x: 474.94, y: 551), controlPoint1: CGPoint(x: 477.77, y: 550.59), controlPoint2: CGPoint(x: 476.35, y: 551))
        bezier43Path.close()
        bezier43Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier43Path.fill()


        //// Bezier 44 Drawing
        let bezier44Path = UIBezierPath()
        bezier44Path.move(to: CGPoint(x: 523.94, y: 601))
        bezier44Path.addCurve(to: CGPoint(x: 519.88, y: 599.67), controlPoint1: CGPoint(x: 522.53, y: 601), controlPoint2: CGPoint(x: 521.11, y: 600.57))
        bezier44Path.addCurve(to: CGPoint(x: 518.32, y: 590), controlPoint1: CGPoint(x: 516.77, y: 597.45), controlPoint2: CGPoint(x: 516.07, y: 593.11))
        bezier44Path.addLine(to: CGPoint(x: 645.43, y: 413.87))
        bezier44Path.addCurve(to: CGPoint(x: 655.12, y: 412.32), controlPoint1: CGPoint(x: 647.68, y: 410.77), controlPoint2: CGPoint(x: 652.02, y: 410.07))
        bezier44Path.addCurve(to: CGPoint(x: 656.68, y: 422.01), controlPoint1: CGPoint(x: 658.23, y: 414.55), controlPoint2: CGPoint(x: 658.93, y: 418.89))
        bezier44Path.addLine(to: CGPoint(x: 529.57, y: 598.13))
        bezier44Path.addCurve(to: CGPoint(x: 523.94, y: 601), controlPoint1: CGPoint(x: 528.21, y: 600), controlPoint2: CGPoint(x: 526.09, y: 601))
        bezier44Path.close()
        bezier44Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier44Path.fill()


        //// Bezier 45 Drawing
        let bezier45Path = UIBezierPath()
        bezier45Path.move(to: CGPoint(x: 348.92, y: 728))
        bezier45Path.addCurve(to: CGPoint(x: 343.31, y: 725.09), controlPoint1: CGPoint(x: 346.77, y: 728), controlPoint2: CGPoint(x: 344.66, y: 726.99))
        bezier45Path.addCurve(to: CGPoint(x: 344.88, y: 715.39), controlPoint1: CGPoint(x: 341.07, y: 721.99), controlPoint2: CGPoint(x: 341.77, y: 717.64))
        bezier45Path.addLine(to: CGPoint(x: 520.04, y: 588.34))
        bezier45Path.addCurve(to: CGPoint(x: 529.69, y: 589.92), controlPoint1: CGPoint(x: 523.11, y: 586.06), controlPoint2: CGPoint(x: 527.44, y: 586.76))
        bezier45Path.addCurve(to: CGPoint(x: 528.12, y: 599.62), controlPoint1: CGPoint(x: 531.93, y: 593.01), controlPoint2: CGPoint(x: 531.23, y: 597.36))
        bezier45Path.addLine(to: CGPoint(x: 352.96, y: 726.67))
        bezier45Path.addCurve(to: CGPoint(x: 348.92, y: 728), controlPoint1: CGPoint(x: 351.74, y: 727.56), controlPoint2: CGPoint(x: 350.32, y: 728))
        bezier45Path.close()
        bezier45Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier45Path.fill()


        //// Bezier 46 Drawing
        let bezier46Path = UIBezierPath()
        bezier46Path.move(to: CGPoint(x: 348.91, y: 728))
        bezier46Path.addCurve(to: CGPoint(x: 344.88, y: 726.67), controlPoint1: CGPoint(x: 347.51, y: 728), controlPoint2: CGPoint(x: 346.09, y: 727.57))
        bezier46Path.addCurve(to: CGPoint(x: 343.31, y: 716.97), controlPoint1: CGPoint(x: 341.77, y: 724.44), controlPoint2: CGPoint(x: 341.07, y: 720.1))
        bezier46Path.addLine(to: CGPoint(x: 469.49, y: 540.9))
        bezier46Path.addCurve(to: CGPoint(x: 479.12, y: 539.33), controlPoint1: CGPoint(x: 471.72, y: 537.78), controlPoint2: CGPoint(x: 476.05, y: 537.05))
        bezier46Path.addCurve(to: CGPoint(x: 480.69, y: 549.03), controlPoint1: CGPoint(x: 482.23, y: 541.58), controlPoint2: CGPoint(x: 482.93, y: 545.93))
        bezier46Path.addLine(to: CGPoint(x: 354.51, y: 725.09))
        bezier46Path.addCurve(to: CGPoint(x: 348.91, y: 728), controlPoint1: CGPoint(x: 353.16, y: 726.99), controlPoint2: CGPoint(x: 351.06, y: 728))
        bezier46Path.close()
        bezier46Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier46Path.fill()


        //// Bezier 47 Drawing
        let bezier47Path = UIBezierPath()
        bezier47Path.move(to: CGPoint(x: 521, y: 751))
        bezier47Path.addLine(to: CGPoint(x: 493, y: 751))
        bezier47Path.addCurve(to: CGPoint(x: 486, y: 744), controlPoint1: CGPoint(x: 489.13, y: 751), controlPoint2: CGPoint(x: 486, y: 747.86))
        bezier47Path.addCurve(to: CGPoint(x: 493, y: 737), controlPoint1: CGPoint(x: 486, y: 740.12), controlPoint2: CGPoint(x: 489.13, y: 737))
        bezier47Path.addLine(to: CGPoint(x: 521, y: 737))
        bezier47Path.addCurve(to: CGPoint(x: 528, y: 744), controlPoint1: CGPoint(x: 524.87, y: 737), controlPoint2: CGPoint(x: 528, y: 740.12))
        bezier47Path.addCurve(to: CGPoint(x: 521, y: 751), controlPoint1: CGPoint(x: 528, y: 747.86), controlPoint2: CGPoint(x: 524.87, y: 751))
        bezier47Path.close()
        bezier47Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier47Path.fill()


        //// Bezier 48 Drawing
        let bezier48Path = UIBezierPath()
        bezier48Path.move(to: CGPoint(x: 521.01, y: 792))
        bezier48Path.addCurve(to: CGPoint(x: 515.27, y: 788.99), controlPoint1: CGPoint(x: 518.81, y: 792), controlPoint2: CGPoint(x: 516.63, y: 790.93))
        bezier48Path.addLine(to: CGPoint(x: 486.24, y: 746.99))
        bezier48Path.addCurve(to: CGPoint(x: 488, y: 737.22), controlPoint1: CGPoint(x: 484.05, y: 743.79), controlPoint2: CGPoint(x: 484.84, y: 739.44))
        bezier48Path.addCurve(to: CGPoint(x: 497.73, y: 739), controlPoint1: CGPoint(x: 491.17, y: 735.06), controlPoint2: CGPoint(x: 495.5, y: 735.83))
        bezier48Path.addLine(to: CGPoint(x: 526.76, y: 781.01))
        bezier48Path.addCurve(to: CGPoint(x: 525, y: 790.74), controlPoint1: CGPoint(x: 528.95, y: 784.18), controlPoint2: CGPoint(x: 528.16, y: 788.55))
        bezier48Path.addCurve(to: CGPoint(x: 521.01, y: 792), controlPoint1: CGPoint(x: 523.78, y: 791.59), controlPoint2: CGPoint(x: 522.39, y: 792))
        bezier48Path.close()
        bezier48Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier48Path.fill()


        //// Bezier 49 Drawing
        let bezier49Path = UIBezierPath()
        bezier49Path.move(to: CGPoint(x: 521, y: 792))
        bezier49Path.addLine(to: CGPoint(x: 493, y: 792))
        bezier49Path.addCurve(to: CGPoint(x: 486, y: 785), controlPoint1: CGPoint(x: 489.13, y: 792), controlPoint2: CGPoint(x: 486, y: 788.85))
        bezier49Path.addCurve(to: CGPoint(x: 493, y: 778), controlPoint1: CGPoint(x: 486, y: 781.12), controlPoint2: CGPoint(x: 489.13, y: 778))
        bezier49Path.addLine(to: CGPoint(x: 521, y: 778))
        bezier49Path.addCurve(to: CGPoint(x: 528, y: 785), controlPoint1: CGPoint(x: 524.87, y: 778), controlPoint2: CGPoint(x: 528, y: 781.12))
        bezier49Path.addCurve(to: CGPoint(x: 521, y: 792), controlPoint1: CGPoint(x: 528, y: 788.85), controlPoint2: CGPoint(x: 524.87, y: 792))
        bezier49Path.close()
        bezier49Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier49Path.fill()


        //// Bezier 50 Drawing
        let bezier50Path = UIBezierPath()
        bezier50Path.move(to: CGPoint(x: 295.14, y: 598))
        bezier50Path.addCurve(to: CGPoint(x: 288.49, y: 592.7), controlPoint1: CGPoint(x: 292.06, y: 598), controlPoint2: CGPoint(x: 289.26, y: 595.87))
        bezier50Path.addLine(to: CGPoint(x: 278.2, y: 550.71))
        bezier50Path.addCurve(to: CGPoint(x: 283.2, y: 542.21), controlPoint1: CGPoint(x: 277.29, y: 546.96), controlPoint2: CGPoint(x: 279.52, y: 543.16))
        bezier50Path.addCurve(to: CGPoint(x: 291.51, y: 547.32), controlPoint1: CGPoint(x: 286.79, y: 541.28), controlPoint2: CGPoint(x: 290.59, y: 543.55))
        bezier50Path.addLine(to: CGPoint(x: 301.8, y: 589.31))
        bezier50Path.addCurve(to: CGPoint(x: 296.8, y: 597.78), controlPoint1: CGPoint(x: 302.71, y: 593.05), controlPoint2: CGPoint(x: 300.48, y: 596.85))
        bezier50Path.addCurve(to: CGPoint(x: 295.14, y: 598), controlPoint1: CGPoint(x: 296.25, y: 597.92), controlPoint2: CGPoint(x: 295.69, y: 598))
        bezier50Path.close()
        bezier50Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier50Path.fill()


        //// Bezier 51 Drawing
        let bezier51Path = UIBezierPath()
        bezier51Path.move(to: CGPoint(x: 294.86, y: 598))
        bezier51Path.addCurve(to: CGPoint(x: 292.45, y: 597.53), controlPoint1: CGPoint(x: 294.05, y: 598), controlPoint2: CGPoint(x: 293.24, y: 597.86))
        bezier51Path.addCurve(to: CGPoint(x: 288.44, y: 588.54), controlPoint1: CGPoint(x: 288.9, y: 596.2), controlPoint2: CGPoint(x: 287.11, y: 592.15))
        bezier51Path.addLine(to: CGPoint(x: 298.73, y: 560.56))
        bezier51Path.addCurve(to: CGPoint(x: 307.55, y: 556.46), controlPoint1: CGPoint(x: 300.05, y: 556.93), controlPoint2: CGPoint(x: 304.03, y: 555.07))
        bezier51Path.addCurve(to: CGPoint(x: 311.56, y: 565.48), controlPoint1: CGPoint(x: 311.1, y: 557.83), controlPoint2: CGPoint(x: 312.9, y: 561.85))
        bezier51Path.addLine(to: CGPoint(x: 301.27, y: 593.46))
        bezier51Path.addCurve(to: CGPoint(x: 294.86, y: 598), controlPoint1: CGPoint(x: 300.24, y: 596.25), controlPoint2: CGPoint(x: 297.63, y: 598))
        bezier51Path.close()
        bezier51Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier51Path.fill()


        //// Bezier 52 Drawing
        let bezier52Path = UIBezierPath()
        bezier52Path.move(to: CGPoint(x: 316.14, y: 598))
        bezier52Path.addCurve(to: CGPoint(x: 309.73, y: 593.46), controlPoint1: CGPoint(x: 313.37, y: 598), controlPoint2: CGPoint(x: 310.76, y: 596.28))
        bezier52Path.addLine(to: CGPoint(x: 299.44, y: 565.48))
        bezier52Path.addCurve(to: CGPoint(x: 303.45, y: 556.46), controlPoint1: CGPoint(x: 298.1, y: 561.85), controlPoint2: CGPoint(x: 299.91, y: 557.82))
        bezier52Path.addCurve(to: CGPoint(x: 312.27, y: 560.56), controlPoint1: CGPoint(x: 306.95, y: 555.07), controlPoint2: CGPoint(x: 310.95, y: 556.95))
        bezier52Path.addLine(to: CGPoint(x: 322.56, y: 588.54))
        bezier52Path.addCurve(to: CGPoint(x: 318.55, y: 597.56), controlPoint1: CGPoint(x: 323.9, y: 592.18), controlPoint2: CGPoint(x: 322.09, y: 596.2))
        bezier52Path.addCurve(to: CGPoint(x: 316.14, y: 598), controlPoint1: CGPoint(x: 317.76, y: 597.86), controlPoint2: CGPoint(x: 316.95, y: 598))
        bezier52Path.close()
        bezier52Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier52Path.fill()


        //// Bezier 53 Drawing
        let bezier53Path = UIBezierPath()
        bezier53Path.move(to: CGPoint(x: 315.86, y: 598))
        bezier53Path.addCurve(to: CGPoint(x: 314.2, y: 597.81), controlPoint1: CGPoint(x: 315.31, y: 598), controlPoint2: CGPoint(x: 314.76, y: 597.95))
        bezier53Path.addCurve(to: CGPoint(x: 309.2, y: 589.31), controlPoint1: CGPoint(x: 310.53, y: 596.85), controlPoint2: CGPoint(x: 308.29, y: 593.05))
        bezier53Path.addLine(to: CGPoint(x: 319.49, y: 547.31))
        bezier53Path.addCurve(to: CGPoint(x: 327.8, y: 542.2), controlPoint1: CGPoint(x: 320.4, y: 543.54), controlPoint2: CGPoint(x: 324.08, y: 541.3))
        bezier53Path.addCurve(to: CGPoint(x: 332.8, y: 550.7), controlPoint1: CGPoint(x: 331.47, y: 543.16), controlPoint2: CGPoint(x: 333.71, y: 546.96))
        bezier53Path.addLine(to: CGPoint(x: 322.51, y: 592.7))
        bezier53Path.addCurve(to: CGPoint(x: 315.86, y: 598), controlPoint1: CGPoint(x: 321.74, y: 595.9), controlPoint2: CGPoint(x: 318.94, y: 598))
        bezier53Path.close()
        bezier53Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier53Path.fill()


        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(roundedRect: CGRect(x: 666, y: 542, width: 14, height: 56), cornerRadius: 7)
        dark.setFill()
        rectangle6Path.fill()


        //// Bezier 54 Drawing
        let bezier54Path = UIBezierPath()
        bezier54Path.move(to: CGPoint(x: 701, y: 556))
        bezier54Path.addLine(to: CGPoint(x: 673, y: 556))
        bezier54Path.addCurve(to: CGPoint(x: 666, y: 549), controlPoint1: CGPoint(x: 669.13, y: 556), controlPoint2: CGPoint(x: 666, y: 552.86))
        bezier54Path.addCurve(to: CGPoint(x: 673, y: 542), controlPoint1: CGPoint(x: 666, y: 545.12), controlPoint2: CGPoint(x: 669.13, y: 542))
        bezier54Path.addLine(to: CGPoint(x: 701, y: 542))
        bezier54Path.addCurve(to: CGPoint(x: 708, y: 549), controlPoint1: CGPoint(x: 704.87, y: 542), controlPoint2: CGPoint(x: 708, y: 545.12))
        bezier54Path.addCurve(to: CGPoint(x: 701, y: 556), controlPoint1: CGPoint(x: 708, y: 552.86), controlPoint2: CGPoint(x: 704.87, y: 556))
        bezier54Path.close()
        bezier54Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier54Path.fill()


        //// Bezier 55 Drawing
        let bezier55Path = UIBezierPath()
        bezier55Path.move(to: CGPoint(x: 701, y: 598))
        bezier55Path.addLine(to: CGPoint(x: 673, y: 598))
        bezier55Path.addCurve(to: CGPoint(x: 666, y: 591), controlPoint1: CGPoint(x: 669.13, y: 598), controlPoint2: CGPoint(x: 666, y: 594.86))
        bezier55Path.addCurve(to: CGPoint(x: 673, y: 584), controlPoint1: CGPoint(x: 666, y: 587.12), controlPoint2: CGPoint(x: 669.13, y: 584))
        bezier55Path.addLine(to: CGPoint(x: 701, y: 584))
        bezier55Path.addCurve(to: CGPoint(x: 708, y: 591), controlPoint1: CGPoint(x: 704.87, y: 584), controlPoint2: CGPoint(x: 708, y: 587.12))
        bezier55Path.addCurve(to: CGPoint(x: 701, y: 598), controlPoint1: CGPoint(x: 708, y: 594.86), controlPoint2: CGPoint(x: 704.87, y: 598))
        bezier55Path.close()
        bezier55Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier55Path.fill()


        //// Bezier 56 Drawing
        let bezier56Path = UIBezierPath()
        bezier56Path.move(to: CGPoint(x: 687.03, y: 577))
        bezier56Path.addLine(to: CGPoint(x: 673.97, y: 577))
        bezier56Path.addCurve(to: CGPoint(x: 667, y: 570), controlPoint1: CGPoint(x: 670.12, y: 577), controlPoint2: CGPoint(x: 667, y: 573.88))
        bezier56Path.addCurve(to: CGPoint(x: 673.97, y: 563), controlPoint1: CGPoint(x: 667, y: 566.15), controlPoint2: CGPoint(x: 670.12, y: 563))
        bezier56Path.addLine(to: CGPoint(x: 687.03, y: 563))
        bezier56Path.addCurve(to: CGPoint(x: 694, y: 570), controlPoint1: CGPoint(x: 690.88, y: 563), controlPoint2: CGPoint(x: 694, y: 566.15))
        bezier56Path.addCurve(to: CGPoint(x: 687.03, y: 577), controlPoint1: CGPoint(x: 694, y: 573.88), controlPoint2: CGPoint(x: 690.88, y: 577))
        bezier56Path.close()
        bezier56Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier56Path.fill()


        //// Rectangle 7 Drawing
        let rectangle7Path = UIBezierPath(roundedRect: CGRect(x: 479, y: 347, width: 14, height: 56), cornerRadius: 7)
        dark.setFill()
        rectangle7Path.fill()


        //// Bezier 57 Drawing
        let bezier57Path = UIBezierPath()
        bezier57Path.move(to: CGPoint(x: 514, y: 403))
        bezier57Path.addCurve(to: CGPoint(x: 508.17, y: 399.88), controlPoint1: CGPoint(x: 511.74, y: 403), controlPoint2: CGPoint(x: 509.53, y: 401.9))
        bezier57Path.addLine(to: CGPoint(x: 480.18, y: 357.9))
        bezier57Path.addCurve(to: CGPoint(x: 482.12, y: 348.18), controlPoint1: CGPoint(x: 478.03, y: 354.68), controlPoint2: CGPoint(x: 478.91, y: 350.33))
        bezier57Path.addCurve(to: CGPoint(x: 491.82, y: 350.12), controlPoint1: CGPoint(x: 485.3, y: 346.04), controlPoint2: CGPoint(x: 489.67, y: 346.89))
        bezier57Path.addLine(to: CGPoint(x: 519.82, y: 392.1))
        bezier57Path.addCurve(to: CGPoint(x: 517.88, y: 401.82), controlPoint1: CGPoint(x: 521.97, y: 395.32), controlPoint2: CGPoint(x: 521.1, y: 399.67))
        bezier57Path.addCurve(to: CGPoint(x: 514, y: 403), controlPoint1: CGPoint(x: 516.69, y: 402.62), controlPoint2: CGPoint(x: 515.34, y: 403))
        bezier57Path.close()
        bezier57Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier57Path.fill()


        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(roundedRect: CGRect(x: 507, y: 346, width: 14, height: 57), cornerRadius: 7)
        dark.setFill()
        rectangle8Path.fill()
        
        context.restoreGState()

    }

    @objc dynamic public class func drawMicro(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 1000, height: 1000), resizing: ResizingBehavior = .aspectFit, white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), light: UIColor = UIColor(red: 0.769, green: 0.847, blue: 0.984, alpha: 1.000), medium: UIColor = UIColor(red: 0.478, green: 0.663, blue: 0.973, alpha: 1.000), dark: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 1000, height: 1000), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 1000, y: resizedFrame.height / 1000)


        //// Group 2
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 262.95, y: 641.95, width: 28.1, height: 28))
        light.setFill()
        ovalPath.fill()


        //// Rectangle Drawing
        context.saveGState()
        context.translateBy(x: 488.5, y: 445.5)
        context.rotate(by: -45 * CGFloat.pi/180)

        let rectanglePath = UIBezierPath(rect: CGRect(x: -21.62, y: -14.43, width: 43.25, height: 28.85))
        white.setFill()
        rectanglePath.fill()

        context.restoreGState()


        //// Rectangle 2 Drawing
        context.saveGState()
        context.translateBy(x: 458.5, y: 475.5)
        context.rotate(by: -45 * CGFloat.pi/180)

        let rectangle2Path = UIBezierPath(rect: CGRect(x: -21.65, y: -14.43, width: 43.3, height: 28.85))
        light.setFill()
        rectangle2Path.fill()

        context.restoreGState()


        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 287.25, y: 665.77))
        bezierPath.addCurve(to: CGPoint(x: 287.25, y: 645.77), controlPoint1: CGPoint(x: 292.75, y: 660.27), controlPoint2: CGPoint(x: 292.75, y: 651.28))
        bezierPath.addCurve(to: CGPoint(x: 267.26, y: 645.77), controlPoint1: CGPoint(x: 281.75, y: 640.28), controlPoint2: CGPoint(x: 272.76, y: 640.28))
        bezierPath.addCurve(to: CGPoint(x: 267.26, y: 665.77), controlPoint1: CGPoint(x: 261.76, y: 651.27), controlPoint2: CGPoint(x: 261.76, y: 660.27))
        bezierPath.addCurve(to: CGPoint(x: 287.25, y: 665.77), controlPoint1: CGPoint(x: 272.76, y: 671.27), controlPoint2: CGPoint(x: 281.75, y: 671.26))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 453.09, y: 499.92))
        bezierPath.addLine(to: CGPoint(x: 513.07, y: 439.95))
        bezierPath.addLine(to: CGPoint(x: 493.08, y: 419.94))
        bezierPath.addLine(to: CGPoint(x: 463.09, y: 449.94))
        bezierPath.addLine(to: CGPoint(x: 433.1, y: 479.93))
        bezierPath.addLine(to: CGPoint(x: 453.09, y: 499.92))
        bezierPath.close()
        bezierPath.move(to: CGPoint(x: 703, y: 409.94))
        bezierPath.addLine(to: CGPoint(x: 573.05, y: 459.94))
        bezierPath.addLine(to: CGPoint(x: 297.25, y: 735.75))
        bezierPath.addCurve(to: CGPoint(x: 257.26, y: 735.75), controlPoint1: CGPoint(x: 286.25, y: 746.74), controlPoint2: CGPoint(x: 268.26, y: 746.76))
        bezierPath.addLine(to: CGPoint(x: 197.28, y: 675.76))
        bezierPath.addCurve(to: CGPoint(x: 197.28, y: 635.78), controlPoint1: CGPoint(x: 186.19, y: 664.67), controlPoint2: CGPoint(x: 186.29, y: 646.77))
        bezierPath.addLine(to: CGPoint(x: 473.09, y: 359.96))
        bezierPath.addLine(to: CGPoint(x: 523.06, y: 230))
        bezierPath.addLine(to: CGPoint(x: 703, y: 409.94))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        medium.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 493.88, y: 380.03))
        bezier2Path.addLine(to: CGPoint(x: 544, y: 250))
        bezier2Path.addLine(to: CGPoint(x: 523.94, y: 230))
        bezier2Path.addLine(to: CGPoint(x: 473.84, y: 360.03))
        bezier2Path.addLine(to: CGPoint(x: 197.3, y: 635.98))
        bezier2Path.addCurve(to: CGPoint(x: 197.3, y: 675.98), controlPoint1: CGPoint(x: 186.28, y: 646.98), controlPoint2: CGPoint(x: 186.18, y: 664.89))
        bezier2Path.addLine(to: CGPoint(x: 217.35, y: 696))
        bezier2Path.addCurve(to: CGPoint(x: 217.35, y: 655.98), controlPoint1: CGPoint(x: 206.22, y: 684.9), controlPoint2: CGPoint(x: 206.33, y: 666.98))
        bezier2Path.addLine(to: CGPoint(x: 493.88, y: 380.03))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        light.setFill()
        bezier2Path.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 829, y: 335))
        bezier3Path.addLine(to: CGPoint(x: 809, y: 355))
        bezier3Path.addLine(to: CGPoint(x: 579, y: 125))
        bezier3Path.addLine(to: CGPoint(x: 599.01, y: 105))
        bezier3Path.addLine(to: CGPoint(x: 829, y: 335))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        white.setFill()
        bezier3Path.fill()


        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 794, y: 360.01))
        bezier4Path.addCurve(to: CGPoint(x: 716, y: 402), controlPoint1: CGPoint(x: 771.89, y: 382.1), controlPoint2: CGPoint(x: 744.71, y: 396.09))
        bezier4Path.addLine(to: CGPoint(x: 704, y: 410))
        bezier4Path.addLine(to: CGPoint(x: 524, y: 230))
        bezier4Path.addLine(to: CGPoint(x: 531.91, y: 217.91))
        bezier4Path.addCurve(to: CGPoint(x: 574.01, y: 140), controlPoint1: CGPoint(x: 537.92, y: 189.31), controlPoint2: CGPoint(x: 551.91, y: 162.1))
        bezier4Path.addLine(to: CGPoint(x: 584.01, y: 130))
        bezier4Path.addLine(to: CGPoint(x: 804, y: 350.01))
        bezier4Path.addLine(to: CGPoint(x: 794, y: 360.01))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        light.setFill()
        bezier4Path.fill()


        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 593, y: 160.02))
        bezier5Path.addLine(to: CGPoint(x: 573.02, y: 140))
        bezier5Path.addCurve(to: CGPoint(x: 531, y: 217.98), controlPoint1: CGPoint(x: 550.96, y: 162.12), controlPoint2: CGPoint(x: 537, y: 189.35))
        bezier5Path.addLine(to: CGPoint(x: 550.96, y: 238))
        bezier5Path.addCurve(to: CGPoint(x: 593, y: 160.02), controlPoint1: CGPoint(x: 556.96, y: 209.37), controlPoint2: CGPoint(x: 570.93, y: 182.15))
        bezier5Path.close()
        bezier5Path.usesEvenOddFillRule = true
        white.setFill()
        bezier5Path.fill()


        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 773.93, y: 339.38))
        bezier6Path.addLine(to: CGPoint(x: 793.97, y: 359.36))
        bezier6Path.addCurve(to: CGPoint(x: 715.96, y: 401.4), controlPoint1: CGPoint(x: 771.83, y: 381.43), controlPoint2: CGPoint(x: 744.61, y: 395.4))
        bezier6Path.addLine(to: CGPoint(x: 695.93, y: 381.43))
        bezier6Path.addCurve(to: CGPoint(x: 773.93, y: 339.38), controlPoint1: CGPoint(x: 724.58, y: 375.43), controlPoint2: CGPoint(x: 751.81, y: 361.45))
        bezier6Path.close()
        bezier6Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier6Path.fill()


        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 834.02, y: 319.4))
        bezier7Path.addLine(to: CGPoint(x: 824.01, y: 329.39))
        bezier7Path.addLine(to: CGPoint(x: 603.71, y: 109.63))
        bezier7Path.addLine(to: CGPoint(x: 613.73, y: 99.64))
        bezier7Path.addCurve(to: CGPoint(x: 834.02, y: 99.64), controlPoint1: CGPoint(x: 674.3, y: 39.2), controlPoint2: CGPoint(x: 773.44, y: 39.2))
        bezier7Path.addCurve(to: CGPoint(x: 879.5, y: 209.5), controlPoint1: CGPoint(x: 864.27, y: 129.81), controlPoint2: CGPoint(x: 879.5, y: 169.76))
        bezier7Path.addCurve(to: CGPoint(x: 834.02, y: 319.4), controlPoint1: CGPoint(x: 879.5, y: 249.28), controlPoint2: CGPoint(x: 864.27, y: 289.23))
        bezier7Path.close()
        bezier7Path.usesEvenOddFillRule = true
        light.setFill()
        bezier7Path.fill()


        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 843.53, y: 110.12))
        bezier8Path.addCurve(to: CGPoint(x: 834.02, y: 99.64), controlPoint1: CGPoint(x: 840.53, y: 106.52), controlPoint2: CGPoint(x: 837.4, y: 103))
        bezier8Path.addCurve(to: CGPoint(x: 613.73, y: 99.64), controlPoint1: CGPoint(x: 773.44, y: 39.2), controlPoint2: CGPoint(x: 674.3, y: 39.2))
        bezier8Path.addLine(to: CGPoint(x: 633.75, y: 119.61))
        bezier8Path.addCurve(to: CGPoint(x: 843.53, y: 110.12), controlPoint1: CGPoint(x: 690.95, y: 62.54), controlPoint2: CGPoint(x: 782.48, y: 59.44))
        bezier8Path.close()
        bezier8Path.usesEvenOddFillRule = true
        white.setFill()
        bezier8Path.fill()


        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 823.5, y: 90.16))
        bezier9Path.addCurve(to: CGPoint(x: 834.02, y: 99.64), controlPoint1: CGPoint(x: 827.11, y: 93.15), controlPoint2: CGPoint(x: 830.65, y: 96.27))
        bezier9Path.addCurve(to: CGPoint(x: 834.02, y: 319.39), controlPoint1: CGPoint(x: 894.61, y: 160.06), controlPoint2: CGPoint(x: 894.61, y: 258.95))
        bezier9Path.addLine(to: CGPoint(x: 813.99, y: 299.41))
        bezier9Path.addCurve(to: CGPoint(x: 823.5, y: 90.16), controlPoint1: CGPoint(x: 871.2, y: 242.35), controlPoint2: CGPoint(x: 874.31, y: 151.05))
        bezier9Path.close()
        bezier9Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier9Path.fill()


        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: 546.95, y: 173.05, width: 14, height: 13.9))
        dark.setFill()
        oval2Path.fill()


        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalIn: CGRect(x: 546.95, y: 213.05, width: 14, height: 13.9))
        dark.setFill()
        oval3Path.fill()


        //// Oval 4 Drawing
        let oval4Path = UIBezierPath(ovalIn: CGRect(x: 586.95, y: 173.05, width: 14, height: 13.9))
        dark.setFill()
        oval4Path.fill()


        //// Oval 5 Drawing
        let oval5Path = UIBezierPath(ovalIn: CGRect(x: 586.95, y: 213.05, width: 14, height: 13.9))
        dark.setFill()
        oval5Path.fill()


        //// Oval 6 Drawing
        let oval6Path = UIBezierPath(ovalIn: CGRect(x: 586.95, y: 253.05, width: 14, height: 13.9))
        dark.setFill()
        oval6Path.fill()


        //// Oval 7 Drawing
        let oval7Path = UIBezierPath(ovalIn: CGRect(x: 627.95, y: 93.05, width: 14, height: 13.9))
        dark.setFill()
        oval7Path.fill()


        //// Oval 8 Drawing
        let oval8Path = UIBezierPath(ovalIn: CGRect(x: 627.95, y: 213.05, width: 14, height: 13.9))
        dark.setFill()
        oval8Path.fill()


        //// Oval 9 Drawing
        let oval9Path = UIBezierPath(ovalIn: CGRect(x: 627.95, y: 253.05, width: 14, height: 13.9))
        dark.setFill()
        oval9Path.fill()


        //// Oval 10 Drawing
        let oval10Path = UIBezierPath(ovalIn: CGRect(x: 627.95, y: 293.05, width: 14, height: 13.9))
        dark.setFill()
        oval10Path.fill()


        //// Oval 11 Drawing
        let oval11Path = UIBezierPath(ovalIn: CGRect(x: 667.95, y: 93.05, width: 14, height: 13.9))
        dark.setFill()
        oval11Path.fill()


        //// Oval 12 Drawing
        let oval12Path = UIBezierPath(ovalIn: CGRect(x: 667.95, y: 133.05, width: 14, height: 13.9))
        dark.setFill()
        oval12Path.fill()


        //// Oval 13 Drawing
        let oval13Path = UIBezierPath(ovalIn: CGRect(x: 667.95, y: 253.05, width: 14, height: 13.9))
        dark.setFill()
        oval13Path.fill()


        //// Oval 14 Drawing
        let oval14Path = UIBezierPath(ovalIn: CGRect(x: 667.95, y: 293.05, width: 14, height: 13.9))
        dark.setFill()
        oval14Path.fill()


        //// Oval 15 Drawing
        let oval15Path = UIBezierPath(ovalIn: CGRect(x: 667.95, y: 333.05, width: 14, height: 13.9))
        dark.setFill()
        oval15Path.fill()


        //// Oval 16 Drawing
        let oval16Path = UIBezierPath(ovalIn: CGRect(x: 706.95, y: 52.05, width: 14, height: 13.9))
        dark.setFill()
        oval16Path.fill()


        //// Oval 17 Drawing
        let oval17Path = UIBezierPath(ovalIn: CGRect(x: 706.95, y: 93.05, width: 14, height: 13.9))
        dark.setFill()
        oval17Path.fill()


        //// Oval 18 Drawing
        let oval18Path = UIBezierPath(ovalIn: CGRect(x: 706.95, y: 133.05, width: 14, height: 13.9))
        dark.setFill()
        oval18Path.fill()


        //// Oval 19 Drawing
        let oval19Path = UIBezierPath(ovalIn: CGRect(x: 706.95, y: 173.05, width: 14, height: 13.9))
        dark.setFill()
        oval19Path.fill()


        //// Oval 20 Drawing
        let oval20Path = UIBezierPath(ovalIn: CGRect(x: 706.95, y: 293.05, width: 14, height: 13.9))
        dark.setFill()
        oval20Path.fill()


        //// Oval 21 Drawing
        let oval21Path = UIBezierPath(ovalIn: CGRect(x: 706.95, y: 333.05, width: 14, height: 13.9))
        dark.setFill()
        oval21Path.fill()


        //// Oval 22 Drawing
        let oval22Path = UIBezierPath(ovalIn: CGRect(x: 706.95, y: 373.05, width: 14, height: 13.9))
        dark.setFill()
        oval22Path.fill()


        //// Oval 23 Drawing
        let oval23Path = UIBezierPath(ovalIn: CGRect(x: 746.95, y: 52.05, width: 14, height: 13.9))
        dark.setFill()
        oval23Path.fill()


        //// Oval 24 Drawing
        let oval24Path = UIBezierPath(ovalIn: CGRect(x: 746.95, y: 93.05, width: 14, height: 13.9))
        dark.setFill()
        oval24Path.fill()


        //// Oval 25 Drawing
        let oval25Path = UIBezierPath(ovalIn: CGRect(x: 746.95, y: 133.05, width: 14, height: 13.9))
        dark.setFill()
        oval25Path.fill()


        //// Oval 26 Drawing
        let oval26Path = UIBezierPath(ovalIn: CGRect(x: 746.95, y: 173.05, width: 14, height: 13.9))
        dark.setFill()
        oval26Path.fill()


        //// Oval 27 Drawing
        let oval27Path = UIBezierPath(ovalIn: CGRect(x: 746.95, y: 213.05, width: 14, height: 13.9))
        dark.setFill()
        oval27Path.fill()


        //// Oval 28 Drawing
        let oval28Path = UIBezierPath(ovalIn: CGRect(x: 746.95, y: 333.05, width: 14, height: 13.9))
        dark.setFill()
        oval28Path.fill()


        //// Oval 29 Drawing
        let oval29Path = UIBezierPath(ovalIn: CGRect(x: 746.95, y: 373.05, width: 14, height: 13.9))
        dark.setFill()
        oval29Path.fill()


        //// Oval 30 Drawing
        let oval30Path = UIBezierPath(ovalIn: CGRect(x: 786.95, y: 93.05, width: 14, height: 13.9))
        dark.setFill()
        oval30Path.fill()


        //// Oval 31 Drawing
        let oval31Path = UIBezierPath(ovalIn: CGRect(x: 786.95, y: 133.05, width: 14, height: 13.9))
        dark.setFill()
        oval31Path.fill()


        //// Oval 32 Drawing
        let oval32Path = UIBezierPath(ovalIn: CGRect(x: 786.95, y: 173.05, width: 14, height: 13.9))
        dark.setFill()
        oval32Path.fill()


        //// Oval 33 Drawing
        let oval33Path = UIBezierPath(ovalIn: CGRect(x: 786.95, y: 213.05, width: 14, height: 13.9))
        dark.setFill()
        oval33Path.fill()


        //// Oval 34 Drawing
        let oval34Path = UIBezierPath(ovalIn: CGRect(x: 786.95, y: 253.05, width: 14, height: 13.9))
        dark.setFill()
        oval34Path.fill()


        //// Oval 35 Drawing
        let oval35Path = UIBezierPath(ovalIn: CGRect(x: 826.95, y: 133.05, width: 14, height: 13.9))
        dark.setFill()
        oval35Path.fill()


        //// Oval 36 Drawing
        let oval36Path = UIBezierPath(ovalIn: CGRect(x: 826.95, y: 173.05, width: 14, height: 13.9))
        dark.setFill()
        oval36Path.fill()


        //// Oval 37 Drawing
        let oval37Path = UIBezierPath(ovalIn: CGRect(x: 826.95, y: 213.05, width: 14, height: 13.9))
        dark.setFill()
        oval37Path.fill()


        //// Oval 38 Drawing
        let oval38Path = UIBezierPath(ovalIn: CGRect(x: 826.95, y: 253.05, width: 14, height: 13.9))
        dark.setFill()
        oval38Path.fill()


        //// Oval 39 Drawing
        let oval39Path = UIBezierPath(ovalIn: CGRect(x: 826.95, y: 293.05, width: 14, height: 13.9))
        dark.setFill()
        oval39Path.fill()


        //// Oval 40 Drawing
        let oval40Path = UIBezierPath(ovalIn: CGRect(x: 867.95, y: 173.05, width: 14, height: 13.9))
        dark.setFill()
        oval40Path.fill()


        //// Oval 41 Drawing
        let oval41Path = UIBezierPath(ovalIn: CGRect(x: 867.95, y: 213.05, width: 14, height: 13.9))
        dark.setFill()
        oval41Path.fill()


        //// Rectangle 3 Drawing
        context.saveGState()
        context.translateBy(x: 206, y: 728)
        context.rotate(by: -45 * CGFloat.pi/180)

        let rectangle3Path = UIBezierPath(rect: CGRect(x: -31.12, y: -14.12, width: 62.25, height: 28.25))
        medium.setFill()
        rectangle3Path.fill()

        context.restoreGState()


        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 531.91, y: 218))
        bezier10Path.addLine(to: CGPoint(x: 524, y: 230.09))
        bezier10Path.addLine(to: CGPoint(x: 704, y: 410))
        bezier10Path.addLine(to: CGPoint(x: 716, y: 402.01))
        bezier10Path.addLine(to: CGPoint(x: 531.91, y: 218))
        bezier10Path.close()
        bezier10Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier10Path.fill()


        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        bezier11Path.move(to: CGPoint(x: 574, y: 139))
        bezier11Path.addLine(to: CGPoint(x: 584, y: 129))
        bezier11Path.addLine(to: CGPoint(x: 804, y: 349))
        bezier11Path.addLine(to: CGPoint(x: 794, y: 359))
        bezier11Path.addLine(to: CGPoint(x: 574, y: 139))
        bezier11Path.close()
        bezier11Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier11Path.fill()


        //// Bezier 12 Drawing
        let bezier12Path = UIBezierPath()
        bezier12Path.move(to: CGPoint(x: 604, y: 109))
        bezier12Path.addLine(to: CGPoint(x: 614, y: 99))
        bezier12Path.addLine(to: CGPoint(x: 834, y: 319))
        bezier12Path.addLine(to: CGPoint(x: 824, y: 329))
        bezier12Path.addLine(to: CGPoint(x: 604, y: 109))
        bezier12Path.close()
        bezier12Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier12Path.fill()


        //// Bezier 13 Drawing
        let bezier13Path = UIBezierPath()
        bezier13Path.move(to: CGPoint(x: 716.04, y: 410))
        bezier13Path.addCurve(to: CGPoint(x: 709.15, y: 404.27), controlPoint1: CGPoint(x: 712.76, y: 410), controlPoint2: CGPoint(x: 709.84, y: 407.66))
        bezier13Path.addCurve(to: CGPoint(x: 714.64, y: 395.8), controlPoint1: CGPoint(x: 708.35, y: 400.38), controlPoint2: CGPoint(x: 710.82, y: 396.6))
        bezier13Path.addCurve(to: CGPoint(x: 788.95, y: 355.1), controlPoint1: CGPoint(x: 742.88, y: 389.88), controlPoint2: CGPoint(x: 768.58, y: 375.8))
        bezier13Path.addCurve(to: CGPoint(x: 798.93, y: 355.1), controlPoint1: CGPoint(x: 791.71, y: 352.3), controlPoint2: CGPoint(x: 796.17, y: 352.3))
        bezier13Path.addCurve(to: CGPoint(x: 798.93, y: 365.25), controlPoint1: CGPoint(x: 801.69, y: 357.91), controlPoint2: CGPoint(x: 801.69, y: 362.45))
        bezier13Path.addCurve(to: CGPoint(x: 717.48, y: 409.84), controlPoint1: CGPoint(x: 776.61, y: 387.94), controlPoint2: CGPoint(x: 748.45, y: 403.37))
        bezier13Path.addCurve(to: CGPoint(x: 716.04, y: 410), controlPoint1: CGPoint(x: 717.01, y: 409.96), controlPoint2: CGPoint(x: 716.51, y: 410))
        bezier13Path.close()
        bezier13Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier13Path.fill()


        //// Bezier 14 Drawing
        let bezier14Path = UIBezierPath()
        bezier14Path.move(to: CGPoint(x: 833.62, y: 326))
        bezier14Path.addCurve(to: CGPoint(x: 828.63, y: 323.93), controlPoint1: CGPoint(x: 831.82, y: 326), controlPoint2: CGPoint(x: 830.01, y: 325.31))
        bezier14Path.addCurve(to: CGPoint(x: 828.63, y: 313.95), controlPoint1: CGPoint(x: 825.87, y: 321.18), controlPoint2: CGPoint(x: 825.87, y: 316.71))
        bezier14Path.addCurve(to: CGPoint(x: 871.89, y: 209.13), controlPoint1: CGPoint(x: 856.52, y: 286.05), controlPoint2: CGPoint(x: 871.89, y: 248.83))
        bezier14Path.addCurve(to: CGPoint(x: 828.63, y: 104.34), controlPoint1: CGPoint(x: 871.89, y: 169.45), controlPoint2: CGPoint(x: 856.52, y: 132.24))
        bezier14Path.addCurve(to: CGPoint(x: 723.83, y: 61.12), controlPoint1: CGPoint(x: 800.76, y: 76.47), controlPoint2: CGPoint(x: 763.54, y: 61.12))
        bezier14Path.addCurve(to: CGPoint(x: 619.05, y: 104.34), controlPoint1: CGPoint(x: 684.13, y: 61.12), controlPoint2: CGPoint(x: 646.92, y: 76.47))
        bezier14Path.addCurve(to: CGPoint(x: 609.07, y: 104.34), controlPoint1: CGPoint(x: 616.29, y: 107.1), controlPoint2: CGPoint(x: 611.82, y: 107.1))
        bezier14Path.addCurve(to: CGPoint(x: 609.07, y: 94.36), controlPoint1: CGPoint(x: 606.31, y: 101.59), controlPoint2: CGPoint(x: 606.31, y: 97.12))
        bezier14Path.addCurve(to: CGPoint(x: 723.83, y: 47), controlPoint1: CGPoint(x: 639.6, y: 63.82), controlPoint2: CGPoint(x: 680.36, y: 47))
        bezier14Path.addCurve(to: CGPoint(x: 838.61, y: 94.36), controlPoint1: CGPoint(x: 767.31, y: 47), controlPoint2: CGPoint(x: 808.08, y: 63.82))
        bezier14Path.addCurve(to: CGPoint(x: 886, y: 209.13), controlPoint1: CGPoint(x: 869.17, y: 124.92), controlPoint2: CGPoint(x: 886, y: 165.69))
        bezier14Path.addCurve(to: CGPoint(x: 838.61, y: 323.93), controlPoint1: CGPoint(x: 886, y: 252.6), controlPoint2: CGPoint(x: 869.17, y: 293.37))
        bezier14Path.addCurve(to: CGPoint(x: 833.62, y: 326), controlPoint1: CGPoint(x: 837.23, y: 325.31), controlPoint2: CGPoint(x: 835.43, y: 326))
        bezier14Path.close()
        bezier14Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier14Path.fill()


        //// Bezier 15 Drawing
        let bezier15Path = UIBezierPath()
        bezier15Path.move(to: CGPoint(x: 531.18, y: 224))
        bezier15Path.addCurve(to: CGPoint(x: 529.7, y: 223.85), controlPoint1: CGPoint(x: 530.68, y: 224), controlPoint2: CGPoint(x: 530.2, y: 223.96))
        bezier15Path.addCurve(to: CGPoint(x: 524.15, y: 215.48), controlPoint1: CGPoint(x: 525.82, y: 223.05), controlPoint2: CGPoint(x: 523.34, y: 219.31))
        bezier15Path.addCurve(to: CGPoint(x: 568.77, y: 134.07), controlPoint1: CGPoint(x: 530.75, y: 184.51), controlPoint2: CGPoint(x: 546.17, y: 156.35))
        bezier15Path.addCurve(to: CGPoint(x: 578.9, y: 134.07), controlPoint1: CGPoint(x: 571.57, y: 131.31), controlPoint2: CGPoint(x: 576.1, y: 131.31))
        bezier15Path.addCurve(to: CGPoint(x: 578.9, y: 144.06), controlPoint1: CGPoint(x: 581.7, y: 136.83), controlPoint2: CGPoint(x: 581.7, y: 141.3))
        bezier15Path.addCurve(to: CGPoint(x: 538.18, y: 218.38), controlPoint1: CGPoint(x: 558.28, y: 164.4), controlPoint2: CGPoint(x: 544.2, y: 190.1))
        bezier15Path.addCurve(to: CGPoint(x: 531.18, y: 224), controlPoint1: CGPoint(x: 537.48, y: 221.71), controlPoint2: CGPoint(x: 534.48, y: 224))
        bezier15Path.close()
        bezier15Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier15Path.fill()


        //// Bezier 16 Drawing
        let bezier16Path = UIBezierPath()
        bezier16Path.move(to: CGPoint(x: 703.93, y: 417))
        bezier16Path.addCurve(to: CGPoint(x: 698.94, y: 414.93), controlPoint1: CGPoint(x: 702.13, y: 417), controlPoint2: CGPoint(x: 700.32, y: 416.31))
        bezier16Path.addLine(to: CGPoint(x: 519.07, y: 235.06))
        bezier16Path.addCurve(to: CGPoint(x: 519.07, y: 225.07), controlPoint1: CGPoint(x: 516.31, y: 232.3), controlPoint2: CGPoint(x: 516.31, y: 227.83))
        bezier16Path.addCurve(to: CGPoint(x: 529.06, y: 225.07), controlPoint1: CGPoint(x: 521.83, y: 222.31), controlPoint2: CGPoint(x: 526.3, y: 222.31))
        bezier16Path.addLine(to: CGPoint(x: 708.93, y: 404.94))
        bezier16Path.addCurve(to: CGPoint(x: 708.93, y: 414.93), controlPoint1: CGPoint(x: 711.69, y: 407.7), controlPoint2: CGPoint(x: 711.69, y: 412.17))
        bezier16Path.addCurve(to: CGPoint(x: 703.93, y: 417), controlPoint1: CGPoint(x: 707.55, y: 416.31), controlPoint2: CGPoint(x: 705.74, y: 417))
        bezier16Path.close()
        bezier16Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier16Path.fill()


        //// Bezier 17 Drawing
        let bezier17Path = UIBezierPath()
        bezier17Path.move(to: CGPoint(x: 653.94, y: 407))
        bezier17Path.addCurve(to: CGPoint(x: 648.94, y: 404.93), controlPoint1: CGPoint(x: 652.12, y: 407), controlPoint2: CGPoint(x: 650.32, y: 406.31))
        bezier17Path.addLine(to: CGPoint(x: 529.07, y: 285.06))
        bezier17Path.addCurve(to: CGPoint(x: 529.07, y: 275.07), controlPoint1: CGPoint(x: 526.31, y: 282.3), controlPoint2: CGPoint(x: 526.31, y: 277.83))
        bezier17Path.addCurve(to: CGPoint(x: 539.06, y: 275.07), controlPoint1: CGPoint(x: 531.83, y: 272.31), controlPoint2: CGPoint(x: 536.3, y: 272.31))
        bezier17Path.addLine(to: CGPoint(x: 658.93, y: 394.94))
        bezier17Path.addCurve(to: CGPoint(x: 658.93, y: 404.93), controlPoint1: CGPoint(x: 661.69, y: 397.7), controlPoint2: CGPoint(x: 661.69, y: 402.17))
        bezier17Path.addCurve(to: CGPoint(x: 653.94, y: 407), controlPoint1: CGPoint(x: 657.55, y: 406.31), controlPoint2: CGPoint(x: 655.73, y: 407))
        bezier17Path.close()
        bezier17Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier17Path.fill()


        //// Bezier 18 Drawing
        let bezier18Path = UIBezierPath()
        bezier18Path.move(to: CGPoint(x: 473.06, y: 367))
        bezier18Path.addCurve(to: CGPoint(x: 470.52, y: 366.53), controlPoint1: CGPoint(x: 472.22, y: 367), controlPoint2: CGPoint(x: 471.36, y: 366.85))
        bezier18Path.addCurve(to: CGPoint(x: 466.47, y: 357.4), controlPoint1: CGPoint(x: 466.89, y: 365.12), controlPoint2: CGPoint(x: 465.07, y: 361.04))
        bezier18Path.addLine(to: CGPoint(x: 516.35, y: 227.53))
        bezier18Path.addCurve(to: CGPoint(x: 525.47, y: 223.47), controlPoint1: CGPoint(x: 517.76, y: 223.9), controlPoint2: CGPoint(x: 521.83, y: 222.07))
        bezier18Path.addCurve(to: CGPoint(x: 529.52, y: 232.61), controlPoint1: CGPoint(x: 529.11, y: 224.88), controlPoint2: CGPoint(x: 530.93, y: 228.96))
        bezier18Path.addLine(to: CGPoint(x: 479.65, y: 362.47))
        bezier18Path.addCurve(to: CGPoint(x: 473.06, y: 367), controlPoint1: CGPoint(x: 478.56, y: 365.28), controlPoint2: CGPoint(x: 475.89, y: 367))
        bezier18Path.close()
        bezier18Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier18Path.fill()


        //// Bezier 19 Drawing
        let bezier19Path = UIBezierPath()
        bezier19Path.move(to: CGPoint(x: 574.06, y: 467))
        bezier19Path.addCurve(to: CGPoint(x: 567.47, y: 462.48), controlPoint1: CGPoint(x: 571.23, y: 467), controlPoint2: CGPoint(x: 568.56, y: 465.28))
        bezier19Path.addCurve(to: CGPoint(x: 571.53, y: 453.36), controlPoint1: CGPoint(x: 566.08, y: 458.84), controlPoint2: CGPoint(x: 567.9, y: 454.76))
        bezier19Path.addLine(to: CGPoint(x: 701.39, y: 403.46))
        bezier19Path.addCurve(to: CGPoint(x: 710.52, y: 407.52), controlPoint1: CGPoint(x: 705.03, y: 402.09), controlPoint2: CGPoint(x: 709.12, y: 403.88))
        bezier19Path.addCurve(to: CGPoint(x: 706.47, y: 416.64), controlPoint1: CGPoint(x: 711.93, y: 411.15), controlPoint2: CGPoint(x: 710.11, y: 415.23))
        bezier19Path.addLine(to: CGPoint(x: 576.6, y: 466.53))
        bezier19Path.addCurve(to: CGPoint(x: 574.06, y: 467), controlPoint1: CGPoint(x: 575.76, y: 466.85), controlPoint2: CGPoint(x: 574.91, y: 467))
        bezier19Path.close()
        bezier19Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier19Path.fill()


        //// Bezier 20 Drawing
        let bezier20Path = UIBezierPath()
        bezier20Path.move(to: CGPoint(x: 197.09, y: 644))
        bezier20Path.addCurve(to: CGPoint(x: 192.08, y: 641.92), controlPoint1: CGPoint(x: 195.28, y: 644), controlPoint2: CGPoint(x: 193.46, y: 643.31))
        bezier20Path.addCurve(to: CGPoint(x: 192.08, y: 631.89), controlPoint1: CGPoint(x: 189.31, y: 639.15), controlPoint2: CGPoint(x: 189.31, y: 634.66))
        bezier20Path.addLine(to: CGPoint(x: 468.89, y: 355.08))
        bezier20Path.addCurve(to: CGPoint(x: 478.92, y: 355.08), controlPoint1: CGPoint(x: 471.66, y: 352.31), controlPoint2: CGPoint(x: 476.15, y: 352.31))
        bezier20Path.addCurve(to: CGPoint(x: 478.92, y: 365.11), controlPoint1: CGPoint(x: 481.69, y: 357.85), controlPoint2: CGPoint(x: 481.69, y: 362.34))
        bezier20Path.addLine(to: CGPoint(x: 202.11, y: 641.92))
        bezier20Path.addCurve(to: CGPoint(x: 197.09, y: 644), controlPoint1: CGPoint(x: 200.72, y: 643.31), controlPoint2: CGPoint(x: 198.91, y: 644))
        bezier20Path.close()
        bezier20Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier20Path.fill()


        //// Bezier 21 Drawing
        let bezier21Path = UIBezierPath()
        bezier21Path.move(to: CGPoint(x: 297.09, y: 744))
        bezier21Path.addCurve(to: CGPoint(x: 292.08, y: 741.92), controlPoint1: CGPoint(x: 295.28, y: 744), controlPoint2: CGPoint(x: 293.46, y: 743.31))
        bezier21Path.addCurve(to: CGPoint(x: 292.08, y: 731.89), controlPoint1: CGPoint(x: 289.31, y: 739.15), controlPoint2: CGPoint(x: 289.31, y: 734.66))
        bezier21Path.addLine(to: CGPoint(x: 568.89, y: 455.08))
        bezier21Path.addCurve(to: CGPoint(x: 578.92, y: 455.08), controlPoint1: CGPoint(x: 571.66, y: 452.31), controlPoint2: CGPoint(x: 576.15, y: 452.31))
        bezier21Path.addCurve(to: CGPoint(x: 578.92, y: 465.11), controlPoint1: CGPoint(x: 581.69, y: 457.85), controlPoint2: CGPoint(x: 581.69, y: 462.34))
        bezier21Path.addLine(to: CGPoint(x: 302.11, y: 741.92))
        bezier21Path.addCurve(to: CGPoint(x: 297.09, y: 744), controlPoint1: CGPoint(x: 300.72, y: 743.31), controlPoint2: CGPoint(x: 298.91, y: 744))
        bezier21Path.close()
        bezier21Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier21Path.fill()


        //// Bezier 22 Drawing
        let bezier22Path = UIBezierPath()
        bezier22Path.move(to: CGPoint(x: 828.93, y: 342))
        bezier22Path.addCurve(to: CGPoint(x: 823.94, y: 339.93), controlPoint1: CGPoint(x: 827.13, y: 342), controlPoint2: CGPoint(x: 825.32, y: 341.31))
        bezier22Path.addLine(to: CGPoint(x: 594.07, y: 110.06))
        bezier22Path.addCurve(to: CGPoint(x: 594.07, y: 100.07), controlPoint1: CGPoint(x: 591.31, y: 107.3), controlPoint2: CGPoint(x: 591.31, y: 102.83))
        bezier22Path.addCurve(to: CGPoint(x: 604.06, y: 100.07), controlPoint1: CGPoint(x: 596.83, y: 97.31), controlPoint2: CGPoint(x: 601.3, y: 97.31))
        bezier22Path.addLine(to: CGPoint(x: 833.93, y: 329.94))
        bezier22Path.addCurve(to: CGPoint(x: 833.93, y: 339.93), controlPoint1: CGPoint(x: 836.69, y: 332.7), controlPoint2: CGPoint(x: 836.69, y: 337.17))
        bezier22Path.addCurve(to: CGPoint(x: 828.93, y: 342), controlPoint1: CGPoint(x: 832.55, y: 341.31), controlPoint2: CGPoint(x: 830.74, y: 342))
        bezier22Path.close()
        bezier22Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier22Path.fill()


        //// Bezier 23 Drawing
        let bezier23Path = UIBezierPath()
        bezier23Path.move(to: CGPoint(x: 808.93, y: 362))
        bezier23Path.addCurve(to: CGPoint(x: 803.94, y: 359.93), controlPoint1: CGPoint(x: 807.13, y: 362), controlPoint2: CGPoint(x: 805.32, y: 361.31))
        bezier23Path.addLine(to: CGPoint(x: 574.07, y: 130.06))
        bezier23Path.addCurve(to: CGPoint(x: 574.07, y: 120.07), controlPoint1: CGPoint(x: 571.31, y: 127.3), controlPoint2: CGPoint(x: 571.31, y: 122.83))
        bezier23Path.addCurve(to: CGPoint(x: 584.06, y: 120.07), controlPoint1: CGPoint(x: 576.83, y: 117.31), controlPoint2: CGPoint(x: 581.3, y: 117.31))
        bezier23Path.addLine(to: CGPoint(x: 813.93, y: 349.94))
        bezier23Path.addCurve(to: CGPoint(x: 813.93, y: 359.93), controlPoint1: CGPoint(x: 816.69, y: 352.7), controlPoint2: CGPoint(x: 816.69, y: 357.17))
        bezier23Path.addCurve(to: CGPoint(x: 808.93, y: 362), controlPoint1: CGPoint(x: 812.55, y: 361.31), controlPoint2: CGPoint(x: 810.74, y: 362))
        bezier23Path.close()
        bezier23Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier23Path.fill()


        //// Bezier 24 Drawing
        let bezier24Path = UIBezierPath()
        bezier24Path.move(to: CGPoint(x: 579.04, y: 132))
        bezier24Path.addCurve(to: CGPoint(x: 574.06, y: 129.94), controlPoint1: CGPoint(x: 577.24, y: 132), controlPoint2: CGPoint(x: 575.44, y: 131.31))
        bezier24Path.addCurve(to: CGPoint(x: 574.06, y: 119.98), controlPoint1: CGPoint(x: 571.31, y: 127.19), controlPoint2: CGPoint(x: 571.31, y: 122.73))
        bezier24Path.addLine(to: CGPoint(x: 593.98, y: 100.06))
        bezier24Path.addCurve(to: CGPoint(x: 603.94, y: 100.06), controlPoint1: CGPoint(x: 596.73, y: 97.31), controlPoint2: CGPoint(x: 601.19, y: 97.31))
        bezier24Path.addCurve(to: CGPoint(x: 603.94, y: 110.02), controlPoint1: CGPoint(x: 606.69, y: 102.81), controlPoint2: CGPoint(x: 606.69, y: 107.27))
        bezier24Path.addLine(to: CGPoint(x: 584.02, y: 129.94))
        bezier24Path.addCurve(to: CGPoint(x: 579.04, y: 132), controlPoint1: CGPoint(x: 582.64, y: 131.31), controlPoint2: CGPoint(x: 580.84, y: 132))
        bezier24Path.close()
        bezier24Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier24Path.fill()


        //// Bezier 25 Drawing
        let bezier25Path = UIBezierPath()
        bezier25Path.move(to: CGPoint(x: 808.04, y: 362))
        bezier25Path.addCurve(to: CGPoint(x: 803.06, y: 359.94), controlPoint1: CGPoint(x: 806.24, y: 362), controlPoint2: CGPoint(x: 804.44, y: 361.31))
        bezier25Path.addCurve(to: CGPoint(x: 803.06, y: 349.98), controlPoint1: CGPoint(x: 800.31, y: 357.19), controlPoint2: CGPoint(x: 800.31, y: 352.73))
        bezier25Path.addLine(to: CGPoint(x: 822.98, y: 330.06))
        bezier25Path.addCurve(to: CGPoint(x: 832.94, y: 330.06), controlPoint1: CGPoint(x: 825.73, y: 327.31), controlPoint2: CGPoint(x: 830.19, y: 327.31))
        bezier25Path.addCurve(to: CGPoint(x: 832.94, y: 340.02), controlPoint1: CGPoint(x: 835.69, y: 332.81), controlPoint2: CGPoint(x: 835.69, y: 337.27))
        bezier25Path.addLine(to: CGPoint(x: 813.02, y: 359.94))
        bezier25Path.addCurve(to: CGPoint(x: 808.04, y: 362), controlPoint1: CGPoint(x: 811.65, y: 361.31), controlPoint2: CGPoint(x: 809.84, y: 362))
        bezier25Path.close()
        bezier25Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier25Path.fill()


        //// Bezier 26 Drawing
        let bezier26Path = UIBezierPath()
        bezier26Path.move(to: CGPoint(x: 197.75, y: 683))
        bezier26Path.addCurve(to: CGPoint(x: 192.62, y: 680.89), controlPoint1: CGPoint(x: 195.89, y: 683), controlPoint2: CGPoint(x: 194.04, y: 682.3))
        bezier26Path.addCurve(to: CGPoint(x: 182, y: 655.44), controlPoint1: CGPoint(x: 185.76, y: 674.11), controlPoint2: CGPoint(x: 181.99, y: 665.07))
        bezier26Path.addCurve(to: CGPoint(x: 192.62, y: 630.1), controlPoint1: CGPoint(x: 182.02, y: 645.88), controlPoint2: CGPoint(x: 185.79, y: 636.87))
        bezier26Path.addCurve(to: CGPoint(x: 202.88, y: 630.1), controlPoint1: CGPoint(x: 195.45, y: 627.3), controlPoint2: CGPoint(x: 200.04, y: 627.3))
        bezier26Path.addCurve(to: CGPoint(x: 202.88, y: 640.26), controlPoint1: CGPoint(x: 205.71, y: 632.91), controlPoint2: CGPoint(x: 205.71, y: 637.46))
        bezier26Path.addCurve(to: CGPoint(x: 196.5, y: 655.47), controlPoint1: CGPoint(x: 198.78, y: 644.32), controlPoint2: CGPoint(x: 196.52, y: 649.72))
        bezier26Path.addCurve(to: CGPoint(x: 202.88, y: 670.74), controlPoint1: CGPoint(x: 196.49, y: 661.24), controlPoint2: CGPoint(x: 198.75, y: 666.65))
        bezier26Path.addCurve(to: CGPoint(x: 202.88, y: 680.89), controlPoint1: CGPoint(x: 205.71, y: 673.54), controlPoint2: CGPoint(x: 205.71, y: 678.09))
        bezier26Path.addCurve(to: CGPoint(x: 197.75, y: 683), controlPoint1: CGPoint(x: 201.46, y: 682.3), controlPoint2: CGPoint(x: 199.6, y: 683))
        bezier26Path.close()
        bezier26Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier26Path.fill()


        //// Bezier 27 Drawing
        let bezier27Path = UIBezierPath()
        bezier27Path.move(to: CGPoint(x: 277.5, y: 752))
        bezier27Path.addCurve(to: CGPoint(x: 252.1, y: 741.38), controlPoint1: CGPoint(x: 268.29, y: 752), controlPoint2: CGPoint(x: 259.1, y: 748.46))
        bezier27Path.addCurve(to: CGPoint(x: 252.1, y: 731.13), controlPoint1: CGPoint(x: 249.3, y: 738.55), controlPoint2: CGPoint(x: 249.3, y: 733.96))
        bezier27Path.addCurve(to: CGPoint(x: 262.26, y: 731.13), controlPoint1: CGPoint(x: 254.91, y: 728.29), controlPoint2: CGPoint(x: 259.46, y: 728.29))
        bezier27Path.addCurve(to: CGPoint(x: 292.74, y: 731.13), controlPoint1: CGPoint(x: 270.66, y: 739.6), controlPoint2: CGPoint(x: 284.34, y: 739.6))
        bezier27Path.addCurve(to: CGPoint(x: 302.9, y: 731.13), controlPoint1: CGPoint(x: 295.55, y: 728.29), controlPoint2: CGPoint(x: 300.09, y: 728.29))
        bezier27Path.addCurve(to: CGPoint(x: 302.9, y: 741.38), controlPoint1: CGPoint(x: 305.7, y: 733.96), controlPoint2: CGPoint(x: 305.7, y: 738.55))
        bezier27Path.addCurve(to: CGPoint(x: 277.5, y: 752), controlPoint1: CGPoint(x: 295.89, y: 748.46), controlPoint2: CGPoint(x: 286.69, y: 752))
        bezier27Path.close()
        bezier27Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier27Path.fill()


        //// Bezier 28 Drawing
        let bezier28Path = UIBezierPath()
        bezier28Path.move(to: CGPoint(x: 256.94, y: 743))
        bezier28Path.addCurve(to: CGPoint(x: 251.95, y: 740.93), controlPoint1: CGPoint(x: 255.14, y: 743), controlPoint2: CGPoint(x: 253.33, y: 742.31))
        bezier28Path.addLine(to: CGPoint(x: 192.07, y: 681.05))
        bezier28Path.addCurve(to: CGPoint(x: 192.07, y: 671.07), controlPoint1: CGPoint(x: 189.31, y: 678.29), controlPoint2: CGPoint(x: 189.31, y: 673.82))
        bezier28Path.addCurve(to: CGPoint(x: 202.05, y: 671.07), controlPoint1: CGPoint(x: 194.82, y: 668.31), controlPoint2: CGPoint(x: 199.29, y: 668.31))
        bezier28Path.addLine(to: CGPoint(x: 261.93, y: 730.95))
        bezier28Path.addCurve(to: CGPoint(x: 261.93, y: 740.93), controlPoint1: CGPoint(x: 264.69, y: 733.71), controlPoint2: CGPoint(x: 264.69, y: 738.18))
        bezier28Path.addCurve(to: CGPoint(x: 256.94, y: 743), controlPoint1: CGPoint(x: 260.55, y: 742.31), controlPoint2: CGPoint(x: 258.75, y: 743))
        bezier28Path.close()
        bezier28Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier28Path.fill()


        //// Bezier 29 Drawing
        let bezier29Path = UIBezierPath()
        bezier29Path.move(to: CGPoint(x: 277, y: 648.88))
        bezier29Path.addCurve(to: CGPoint(x: 272.05, y: 650.91), controlPoint1: CGPoint(x: 275.12, y: 648.88), controlPoint2: CGPoint(x: 273.36, y: 649.59))
        bezier29Path.addCurve(to: CGPoint(x: 272.05, y: 660.87), controlPoint1: CGPoint(x: 269.32, y: 653.66), controlPoint2: CGPoint(x: 269.32, y: 658.12))
        bezier29Path.addCurve(to: CGPoint(x: 281.96, y: 660.87), controlPoint1: CGPoint(x: 274.67, y: 663.51), controlPoint2: CGPoint(x: 279.33, y: 663.51))
        bezier29Path.addCurve(to: CGPoint(x: 281.95, y: 650.91), controlPoint1: CGPoint(x: 284.68, y: 658.12), controlPoint2: CGPoint(x: 284.68, y: 653.66))
        bezier29Path.addCurve(to: CGPoint(x: 277, y: 648.88), controlPoint1: CGPoint(x: 280.64, y: 649.59), controlPoint2: CGPoint(x: 278.89, y: 648.88))
        bezier29Path.close()
        bezier29Path.move(to: CGPoint(x: 277, y: 677))
        bezier29Path.addCurve(to: CGPoint(x: 262.14, y: 670.82), controlPoint1: CGPoint(x: 271.37, y: 677), controlPoint2: CGPoint(x: 266.1, y: 674.8))
        bezier29Path.addCurve(to: CGPoint(x: 262.15, y: 640.96), controlPoint1: CGPoint(x: 253.95, y: 662.59), controlPoint2: CGPoint(x: 253.95, y: 649.19))
        bezier29Path.addCurve(to: CGPoint(x: 291.86, y: 640.96), controlPoint1: CGPoint(x: 270.06, y: 633.02), controlPoint2: CGPoint(x: 283.94, y: 633.01))
        bezier29Path.addCurve(to: CGPoint(x: 291.86, y: 670.82), controlPoint1: CGPoint(x: 300.05, y: 649.19), controlPoint2: CGPoint(x: 300.05, y: 662.6))
        bezier29Path.addCurve(to: CGPoint(x: 277, y: 677), controlPoint1: CGPoint(x: 287.89, y: 674.81), controlPoint2: CGPoint(x: 282.62, y: 677))
        bezier29Path.close()
        bezier29Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier29Path.fill()


        //// Bezier 30 Drawing
        let bezier30Path = UIBezierPath()
        bezier30Path.move(to: CGPoint(x: 513.96, y: 447))
        bezier30Path.addCurve(to: CGPoint(x: 508.98, y: 444.94), controlPoint1: CGPoint(x: 512.16, y: 447), controlPoint2: CGPoint(x: 510.36, y: 446.31))
        bezier30Path.addLine(to: CGPoint(x: 489.06, y: 425.02))
        bezier30Path.addCurve(to: CGPoint(x: 489.06, y: 415.06), controlPoint1: CGPoint(x: 486.31, y: 422.27), controlPoint2: CGPoint(x: 486.31, y: 417.81))
        bezier30Path.addCurve(to: CGPoint(x: 499.02, y: 415.06), controlPoint1: CGPoint(x: 491.82, y: 412.31), controlPoint2: CGPoint(x: 496.27, y: 412.31))
        bezier30Path.addLine(to: CGPoint(x: 518.94, y: 434.98))
        bezier30Path.addCurve(to: CGPoint(x: 518.94, y: 444.94), controlPoint1: CGPoint(x: 521.69, y: 437.73), controlPoint2: CGPoint(x: 521.69, y: 442.19))
        bezier30Path.addCurve(to: CGPoint(x: 513.96, y: 447), controlPoint1: CGPoint(x: 517.56, y: 446.31), controlPoint2: CGPoint(x: 515.77, y: 447))
        bezier30Path.close()
        bezier30Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier30Path.fill()


        //// Bezier 31 Drawing
        let bezier31Path = UIBezierPath()
        bezier31Path.move(to: CGPoint(x: 454.06, y: 507))
        bezier31Path.addCurve(to: CGPoint(x: 449.07, y: 504.93), controlPoint1: CGPoint(x: 452.25, y: 507), controlPoint2: CGPoint(x: 450.45, y: 506.31))
        bezier31Path.addCurve(to: CGPoint(x: 449.07, y: 494.95), controlPoint1: CGPoint(x: 446.31, y: 502.17), controlPoint2: CGPoint(x: 446.31, y: 497.71))
        bezier31Path.addLine(to: CGPoint(x: 508.96, y: 435.07))
        bezier31Path.addCurve(to: CGPoint(x: 518.93, y: 435.07), controlPoint1: CGPoint(x: 511.72, y: 432.31), controlPoint2: CGPoint(x: 516.18, y: 432.31))
        bezier31Path.addCurve(to: CGPoint(x: 518.93, y: 445.05), controlPoint1: CGPoint(x: 521.69, y: 437.83), controlPoint2: CGPoint(x: 521.69, y: 442.29))
        bezier31Path.addLine(to: CGPoint(x: 459.05, y: 504.93))
        bezier31Path.addCurve(to: CGPoint(x: 454.06, y: 507), controlPoint1: CGPoint(x: 457.67, y: 506.31), controlPoint2: CGPoint(x: 455.86, y: 507))
        bezier31Path.close()
        bezier31Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier31Path.fill()


        //// Bezier 32 Drawing
        let bezier32Path = UIBezierPath()
        bezier32Path.move(to: CGPoint(x: 452.96, y: 507))
        bezier32Path.addCurve(to: CGPoint(x: 447.98, y: 504.94), controlPoint1: CGPoint(x: 451.16, y: 507), controlPoint2: CGPoint(x: 449.36, y: 506.31))
        bezier32Path.addLine(to: CGPoint(x: 428.06, y: 485.02))
        bezier32Path.addCurve(to: CGPoint(x: 428.06, y: 475.06), controlPoint1: CGPoint(x: 425.31, y: 482.27), controlPoint2: CGPoint(x: 425.31, y: 477.81))
        bezier32Path.addCurve(to: CGPoint(x: 438.02, y: 475.06), controlPoint1: CGPoint(x: 430.81, y: 472.31), controlPoint2: CGPoint(x: 435.27, y: 472.31))
        bezier32Path.addLine(to: CGPoint(x: 457.94, y: 494.98))
        bezier32Path.addCurve(to: CGPoint(x: 457.94, y: 504.94), controlPoint1: CGPoint(x: 460.69, y: 497.73), controlPoint2: CGPoint(x: 460.69, y: 502.19))
        bezier32Path.addCurve(to: CGPoint(x: 452.96, y: 507), controlPoint1: CGPoint(x: 456.56, y: 506.31), controlPoint2: CGPoint(x: 454.76, y: 507))
        bezier32Path.close()
        bezier32Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier32Path.fill()


        //// Bezier 33 Drawing
        let bezier33Path = UIBezierPath()
        bezier33Path.move(to: CGPoint(x: 433.06, y: 487))
        bezier33Path.addCurve(to: CGPoint(x: 428.07, y: 484.93), controlPoint1: CGPoint(x: 431.25, y: 487), controlPoint2: CGPoint(x: 429.45, y: 486.31))
        bezier33Path.addCurve(to: CGPoint(x: 428.07, y: 474.95), controlPoint1: CGPoint(x: 425.31, y: 482.17), controlPoint2: CGPoint(x: 425.31, y: 477.71))
        bezier33Path.addLine(to: CGPoint(x: 487.95, y: 415.07))
        bezier33Path.addCurve(to: CGPoint(x: 497.93, y: 415.07), controlPoint1: CGPoint(x: 490.71, y: 412.31), controlPoint2: CGPoint(x: 495.18, y: 412.31))
        bezier33Path.addCurve(to: CGPoint(x: 497.93, y: 425.05), controlPoint1: CGPoint(x: 500.69, y: 417.82), controlPoint2: CGPoint(x: 500.69, y: 422.29))
        bezier33Path.addLine(to: CGPoint(x: 438.05, y: 484.93))
        bezier33Path.addCurve(to: CGPoint(x: 433.06, y: 487), controlPoint1: CGPoint(x: 436.67, y: 486.31), controlPoint2: CGPoint(x: 434.86, y: 487))
        bezier33Path.close()
        bezier33Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier33Path.fill()


        //// Bezier 34 Drawing
        let bezier34Path = UIBezierPath()
        bezier34Path.move(to: CGPoint(x: 483.13, y: 477.44))
        bezier34Path.addCurve(to: CGPoint(x: 478.13, y: 475.37), controlPoint1: CGPoint(x: 481.32, y: 477.44), controlPoint2: CGPoint(x: 479.51, y: 476.75))
        bezier34Path.addLine(to: CGPoint(x: 458.16, y: 455.38))
        bezier34Path.addCurve(to: CGPoint(x: 458.16, y: 445.38), controlPoint1: CGPoint(x: 455.4, y: 452.61), controlPoint2: CGPoint(x: 455.4, y: 448.14))
        bezier34Path.addCurve(to: CGPoint(x: 468.15, y: 445.38), controlPoint1: CGPoint(x: 460.92, y: 442.61), controlPoint2: CGPoint(x: 465.39, y: 442.61))
        bezier34Path.addLine(to: CGPoint(x: 488.12, y: 465.37))
        bezier34Path.addCurve(to: CGPoint(x: 488.12, y: 475.37), controlPoint1: CGPoint(x: 490.88, y: 468.13), controlPoint2: CGPoint(x: 490.88, y: 472.61))
        bezier34Path.addCurve(to: CGPoint(x: 483.13, y: 477.44), controlPoint1: CGPoint(x: 486.74, y: 476.75), controlPoint2: CGPoint(x: 484.93, y: 477.44))
        bezier34Path.close()
        bezier34Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier34Path.fill()


        //// Bezier 35 Drawing
        let bezier35Path = UIBezierPath()
        bezier35Path.move(to: CGPoint(x: 213.17, y: 952.75))
        bezier35Path.addCurve(to: CGPoint(x: 142.34, y: 923.54), controlPoint1: CGPoint(x: 187.54, y: 952.75), controlPoint2: CGPoint(x: 161.89, y: 943.01))
        bezier35Path.addCurve(to: CGPoint(x: 142.32, y: 781.54), controlPoint1: CGPoint(x: 103.22, y: 884.38), controlPoint2: CGPoint(x: 103.22, y: 820.69))
        bezier35Path.addCurve(to: CGPoint(x: 152.31, y: 781.54), controlPoint1: CGPoint(x: 145.08, y: 778.78), controlPoint2: CGPoint(x: 149.55, y: 778.78))
        bezier35Path.addCurve(to: CGPoint(x: 152.31, y: 791.54), controlPoint1: CGPoint(x: 155.07, y: 784.3), controlPoint2: CGPoint(x: 155.07, y: 788.78))
        bezier35Path.addCurve(to: CGPoint(x: 152.31, y: 913.53), controlPoint1: CGPoint(x: 118.72, y: 825.18), controlPoint2: CGPoint(x: 118.72, y: 879.89))
        bezier35Path.addCurve(to: CGPoint(x: 274.07, y: 913.43), controlPoint1: CGPoint(x: 185.93, y: 947.02), controlPoint2: CGPoint(x: 240.55, y: 946.98))
        bezier35Path.addCurve(to: CGPoint(x: 284.05, y: 913.43), controlPoint1: CGPoint(x: 276.83, y: 910.67), controlPoint2: CGPoint(x: 281.3, y: 910.67))
        bezier35Path.addCurve(to: CGPoint(x: 284.05, y: 923.43), controlPoint1: CGPoint(x: 286.81, y: 916.2), controlPoint2: CGPoint(x: 286.81, y: 920.67))
        bezier35Path.addCurve(to: CGPoint(x: 213.17, y: 952.75), controlPoint1: CGPoint(x: 264.54, y: 942.97), controlPoint2: CGPoint(x: 238.86, y: 952.75))
        bezier35Path.close()
        bezier35Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier35Path.fill()


        //// Bezier 36 Drawing
        let bezier36Path = UIBezierPath()
        bezier36Path.move(to: CGPoint(x: 615.13, y: 773))
        bezier36Path.addCurve(to: CGPoint(x: 610.13, y: 770.93), controlPoint1: CGPoint(x: 613.31, y: 773), controlPoint2: CGPoint(x: 611.51, y: 772.31))
        bezier36Path.addCurve(to: CGPoint(x: 610.13, y: 760.93), controlPoint1: CGPoint(x: 607.37, y: 768.17), controlPoint2: CGPoint(x: 607.37, y: 763.69))
        bezier36Path.addCurve(to: CGPoint(x: 610.13, y: 679.93), controlPoint1: CGPoint(x: 632.44, y: 738.61), controlPoint2: CGPoint(x: 632.44, y: 702.26))
        bezier36Path.addCurve(to: CGPoint(x: 529.06, y: 679.84), controlPoint1: CGPoint(x: 587.74, y: 657.57), controlPoint2: CGPoint(x: 551.4, y: 657.52))
        bezier36Path.addCurve(to: CGPoint(x: 519.07, y: 679.84), controlPoint1: CGPoint(x: 526.3, y: 682.6), controlPoint2: CGPoint(x: 521.83, y: 682.6))
        bezier36Path.addCurve(to: CGPoint(x: 519.07, y: 669.84), controlPoint1: CGPoint(x: 516.31, y: 677.07), controlPoint2: CGPoint(x: 516.31, y: 672.6))
        bezier36Path.addCurve(to: CGPoint(x: 620.13, y: 669.94), controlPoint1: CGPoint(x: 546.91, y: 642.02), controlPoint2: CGPoint(x: 592.24, y: 642.06))
        bezier36Path.addCurve(to: CGPoint(x: 620.13, y: 770.93), controlPoint1: CGPoint(x: 647.96, y: 697.77), controlPoint2: CGPoint(x: 647.96, y: 743.09))
        bezier36Path.addCurve(to: CGPoint(x: 615.13, y: 773), controlPoint1: CGPoint(x: 618.75, y: 772.31), controlPoint2: CGPoint(x: 616.93, y: 773))
        bezier36Path.close()
        bezier36Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier36Path.fill()


        //// Bezier 37 Drawing
        let bezier37Path = UIBezierPath()
        bezier37Path.move(to: CGPoint(x: 174.02, y: 747))
        bezier37Path.addCurve(to: CGPoint(x: 169.06, y: 744.94), controlPoint1: CGPoint(x: 172.22, y: 747), controlPoint2: CGPoint(x: 170.43, y: 746.31))
        bezier37Path.addCurve(to: CGPoint(x: 169.06, y: 735.01), controlPoint1: CGPoint(x: 166.31, y: 742.2), controlPoint2: CGPoint(x: 166.31, y: 737.76))
        bezier37Path.addLine(to: CGPoint(x: 203.02, y: 701.06))
        bezier37Path.addCurve(to: CGPoint(x: 212.94, y: 701.06), controlPoint1: CGPoint(x: 205.76, y: 698.31), controlPoint2: CGPoint(x: 210.2, y: 698.31))
        bezier37Path.addCurve(to: CGPoint(x: 212.94, y: 710.99), controlPoint1: CGPoint(x: 215.69, y: 703.8), controlPoint2: CGPoint(x: 215.69, y: 708.24))
        bezier37Path.addLine(to: CGPoint(x: 178.99, y: 744.94))
        bezier37Path.addCurve(to: CGPoint(x: 174.02, y: 747), controlPoint1: CGPoint(x: 177.61, y: 746.32), controlPoint2: CGPoint(x: 175.82, y: 747))
        bezier37Path.close()
        bezier37Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier37Path.fill()


        //// Bezier 38 Drawing
        let bezier38Path = UIBezierPath()
        bezier38Path.move(to: CGPoint(x: 193.02, y: 767))
        bezier38Path.addCurve(to: CGPoint(x: 188.06, y: 764.94), controlPoint1: CGPoint(x: 191.23, y: 767), controlPoint2: CGPoint(x: 189.43, y: 766.31))
        bezier38Path.addCurve(to: CGPoint(x: 188.06, y: 755.01), controlPoint1: CGPoint(x: 185.31, y: 762.2), controlPoint2: CGPoint(x: 185.31, y: 757.76))
        bezier38Path.addLine(to: CGPoint(x: 222.02, y: 721.06))
        bezier38Path.addCurve(to: CGPoint(x: 231.94, y: 721.06), controlPoint1: CGPoint(x: 224.76, y: 718.31), controlPoint2: CGPoint(x: 229.2, y: 718.31))
        bezier38Path.addCurve(to: CGPoint(x: 231.94, y: 730.99), controlPoint1: CGPoint(x: 234.69, y: 723.8), controlPoint2: CGPoint(x: 234.69, y: 728.24))
        bezier38Path.addLine(to: CGPoint(x: 197.99, y: 764.94))
        bezier38Path.addCurve(to: CGPoint(x: 193.02, y: 767), controlPoint1: CGPoint(x: 196.61, y: 766.31), controlPoint2: CGPoint(x: 194.82, y: 767))
        bezier38Path.close()
        bezier38Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier38Path.fill()


        //// Bezier 39 Drawing
        let bezier39Path = UIBezierPath()
        bezier39Path.move(to: CGPoint(x: 193.96, y: 767))
        bezier39Path.addCurve(to: CGPoint(x: 188.98, y: 764.94), controlPoint1: CGPoint(x: 192.16, y: 767), controlPoint2: CGPoint(x: 190.35, y: 766.31))
        bezier39Path.addLine(to: CGPoint(x: 169.06, y: 745.02))
        bezier39Path.addCurve(to: CGPoint(x: 169.06, y: 735.06), controlPoint1: CGPoint(x: 166.31, y: 742.27), controlPoint2: CGPoint(x: 166.31, y: 737.81))
        bezier39Path.addCurve(to: CGPoint(x: 179.02, y: 735.06), controlPoint1: CGPoint(x: 171.81, y: 732.31), controlPoint2: CGPoint(x: 176.27, y: 732.31))
        bezier39Path.addLine(to: CGPoint(x: 198.94, y: 754.98))
        bezier39Path.addCurve(to: CGPoint(x: 198.94, y: 764.94), controlPoint1: CGPoint(x: 201.69, y: 757.73), controlPoint2: CGPoint(x: 201.69, y: 762.19))
        bezier39Path.addCurve(to: CGPoint(x: 193.96, y: 767), controlPoint1: CGPoint(x: 197.56, y: 766.31), controlPoint2: CGPoint(x: 195.76, y: 767))
        bezier39Path.close()
        bezier39Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier39Path.fill()


        //// Bezier 40 Drawing
        let bezier40Path = UIBezierPath()
        bezier40Path.move(to: CGPoint(x: 147.16, y: 793))
        bezier40Path.addCurve(to: CGPoint(x: 142.1, y: 790.9), controlPoint1: CGPoint(x: 145.33, y: 793), controlPoint2: CGPoint(x: 143.5, y: 792.3))
        bezier40Path.addCurve(to: CGPoint(x: 142.1, y: 780.77), controlPoint1: CGPoint(x: 139.3, y: 788.1), controlPoint2: CGPoint(x: 139.3, y: 783.57))
        bezier40Path.addLine(to: CGPoint(x: 178.77, y: 744.1))
        bezier40Path.addCurve(to: CGPoint(x: 188.9, y: 744.1), controlPoint1: CGPoint(x: 181.57, y: 741.3), controlPoint2: CGPoint(x: 186.1, y: 741.3))
        bezier40Path.addCurve(to: CGPoint(x: 188.9, y: 754.23), controlPoint1: CGPoint(x: 191.7, y: 746.9), controlPoint2: CGPoint(x: 191.7, y: 751.43))
        bezier40Path.addLine(to: CGPoint(x: 152.23, y: 790.9))
        bezier40Path.addCurve(to: CGPoint(x: 147.16, y: 793), controlPoint1: CGPoint(x: 150.83, y: 792.3), controlPoint2: CGPoint(x: 149, y: 793))
        bezier40Path.close()
        bezier40Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier40Path.fill()


        //// Bezier 41 Drawing
        let bezier41Path = UIBezierPath()
        bezier41Path.move(to: CGPoint(x: 280.08, y: 925))
        bezier41Path.addCurve(to: CGPoint(x: 275.07, y: 922.92), controlPoint1: CGPoint(x: 278.27, y: 925), controlPoint2: CGPoint(x: 276.46, y: 924.31))
        bezier41Path.addCurve(to: CGPoint(x: 275.07, y: 912.91), controlPoint1: CGPoint(x: 272.31, y: 920.16), controlPoint2: CGPoint(x: 272.31, y: 915.68))
        bezier41Path.addLine(to: CGPoint(x: 518.91, y: 669.07))
        bezier41Path.addCurve(to: CGPoint(x: 528.93, y: 669.07), controlPoint1: CGPoint(x: 521.68, y: 666.31), controlPoint2: CGPoint(x: 526.16, y: 666.31))
        bezier41Path.addCurve(to: CGPoint(x: 528.93, y: 679.09), controlPoint1: CGPoint(x: 531.69, y: 671.84), controlPoint2: CGPoint(x: 531.69, y: 676.32))
        bezier41Path.addLine(to: CGPoint(x: 285.09, y: 922.92))
        bezier41Path.addCurve(to: CGPoint(x: 280.08, y: 925), controlPoint1: CGPoint(x: 283.71, y: 924.31), controlPoint2: CGPoint(x: 281.89, y: 925))
        bezier41Path.close()
        bezier41Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier41Path.fill()


        //// Bezier 42 Drawing
        let bezier42Path = UIBezierPath()
        bezier42Path.move(to: CGPoint(x: 434.09, y: 953))
        bezier42Path.addCurve(to: CGPoint(x: 429.08, y: 950.92), controlPoint1: CGPoint(x: 432.27, y: 953), controlPoint2: CGPoint(x: 430.46, y: 952.31))
        bezier42Path.addCurve(to: CGPoint(x: 429.08, y: 940.9), controlPoint1: CGPoint(x: 426.31, y: 948.15), controlPoint2: CGPoint(x: 426.31, y: 943.67))
        bezier42Path.addLine(to: CGPoint(x: 609.9, y: 760.08))
        bezier42Path.addCurve(to: CGPoint(x: 619.92, y: 760.08), controlPoint1: CGPoint(x: 612.67, y: 757.31), controlPoint2: CGPoint(x: 617.16, y: 757.31))
        bezier42Path.addCurve(to: CGPoint(x: 619.92, y: 770.1), controlPoint1: CGPoint(x: 622.69, y: 762.85), controlPoint2: CGPoint(x: 622.69, y: 767.33))
        bezier42Path.addLine(to: CGPoint(x: 439.1, y: 950.92))
        bezier42Path.addCurve(to: CGPoint(x: 434.09, y: 953), controlPoint1: CGPoint(x: 437.71, y: 952.31), controlPoint2: CGPoint(x: 435.9, y: 953))
        bezier42Path.close()
        bezier42Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier42Path.fill()
        
        context.restoreGState()

    }

    @objc dynamic public class func drawBook(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 1000, height: 1000), resizing: ResizingBehavior = .aspectFit, white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), light: UIColor = UIColor(red: 0.769, green: 0.847, blue: 0.984, alpha: 1.000), medium: UIColor = UIColor(red: 0.478, green: 0.663, blue: 0.973, alpha: 1.000), dark: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 1000, height: 1000), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 1000, y: resizedFrame.height / 1000)


        //// Group 2
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 923.51, y: 203.67))
        bezierPath.addCurve(to: CGPoint(x: 895.71, y: 203.67), controlPoint1: CGPoint(x: 915.73, y: 203.67), controlPoint2: CGPoint(x: 895.71, y: 203.67))
        bezierPath.addLine(to: CGPoint(x: 881.81, y: 203.67))
        bezierPath.addLine(to: CGPoint(x: 881.81, y: 772.75))
        bezierPath.addCurve(to: CGPoint(x: 522.23, y: 788.43), controlPoint1: CGPoint(x: 881.81, y: 772.75), controlPoint2: CGPoint(x: 608.12, y: 761.78))
        bezierPath.addCurve(to: CGPoint(x: 499.57, y: 800.51), controlPoint1: CGPoint(x: 511.39, y: 791.9), controlPoint2: CGPoint(x: 503.46, y: 795.79))
        bezierPath.addCurve(to: CGPoint(x: 117.33, y: 772.75), controlPoint1: CGPoint(x: 464.82, y: 758.87), controlPoint2: CGPoint(x: 117.33, y: 772.75))
        bezierPath.addLine(to: CGPoint(x: 117.33, y: 203.67))
        bezierPath.addLine(to: CGPoint(x: 103.43, y: 203.67))
        bezierPath.addCurve(to: CGPoint(x: 75.64, y: 203.67), controlPoint1: CGPoint(x: 103.43, y: 203.67), controlPoint2: CGPoint(x: 83.42, y: 203.67))
        bezierPath.addCurve(to: CGPoint(x: 61.74, y: 217.55), controlPoint1: CGPoint(x: 67.85, y: 203.67), controlPoint2: CGPoint(x: 61.74, y: 209.78))
        bezierPath.addCurve(to: CGPoint(x: 61.74, y: 231.43), controlPoint1: CGPoint(x: 61.74, y: 225.33), controlPoint2: CGPoint(x: 61.74, y: 231.43))
        bezierPath.addLine(to: CGPoint(x: 61.74, y: 800.51))
        bezierPath.addCurve(to: CGPoint(x: 75.64, y: 814.39), controlPoint1: CGPoint(x: 61.74, y: 808.14), controlPoint2: CGPoint(x: 67.99, y: 814.39))
        bezierPath.addLine(to: CGPoint(x: 452.45, y: 814.39))
        bezierPath.addCurve(to: CGPoint(x: 498.6, y: 828.27), controlPoint1: CGPoint(x: 452.45, y: 814.39), controlPoint2: CGPoint(x: 478.59, y: 827.85))
        bezierPath.addCurve(to: CGPoint(x: 499.57, y: 828.27), controlPoint1: CGPoint(x: 498.88, y: 828.27), controlPoint2: CGPoint(x: 499.29, y: 828.27))
        bezierPath.addCurve(to: CGPoint(x: 546.69, y: 814.39), controlPoint1: CGPoint(x: 519.73, y: 828.27), controlPoint2: CGPoint(x: 546.69, y: 814.39))
        bezierPath.addLine(to: CGPoint(x: 923.51, y: 814.39))
        bezierPath.addCurve(to: CGPoint(x: 937.41, y: 800.51), controlPoint1: CGPoint(x: 931.15, y: 814.39), controlPoint2: CGPoint(x: 937.41, y: 808.14))
        bezierPath.addLine(to: CGPoint(x: 937.41, y: 231.43))
        bezierPath.addCurve(to: CGPoint(x: 937.41, y: 217.55), controlPoint1: CGPoint(x: 937.41, y: 231.43), controlPoint2: CGPoint(x: 937.41, y: 225.33))
        bezierPath.addCurve(to: CGPoint(x: 923.51, y: 203.67), controlPoint1: CGPoint(x: 937.41, y: 209.78), controlPoint2: CGPoint(x: 931.29, y: 203.67))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        medium.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 548.22, y: 509.03))
        bezier2Path.addLine(to: CGPoint(x: 826.21, y: 509.03))
        bezier2Path.addLine(to: CGPoint(x: 826.21, y: 273.08))
        bezier2Path.addLine(to: CGPoint(x: 548.22, y: 273.08))
        bezier2Path.addLine(to: CGPoint(x: 548.22, y: 509.03))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: 172.93, y: 509.03))
        bezier2Path.addLine(to: CGPoint(x: 450.92, y: 509.03))
        bezier2Path.addLine(to: CGPoint(x: 450.92, y: 273.08))
        bezier2Path.addLine(to: CGPoint(x: 172.93, y: 273.08))
        bezier2Path.addLine(to: CGPoint(x: 172.93, y: 509.03))
        bezier2Path.close()
        bezier2Path.move(to: CGPoint(x: 499.57, y: 203.67))
        bezier2Path.addCurve(to: CGPoint(x: 117.33, y: 175.91), controlPoint1: CGPoint(x: 464.82, y: 162.04), controlPoint2: CGPoint(x: 117.33, y: 175.91))
        bezier2Path.addLine(to: CGPoint(x: 117.33, y: 772.75))
        bezier2Path.addCurve(to: CGPoint(x: 499.57, y: 800.51), controlPoint1: CGPoint(x: 117.33, y: 772.75), controlPoint2: CGPoint(x: 464.82, y: 758.87))
        bezier2Path.addCurve(to: CGPoint(x: 522.22, y: 788.43), controlPoint1: CGPoint(x: 503.46, y: 795.79), controlPoint2: CGPoint(x: 511.39, y: 791.9))
        bezier2Path.addCurve(to: CGPoint(x: 881.81, y: 772.75), controlPoint1: CGPoint(x: 608.12, y: 761.78), controlPoint2: CGPoint(x: 881.81, y: 772.75))
        bezier2Path.addLine(to: CGPoint(x: 881.81, y: 175.91))
        bezier2Path.addCurve(to: CGPoint(x: 499.57, y: 203.67), controlPoint1: CGPoint(x: 881.81, y: 175.91), controlPoint2: CGPoint(x: 534.32, y: 162.04))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        white.setFill()
        bezier2Path.fill()


        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 548, y: 273, width: 278, height: 236))
        white.setFill()
        rectanglePath.fill()


        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: 548, y: 273, width: 278, height: 167))
        light.setFill()
        rectangle2Path.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 687.5, y: 328))
        bezier3Path.addLine(to: CGPoint(x: 632, y: 372.45))
        bezier3Path.addLine(to: CGPoint(x: 632, y: 453))
        bezier3Path.addLine(to: CGPoint(x: 743, y: 453))
        bezier3Path.addLine(to: CGPoint(x: 743, y: 372.45))
        bezier3Path.addLine(to: CGPoint(x: 687.5, y: 328))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier3Path.fill()


        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 632, y: 373.16))
        bezier4Path.addLine(to: CGPoint(x: 632, y: 454))
        bezier4Path.addLine(to: CGPoint(x: 646, y: 454))
        bezier4Path.addLine(to: CGPoint(x: 646, y: 362))
        bezier4Path.addLine(to: CGPoint(x: 632, y: 373.16))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier4Path.fill()


        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: 173, y: 273, width: 278, height: 236))
        light.setFill()
        rectangle3Path.fill()


        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 368, y: 388.3))
        bezier5Path.addLine(to: CGPoint(x: 312.5, y: 342))
        bezier5Path.addLine(to: CGPoint(x: 257, y: 388.3))
        bezier5Path.addLine(to: CGPoint(x: 257, y: 467))
        bezier5Path.addLine(to: CGPoint(x: 368, y: 467))
        bezier5Path.addLine(to: CGPoint(x: 368, y: 388.3))
        bezier5Path.close()
        bezier5Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier5Path.fill()


        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 256, y: 388.54))
        bezier6Path.addLine(to: CGPoint(x: 256, y: 467))
        bezier6Path.addLine(to: CGPoint(x: 270, y: 467))
        bezier6Path.addLine(to: CGPoint(x: 270, y: 377))
        bezier6Path.addLine(to: CGPoint(x: 256, y: 388.54))
        bezier6Path.close()
        bezier6Path.usesEvenOddFillRule = true
        light.setFill()
        bezier6Path.fill()


        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 312.5, y: 315))
        bezier7Path.addLine(to: CGPoint(x: 229, y: 384.29))
        bezier7Path.addLine(to: CGPoint(x: 229, y: 412))
        bezier7Path.addLine(to: CGPoint(x: 312.5, y: 342.71))
        bezier7Path.addLine(to: CGPoint(x: 396, y: 412))
        bezier7Path.addLine(to: CGPoint(x: 396, y: 384.29))
        bezier7Path.addLine(to: CGPoint(x: 312.5, y: 315))
        bezier7Path.close()
        bezier7Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier7Path.fill()


        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 118, y: 780))
        bezier8Path.addCurve(to: CGPoint(x: 111, y: 773.06), controlPoint1: CGPoint(x: 114.13, y: 780), controlPoint2: CGPoint(x: 111, y: 776.89))
        bezier8Path.addLine(to: CGPoint(x: 111, y: 175.94))
        bezier8Path.addCurve(to: CGPoint(x: 118, y: 169), controlPoint1: CGPoint(x: 111, y: 172.11), controlPoint2: CGPoint(x: 114.13, y: 169))
        bezier8Path.addCurve(to: CGPoint(x: 125, y: 175.94), controlPoint1: CGPoint(x: 121.87, y: 169), controlPoint2: CGPoint(x: 125, y: 172.11))
        bezier8Path.addLine(to: CGPoint(x: 125, y: 773.06))
        bezier8Path.addCurve(to: CGPoint(x: 118, y: 780), controlPoint1: CGPoint(x: 125, y: 776.89), controlPoint2: CGPoint(x: 121.87, y: 780))
        bezier8Path.close()
        bezier8Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier8Path.fill()


        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 499.75, y: 807.28))
        bezier9Path.addCurve(to: CGPoint(x: 494.41, y: 804.79), controlPoint1: CGPoint(x: 497.76, y: 807.28), controlPoint2: CGPoint(x: 495.79, y: 806.43))
        bezier9Path.addCurve(to: CGPoint(x: 117.82, y: 779.51), controlPoint1: CGPoint(x: 470.53, y: 776.16), controlPoint2: CGPoint(x: 256.1, y: 774))
        bezier9Path.addCurve(to: CGPoint(x: 110.6, y: 772.86), controlPoint1: CGPoint(x: 113.96, y: 779.58), controlPoint2: CGPoint(x: 110.75, y: 776.69))
        bezier9Path.addCurve(to: CGPoint(x: 117.26, y: 765.65), controlPoint1: CGPoint(x: 110.44, y: 769.04), controlPoint2: CGPoint(x: 113.43, y: 765.8))
        bezier9Path.addCurve(to: CGPoint(x: 505.09, y: 795.9), controlPoint1: CGPoint(x: 153.17, y: 764.23), controlPoint2: CGPoint(x: 469.18, y: 752.88))
        bezier9Path.addCurve(to: CGPoint(x: 504.2, y: 805.67), controlPoint1: CGPoint(x: 507.55, y: 798.84), controlPoint2: CGPoint(x: 507.15, y: 803.22))
        bezier9Path.addCurve(to: CGPoint(x: 499.75, y: 807.28), controlPoint1: CGPoint(x: 502.9, y: 806.75), controlPoint2: CGPoint(x: 501.32, y: 807.28))
        bezier9Path.close()
        bezier9Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier9Path.fill()


        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 499.75, y: 210.55))
        bezier10Path.addCurve(to: CGPoint(x: 494.41, y: 208.06), controlPoint1: CGPoint(x: 497.76, y: 210.55), controlPoint2: CGPoint(x: 495.79, y: 209.71))
        bezier10Path.addCurve(to: CGPoint(x: 117.82, y: 182.79), controlPoint1: CGPoint(x: 470.53, y: 179.43), controlPoint2: CGPoint(x: 256.1, y: 177.27))
        bezier10Path.addCurve(to: CGPoint(x: 110.6, y: 176.14), controlPoint1: CGPoint(x: 113.96, y: 183.01), controlPoint2: CGPoint(x: 110.75, y: 179.96))
        bezier10Path.addCurve(to: CGPoint(x: 117.26, y: 168.93), controlPoint1: CGPoint(x: 110.44, y: 172.31), controlPoint2: CGPoint(x: 113.43, y: 169.08))
        bezier10Path.addCurve(to: CGPoint(x: 505.09, y: 199.17), controlPoint1: CGPoint(x: 153.17, y: 167.48), controlPoint2: CGPoint(x: 469.18, y: 156.16))
        bezier10Path.addCurve(to: CGPoint(x: 504.2, y: 208.95), controlPoint1: CGPoint(x: 507.55, y: 202.12), controlPoint2: CGPoint(x: 507.15, y: 206.49))
        bezier10Path.addCurve(to: CGPoint(x: 499.75, y: 210.55), controlPoint1: CGPoint(x: 502.9, y: 210.02), controlPoint2: CGPoint(x: 501.32, y: 210.55))
        bezier10Path.close()
        bezier10Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier10Path.fill()


        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        bezier11Path.move(to: CGPoint(x: 61.95, y: 807.28))
        bezier11Path.addCurve(to: CGPoint(x: 55, y: 800.35), controlPoint1: CGPoint(x: 58.11, y: 807.28), controlPoint2: CGPoint(x: 55, y: 804.18))
        bezier11Path.addLine(to: CGPoint(x: 55, y: 231.37))
        bezier11Path.addCurve(to: CGPoint(x: 61.95, y: 224.43), controlPoint1: CGPoint(x: 55, y: 227.53), controlPoint2: CGPoint(x: 58.11, y: 224.43))
        bezier11Path.addCurve(to: CGPoint(x: 68.9, y: 231.37), controlPoint1: CGPoint(x: 65.79, y: 224.43), controlPoint2: CGPoint(x: 68.9, y: 227.53))
        bezier11Path.addLine(to: CGPoint(x: 68.9, y: 800.35))
        bezier11Path.addCurve(to: CGPoint(x: 61.95, y: 807.28), controlPoint1: CGPoint(x: 68.9, y: 804.18), controlPoint2: CGPoint(x: 65.79, y: 807.28))
        bezier11Path.close()
        bezier11Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier11Path.fill()


        //// Bezier 12 Drawing
        let bezier12Path = UIBezierPath()
        bezier12Path.move(to: CGPoint(x: 499.54, y: 835))
        bezier12Path.addCurve(to: CGPoint(x: 450.82, y: 821), controlPoint1: CGPoint(x: 479.86, y: 834.6), controlPoint2: CGPoint(x: 456.98, y: 824.02))
        bezier12Path.addLine(to: CGPoint(x: 75.95, y: 821))
        bezier12Path.addCurve(to: CGPoint(x: 69, y: 814), controlPoint1: CGPoint(x: 72.11, y: 821), controlPoint2: CGPoint(x: 69, y: 817.87))
        bezier12Path.addCurve(to: CGPoint(x: 75.95, y: 807), controlPoint1: CGPoint(x: 69, y: 810.13), controlPoint2: CGPoint(x: 72.11, y: 807))
        bezier12Path.addLine(to: CGPoint(x: 452.46, y: 807))
        bezier12Path.addCurve(to: CGPoint(x: 455.64, y: 807.78), controlPoint1: CGPoint(x: 453.56, y: 807), controlPoint2: CGPoint(x: 454.66, y: 807.26))
        bezier12Path.addCurve(to: CGPoint(x: 498.72, y: 821), controlPoint1: CGPoint(x: 455.89, y: 807.9), controlPoint2: CGPoint(x: 480.59, y: 820.62))
        bezier12Path.addCurve(to: CGPoint(x: 506, y: 828.07), controlPoint1: CGPoint(x: 502.52, y: 821.08), controlPoint2: CGPoint(x: 506.04, y: 824.23))
        bezier12Path.addCurve(to: CGPoint(x: 499.54, y: 835), controlPoint1: CGPoint(x: 505.96, y: 831.91), controlPoint2: CGPoint(x: 503.35, y: 835))
        bezier12Path.close()
        bezier12Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier12Path.fill()


        //// Bezier 13 Drawing
        let bezier13Path = UIBezierPath()
        bezier13Path.move(to: CGPoint(x: 499.75, y: 765.73))
        bezier13Path.addCurve(to: CGPoint(x: 492.8, y: 758.79), controlPoint1: CGPoint(x: 495.91, y: 765.73), controlPoint2: CGPoint(x: 492.8, y: 762.63))
        bezier13Path.addLine(to: CGPoint(x: 492.8, y: 231.14))
        bezier13Path.addCurve(to: CGPoint(x: 499.75, y: 224.2), controlPoint1: CGPoint(x: 492.8, y: 227.3), controlPoint2: CGPoint(x: 495.91, y: 224.2))
        bezier13Path.addCurve(to: CGPoint(x: 506.7, y: 231.14), controlPoint1: CGPoint(x: 503.59, y: 224.2), controlPoint2: CGPoint(x: 506.7, y: 227.3))
        bezier13Path.addLine(to: CGPoint(x: 506.7, y: 758.79))
        bezier13Path.addCurve(to: CGPoint(x: 499.75, y: 765.73), controlPoint1: CGPoint(x: 506.7, y: 762.63), controlPoint2: CGPoint(x: 503.59, y: 765.73))
        bezier13Path.close()
        bezier13Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier13Path.fill()


        //// Bezier 14 Drawing
        let bezier14Path = UIBezierPath()
        bezier14Path.move(to: CGPoint(x: 61.95, y: 238.09))
        bezier14Path.addCurve(to: CGPoint(x: 55, y: 231.14), controlPoint1: CGPoint(x: 58.11, y: 238.09), controlPoint2: CGPoint(x: 55, y: 234.98))
        bezier14Path.addLine(to: CGPoint(x: 55, y: 217.26))
        bezier14Path.addCurve(to: CGPoint(x: 75.85, y: 196.43), controlPoint1: CGPoint(x: 55, y: 205.58), controlPoint2: CGPoint(x: 64.15, y: 196.43))
        bezier14Path.addLine(to: CGPoint(x: 103.64, y: 196.43))
        bezier14Path.addCurve(to: CGPoint(x: 110.59, y: 203.37), controlPoint1: CGPoint(x: 107.48, y: 196.43), controlPoint2: CGPoint(x: 110.59, y: 199.53))
        bezier14Path.addCurve(to: CGPoint(x: 103.64, y: 210.32), controlPoint1: CGPoint(x: 110.59, y: 207.21), controlPoint2: CGPoint(x: 107.48, y: 210.32))
        bezier14Path.addLine(to: CGPoint(x: 75.85, y: 210.32))
        bezier14Path.addCurve(to: CGPoint(x: 68.9, y: 217.26), controlPoint1: CGPoint(x: 71.88, y: 210.32), controlPoint2: CGPoint(x: 68.9, y: 213.3))
        bezier14Path.addLine(to: CGPoint(x: 68.9, y: 231.14))
        bezier14Path.addCurve(to: CGPoint(x: 61.95, y: 238.09), controlPoint1: CGPoint(x: 68.9, y: 234.98), controlPoint2: CGPoint(x: 65.79, y: 238.09))
        bezier14Path.close()
        bezier14Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier14Path.fill()


        //// Bezier 15 Drawing
        let bezier15Path = UIBezierPath()
        bezier15Path.move(to: CGPoint(x: 75.85, y: 821.27))
        bezier15Path.addCurve(to: CGPoint(x: 55, y: 800.45), controlPoint1: CGPoint(x: 64.35, y: 821.27), controlPoint2: CGPoint(x: 55, y: 811.93))
        bezier15Path.addCurve(to: CGPoint(x: 61.95, y: 793.5), controlPoint1: CGPoint(x: 55, y: 796.61), controlPoint2: CGPoint(x: 58.11, y: 793.5))
        bezier15Path.addCurve(to: CGPoint(x: 68.9, y: 800.45), controlPoint1: CGPoint(x: 65.79, y: 793.5), controlPoint2: CGPoint(x: 68.9, y: 796.61))
        bezier15Path.addCurve(to: CGPoint(x: 75.85, y: 807.39), controlPoint1: CGPoint(x: 68.9, y: 804.27), controlPoint2: CGPoint(x: 72.01, y: 807.39))
        bezier15Path.addCurve(to: CGPoint(x: 82.8, y: 814.33), controlPoint1: CGPoint(x: 79.69, y: 807.39), controlPoint2: CGPoint(x: 82.8, y: 810.49))
        bezier15Path.addCurve(to: CGPoint(x: 75.85, y: 821.27), controlPoint1: CGPoint(x: 82.8, y: 818.17), controlPoint2: CGPoint(x: 79.69, y: 821.27))
        bezier15Path.close()
        bezier15Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier15Path.fill()


        //// Bezier 16 Drawing
        let bezier16Path = UIBezierPath()
        bezier16Path.move(to: CGPoint(x: 882, y: 780))
        bezier16Path.addCurve(to: CGPoint(x: 875, y: 773.06), controlPoint1: CGPoint(x: 878.13, y: 780), controlPoint2: CGPoint(x: 875, y: 776.89))
        bezier16Path.addLine(to: CGPoint(x: 875, y: 175.94))
        bezier16Path.addCurve(to: CGPoint(x: 882, y: 169), controlPoint1: CGPoint(x: 875, y: 172.11), controlPoint2: CGPoint(x: 878.13, y: 169))
        bezier16Path.addCurve(to: CGPoint(x: 889, y: 175.94), controlPoint1: CGPoint(x: 885.87, y: 169), controlPoint2: CGPoint(x: 889, y: 172.11))
        bezier16Path.addLine(to: CGPoint(x: 889, y: 773.06))
        bezier16Path.addCurve(to: CGPoint(x: 882, y: 780), controlPoint1: CGPoint(x: 889, y: 776.89), controlPoint2: CGPoint(x: 885.87, y: 780))
        bezier16Path.close()
        bezier16Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier16Path.fill()


        //// Bezier 17 Drawing
        let bezier17Path = UIBezierPath()
        bezier17Path.move(to: CGPoint(x: 499.38, y: 807.28))
        bezier17Path.addCurve(to: CGPoint(x: 494.97, y: 805.7), controlPoint1: CGPoint(x: 497.83, y: 807.28), controlPoint2: CGPoint(x: 496.27, y: 806.77))
        bezier17Path.addCurve(to: CGPoint(x: 494.02, y: 795.93), controlPoint1: CGPoint(x: 492.02, y: 803.26), controlPoint2: CGPoint(x: 491.59, y: 798.89))
        bezier17Path.addCurve(to: CGPoint(x: 519.92, y: 781.65), controlPoint1: CGPoint(x: 498.6, y: 790.38), controlPoint2: CGPoint(x: 506.83, y: 785.86))
        bezier17Path.addCurve(to: CGPoint(x: 881.78, y: 765.65), controlPoint1: CGPoint(x: 605.99, y: 754.96), controlPoint2: CGPoint(x: 870.57, y: 765.22))
        bezier17Path.addCurve(to: CGPoint(x: 888.44, y: 772.86), controlPoint1: CGPoint(x: 885.6, y: 765.8), controlPoint2: CGPoint(x: 888.59, y: 769.04))
        bezier17Path.addCurve(to: CGPoint(x: 881.21, y: 779.51), controlPoint1: CGPoint(x: 888.29, y: 776.69), controlPoint2: CGPoint(x: 885.14, y: 779.88))
        bezier17Path.addCurve(to: CGPoint(x: 524.1, y: 794.89), controlPoint1: CGPoint(x: 878.48, y: 779.41), controlPoint2: CGPoint(x: 607.83, y: 768.92))
        bezier17Path.addCurve(to: CGPoint(x: 504.76, y: 804.75), controlPoint1: CGPoint(x: 511.51, y: 798.92), controlPoint2: CGPoint(x: 506.62, y: 802.48))
        bezier17Path.addCurve(to: CGPoint(x: 499.38, y: 807.28), controlPoint1: CGPoint(x: 503.38, y: 806.41), controlPoint2: CGPoint(x: 501.39, y: 807.28))
        bezier17Path.close()
        bezier17Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier17Path.fill()


        //// Bezier 18 Drawing
        let bezier18Path = UIBezierPath()
        bezier18Path.move(to: CGPoint(x: 499.38, y: 210.55))
        bezier18Path.addCurve(to: CGPoint(x: 494.94, y: 208.95), controlPoint1: CGPoint(x: 497.82, y: 210.55), controlPoint2: CGPoint(x: 496.24, y: 210.02))
        bezier18Path.addCurve(to: CGPoint(x: 494.05, y: 199.17), controlPoint1: CGPoint(x: 492, y: 206.49), controlPoint2: CGPoint(x: 491.59, y: 202.12))
        bezier18Path.addCurve(to: CGPoint(x: 881.76, y: 168.93), controlPoint1: CGPoint(x: 529.93, y: 156.15), controlPoint2: CGPoint(x: 845.87, y: 167.48))
        bezier18Path.addCurve(to: CGPoint(x: 888.44, y: 176.14), controlPoint1: CGPoint(x: 885.6, y: 169.08), controlPoint2: CGPoint(x: 888.59, y: 172.31))
        bezier18Path.addCurve(to: CGPoint(x: 881.22, y: 182.79), controlPoint1: CGPoint(x: 888.29, y: 179.97), controlPoint2: CGPoint(x: 885.14, y: 183.09))
        bezier18Path.addCurve(to: CGPoint(x: 504.73, y: 208.06), controlPoint1: CGPoint(x: 742.94, y: 177.27), controlPoint2: CGPoint(x: 528.6, y: 179.44))
        bezier18Path.addCurve(to: CGPoint(x: 499.38, y: 210.55), controlPoint1: CGPoint(x: 503.35, y: 209.71), controlPoint2: CGPoint(x: 501.38, y: 210.55))
        bezier18Path.close()
        bezier18Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier18Path.fill()


        //// Bezier 19 Drawing
        let bezier19Path = UIBezierPath()
        bezier19Path.move(to: CGPoint(x: 937, y: 807))
        bezier19Path.addCurve(to: CGPoint(x: 930, y: 800.06), controlPoint1: CGPoint(x: 933.13, y: 807), controlPoint2: CGPoint(x: 930, y: 803.9))
        bezier19Path.addLine(to: CGPoint(x: 930, y: 230.94))
        bezier19Path.addCurve(to: CGPoint(x: 937, y: 224), controlPoint1: CGPoint(x: 930, y: 227.1), controlPoint2: CGPoint(x: 933.13, y: 224))
        bezier19Path.addCurve(to: CGPoint(x: 944, y: 230.94), controlPoint1: CGPoint(x: 940.87, y: 224), controlPoint2: CGPoint(x: 944, y: 227.1))
        bezier19Path.addLine(to: CGPoint(x: 944, y: 800.06))
        bezier19Path.addCurve(to: CGPoint(x: 937, y: 807), controlPoint1: CGPoint(x: 944, y: 803.9), controlPoint2: CGPoint(x: 940.87, y: 807))
        bezier19Path.close()
        bezier19Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier19Path.fill()


        //// Bezier 20 Drawing
        let bezier20Path = UIBezierPath()
        bezier20Path.move(to: CGPoint(x: 499.95, y: 835))
        bezier20Path.addCurve(to: CGPoint(x: 493, y: 828), controlPoint1: CGPoint(x: 496.11, y: 835), controlPoint2: CGPoint(x: 493, y: 831.87))
        bezier20Path.addCurve(to: CGPoint(x: 499.95, y: 821), controlPoint1: CGPoint(x: 493, y: 824.13), controlPoint2: CGPoint(x: 496.11, y: 821))
        bezier20Path.addCurve(to: CGPoint(x: 543.89, y: 807.78), controlPoint1: CGPoint(x: 518.22, y: 821), controlPoint2: CGPoint(x: 543.65, y: 807.9))
        bezier20Path.addCurve(to: CGPoint(x: 547.09, y: 807), controlPoint1: CGPoint(x: 544.88, y: 807.26), controlPoint2: CGPoint(x: 545.97, y: 807))
        bezier20Path.addLine(to: CGPoint(x: 924.05, y: 807))
        bezier20Path.addCurve(to: CGPoint(x: 931, y: 814), controlPoint1: CGPoint(x: 927.89, y: 807), controlPoint2: CGPoint(x: 931, y: 810.13))
        bezier20Path.addCurve(to: CGPoint(x: 924.05, y: 821), controlPoint1: CGPoint(x: 931, y: 817.87), controlPoint2: CGPoint(x: 927.89, y: 821))
        bezier20Path.addLine(to: CGPoint(x: 548.73, y: 821))
        bezier20Path.addCurve(to: CGPoint(x: 499.95, y: 835), controlPoint1: CGPoint(x: 542.47, y: 824.08), controlPoint2: CGPoint(x: 518.92, y: 835))
        bezier20Path.close()
        bezier20Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier20Path.fill()


        //// Bezier 21 Drawing
        let bezier21Path = UIBezierPath()
        bezier21Path.move(to: CGPoint(x: 938, y: 238))
        bezier21Path.addCurve(to: CGPoint(x: 931, y: 231), controlPoint1: CGPoint(x: 934.13, y: 238), controlPoint2: CGPoint(x: 931, y: 234.87))
        bezier21Path.addLine(to: CGPoint(x: 931, y: 217))
        bezier21Path.addCurve(to: CGPoint(x: 924, y: 210), controlPoint1: CGPoint(x: 931, y: 213.01), controlPoint2: CGPoint(x: 927.99, y: 210))
        bezier21Path.addLine(to: CGPoint(x: 896, y: 210))
        bezier21Path.addCurve(to: CGPoint(x: 889, y: 203), controlPoint1: CGPoint(x: 892.13, y: 210), controlPoint2: CGPoint(x: 889, y: 206.87))
        bezier21Path.addCurve(to: CGPoint(x: 896, y: 196), controlPoint1: CGPoint(x: 889, y: 199.13), controlPoint2: CGPoint(x: 892.13, y: 196))
        bezier21Path.addLine(to: CGPoint(x: 924, y: 196))
        bezier21Path.addCurve(to: CGPoint(x: 945, y: 217), controlPoint1: CGPoint(x: 935.77, y: 196), controlPoint2: CGPoint(x: 945, y: 205.22))
        bezier21Path.addLine(to: CGPoint(x: 945, y: 231))
        bezier21Path.addCurve(to: CGPoint(x: 938, y: 238), controlPoint1: CGPoint(x: 945, y: 234.87), controlPoint2: CGPoint(x: 941.87, y: 238))
        bezier21Path.close()
        bezier21Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier21Path.fill()


        //// Bezier 22 Drawing
        let bezier22Path = UIBezierPath()
        bezier22Path.move(to: CGPoint(x: 924, y: 821))
        bezier22Path.addCurve(to: CGPoint(x: 917, y: 814), controlPoint1: CGPoint(x: 920.13, y: 821), controlPoint2: CGPoint(x: 917, y: 817.87))
        bezier22Path.addCurve(to: CGPoint(x: 924, y: 807), controlPoint1: CGPoint(x: 917, y: 810.13), controlPoint2: CGPoint(x: 920.13, y: 807))
        bezier22Path.addCurve(to: CGPoint(x: 931, y: 800), controlPoint1: CGPoint(x: 927.86, y: 807), controlPoint2: CGPoint(x: 931, y: 803.86))
        bezier22Path.addCurve(to: CGPoint(x: 938, y: 793), controlPoint1: CGPoint(x: 931, y: 796.13), controlPoint2: CGPoint(x: 934.13, y: 793))
        bezier22Path.addCurve(to: CGPoint(x: 945, y: 800), controlPoint1: CGPoint(x: 941.87, y: 793), controlPoint2: CGPoint(x: 945, y: 796.13))
        bezier22Path.addCurve(to: CGPoint(x: 924, y: 821), controlPoint1: CGPoint(x: 945, y: 811.58), controlPoint2: CGPoint(x: 935.58, y: 821))
        bezier22Path.close()
        bezier22Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier22Path.fill()


        //// Bezier 23 Drawing
        let bezier23Path = UIBezierPath()
        bezier23Path.move(to: CGPoint(x: 179.91, y: 502.11))
        bezier23Path.addLine(to: CGPoint(x: 444.09, y: 502.11))
        bezier23Path.addLine(to: CGPoint(x: 444.09, y: 279.89))
        bezier23Path.addLine(to: CGPoint(x: 179.91, y: 279.89))
        bezier23Path.addLine(to: CGPoint(x: 179.91, y: 502.11))
        bezier23Path.close()
        bezier23Path.move(to: CGPoint(x: 451.05, y: 516))
        bezier23Path.addLine(to: CGPoint(x: 172.95, y: 516))
        bezier23Path.addCurve(to: CGPoint(x: 166, y: 509.05), controlPoint1: CGPoint(x: 169.11, y: 516), controlPoint2: CGPoint(x: 166, y: 512.9))
        bezier23Path.addLine(to: CGPoint(x: 166, y: 272.95))
        bezier23Path.addCurve(to: CGPoint(x: 172.95, y: 266), controlPoint1: CGPoint(x: 166, y: 269.11), controlPoint2: CGPoint(x: 169.11, y: 266))
        bezier23Path.addLine(to: CGPoint(x: 451.05, y: 266))
        bezier23Path.addCurve(to: CGPoint(x: 458, y: 272.95), controlPoint1: CGPoint(x: 454.89, y: 266), controlPoint2: CGPoint(x: 458, y: 269.11))
        bezier23Path.addLine(to: CGPoint(x: 458, y: 509.05))
        bezier23Path.addCurve(to: CGPoint(x: 451.05, y: 516), controlPoint1: CGPoint(x: 458, y: 512.89), controlPoint2: CGPoint(x: 454.89, y: 516))
        bezier23Path.close()
        bezier23Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier23Path.fill()


        //// Bezier 24 Drawing
        let bezier24Path = UIBezierPath()
        bezier24Path.move(to: CGPoint(x: 228.94, y: 391))
        bezier24Path.addCurve(to: CGPoint(x: 223.61, y: 388.51), controlPoint1: CGPoint(x: 226.95, y: 391), controlPoint2: CGPoint(x: 224.98, y: 390.16))
        bezier24Path.addCurve(to: CGPoint(x: 224.49, y: 378.77), controlPoint1: CGPoint(x: 221.16, y: 385.58), controlPoint2: CGPoint(x: 221.55, y: 381.21))
        bezier24Path.addLine(to: CGPoint(x: 307.63, y: 309.6))
        bezier24Path.addCurve(to: CGPoint(x: 317.39, y: 310.49), controlPoint1: CGPoint(x: 310.58, y: 307.16), controlPoint2: CGPoint(x: 314.95, y: 307.56))
        bezier24Path.addCurve(to: CGPoint(x: 316.51, y: 320.23), controlPoint1: CGPoint(x: 319.84, y: 313.43), controlPoint2: CGPoint(x: 319.45, y: 317.79))
        bezier24Path.addLine(to: CGPoint(x: 233.37, y: 389.4))
        bezier24Path.addCurve(to: CGPoint(x: 228.94, y: 391), controlPoint1: CGPoint(x: 232.07, y: 390.47), controlPoint2: CGPoint(x: 230.5, y: 391))
        bezier24Path.close()
        bezier24Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier24Path.fill()


        //// Bezier 25 Drawing
        let bezier25Path = UIBezierPath()
        bezier25Path.move(to: CGPoint(x: 395.06, y: 391))
        bezier25Path.addCurve(to: CGPoint(x: 390.63, y: 389.4), controlPoint1: CGPoint(x: 393.5, y: 391), controlPoint2: CGPoint(x: 391.93, y: 390.47))
        bezier25Path.addLine(to: CGPoint(x: 307.49, y: 320.23))
        bezier25Path.addCurve(to: CGPoint(x: 306.6, y: 310.49), controlPoint1: CGPoint(x: 304.56, y: 317.79), controlPoint2: CGPoint(x: 304.16, y: 313.43))
        bezier25Path.addCurve(to: CGPoint(x: 316.37, y: 309.6), controlPoint1: CGPoint(x: 309.06, y: 307.56), controlPoint2: CGPoint(x: 313.41, y: 307.16))
        bezier25Path.addLine(to: CGPoint(x: 399.51, y: 378.77))
        bezier25Path.addCurve(to: CGPoint(x: 400.39, y: 388.51), controlPoint1: CGPoint(x: 402.45, y: 381.21), controlPoint2: CGPoint(x: 402.84, y: 385.58))
        bezier25Path.addCurve(to: CGPoint(x: 395.06, y: 391), controlPoint1: CGPoint(x: 399.02, y: 390.16), controlPoint2: CGPoint(x: 397.05, y: 391))
        bezier25Path.close()
        bezier25Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier25Path.fill()


        //// Bezier 26 Drawing
        let bezier26Path = UIBezierPath()
        bezier26Path.move(to: CGPoint(x: 228.94, y: 419))
        bezier26Path.addCurve(to: CGPoint(x: 223.61, y: 416.51), controlPoint1: CGPoint(x: 226.95, y: 419), controlPoint2: CGPoint(x: 224.98, y: 418.16))
        bezier26Path.addCurve(to: CGPoint(x: 224.49, y: 406.77), controlPoint1: CGPoint(x: 221.16, y: 413.58), controlPoint2: CGPoint(x: 221.55, y: 409.21))
        bezier26Path.addLine(to: CGPoint(x: 307.63, y: 337.6))
        bezier26Path.addCurve(to: CGPoint(x: 317.39, y: 338.49), controlPoint1: CGPoint(x: 310.58, y: 335.16), controlPoint2: CGPoint(x: 314.95, y: 335.56))
        bezier26Path.addCurve(to: CGPoint(x: 316.51, y: 348.23), controlPoint1: CGPoint(x: 319.84, y: 341.43), controlPoint2: CGPoint(x: 319.45, y: 345.79))
        bezier26Path.addLine(to: CGPoint(x: 233.37, y: 417.4))
        bezier26Path.addCurve(to: CGPoint(x: 228.94, y: 419), controlPoint1: CGPoint(x: 232.07, y: 418.47), controlPoint2: CGPoint(x: 230.5, y: 419))
        bezier26Path.close()
        bezier26Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier26Path.fill()


        //// Bezier 27 Drawing
        let bezier27Path = UIBezierPath()
        bezier27Path.move(to: CGPoint(x: 395.06, y: 419))
        bezier27Path.addCurve(to: CGPoint(x: 390.63, y: 417.4), controlPoint1: CGPoint(x: 393.5, y: 419), controlPoint2: CGPoint(x: 391.93, y: 418.47))
        bezier27Path.addLine(to: CGPoint(x: 307.49, y: 348.23))
        bezier27Path.addCurve(to: CGPoint(x: 306.6, y: 338.49), controlPoint1: CGPoint(x: 304.56, y: 345.79), controlPoint2: CGPoint(x: 304.16, y: 341.43))
        bezier27Path.addCurve(to: CGPoint(x: 316.37, y: 337.6), controlPoint1: CGPoint(x: 309.06, y: 335.56), controlPoint2: CGPoint(x: 313.41, y: 335.16))
        bezier27Path.addLine(to: CGPoint(x: 399.51, y: 406.77))
        bezier27Path.addCurve(to: CGPoint(x: 400.39, y: 416.51), controlPoint1: CGPoint(x: 402.45, y: 409.21), controlPoint2: CGPoint(x: 402.84, y: 413.58))
        bezier27Path.addCurve(to: CGPoint(x: 395.06, y: 419), controlPoint1: CGPoint(x: 399.02, y: 418.16), controlPoint2: CGPoint(x: 397.05, y: 419))
        bezier27Path.close()
        bezier27Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier27Path.fill()


        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(roundedRect: CGRect(x: 250, y: 405, width: 14, height: 69), cornerRadius: 7)
        dark.setFill()
        rectangle4Path.fill()


        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(roundedRect: CGRect(x: 250, y: 460, width: 125, height: 14), cornerRadius: 7)
        dark.setFill()
        rectangle5Path.fill()


        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(roundedRect: CGRect(x: 361, y: 405, width: 14, height: 69), cornerRadius: 7)
        dark.setFill()
        rectangle6Path.fill()


        //// Rectangle 7 Drawing
        let rectangle7Path = UIBezierPath(roundedRect: CGRect(x: 305, y: 432, width: 14, height: 42), cornerRadius: 7)
        dark.setFill()
        rectangle7Path.fill()


        //// Bezier 28 Drawing
        let bezier28Path = UIBezierPath()
        bezier28Path.move(to: CGPoint(x: 451.05, y: 558))
        bezier28Path.addLine(to: CGPoint(x: 172.95, y: 558))
        bezier28Path.addCurve(to: CGPoint(x: 166, y: 551), controlPoint1: CGPoint(x: 169.11, y: 558), controlPoint2: CGPoint(x: 166, y: 554.87))
        bezier28Path.addCurve(to: CGPoint(x: 172.95, y: 544), controlPoint1: CGPoint(x: 166, y: 547.13), controlPoint2: CGPoint(x: 169.11, y: 544))
        bezier28Path.addLine(to: CGPoint(x: 451.05, y: 544))
        bezier28Path.addCurve(to: CGPoint(x: 458, y: 551), controlPoint1: CGPoint(x: 454.89, y: 544), controlPoint2: CGPoint(x: 458, y: 547.13))
        bezier28Path.addCurve(to: CGPoint(x: 451.05, y: 558), controlPoint1: CGPoint(x: 458, y: 554.87), controlPoint2: CGPoint(x: 454.89, y: 558))
        bezier28Path.close()
        bezier28Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier28Path.fill()


        //// Bezier 29 Drawing
        let bezier29Path = UIBezierPath()
        bezier29Path.move(to: CGPoint(x: 451.05, y: 599))
        bezier29Path.addLine(to: CGPoint(x: 172.95, y: 599))
        bezier29Path.addCurve(to: CGPoint(x: 166, y: 592), controlPoint1: CGPoint(x: 169.11, y: 599), controlPoint2: CGPoint(x: 166, y: 595.87))
        bezier29Path.addCurve(to: CGPoint(x: 172.95, y: 585), controlPoint1: CGPoint(x: 166, y: 588.13), controlPoint2: CGPoint(x: 169.11, y: 585))
        bezier29Path.addLine(to: CGPoint(x: 451.05, y: 585))
        bezier29Path.addCurve(to: CGPoint(x: 458, y: 592), controlPoint1: CGPoint(x: 454.89, y: 585), controlPoint2: CGPoint(x: 458, y: 588.13))
        bezier29Path.addCurve(to: CGPoint(x: 451.05, y: 599), controlPoint1: CGPoint(x: 458, y: 595.87), controlPoint2: CGPoint(x: 454.89, y: 599))
        bezier29Path.close()
        bezier29Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier29Path.fill()


        //// Bezier 30 Drawing
        let bezier30Path = UIBezierPath()
        bezier30Path.move(to: CGPoint(x: 451.05, y: 641))
        bezier30Path.addLine(to: CGPoint(x: 172.95, y: 641))
        bezier30Path.addCurve(to: CGPoint(x: 166, y: 634), controlPoint1: CGPoint(x: 169.11, y: 641), controlPoint2: CGPoint(x: 166, y: 637.87))
        bezier30Path.addCurve(to: CGPoint(x: 172.95, y: 627), controlPoint1: CGPoint(x: 166, y: 630.13), controlPoint2: CGPoint(x: 169.11, y: 627))
        bezier30Path.addLine(to: CGPoint(x: 451.05, y: 627))
        bezier30Path.addCurve(to: CGPoint(x: 458, y: 634), controlPoint1: CGPoint(x: 454.89, y: 627), controlPoint2: CGPoint(x: 458, y: 630.13))
        bezier30Path.addCurve(to: CGPoint(x: 451.05, y: 641), controlPoint1: CGPoint(x: 458, y: 637.87), controlPoint2: CGPoint(x: 454.89, y: 641))
        bezier30Path.close()
        bezier30Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier30Path.fill()


        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(roundedRect: CGRect(x: 166, y: 682, width: 125, height: 14), cornerRadius: 7)
        dark.setFill()
        rectangle8Path.fill()


        //// Bezier 31 Drawing
        let bezier31Path = UIBezierPath()
        bezier31Path.move(to: CGPoint(x: 555.91, y: 501.11))
        bezier31Path.addLine(to: CGPoint(x: 820.1, y: 501.11))
        bezier31Path.addLine(to: CGPoint(x: 820.1, y: 278.89))
        bezier31Path.addLine(to: CGPoint(x: 555.91, y: 278.89))
        bezier31Path.addLine(to: CGPoint(x: 555.91, y: 501.11))
        bezier31Path.close()
        bezier31Path.move(to: CGPoint(x: 827.05, y: 515))
        bezier31Path.addLine(to: CGPoint(x: 548.95, y: 515))
        bezier31Path.addCurve(to: CGPoint(x: 542, y: 508.05), controlPoint1: CGPoint(x: 545.11, y: 515), controlPoint2: CGPoint(x: 542, y: 511.9))
        bezier31Path.addLine(to: CGPoint(x: 542, y: 271.95))
        bezier31Path.addCurve(to: CGPoint(x: 548.95, y: 265), controlPoint1: CGPoint(x: 542, y: 268.11), controlPoint2: CGPoint(x: 545.11, y: 265))
        bezier31Path.addLine(to: CGPoint(x: 827.05, y: 265))
        bezier31Path.addCurve(to: CGPoint(x: 834, y: 271.95), controlPoint1: CGPoint(x: 830.89, y: 265), controlPoint2: CGPoint(x: 834, y: 268.11))
        bezier31Path.addLine(to: CGPoint(x: 834, y: 508.05))
        bezier31Path.addCurve(to: CGPoint(x: 827.05, y: 515), controlPoint1: CGPoint(x: 834, y: 511.89), controlPoint2: CGPoint(x: 830.89, y: 515))
        bezier31Path.close()
        bezier31Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier31Path.fill()


        //// Bezier 32 Drawing
        let bezier32Path = UIBezierPath()
        bezier32Path.move(to: CGPoint(x: 617.92, y: 391))
        bezier32Path.addCurve(to: CGPoint(x: 612.51, y: 388.41), controlPoint1: CGPoint(x: 615.89, y: 391), controlPoint2: CGPoint(x: 613.88, y: 390.11))
        bezier32Path.addCurve(to: CGPoint(x: 613.59, y: 378.71), controlPoint1: CGPoint(x: 610.14, y: 385.43), controlPoint2: CGPoint(x: 610.61, y: 381.09))
        bezier32Path.addLine(to: CGPoint(x: 682.76, y: 323.5))
        bezier32Path.addCurve(to: CGPoint(x: 692.49, y: 324.58), controlPoint1: CGPoint(x: 685.77, y: 321.13), controlPoint2: CGPoint(x: 690.11, y: 321.62))
        bezier32Path.addCurve(to: CGPoint(x: 691.41, y: 334.29), controlPoint1: CGPoint(x: 694.86, y: 327.56), controlPoint2: CGPoint(x: 694.39, y: 331.9))
        bezier32Path.addLine(to: CGPoint(x: 622.24, y: 389.49))
        bezier32Path.addCurve(to: CGPoint(x: 617.92, y: 391), controlPoint1: CGPoint(x: 620.96, y: 390.51), controlPoint2: CGPoint(x: 619.43, y: 391))
        bezier32Path.close()
        bezier32Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier32Path.fill()


        //// Bezier 33 Drawing
        let bezier33Path = UIBezierPath()
        bezier33Path.move(to: CGPoint(x: 757.08, y: 391))
        bezier33Path.addCurve(to: CGPoint(x: 752.76, y: 389.49), controlPoint1: CGPoint(x: 755.56, y: 391), controlPoint2: CGPoint(x: 754.04, y: 390.51))
        bezier33Path.addLine(to: CGPoint(x: 683.59, y: 334.29))
        bezier33Path.addCurve(to: CGPoint(x: 682.51, y: 324.58), controlPoint1: CGPoint(x: 680.61, y: 331.9), controlPoint2: CGPoint(x: 680.14, y: 327.56))
        bezier33Path.addCurve(to: CGPoint(x: 692.24, y: 323.5), controlPoint1: CGPoint(x: 684.92, y: 321.61), controlPoint2: CGPoint(x: 689.25, y: 321.14))
        bezier33Path.addLine(to: CGPoint(x: 761.41, y: 378.71))
        bezier33Path.addCurve(to: CGPoint(x: 762.49, y: 388.41), controlPoint1: CGPoint(x: 764.39, y: 381.09), controlPoint2: CGPoint(x: 764.86, y: 385.43))
        bezier33Path.addCurve(to: CGPoint(x: 757.08, y: 391), controlPoint1: CGPoint(x: 761.12, y: 390.11), controlPoint2: CGPoint(x: 759.11, y: 391))
        bezier33Path.close()
        bezier33Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier33Path.fill()


        //// Rectangle 9 Drawing
        let rectangle9Path = UIBezierPath(roundedRect: CGRect(x: 625, y: 391, width: 14, height: 69), cornerRadius: 7)
        dark.setFill()
        rectangle9Path.fill()


        //// Rectangle 10 Drawing
        let rectangle10Path = UIBezierPath(roundedRect: CGRect(x: 625, y: 446, width: 125, height: 14), cornerRadius: 7)
        dark.setFill()
        rectangle10Path.fill()


        //// Rectangle 11 Drawing
        let rectangle11Path = UIBezierPath(roundedRect: CGRect(x: 736, y: 391, width: 14, height: 69), cornerRadius: 7)
        dark.setFill()
        rectangle11Path.fill()


        //// Rectangle 12 Drawing
        let rectangle12Path = UIBezierPath(roundedRect: CGRect(x: 680, y: 419, width: 14, height: 42), cornerRadius: 7)
        dark.setFill()
        rectangle12Path.fill()


        //// Bezier 34 Drawing
        let bezier34Path = UIBezierPath()
        bezier34Path.move(to: CGPoint(x: 826.05, y: 558))
        bezier34Path.addLine(to: CGPoint(x: 547.95, y: 558))
        bezier34Path.addCurve(to: CGPoint(x: 541, y: 551), controlPoint1: CGPoint(x: 544.11, y: 558), controlPoint2: CGPoint(x: 541, y: 554.87))
        bezier34Path.addCurve(to: CGPoint(x: 547.95, y: 544), controlPoint1: CGPoint(x: 541, y: 547.13), controlPoint2: CGPoint(x: 544.11, y: 544))
        bezier34Path.addLine(to: CGPoint(x: 826.05, y: 544))
        bezier34Path.addCurve(to: CGPoint(x: 833, y: 551), controlPoint1: CGPoint(x: 829.89, y: 544), controlPoint2: CGPoint(x: 833, y: 547.13))
        bezier34Path.addCurve(to: CGPoint(x: 826.05, y: 558), controlPoint1: CGPoint(x: 833, y: 554.87), controlPoint2: CGPoint(x: 829.89, y: 558))
        bezier34Path.close()
        bezier34Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier34Path.fill()


        //// Bezier 35 Drawing
        let bezier35Path = UIBezierPath()
        bezier35Path.move(to: CGPoint(x: 826.05, y: 599))
        bezier35Path.addLine(to: CGPoint(x: 547.95, y: 599))
        bezier35Path.addCurve(to: CGPoint(x: 541, y: 592), controlPoint1: CGPoint(x: 544.11, y: 599), controlPoint2: CGPoint(x: 541, y: 595.87))
        bezier35Path.addCurve(to: CGPoint(x: 547.95, y: 585), controlPoint1: CGPoint(x: 541, y: 588.13), controlPoint2: CGPoint(x: 544.11, y: 585))
        bezier35Path.addLine(to: CGPoint(x: 826.05, y: 585))
        bezier35Path.addCurve(to: CGPoint(x: 833, y: 592), controlPoint1: CGPoint(x: 829.89, y: 585), controlPoint2: CGPoint(x: 833, y: 588.13))
        bezier35Path.addCurve(to: CGPoint(x: 826.05, y: 599), controlPoint1: CGPoint(x: 833, y: 595.87), controlPoint2: CGPoint(x: 829.89, y: 599))
        bezier35Path.close()
        bezier35Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier35Path.fill()


        //// Bezier 36 Drawing
        let bezier36Path = UIBezierPath()
        bezier36Path.move(to: CGPoint(x: 826.05, y: 641))
        bezier36Path.addLine(to: CGPoint(x: 547.95, y: 641))
        bezier36Path.addCurve(to: CGPoint(x: 541, y: 634), controlPoint1: CGPoint(x: 544.11, y: 641), controlPoint2: CGPoint(x: 541, y: 637.87))
        bezier36Path.addCurve(to: CGPoint(x: 547.95, y: 627), controlPoint1: CGPoint(x: 541, y: 630.13), controlPoint2: CGPoint(x: 544.11, y: 627))
        bezier36Path.addLine(to: CGPoint(x: 826.05, y: 627))
        bezier36Path.addCurve(to: CGPoint(x: 833, y: 634), controlPoint1: CGPoint(x: 829.89, y: 627), controlPoint2: CGPoint(x: 833, y: 630.13))
        bezier36Path.addCurve(to: CGPoint(x: 826.05, y: 641), controlPoint1: CGPoint(x: 833, y: 637.87), controlPoint2: CGPoint(x: 829.89, y: 641))
        bezier36Path.close()
        bezier36Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier36Path.fill()


        //// Rectangle 13 Drawing
        let rectangle13Path = UIBezierPath(roundedRect: CGRect(x: 541, y: 682, width: 125, height: 14), cornerRadius: 7)
        dark.setFill()
        rectangle13Path.fill()


        //// Rectangle 14 Drawing
        let rectangle14Path = UIBezierPath(roundedRect: CGRect(x: 625, y: 349, width: 14, height: 31), cornerRadius: 7)
        dark.setFill()
        rectangle14Path.fill()


        //// Rectangle 15 Drawing
        let rectangle15Path = UIBezierPath(roundedRect: CGRect(x: 569, y: 432, width: 14, height: 28), cornerRadius: 7)
        dark.setFill()
        rectangle15Path.fill()


        //// Rectangle 16 Drawing
        let rectangle16Path = UIBezierPath(roundedRect: CGRect(x: 597, y: 432, width: 14, height: 28), cornerRadius: 7)
        dark.setFill()
        rectangle16Path.fill()


        //// Rectangle 17 Drawing
        let rectangle17Path = UIBezierPath(roundedRect: CGRect(x: 764, y: 432, width: 14, height: 28), cornerRadius: 7)
        dark.setFill()
        rectangle17Path.fill()


        //// Rectangle 18 Drawing
        let rectangle18Path = UIBezierPath(roundedRect: CGRect(x: 791, y: 432, width: 14, height: 28), cornerRadius: 7)
        dark.setFill()
        rectangle18Path.fill()
        
        context.restoreGState()

    }

    @objc dynamic public class func drawDocuments(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 1000, height: 1000), resizing: ResizingBehavior = .aspectFit, white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), light: UIColor = UIColor(red: 0.769, green: 0.847, blue: 0.984, alpha: 1.000), medium: UIColor = UIColor(red: 0.478, green: 0.663, blue: 0.973, alpha: 1.000), dark: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 1000, height: 1000), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 1000, y: resizedFrame.height / 1000)


        //// fds
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 838, y: 133.67))
        bezierPath.addLine(to: CGPoint(x: 838, y: 189))
        bezierPath.addLine(to: CGPoint(x: 161, y: 189))
        bezierPath.addLine(to: CGPoint(x: 161, y: 133.67))
        bezierPath.addLine(to: CGPoint(x: 202.45, y: 133.67))
        bezierPath.addLine(to: CGPoint(x: 202.45, y: 106))
        bezierPath.addLine(to: CGPoint(x: 340.61, y: 106))
        bezierPath.addLine(to: CGPoint(x: 382.06, y: 133.67))
        bezierPath.addLine(to: CGPoint(x: 838, y: 133.67))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        light.setFill()
        bezierPath.fill()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 299, y: 190))
        bezier2Path.addLine(to: CGPoint(x: 838, y: 190))
        bezier2Path.addLine(to: CGPoint(x: 838, y: 231))
        bezier2Path.addLine(to: CGPoint(x: 340.46, y: 231))
        bezier2Path.addLine(to: CGPoint(x: 299, y: 190))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        light.setFill()
        bezier2Path.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 340.09, y: 230.57))
        bezier3Path.addLine(to: CGPoint(x: 879, y: 230.57))
        bezier3Path.addLine(to: CGPoint(x: 879, y: 286))
        bezier3Path.addLine(to: CGPoint(x: 119, y: 286))
        bezier3Path.addLine(to: CGPoint(x: 119, y: 230.57))
        bezier3Path.addLine(to: CGPoint(x: 160.46, y: 230.57))
        bezier3Path.addLine(to: CGPoint(x: 160.46, y: 189))
        bezier3Path.addLine(to: CGPoint(x: 298.64, y: 189))
        bezier3Path.addLine(to: CGPoint(x: 340.09, y: 230.57))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        light.setFill()
        bezier3Path.fill()


        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 665.41, y: 652.06))
        bezier4Path.addLine(to: CGPoint(x: 665.41, y: 610.59))
        bezier4Path.addCurve(to: CGPoint(x: 644.67, y: 589.85), controlPoint1: CGPoint(x: 665.41, y: 599.11), controlPoint2: CGPoint(x: 656.14, y: 589.85))
        bezier4Path.addCurve(to: CGPoint(x: 623.93, y: 610.59), controlPoint1: CGPoint(x: 633.19, y: 589.85), controlPoint2: CGPoint(x: 623.93, y: 599.11))
        bezier4Path.addLine(to: CGPoint(x: 623.93, y: 631.32))
        bezier4Path.addLine(to: CGPoint(x: 375.07, y: 631.32))
        bezier4Path.addLine(to: CGPoint(x: 375.07, y: 610.59))
        bezier4Path.addCurve(to: CGPoint(x: 354.33, y: 589.85), controlPoint1: CGPoint(x: 375.07, y: 599.11), controlPoint2: CGPoint(x: 365.81, y: 589.85))
        bezier4Path.addCurve(to: CGPoint(x: 333.59, y: 610.59), controlPoint1: CGPoint(x: 342.86, y: 589.85), controlPoint2: CGPoint(x: 333.59, y: 599.11))
        bezier4Path.addLine(to: CGPoint(x: 333.59, y: 652.06))
        bezier4Path.addCurve(to: CGPoint(x: 354.33, y: 672.8), controlPoint1: CGPoint(x: 333.59, y: 663.54), controlPoint2: CGPoint(x: 342.86, y: 672.8))
        bezier4Path.addLine(to: CGPoint(x: 644.67, y: 672.8))
        bezier4Path.addCurve(to: CGPoint(x: 665.41, y: 652.06), controlPoint1: CGPoint(x: 656.14, y: 672.8), controlPoint2: CGPoint(x: 665.41, y: 663.54))
        bezier4Path.close()
        bezier4Path.move(to: CGPoint(x: 935, y: 368.65))
        bezier4Path.addLine(to: CGPoint(x: 935, y: 866.35))
        bezier4Path.addCurve(to: CGPoint(x: 907.35, y: 894), controlPoint1: CGPoint(x: 935, y: 881.55), controlPoint2: CGPoint(x: 922.55, y: 894))
        bezier4Path.addLine(to: CGPoint(x: 91.65, y: 894))
        bezier4Path.addCurve(to: CGPoint(x: 64, y: 866.35), controlPoint1: CGPoint(x: 76.44, y: 894), controlPoint2: CGPoint(x: 64, y: 881.55))
        bezier4Path.addLine(to: CGPoint(x: 64, y: 368.65))
        bezier4Path.addCurve(to: CGPoint(x: 91.65, y: 341), controlPoint1: CGPoint(x: 64, y: 353.44), controlPoint2: CGPoint(x: 76.44, y: 341))
        bezier4Path.addLine(to: CGPoint(x: 907.35, y: 341))
        bezier4Path.addCurve(to: CGPoint(x: 935, y: 368.65), controlPoint1: CGPoint(x: 922.55, y: 341), controlPoint2: CGPoint(x: 935, y: 353.44))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier4Path.fill()


        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 879, y: 327.25))
        bezier5Path.addLine(to: CGPoint(x: 879, y: 341))
        bezier5Path.addLine(to: CGPoint(x: 119, y: 341))
        bezier5Path.addLine(to: CGPoint(x: 119, y: 286))
        bezier5Path.addLine(to: CGPoint(x: 879, y: 286))
        bezier5Path.addLine(to: CGPoint(x: 879, y: 327.25))
        bezier5Path.close()
        bezier5Path.usesEvenOddFillRule = true
        light.setFill()
        bezier5Path.fill()


        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 665, y: 610.75))
        bezier6Path.addLine(to: CGPoint(x: 665, y: 652.25))
        bezier6Path.addCurve(to: CGPoint(x: 644.25, y: 673), controlPoint1: CGPoint(x: 665, y: 663.73), controlPoint2: CGPoint(x: 655.73, y: 673))
        bezier6Path.addLine(to: CGPoint(x: 353.75, y: 673))
        bezier6Path.addCurve(to: CGPoint(x: 333, y: 652.25), controlPoint1: CGPoint(x: 342.27, y: 673), controlPoint2: CGPoint(x: 333, y: 663.73))
        bezier6Path.addLine(to: CGPoint(x: 333, y: 610.75))
        bezier6Path.addCurve(to: CGPoint(x: 353.75, y: 590), controlPoint1: CGPoint(x: 333, y: 599.27), controlPoint2: CGPoint(x: 342.27, y: 590))
        bezier6Path.addCurve(to: CGPoint(x: 374.5, y: 610.75), controlPoint1: CGPoint(x: 365.23, y: 590), controlPoint2: CGPoint(x: 374.5, y: 599.27))
        bezier6Path.addLine(to: CGPoint(x: 374.5, y: 631.5))
        bezier6Path.addLine(to: CGPoint(x: 623.5, y: 631.5))
        bezier6Path.addLine(to: CGPoint(x: 623.5, y: 610.75))
        bezier6Path.addCurve(to: CGPoint(x: 644.25, y: 590), controlPoint1: CGPoint(x: 623.5, y: 599.27), controlPoint2: CGPoint(x: 632.76, y: 590))
        bezier6Path.addCurve(to: CGPoint(x: 665, y: 610.75), controlPoint1: CGPoint(x: 655.73, y: 590), controlPoint2: CGPoint(x: 665, y: 599.27))
        bezier6Path.close()
        bezier6Path.usesEvenOddFillRule = true
        white.setFill()
        bezier6Path.fill()


        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 161, y: 286))
        bezier7Path.addLine(to: CGPoint(x: 838, y: 286))
        bezier7Path.addLine(to: CGPoint(x: 838, y: 258))
        bezier7Path.addLine(to: CGPoint(x: 161, y: 258))
        bezier7Path.addLine(to: CGPoint(x: 161, y: 286))
        bezier7Path.close()
        bezier7Path.usesEvenOddFillRule = true
        white.setFill()
        bezier7Path.fill()


        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 202, y: 189))
        bezier8Path.addLine(to: CGPoint(x: 796, y: 189))
        bezier8Path.addLine(to: CGPoint(x: 796, y: 161))
        bezier8Path.addLine(to: CGPoint(x: 202, y: 161))
        bezier8Path.addLine(to: CGPoint(x: 202, y: 189))
        bezier8Path.close()
        bezier8Path.usesEvenOddFillRule = true
        white.setFill()
        bezier8Path.fill()


        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 119, y: 341))
        bezier9Path.addLine(to: CGPoint(x: 879, y: 341))
        bezier9Path.addLine(to: CGPoint(x: 879, y: 327))
        bezier9Path.addLine(to: CGPoint(x: 119, y: 327))
        bezier9Path.addLine(to: CGPoint(x: 119, y: 341))
        bezier9Path.close()
        bezier9Path.usesEvenOddFillRule = true
        white.setFill()
        bezier9Path.fill()


        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 119, y: 231, width: 14, height: 97))
        white.setFill()
        rectanglePath.fill()


        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 161.01, y: 189))
        bezier10Path.addLine(to: CGPoint(x: 161, y: 189))
        bezier10Path.addLine(to: CGPoint(x: 161, y: 134))
        bezier10Path.addLine(to: CGPoint(x: 161.01, y: 134))
        bezier10Path.addLine(to: CGPoint(x: 161.01, y: 188.99))
        bezier10Path.addLine(to: CGPoint(x: 175, y: 188.99))
        bezier10Path.addLine(to: CGPoint(x: 161.01, y: 188.99))
        bezier10Path.addLine(to: CGPoint(x: 161.01, y: 189))
        bezier10Path.close()
        bezier10Path.usesEvenOddFillRule = true
        UIColor.red.setFill()
        bezier10Path.fill()


        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: 161, y: 134, width: 14, height: 55))
        white.setFill()
        rectangle2Path.fill()


        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        bezier11Path.move(to: CGPoint(x: 161, y: 189.5))
        bezier11Path.addLine(to: CGPoint(x: 175, y: 189.5))
        bezier11Path.addLine(to: CGPoint(x: 175, y: 189.5))
        bezier11Path.addLine(to: CGPoint(x: 161, y: 189.5))
        bezier11Path.addLine(to: CGPoint(x: 161, y: 189.5))
        bezier11Path.close()
        bezier11Path.usesEvenOddFillRule = true
        UIColor.red.setFill()
        bezier11Path.fill()


        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: 865, y: 231, width: 14, height: 97))
        medium.setFill()
        rectangle3Path.fill()


        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(rect: CGRect(x: 824, y: 134, width: 14, height: 55))
        medium.setFill()
        rectangle4Path.fill()


        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(rect: CGRect(x: 823.95, y: 189.48, width: 13.8, height: 27.65))
        medium.setFill()
        rectangle5Path.fill()


        //// Bezier 12 Drawing
        let bezier12Path = UIBezierPath()
        bezier12Path.move(to: CGPoint(x: 91.55, y: 348.37))
        bezier12Path.addCurve(to: CGPoint(x: 70.82, y: 369.09), controlPoint1: CGPoint(x: 80.12, y: 348.37), controlPoint2: CGPoint(x: 70.82, y: 357.66))
        bezier12Path.addLine(to: CGPoint(x: 70.82, y: 866.46))
        bezier12Path.addCurve(to: CGPoint(x: 91.55, y: 887.19), controlPoint1: CGPoint(x: 70.82, y: 877.89), controlPoint2: CGPoint(x: 80.12, y: 887.19))
        bezier12Path.addLine(to: CGPoint(x: 906.85, y: 887.19))
        bezier12Path.addCurve(to: CGPoint(x: 927.58, y: 866.46), controlPoint1: CGPoint(x: 918.28, y: 887.19), controlPoint2: CGPoint(x: 927.58, y: 877.89))
        bezier12Path.addLine(to: CGPoint(x: 927.58, y: 369.09))
        bezier12Path.addCurve(to: CGPoint(x: 906.85, y: 348.37), controlPoint1: CGPoint(x: 927.58, y: 357.66), controlPoint2: CGPoint(x: 918.28, y: 348.37))
        bezier12Path.addLine(to: CGPoint(x: 91.55, y: 348.37))
        bezier12Path.close()
        bezier12Path.move(to: CGPoint(x: 906.85, y: 901))
        bezier12Path.addLine(to: CGPoint(x: 91.55, y: 901))
        bezier12Path.addCurve(to: CGPoint(x: 57, y: 866.46), controlPoint1: CGPoint(x: 72.5, y: 901), controlPoint2: CGPoint(x: 57, y: 885.51))
        bezier12Path.addLine(to: CGPoint(x: 57, y: 369.09))
        bezier12Path.addCurve(to: CGPoint(x: 91.55, y: 334.55), controlPoint1: CGPoint(x: 57, y: 350.05), controlPoint2: CGPoint(x: 72.5, y: 334.55))
        bezier12Path.addLine(to: CGPoint(x: 906.85, y: 334.55))
        bezier12Path.addCurve(to: CGPoint(x: 941.4, y: 369.09), controlPoint1: CGPoint(x: 925.9, y: 334.55), controlPoint2: CGPoint(x: 941.4, y: 350.05))
        bezier12Path.addLine(to: CGPoint(x: 941.4, y: 866.46))
        bezier12Path.addCurve(to: CGPoint(x: 906.85, y: 901), controlPoint1: CGPoint(x: 941.4, y: 885.51), controlPoint2: CGPoint(x: 925.9, y: 901))
        bezier12Path.close()
        bezier12Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier12Path.fill()


        //// Bezier 13 Drawing
        let bezier13Path = UIBezierPath()
        bezier13Path.move(to: CGPoint(x: 353.68, y: 596.86))
        bezier13Path.addCurve(to: CGPoint(x: 339.84, y: 610.71), controlPoint1: CGPoint(x: 346.05, y: 596.86), controlPoint2: CGPoint(x: 339.84, y: 603.08))
        bezier13Path.addLine(to: CGPoint(x: 339.84, y: 652.28))
        bezier13Path.addCurve(to: CGPoint(x: 353.68, y: 666.14), controlPoint1: CGPoint(x: 339.84, y: 659.92), controlPoint2: CGPoint(x: 346.05, y: 666.14))
        bezier13Path.addLine(to: CGPoint(x: 644.32, y: 666.14))
        bezier13Path.addCurve(to: CGPoint(x: 658.16, y: 652.28), controlPoint1: CGPoint(x: 651.94, y: 666.14), controlPoint2: CGPoint(x: 658.16, y: 659.92))
        bezier13Path.addLine(to: CGPoint(x: 658.16, y: 610.71))
        bezier13Path.addCurve(to: CGPoint(x: 644.32, y: 596.86), controlPoint1: CGPoint(x: 658.16, y: 603.08), controlPoint2: CGPoint(x: 651.94, y: 596.86))
        bezier13Path.addCurve(to: CGPoint(x: 630.48, y: 610.71), controlPoint1: CGPoint(x: 636.7, y: 596.86), controlPoint2: CGPoint(x: 630.48, y: 603.08))
        bezier13Path.addLine(to: CGPoint(x: 630.48, y: 631.5))
        bezier13Path.addCurve(to: CGPoint(x: 623.56, y: 638.43), controlPoint1: CGPoint(x: 630.48, y: 635.33), controlPoint2: CGPoint(x: 627.39, y: 638.43))
        bezier13Path.addLine(to: CGPoint(x: 374.44, y: 638.43))
        bezier13Path.addCurve(to: CGPoint(x: 367.52, y: 631.5), controlPoint1: CGPoint(x: 370.62, y: 638.43), controlPoint2: CGPoint(x: 367.52, y: 635.33))
        bezier13Path.addLine(to: CGPoint(x: 367.52, y: 610.71))
        bezier13Path.addCurve(to: CGPoint(x: 353.68, y: 596.86), controlPoint1: CGPoint(x: 367.52, y: 603.08), controlPoint2: CGPoint(x: 361.31, y: 596.86))
        bezier13Path.close()
        bezier13Path.move(to: CGPoint(x: 644.32, y: 680))
        bezier13Path.addLine(to: CGPoint(x: 353.68, y: 680))
        bezier13Path.addCurve(to: CGPoint(x: 326, y: 652.29), controlPoint1: CGPoint(x: 338.41, y: 680), controlPoint2: CGPoint(x: 326, y: 667.58))
        bezier13Path.addLine(to: CGPoint(x: 326, y: 610.71))
        bezier13Path.addCurve(to: CGPoint(x: 353.68, y: 583), controlPoint1: CGPoint(x: 326, y: 595.42), controlPoint2: CGPoint(x: 338.41, y: 583))
        bezier13Path.addCurve(to: CGPoint(x: 381.36, y: 610.71), controlPoint1: CGPoint(x: 368.95, y: 583), controlPoint2: CGPoint(x: 381.36, y: 595.42))
        bezier13Path.addLine(to: CGPoint(x: 381.36, y: 624.57))
        bezier13Path.addLine(to: CGPoint(x: 616.64, y: 624.57))
        bezier13Path.addLine(to: CGPoint(x: 616.64, y: 610.71))
        bezier13Path.addCurve(to: CGPoint(x: 644.32, y: 583), controlPoint1: CGPoint(x: 616.64, y: 595.42), controlPoint2: CGPoint(x: 629.05, y: 583))
        bezier13Path.addCurve(to: CGPoint(x: 672, y: 610.71), controlPoint1: CGPoint(x: 659.59, y: 583), controlPoint2: CGPoint(x: 672, y: 595.42))
        bezier13Path.addLine(to: CGPoint(x: 672, y: 652.29))
        bezier13Path.addCurve(to: CGPoint(x: 644.32, y: 680), controlPoint1: CGPoint(x: 672, y: 667.58), controlPoint2: CGPoint(x: 659.6, y: 680))
        bezier13Path.close()
        bezier13Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier13Path.fill()


        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(roundedRect: CGRect(x: 112, y: 279, width: 14, height: 55), cornerRadius: 7)
        dark.setFill()
        rectangle6Path.fill()


        //// Bezier 14 Drawing
        let bezier14Path = UIBezierPath()
        bezier14Path.move(to: CGPoint(x: 879.09, y: 293))
        bezier14Path.addLine(to: CGPoint(x: 118.91, y: 293))
        bezier14Path.addCurve(to: CGPoint(x: 112, y: 286), controlPoint1: CGPoint(x: 115.09, y: 293), controlPoint2: CGPoint(x: 112, y: 289.87))
        bezier14Path.addCurve(to: CGPoint(x: 118.91, y: 279), controlPoint1: CGPoint(x: 112, y: 282.13), controlPoint2: CGPoint(x: 115.09, y: 279))
        bezier14Path.addLine(to: CGPoint(x: 879.09, y: 279))
        bezier14Path.addCurve(to: CGPoint(x: 886, y: 286), controlPoint1: CGPoint(x: 882.91, y: 279), controlPoint2: CGPoint(x: 886, y: 282.13))
        bezier14Path.addCurve(to: CGPoint(x: 879.09, y: 293), controlPoint1: CGPoint(x: 886, y: 289.87), controlPoint2: CGPoint(x: 882.91, y: 293))
        bezier14Path.close()
        bezier14Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier14Path.fill()


        //// Rectangle 7 Drawing
        let rectangle7Path = UIBezierPath(roundedRect: CGRect(x: 872, y: 279, width: 14, height: 55), cornerRadius: 7)
        dark.setFill()
        rectangle7Path.fill()


        //// Bezier 15 Drawing
        let bezier15Path = UIBezierPath()
        bezier15Path.move(to: CGPoint(x: 879.09, y: 238))
        bezier15Path.addLine(to: CGPoint(x: 340.05, y: 238))
        bezier15Path.addCurve(to: CGPoint(x: 335.17, y: 235.99), controlPoint1: CGPoint(x: 338.22, y: 238), controlPoint2: CGPoint(x: 336.46, y: 237.27))
        bezier15Path.addLine(to: CGPoint(x: 295.73, y: 196.75))
        bezier15Path.addLine(to: CGPoint(x: 167.29, y: 196.75))
        bezier15Path.addLine(to: CGPoint(x: 167.29, y: 231.12))
        bezier15Path.addCurve(to: CGPoint(x: 160.38, y: 238), controlPoint1: CGPoint(x: 167.29, y: 234.92), controlPoint2: CGPoint(x: 164.19, y: 238))
        bezier15Path.addLine(to: CGPoint(x: 118.91, y: 238))
        bezier15Path.addCurve(to: CGPoint(x: 112, y: 231.12), controlPoint1: CGPoint(x: 115.09, y: 238), controlPoint2: CGPoint(x: 112, y: 234.92))
        bezier15Path.addCurve(to: CGPoint(x: 118.91, y: 224.25), controlPoint1: CGPoint(x: 112, y: 227.32), controlPoint2: CGPoint(x: 115.09, y: 224.25))
        bezier15Path.addLine(to: CGPoint(x: 153.46, y: 224.25))
        bezier15Path.addLine(to: CGPoint(x: 153.46, y: 189.87))
        bezier15Path.addCurve(to: CGPoint(x: 160.38, y: 183), controlPoint1: CGPoint(x: 153.46, y: 186.08), controlPoint2: CGPoint(x: 156.56, y: 183))
        bezier15Path.addLine(to: CGPoint(x: 298.59, y: 183))
        bezier15Path.addCurve(to: CGPoint(x: 303.47, y: 185.01), controlPoint1: CGPoint(x: 300.42, y: 183), controlPoint2: CGPoint(x: 302.18, y: 183.73))
        bezier15Path.addLine(to: CGPoint(x: 342.91, y: 224.25))
        bezier15Path.addLine(to: CGPoint(x: 879.09, y: 224.25))
        bezier15Path.addCurve(to: CGPoint(x: 886, y: 231.12), controlPoint1: CGPoint(x: 882.91, y: 224.25), controlPoint2: CGPoint(x: 886, y: 227.32))
        bezier15Path.addCurve(to: CGPoint(x: 879.09, y: 238), controlPoint1: CGPoint(x: 886, y: 234.92), controlPoint2: CGPoint(x: 882.91, y: 238))
        bezier15Path.close()
        bezier15Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier15Path.fill()


        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(roundedRect: CGRect(x: 872, y: 224, width: 14, height: 55), cornerRadius: 7)
        dark.setFill()
        rectangle8Path.fill()


        //// Rectangle 9 Drawing
        let rectangle9Path = UIBezierPath(roundedRect: CGRect(x: 112, y: 224, width: 14, height: 55), cornerRadius: 7)
        dark.setFill()
        rectangle9Path.fill()


        //// Bezier 16 Drawing
        let bezier16Path = UIBezierPath()
        bezier16Path.move(to: CGPoint(x: 838.09, y: 265))
        bezier16Path.addLine(to: CGPoint(x: 160.91, y: 265))
        bezier16Path.addCurve(to: CGPoint(x: 154, y: 258), controlPoint1: CGPoint(x: 157.09, y: 265), controlPoint2: CGPoint(x: 154, y: 261.87))
        bezier16Path.addCurve(to: CGPoint(x: 160.91, y: 251), controlPoint1: CGPoint(x: 154, y: 254.13), controlPoint2: CGPoint(x: 157.09, y: 251))
        bezier16Path.addLine(to: CGPoint(x: 838.09, y: 251))
        bezier16Path.addCurve(to: CGPoint(x: 845, y: 258), controlPoint1: CGPoint(x: 841.91, y: 251), controlPoint2: CGPoint(x: 845, y: 254.13))
        bezier16Path.addCurve(to: CGPoint(x: 838.09, y: 265), controlPoint1: CGPoint(x: 845, y: 261.87), controlPoint2: CGPoint(x: 841.91, y: 265))
        bezier16Path.close()
        bezier16Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier16Path.fill()


        //// Bezier 17 Drawing
        let bezier17Path = UIBezierPath()
        bezier17Path.move(to: CGPoint(x: 838.09, y: 196))
        bezier17Path.addLine(to: CGPoint(x: 326.91, y: 196))
        bezier17Path.addCurve(to: CGPoint(x: 320, y: 189), controlPoint1: CGPoint(x: 323.09, y: 196), controlPoint2: CGPoint(x: 320, y: 192.87))
        bezier17Path.addCurve(to: CGPoint(x: 326.91, y: 182), controlPoint1: CGPoint(x: 320, y: 185.13), controlPoint2: CGPoint(x: 323.09, y: 182))
        bezier17Path.addLine(to: CGPoint(x: 838.09, y: 182))
        bezier17Path.addCurve(to: CGPoint(x: 845, y: 189), controlPoint1: CGPoint(x: 841.91, y: 182), controlPoint2: CGPoint(x: 845, y: 185.13))
        bezier17Path.addCurve(to: CGPoint(x: 838.09, y: 196), controlPoint1: CGPoint(x: 845, y: 192.87), controlPoint2: CGPoint(x: 841.91, y: 196))
        bezier17Path.close()
        bezier17Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier17Path.fill()


        //// Rectangle 10 Drawing
        let rectangle10Path = UIBezierPath(roundedRect: CGRect(x: 831, y: 183, width: 14, height: 41), cornerRadius: 7)
        dark.setFill()
        rectangle10Path.fill()


        //// Bezier 18 Drawing
        let bezier18Path = UIBezierPath()
        bezier18Path.move(to: CGPoint(x: 838.09, y: 141))
        bezier18Path.addLine(to: CGPoint(x: 382.03, y: 141))
        bezier18Path.addCurve(to: CGPoint(x: 378.2, y: 139.85), controlPoint1: CGPoint(x: 380.67, y: 141), controlPoint2: CGPoint(x: 379.33, y: 140.6))
        bezier18Path.addLine(to: CGPoint(x: 338.48, y: 113.67))
        bezier18Path.addLine(to: CGPoint(x: 209.28, y: 113.67))
        bezier18Path.addLine(to: CGPoint(x: 209.28, y: 134.17))
        bezier18Path.addCurve(to: CGPoint(x: 202.37, y: 141), controlPoint1: CGPoint(x: 209.28, y: 137.94), controlPoint2: CGPoint(x: 206.19, y: 141))
        bezier18Path.addLine(to: CGPoint(x: 160.91, y: 141))
        bezier18Path.addCurve(to: CGPoint(x: 154, y: 134.17), controlPoint1: CGPoint(x: 157.09, y: 141), controlPoint2: CGPoint(x: 154, y: 137.94))
        bezier18Path.addCurve(to: CGPoint(x: 160.91, y: 127.33), controlPoint1: CGPoint(x: 154, y: 130.39), controlPoint2: CGPoint(x: 157.09, y: 127.33))
        bezier18Path.addLine(to: CGPoint(x: 195.46, y: 127.33))
        bezier18Path.addLine(to: CGPoint(x: 195.46, y: 106.83))
        bezier18Path.addCurve(to: CGPoint(x: 202.37, y: 100), controlPoint1: CGPoint(x: 195.46, y: 103.05), controlPoint2: CGPoint(x: 198.55, y: 100))
        bezier18Path.addLine(to: CGPoint(x: 340.57, y: 100))
        bezier18Path.addCurve(to: CGPoint(x: 344.4, y: 101.15), controlPoint1: CGPoint(x: 341.93, y: 100), controlPoint2: CGPoint(x: 343.27, y: 100.4))
        bezier18Path.addLine(to: CGPoint(x: 384.12, y: 127.33))
        bezier18Path.addLine(to: CGPoint(x: 838.09, y: 127.33))
        bezier18Path.addCurve(to: CGPoint(x: 845, y: 134.17), controlPoint1: CGPoint(x: 841.91, y: 127.33), controlPoint2: CGPoint(x: 845, y: 130.39))
        bezier18Path.addCurve(to: CGPoint(x: 838.09, y: 141), controlPoint1: CGPoint(x: 845, y: 137.94), controlPoint2: CGPoint(x: 841.91, y: 141))
        bezier18Path.close()
        bezier18Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier18Path.fill()


        //// Rectangle 11 Drawing
        let rectangle11Path = UIBezierPath(roundedRect: CGRect(x: 831, y: 127, width: 14, height: 55), cornerRadius: 7)
        dark.setFill()
        rectangle11Path.fill()


        //// Rectangle 12 Drawing
        let rectangle12Path = UIBezierPath(roundedRect: CGRect(x: 154, y: 127, width: 14, height: 55), cornerRadius: 7)
        dark.setFill()
        rectangle12Path.fill()


        //// Bezier 19 Drawing
        let bezier19Path = UIBezierPath()
        bezier19Path.move(to: CGPoint(x: 796.09, y: 169))
        bezier19Path.addLine(to: CGPoint(x: 201.91, y: 169))
        bezier19Path.addCurve(to: CGPoint(x: 195, y: 162), controlPoint1: CGPoint(x: 198.09, y: 169), controlPoint2: CGPoint(x: 195, y: 165.87))
        bezier19Path.addCurve(to: CGPoint(x: 201.91, y: 155), controlPoint1: CGPoint(x: 195, y: 158.13), controlPoint2: CGPoint(x: 198.09, y: 155))
        bezier19Path.addLine(to: CGPoint(x: 796.09, y: 155))
        bezier19Path.addCurve(to: CGPoint(x: 803, y: 162), controlPoint1: CGPoint(x: 799.91, y: 155), controlPoint2: CGPoint(x: 803, y: 158.13))
        bezier19Path.addCurve(to: CGPoint(x: 796.09, y: 169), controlPoint1: CGPoint(x: 803, y: 165.87), controlPoint2: CGPoint(x: 799.91, y: 169))
        bezier19Path.close()
        bezier19Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier19Path.fill()


        //// Bezier 20 Drawing
        let bezier20Path = UIBezierPath()
        bezier20Path.move(to: CGPoint(x: 119, y: 832))
        bezier20Path.addCurve(to: CGPoint(x: 112, y: 825.1), controlPoint1: CGPoint(x: 115.13, y: 832), controlPoint2: CGPoint(x: 112, y: 828.91))
        bezier20Path.addLine(to: CGPoint(x: 112, y: 410.9))
        bezier20Path.addCurve(to: CGPoint(x: 119, y: 404), controlPoint1: CGPoint(x: 112, y: 407.09), controlPoint2: CGPoint(x: 115.13, y: 404))
        bezier20Path.addCurve(to: CGPoint(x: 126, y: 410.9), controlPoint1: CGPoint(x: 122.87, y: 404), controlPoint2: CGPoint(x: 126, y: 407.09))
        bezier20Path.addLine(to: CGPoint(x: 126, y: 825.1))
        bezier20Path.addCurve(to: CGPoint(x: 119, y: 832), controlPoint1: CGPoint(x: 126, y: 828.91), controlPoint2: CGPoint(x: 122.87, y: 832))
        bezier20Path.close()
        bezier20Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier20Path.fill()


        //// Bezier 21 Drawing
        let bezier21Path = UIBezierPath()
        bezier21Path.move(to: CGPoint(x: 879, y: 832))
        bezier21Path.addCurve(to: CGPoint(x: 872, y: 825.1), controlPoint1: CGPoint(x: 875.13, y: 832), controlPoint2: CGPoint(x: 872, y: 828.91))
        bezier21Path.addLine(to: CGPoint(x: 872, y: 410.9))
        bezier21Path.addCurve(to: CGPoint(x: 879, y: 404), controlPoint1: CGPoint(x: 872, y: 407.09), controlPoint2: CGPoint(x: 875.13, y: 404))
        bezier21Path.addCurve(to: CGPoint(x: 886, y: 410.9), controlPoint1: CGPoint(x: 882.87, y: 404), controlPoint2: CGPoint(x: 886, y: 407.09))
        bezier21Path.addLine(to: CGPoint(x: 886, y: 825.1))
        bezier21Path.addCurve(to: CGPoint(x: 879, y: 832), controlPoint1: CGPoint(x: 886, y: 828.91), controlPoint2: CGPoint(x: 882.87, y: 832))
        bezier21Path.close()
        bezier21Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier21Path.fill()
        
        context.restoreGState()

    }

    @objc dynamic public class func drawCalendar(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 1000, height: 1000), resizing: ResizingBehavior = .aspectFit, white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), light: UIColor = UIColor(red: 0.769, green: 0.847, blue: 0.984, alpha: 1.000), medium: UIColor = UIColor(red: 0.478, green: 0.663, blue: 0.973, alpha: 1.000), dark: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 1000, height: 1000), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 1000, y: resizedFrame.height / 1000)


        //// Group 2
        //// Group 3
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        //// Clip Clip
        let clipPath = UIBezierPath(rect: CGRect(x: 33.43, y: 700.48, width: 682.35, height: 148.35))
        clipPath.addClip()


        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 28.43, y: 695.48, width: 692.35, height: 158.35))
        white.setFill()
        rectanglePath.fill()


        context.endTransparencyLayer()
        context.restoreGState()


        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 715.77, y: 819.12))
        bezierPath.addLine(to: CGPoint(x: 152.08, y: 819.12))
        bezierPath.addLine(to: CGPoint(x: 33.42, y: 700.45))
        bezierPath.addLine(to: CGPoint(x: 33.42, y: 314.78))
        bezierPath.addLine(to: CGPoint(x: 715.77, y: 314.78))
        bezierPath.addLine(to: CGPoint(x: 715.77, y: 819.12))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        light.setFill()
        bezierPath.fill()


        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: 33.43, y: 181.3, width: 682.35, height: 133.5))
        medium.setFill()
        rectangle3Path.fill()


        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(roundedRect: CGRect(x: 137.28, y: 121.97, width: 29.65, height: 118.65), cornerRadius: 14.8)
        light.setFill()
        rectangle4Path.fill()


        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(roundedRect: CGRect(x: 285.58, y: 121.97, width: 29.65, height: 118.65), cornerRadius: 14.8)
        light.setFill()
        rectangle5Path.fill()


        //// Rectangle 6 Drawing
        let rectangle6Path = UIBezierPath(roundedRect: CGRect(x: 433.93, y: 121.97, width: 29.65, height: 118.65), cornerRadius: 14.8)
        light.setFill()
        rectangle6Path.fill()


        //// Rectangle 7 Drawing
        let rectangle7Path = UIBezierPath(roundedRect: CGRect(x: 582.27, y: 121.97, width: 29.65, height: 118.65), cornerRadius: 14.8)
        light.setFill()
        rectangle7Path.fill()


        //// Bezier 2 Drawing
        let bezier2Path = UIBezierPath()
        bezier2Path.move(to: CGPoint(x: 597.1, y: 136.78))
        bezier2Path.addCurve(to: CGPoint(x: 611.93, y: 151.61), controlPoint1: CGPoint(x: 605.3, y: 136.78), controlPoint2: CGPoint(x: 611.93, y: 143.42))
        bezier2Path.addLine(to: CGPoint(x: 611.93, y: 136.78))
        bezier2Path.addCurve(to: CGPoint(x: 597.1, y: 121.94), controlPoint1: CGPoint(x: 611.93, y: 128.58), controlPoint2: CGPoint(x: 605.3, y: 121.94))
        bezier2Path.addCurve(to: CGPoint(x: 582.27, y: 136.78), controlPoint1: CGPoint(x: 588.91, y: 121.94), controlPoint2: CGPoint(x: 582.27, y: 128.58))
        bezier2Path.addLine(to: CGPoint(x: 582.27, y: 151.61))
        bezier2Path.addCurve(to: CGPoint(x: 597.1, y: 136.78), controlPoint1: CGPoint(x: 582.27, y: 143.42), controlPoint2: CGPoint(x: 588.91, y: 136.78))
        bezier2Path.close()
        bezier2Path.usesEvenOddFillRule = true
        white.setFill()
        bezier2Path.fill()


        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 448.76, y: 136.78))
        bezier3Path.addCurve(to: CGPoint(x: 463.59, y: 151.61), controlPoint1: CGPoint(x: 456.95, y: 136.78), controlPoint2: CGPoint(x: 463.59, y: 143.42))
        bezier3Path.addLine(to: CGPoint(x: 463.59, y: 136.78))
        bezier3Path.addCurve(to: CGPoint(x: 448.76, y: 121.94), controlPoint1: CGPoint(x: 463.59, y: 128.58), controlPoint2: CGPoint(x: 456.95, y: 121.94))
        bezier3Path.addCurve(to: CGPoint(x: 433.93, y: 136.78), controlPoint1: CGPoint(x: 440.57, y: 121.94), controlPoint2: CGPoint(x: 433.93, y: 128.58))
        bezier3Path.addLine(to: CGPoint(x: 433.93, y: 151.61))
        bezier3Path.addCurve(to: CGPoint(x: 448.76, y: 136.78), controlPoint1: CGPoint(x: 433.93, y: 143.42), controlPoint2: CGPoint(x: 440.57, y: 136.78))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        white.setFill()
        bezier3Path.fill()


        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 300.42, y: 136.78))
        bezier4Path.addCurve(to: CGPoint(x: 315.26, y: 151.61), controlPoint1: CGPoint(x: 308.61, y: 136.78), controlPoint2: CGPoint(x: 315.26, y: 143.42))
        bezier4Path.addLine(to: CGPoint(x: 315.26, y: 136.78))
        bezier4Path.addCurve(to: CGPoint(x: 300.42, y: 121.94), controlPoint1: CGPoint(x: 315.26, y: 128.58), controlPoint2: CGPoint(x: 308.61, y: 121.94))
        bezier4Path.addCurve(to: CGPoint(x: 285.59, y: 136.78), controlPoint1: CGPoint(x: 292.23, y: 121.94), controlPoint2: CGPoint(x: 285.59, y: 128.58))
        bezier4Path.addLine(to: CGPoint(x: 285.59, y: 151.61))
        bezier4Path.addCurve(to: CGPoint(x: 300.42, y: 136.78), controlPoint1: CGPoint(x: 285.59, y: 143.42), controlPoint2: CGPoint(x: 292.23, y: 136.78))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        white.setFill()
        bezier4Path.fill()


        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 152.08, y: 136.78))
        bezier5Path.addCurve(to: CGPoint(x: 166.92, y: 151.61), controlPoint1: CGPoint(x: 160.29, y: 136.78), controlPoint2: CGPoint(x: 166.92, y: 143.42))
        bezier5Path.addLine(to: CGPoint(x: 166.92, y: 136.78))
        bezier5Path.addCurve(to: CGPoint(x: 152.08, y: 121.94), controlPoint1: CGPoint(x: 166.92, y: 128.58), controlPoint2: CGPoint(x: 160.29, y: 121.94))
        bezier5Path.addCurve(to: CGPoint(x: 137.25, y: 136.78), controlPoint1: CGPoint(x: 143.89, y: 121.94), controlPoint2: CGPoint(x: 137.25, y: 128.58))
        bezier5Path.addLine(to: CGPoint(x: 137.25, y: 151.61))
        bezier5Path.addCurve(to: CGPoint(x: 152.08, y: 136.78), controlPoint1: CGPoint(x: 137.25, y: 143.42), controlPoint2: CGPoint(x: 143.89, y: 136.78))
        bezier5Path.close()
        bezier5Path.usesEvenOddFillRule = true
        white.setFill()
        bezier5Path.fill()


        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 33.42, y: 878.45))
        bezier6Path.addLine(to: CGPoint(x: 738.01, y: 878.45))
        bezier6Path.addLine(to: CGPoint(x: 738.01, y: 848.79))
        bezier6Path.addLine(to: CGPoint(x: 33.42, y: 848.79))
        bezier6Path.addLine(to: CGPoint(x: 33.42, y: 878.45))
        bezier6Path.close()
        bezier6Path.usesEvenOddFillRule = true
        white.setFill()
        bezier6Path.fill()


        //// Rectangle 8 Drawing
        let rectangle8Path = UIBezierPath(rect: CGRect(x: 344.93, y: 359.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle8Path.fill()


        //// Rectangle 9 Drawing
        let rectangle9Path = UIBezierPath(rect: CGRect(x: 433.93, y: 359.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle9Path.fill()


        //// Rectangle 10 Drawing
        let rectangle10Path = UIBezierPath(rect: CGRect(x: 522.93, y: 359.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle10Path.fill()


        //// Rectangle 11 Drawing
        let rectangle11Path = UIBezierPath(rect: CGRect(x: 77.93, y: 448.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle11Path.fill()


        //// Rectangle 12 Drawing
        let rectangle12Path = UIBezierPath(rect: CGRect(x: 166.93, y: 448.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle12Path.fill()


        //// Rectangle 13 Drawing
        let rectangle13Path = UIBezierPath(rect: CGRect(x: 255.93, y: 448.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle13Path.fill()


        //// Rectangle 14 Drawing
        let rectangle14Path = UIBezierPath(rect: CGRect(x: 344.93, y: 448.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle14Path.fill()


        //// Rectangle 15 Drawing
        let rectangle15Path = UIBezierPath(rect: CGRect(x: 433.93, y: 448.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle15Path.fill()


        //// Rectangle 16 Drawing
        let rectangle16Path = UIBezierPath(rect: CGRect(x: 522.93, y: 448.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle16Path.fill()


        //// Rectangle 17 Drawing
        let rectangle17Path = UIBezierPath(rect: CGRect(x: 78.53, y: 537.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle17Path.fill()


        //// Rectangle 18 Drawing
        let rectangle18Path = UIBezierPath(rect: CGRect(x: 77.93, y: 626.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle18Path.fill()


        //// Rectangle 19 Drawing
        let rectangle19Path = UIBezierPath(rect: CGRect(x: 166.93, y: 626.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle19Path.fill()


        //// Rectangle 20 Drawing
        let rectangle20Path = UIBezierPath(rect: CGRect(x: 256.52, y: 626.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle20Path.fill()


        //// Rectangle 21 Drawing
        let rectangle21Path = UIBezierPath(rect: CGRect(x: 345.53, y: 626.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle21Path.fill()


        //// Rectangle 22 Drawing
        let rectangle22Path = UIBezierPath(rect: CGRect(x: 434.53, y: 626.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle22Path.fill()


        //// Rectangle 23 Drawing
        let rectangle23Path = UIBezierPath(rect: CGRect(x: 434.53, y: 715.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle23Path.fill()


        //// Rectangle 24 Drawing
        let rectangle24Path = UIBezierPath(rect: CGRect(x: 345.53, y: 715.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle24Path.fill()


        //// Rectangle 25 Drawing
        let rectangle25Path = UIBezierPath(rect: CGRect(x: 255.93, y: 715.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle25Path.fill()


        //// Rectangle 26 Drawing
        let rectangle26Path = UIBezierPath(rect: CGRect(x: 166.93, y: 715.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle26Path.fill()


        //// Rectangle 27 Drawing
        let rectangle27Path = UIBezierPath(rect: CGRect(x: 167.53, y: 537.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle27Path.fill()


        //// Rectangle 28 Drawing
        let rectangle28Path = UIBezierPath(rect: CGRect(x: 256.52, y: 537.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle28Path.fill()


        //// Rectangle 29 Drawing
        let rectangle29Path = UIBezierPath(rect: CGRect(x: 345.53, y: 537.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle29Path.fill()


        //// Rectangle 30 Drawing
        let rectangle30Path = UIBezierPath(rect: CGRect(x: 434.53, y: 537.27, width: 59.35, height: 59.35))
        white.setFill()
        rectangle30Path.fill()


        //// Bezier 7 Drawing
        let bezier7Path = UIBezierPath()
        bezier7Path.move(to: CGPoint(x: 152.08, y: 819.12))
        bezier7Path.addLine(to: CGPoint(x: 152.08, y: 700.45))
        bezier7Path.addLine(to: CGPoint(x: 33.42, y: 700.45))
        bezier7Path.addLine(to: CGPoint(x: 152.08, y: 819.12))
        bezier7Path.close()
        bezier7Path.usesEvenOddFillRule = true
        white.setFill()
        bezier7Path.fill()


        //// Bezier 8 Drawing
        let bezier8Path = UIBezierPath()
        bezier8Path.move(to: CGPoint(x: 715.77, y: 285.12))
        bezier8Path.addLine(to: CGPoint(x: 715.77, y: 181.28))
        bezier8Path.addLine(to: CGPoint(x: 715.78, y: 181.28))
        bezier8Path.addLine(to: CGPoint(x: 715.78, y: 285.12))
        bezier8Path.addCurve(to: CGPoint(x: 715.77, y: 285.12), controlPoint1: CGPoint(x: 715.77, y: 285.12), controlPoint2: CGPoint(x: 715.77, y: 285.12))
        bezier8Path.close()
        bezier8Path.usesEvenOddFillRule = true
        UIColor.red.setFill()
        bezier8Path.fill()


        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 967.94, y: 648.54))
        bezier9Path.addCurve(to: CGPoint(x: 738.01, y: 878.46), controlPoint1: CGPoint(x: 967.94, y: 775.67), controlPoint2: CGPoint(x: 865.14, y: 878.46))
        bezier9Path.addCurve(to: CGPoint(x: 508.1, y: 648.54), controlPoint1: CGPoint(x: 610.88, y: 878.46), controlPoint2: CGPoint(x: 508.1, y: 775.67))
        bezier9Path.addCurve(to: CGPoint(x: 620.92, y: 371.9), controlPoint1: CGPoint(x: 508.1, y: 531.24), controlPoint2: CGPoint(x: 562.59, y: 438.05))
        bezier9Path.addCurve(to: CGPoint(x: 760.26, y: 255.45), controlPoint1: CGPoint(x: 688.06, y: 295.76), controlPoint2: CGPoint(x: 760.26, y: 255.45))
        bezier9Path.addCurve(to: CGPoint(x: 760.26, y: 374.12), controlPoint1: CGPoint(x: 760.26, y: 255.45), controlPoint2: CGPoint(x: 726.3, y: 340))
        bezier9Path.addCurve(to: CGPoint(x: 849.27, y: 359.28), controlPoint1: CGPoint(x: 794.38, y: 408.08), controlPoint2: CGPoint(x: 849.27, y: 359.28))
        bezier9Path.addCurve(to: CGPoint(x: 967.94, y: 648.54), controlPoint1: CGPoint(x: 849.27, y: 359.28), controlPoint2: CGPoint(x: 967.94, y: 485.96))
        bezier9Path.close()
        bezier9Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier9Path.fill()


        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 537.76, y: 648.54))
        bezier10Path.addCurve(to: CGPoint(x: 752.36, y: 280.08), controlPoint1: CGPoint(x: 537.76, y: 457.61), controlPoint2: CGPoint(x: 682.1, y: 330.61))
        bezier10Path.addCurve(to: CGPoint(x: 760.26, y: 255.44), controlPoint1: CGPoint(x: 756.25, y: 265.56), controlPoint2: CGPoint(x: 760.26, y: 255.44))
        bezier10Path.addCurve(to: CGPoint(x: 508.1, y: 648.53), controlPoint1: CGPoint(x: 760.26, y: 255.44), controlPoint2: CGPoint(x: 508.1, y: 396.22))
        bezier10Path.addCurve(to: CGPoint(x: 738.01, y: 878.46), controlPoint1: CGPoint(x: 508.1, y: 775.66), controlPoint2: CGPoint(x: 610.89, y: 878.46))
        bezier10Path.addCurve(to: CGPoint(x: 752.85, y: 877.7), controlPoint1: CGPoint(x: 743.03, y: 878.46), controlPoint2: CGPoint(x: 747.93, y: 878.02))
        bezier10Path.addCurve(to: CGPoint(x: 537.76, y: 648.54), controlPoint1: CGPoint(x: 632.69, y: 870.04), controlPoint2: CGPoint(x: 537.76, y: 770.65))
        bezier10Path.close()
        bezier10Path.usesEvenOddFillRule = true
        light.setFill()
        bezier10Path.fill()


        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 537.75, y: 448.3, width: 400.5, height: 400.5))
        white.setFill()
        ovalPath.fill()


        //// Group 4
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        //// Clip Clip 2
        let clip2Path = UIBezierPath()
        clip2Path.move(to: CGPoint(x: 48.25, y: 314.79))
        clip2Path.addLine(to: CGPoint(x: 33.42, y: 314.79))
        clip2Path.addLine(to: CGPoint(x: 48.25, y: 314.78))
        clip2Path.addLine(to: CGPoint(x: 48.25, y: 314.79))
        clip2Path.close()
        clip2Path.usesEvenOddFillRule = true
        clip2Path.addClip()


        //// Rectangle 31 Drawing
        let rectangle31Path = UIBezierPath(rect: CGRect(x: 28.43, y: 309.8, width: 24.85, height: 10))
        medium.setFill()
        rectangle31Path.fill()


        context.endTransparencyLayer()
        context.restoreGState()


        //// Bezier 12 Drawing
        let bezier12Path = UIBezierPath()
        bezier12Path.move(to: CGPoint(x: 537.76, y: 826.54))
        bezier12Path.addLine(to: CGPoint(x: 152.08, y: 826.54))
        bezier12Path.addCurve(to: CGPoint(x: 144.67, y: 819.12), controlPoint1: CGPoint(x: 147.99, y: 826.54), controlPoint2: CGPoint(x: 144.67, y: 823.22))
        bezier12Path.addCurve(to: CGPoint(x: 152.08, y: 811.71), controlPoint1: CGPoint(x: 144.67, y: 815.03), controlPoint2: CGPoint(x: 147.99, y: 811.71))
        bezier12Path.addLine(to: CGPoint(x: 537.76, y: 811.71))
        bezier12Path.addCurve(to: CGPoint(x: 545.18, y: 819.12), controlPoint1: CGPoint(x: 541.86, y: 811.71), controlPoint2: CGPoint(x: 545.18, y: 815.03))
        bezier12Path.addCurve(to: CGPoint(x: 537.76, y: 826.54), controlPoint1: CGPoint(x: 545.18, y: 823.22), controlPoint2: CGPoint(x: 541.86, y: 826.54))
        bezier12Path.close()
        bezier12Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier12Path.fill()


        //// Group 5
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        //// Clip Clip 3
        let clip3Path = UIBezierPath()
        clip3Path.move(to: CGPoint(x: 33.42, y: 707.87))
        clip3Path.addCurve(to: CGPoint(x: 26, y: 700.45), controlPoint1: CGPoint(x: 29.32, y: 707.87), controlPoint2: CGPoint(x: 26, y: 704.55))
        clip3Path.addLine(to: CGPoint(x: 26, y: 181.28))
        clip3Path.addCurve(to: CGPoint(x: 33.42, y: 173.86), controlPoint1: CGPoint(x: 26, y: 177.18), controlPoint2: CGPoint(x: 29.32, y: 173.86))
        clip3Path.addCurve(to: CGPoint(x: 40.83, y: 181.28), controlPoint1: CGPoint(x: 37.52, y: 173.86), controlPoint2: CGPoint(x: 40.83, y: 177.18))
        clip3Path.addLine(to: CGPoint(x: 40.83, y: 700.45))
        clip3Path.addCurve(to: CGPoint(x: 33.42, y: 707.87), controlPoint1: CGPoint(x: 40.83, y: 704.55), controlPoint2: CGPoint(x: 37.52, y: 707.87))
        clip3Path.close()
        clip3Path.usesEvenOddFillRule = true
        clip3Path.addClip()


        //// Bezier 13 Drawing
        let bezier13Path = UIBezierPath()
        bezier13Path.move(to: CGPoint(x: 21, y: 168.86))
        bezier13Path.addLine(to: CGPoint(x: 45.83, y: 168.86))
        bezier13Path.addLine(to: CGPoint(x: 45.83, y: 712.87))
        bezier13Path.addLine(to: CGPoint(x: 21, y: 712.87))
        bezier13Path.addLine(to: CGPoint(x: 21, y: 168.86))
        bezier13Path.close()
        dark.setFill()
        bezier13Path.fill()


        context.endTransparencyLayer()
        context.restoreGState()


        //// Bezier 15 Drawing
        let bezier15Path = UIBezierPath()
        bezier15Path.move(to: CGPoint(x: 107.59, y: 188.69))
        bezier15Path.addLine(to: CGPoint(x: 33.42, y: 188.69))
        bezier15Path.addCurve(to: CGPoint(x: 26, y: 181.28), controlPoint1: CGPoint(x: 29.32, y: 188.69), controlPoint2: CGPoint(x: 26, y: 185.38))
        bezier15Path.addCurve(to: CGPoint(x: 33.42, y: 173.86), controlPoint1: CGPoint(x: 26, y: 177.18), controlPoint2: CGPoint(x: 29.32, y: 173.86))
        bezier15Path.addLine(to: CGPoint(x: 107.59, y: 173.86))
        bezier15Path.addCurve(to: CGPoint(x: 115, y: 181.28), controlPoint1: CGPoint(x: 111.69, y: 173.86), controlPoint2: CGPoint(x: 115, y: 177.18))
        bezier15Path.addCurve(to: CGPoint(x: 107.59, y: 188.69), controlPoint1: CGPoint(x: 115, y: 185.38), controlPoint2: CGPoint(x: 111.69, y: 188.69))
        bezier15Path.close()
        bezier15Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier15Path.fill()


        //// Rectangle 32 Drawing
        let rectangle32Path = UIBezierPath(roundedRect: CGRect(x: 634.2, y: 173.87, width: 89, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle32Path.fill()


        //// Rectangle 33 Drawing
        let rectangle33Path = UIBezierPath(roundedRect: CGRect(x: 708.33, y: 173.88, width: 14.85, height: 74.15), cornerRadius: 7.4)
        dark.setFill()
        rectangle33Path.fill()


        //// Bezier 16 Drawing
        let bezier16Path = UIBezierPath()
        bezier16Path.move(to: CGPoint(x: 626.76, y: 322.2))
        bezier16Path.addLine(to: CGPoint(x: 33.42, y: 322.2))
        bezier16Path.addCurve(to: CGPoint(x: 26, y: 314.78), controlPoint1: CGPoint(x: 29.32, y: 322.2), controlPoint2: CGPoint(x: 26, y: 318.88))
        bezier16Path.addCurve(to: CGPoint(x: 33.42, y: 307.36), controlPoint1: CGPoint(x: 26, y: 310.68), controlPoint2: CGPoint(x: 29.32, y: 307.36))
        bezier16Path.addLine(to: CGPoint(x: 626.76, y: 307.36))
        bezier16Path.addCurve(to: CGPoint(x: 634.18, y: 314.78), controlPoint1: CGPoint(x: 630.87, y: 307.36), controlPoint2: CGPoint(x: 634.18, y: 310.68))
        bezier16Path.addCurve(to: CGPoint(x: 626.76, y: 322.2), controlPoint1: CGPoint(x: 634.18, y: 318.88), controlPoint2: CGPoint(x: 630.87, y: 322.2))
        bezier16Path.close()
        bezier16Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier16Path.fill()


        //// Bezier 17 Drawing
        let bezier17Path = UIBezierPath()
        bezier17Path.move(to: CGPoint(x: 352.34, y: 411.2))
        bezier17Path.addLine(to: CGPoint(x: 396.84, y: 411.2))
        bezier17Path.addLine(to: CGPoint(x: 396.84, y: 366.7))
        bezier17Path.addLine(to: CGPoint(x: 352.34, y: 366.7))
        bezier17Path.addLine(to: CGPoint(x: 352.34, y: 411.2))
        bezier17Path.close()
        bezier17Path.move(to: CGPoint(x: 404.26, y: 426.03))
        bezier17Path.addLine(to: CGPoint(x: 344.93, y: 426.03))
        bezier17Path.addCurve(to: CGPoint(x: 337.51, y: 418.61), controlPoint1: CGPoint(x: 340.83, y: 426.03), controlPoint2: CGPoint(x: 337.51, y: 422.71))
        bezier17Path.addLine(to: CGPoint(x: 337.51, y: 359.28))
        bezier17Path.addCurve(to: CGPoint(x: 344.93, y: 351.86), controlPoint1: CGPoint(x: 337.51, y: 355.18), controlPoint2: CGPoint(x: 340.83, y: 351.86))
        bezier17Path.addLine(to: CGPoint(x: 404.26, y: 351.86))
        bezier17Path.addCurve(to: CGPoint(x: 411.68, y: 359.28), controlPoint1: CGPoint(x: 408.36, y: 351.86), controlPoint2: CGPoint(x: 411.68, y: 355.18))
        bezier17Path.addLine(to: CGPoint(x: 411.68, y: 418.61))
        bezier17Path.addCurve(to: CGPoint(x: 404.26, y: 426.03), controlPoint1: CGPoint(x: 411.68, y: 422.71), controlPoint2: CGPoint(x: 408.36, y: 426.03))
        bezier17Path.close()
        bezier17Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier17Path.fill()


        //// Bezier 18 Drawing
        let bezier18Path = UIBezierPath()
        bezier18Path.move(to: CGPoint(x: 441.34, y: 411.2))
        bezier18Path.addLine(to: CGPoint(x: 485.85, y: 411.2))
        bezier18Path.addLine(to: CGPoint(x: 485.85, y: 366.7))
        bezier18Path.addLine(to: CGPoint(x: 441.34, y: 366.7))
        bezier18Path.addLine(to: CGPoint(x: 441.34, y: 411.2))
        bezier18Path.close()
        bezier18Path.move(to: CGPoint(x: 493.27, y: 426.03))
        bezier18Path.addLine(to: CGPoint(x: 433.93, y: 426.03))
        bezier18Path.addCurve(to: CGPoint(x: 426.51, y: 418.61), controlPoint1: CGPoint(x: 429.83, y: 426.03), controlPoint2: CGPoint(x: 426.51, y: 422.71))
        bezier18Path.addLine(to: CGPoint(x: 426.51, y: 359.28))
        bezier18Path.addCurve(to: CGPoint(x: 433.93, y: 351.86), controlPoint1: CGPoint(x: 426.51, y: 355.18), controlPoint2: CGPoint(x: 429.83, y: 351.86))
        bezier18Path.addLine(to: CGPoint(x: 493.27, y: 351.86))
        bezier18Path.addCurve(to: CGPoint(x: 500.68, y: 359.28), controlPoint1: CGPoint(x: 497.37, y: 351.86), controlPoint2: CGPoint(x: 500.68, y: 355.18))
        bezier18Path.addLine(to: CGPoint(x: 500.68, y: 418.61))
        bezier18Path.addCurve(to: CGPoint(x: 493.27, y: 426.03), controlPoint1: CGPoint(x: 500.68, y: 422.71), controlPoint2: CGPoint(x: 497.37, y: 426.03))
        bezier18Path.close()
        bezier18Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier18Path.fill()


        //// Bezier 19 Drawing
        let bezier19Path = UIBezierPath()
        bezier19Path.move(to: CGPoint(x: 522.93, y: 426.03))
        bezier19Path.addCurve(to: CGPoint(x: 515.51, y: 418.61), controlPoint1: CGPoint(x: 518.83, y: 426.03), controlPoint2: CGPoint(x: 515.51, y: 422.71))
        bezier19Path.addLine(to: CGPoint(x: 515.51, y: 359.28))
        bezier19Path.addCurve(to: CGPoint(x: 522.93, y: 351.86), controlPoint1: CGPoint(x: 515.51, y: 355.18), controlPoint2: CGPoint(x: 518.83, y: 351.86))
        bezier19Path.addLine(to: CGPoint(x: 582.27, y: 351.86))
        bezier19Path.addCurve(to: CGPoint(x: 589.68, y: 359.28), controlPoint1: CGPoint(x: 586.36, y: 351.86), controlPoint2: CGPoint(x: 589.68, y: 355.18))
        bezier19Path.addCurve(to: CGPoint(x: 582.27, y: 366.7), controlPoint1: CGPoint(x: 589.68, y: 363.38), controlPoint2: CGPoint(x: 586.36, y: 366.7))
        bezier19Path.addLine(to: CGPoint(x: 530.35, y: 366.7))
        bezier19Path.addLine(to: CGPoint(x: 530.35, y: 418.61))
        bezier19Path.addCurve(to: CGPoint(x: 522.93, y: 426.03), controlPoint1: CGPoint(x: 530.34, y: 422.71), controlPoint2: CGPoint(x: 527.03, y: 426.03))
        bezier19Path.close()
        bezier19Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier19Path.fill()


        //// Bezier 20 Drawing
        let bezier20Path = UIBezierPath()
        bezier20Path.move(to: CGPoint(x: 85.34, y: 500.2))
        bezier20Path.addLine(to: CGPoint(x: 129.84, y: 500.2))
        bezier20Path.addLine(to: CGPoint(x: 129.84, y: 455.7))
        bezier20Path.addLine(to: CGPoint(x: 85.34, y: 455.7))
        bezier20Path.addLine(to: CGPoint(x: 85.34, y: 500.2))
        bezier20Path.close()
        bezier20Path.move(to: CGPoint(x: 137.25, y: 515.03))
        bezier20Path.addLine(to: CGPoint(x: 77.92, y: 515.03))
        bezier20Path.addCurve(to: CGPoint(x: 70.5, y: 507.62), controlPoint1: CGPoint(x: 73.82, y: 515.03), controlPoint2: CGPoint(x: 70.5, y: 511.72))
        bezier20Path.addLine(to: CGPoint(x: 70.5, y: 448.28))
        bezier20Path.addCurve(to: CGPoint(x: 77.92, y: 440.86), controlPoint1: CGPoint(x: 70.5, y: 444.18), controlPoint2: CGPoint(x: 73.82, y: 440.86))
        bezier20Path.addLine(to: CGPoint(x: 137.26, y: 440.86))
        bezier20Path.addCurve(to: CGPoint(x: 144.67, y: 448.28), controlPoint1: CGPoint(x: 141.35, y: 440.86), controlPoint2: CGPoint(x: 144.67, y: 444.18))
        bezier20Path.addLine(to: CGPoint(x: 144.67, y: 507.62))
        bezier20Path.addCurve(to: CGPoint(x: 137.25, y: 515.03), controlPoint1: CGPoint(x: 144.67, y: 511.72), controlPoint2: CGPoint(x: 141.35, y: 515.03))
        bezier20Path.close()
        bezier20Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier20Path.fill()


        //// Bezier 21 Drawing
        let bezier21Path = UIBezierPath()
        bezier21Path.move(to: CGPoint(x: 174.34, y: 500.2))
        bezier21Path.addLine(to: CGPoint(x: 218.84, y: 500.2))
        bezier21Path.addLine(to: CGPoint(x: 218.84, y: 455.7))
        bezier21Path.addLine(to: CGPoint(x: 174.34, y: 455.7))
        bezier21Path.addLine(to: CGPoint(x: 174.34, y: 500.2))
        bezier21Path.close()
        bezier21Path.move(to: CGPoint(x: 226.26, y: 515.03))
        bezier21Path.addLine(to: CGPoint(x: 166.92, y: 515.03))
        bezier21Path.addCurve(to: CGPoint(x: 159.5, y: 507.62), controlPoint1: CGPoint(x: 162.82, y: 515.03), controlPoint2: CGPoint(x: 159.5, y: 511.72))
        bezier21Path.addLine(to: CGPoint(x: 159.5, y: 448.28))
        bezier21Path.addCurve(to: CGPoint(x: 166.92, y: 440.86), controlPoint1: CGPoint(x: 159.5, y: 444.18), controlPoint2: CGPoint(x: 162.82, y: 440.86))
        bezier21Path.addLine(to: CGPoint(x: 226.26, y: 440.86))
        bezier21Path.addCurve(to: CGPoint(x: 233.67, y: 448.28), controlPoint1: CGPoint(x: 230.35, y: 440.86), controlPoint2: CGPoint(x: 233.67, y: 444.18))
        bezier21Path.addLine(to: CGPoint(x: 233.67, y: 507.62))
        bezier21Path.addCurve(to: CGPoint(x: 226.26, y: 515.03), controlPoint1: CGPoint(x: 233.67, y: 511.72), controlPoint2: CGPoint(x: 230.35, y: 515.03))
        bezier21Path.close()
        bezier21Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier21Path.fill()


        //// Bezier 22 Drawing
        let bezier22Path = UIBezierPath()
        bezier22Path.move(to: CGPoint(x: 263.34, y: 500.2))
        bezier22Path.addLine(to: CGPoint(x: 307.84, y: 500.2))
        bezier22Path.addLine(to: CGPoint(x: 307.84, y: 455.7))
        bezier22Path.addLine(to: CGPoint(x: 263.34, y: 455.7))
        bezier22Path.addLine(to: CGPoint(x: 263.34, y: 500.2))
        bezier22Path.close()
        bezier22Path.move(to: CGPoint(x: 315.26, y: 515.03))
        bezier22Path.addLine(to: CGPoint(x: 255.92, y: 515.03))
        bezier22Path.addCurve(to: CGPoint(x: 248.5, y: 507.62), controlPoint1: CGPoint(x: 251.82, y: 515.03), controlPoint2: CGPoint(x: 248.5, y: 511.72))
        bezier22Path.addLine(to: CGPoint(x: 248.5, y: 448.28))
        bezier22Path.addCurve(to: CGPoint(x: 255.92, y: 440.86), controlPoint1: CGPoint(x: 248.5, y: 444.18), controlPoint2: CGPoint(x: 251.82, y: 440.86))
        bezier22Path.addLine(to: CGPoint(x: 315.26, y: 440.86))
        bezier22Path.addCurve(to: CGPoint(x: 322.67, y: 448.28), controlPoint1: CGPoint(x: 319.36, y: 440.86), controlPoint2: CGPoint(x: 322.67, y: 444.18))
        bezier22Path.addLine(to: CGPoint(x: 322.67, y: 507.62))
        bezier22Path.addCurve(to: CGPoint(x: 315.26, y: 515.03), controlPoint1: CGPoint(x: 322.67, y: 511.72), controlPoint2: CGPoint(x: 319.36, y: 515.03))
        bezier22Path.close()
        bezier22Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier22Path.fill()


        //// Bezier 23 Drawing
        let bezier23Path = UIBezierPath()
        bezier23Path.move(to: CGPoint(x: 352.34, y: 500.2))
        bezier23Path.addLine(to: CGPoint(x: 396.84, y: 500.2))
        bezier23Path.addLine(to: CGPoint(x: 396.84, y: 455.7))
        bezier23Path.addLine(to: CGPoint(x: 352.34, y: 455.7))
        bezier23Path.addLine(to: CGPoint(x: 352.34, y: 500.2))
        bezier23Path.close()
        bezier23Path.move(to: CGPoint(x: 404.26, y: 515.03))
        bezier23Path.addLine(to: CGPoint(x: 344.93, y: 515.03))
        bezier23Path.addCurve(to: CGPoint(x: 337.51, y: 507.62), controlPoint1: CGPoint(x: 340.83, y: 515.03), controlPoint2: CGPoint(x: 337.51, y: 511.72))
        bezier23Path.addLine(to: CGPoint(x: 337.51, y: 448.28))
        bezier23Path.addCurve(to: CGPoint(x: 344.93, y: 440.86), controlPoint1: CGPoint(x: 337.51, y: 444.18), controlPoint2: CGPoint(x: 340.83, y: 440.86))
        bezier23Path.addLine(to: CGPoint(x: 404.26, y: 440.86))
        bezier23Path.addCurve(to: CGPoint(x: 411.68, y: 448.28), controlPoint1: CGPoint(x: 408.36, y: 440.86), controlPoint2: CGPoint(x: 411.68, y: 444.18))
        bezier23Path.addLine(to: CGPoint(x: 411.68, y: 507.62))
        bezier23Path.addCurve(to: CGPoint(x: 404.26, y: 515.03), controlPoint1: CGPoint(x: 411.68, y: 511.72), controlPoint2: CGPoint(x: 408.36, y: 515.03))
        bezier23Path.close()
        bezier23Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier23Path.fill()


        //// Bezier 24 Drawing
        let bezier24Path = UIBezierPath()
        bezier24Path.move(to: CGPoint(x: 441.34, y: 500.2))
        bezier24Path.addLine(to: CGPoint(x: 485.85, y: 500.2))
        bezier24Path.addLine(to: CGPoint(x: 485.85, y: 455.7))
        bezier24Path.addLine(to: CGPoint(x: 441.34, y: 455.7))
        bezier24Path.addLine(to: CGPoint(x: 441.34, y: 500.2))
        bezier24Path.close()
        bezier24Path.move(to: CGPoint(x: 493.27, y: 515.03))
        bezier24Path.addLine(to: CGPoint(x: 433.93, y: 515.03))
        bezier24Path.addCurve(to: CGPoint(x: 426.51, y: 507.62), controlPoint1: CGPoint(x: 429.83, y: 515.03), controlPoint2: CGPoint(x: 426.51, y: 511.72))
        bezier24Path.addLine(to: CGPoint(x: 426.51, y: 448.28))
        bezier24Path.addCurve(to: CGPoint(x: 433.93, y: 440.86), controlPoint1: CGPoint(x: 426.51, y: 444.18), controlPoint2: CGPoint(x: 429.83, y: 440.86))
        bezier24Path.addLine(to: CGPoint(x: 493.27, y: 440.86))
        bezier24Path.addCurve(to: CGPoint(x: 500.68, y: 448.28), controlPoint1: CGPoint(x: 497.37, y: 440.86), controlPoint2: CGPoint(x: 500.68, y: 444.18))
        bezier24Path.addLine(to: CGPoint(x: 500.68, y: 507.62))
        bezier24Path.addCurve(to: CGPoint(x: 493.27, y: 515.03), controlPoint1: CGPoint(x: 500.68, y: 511.72), controlPoint2: CGPoint(x: 497.37, y: 515.03))
        bezier24Path.close()
        bezier24Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier24Path.fill()


        //// Rectangle 34 Drawing
        let rectangle34Path = UIBezierPath(roundedRect: CGRect(x: 515.53, y: 440.88, width: 14.85, height: 29.65), cornerRadius: 7.4)
        dark.setFill()
        rectangle34Path.fill()


        //// Bezier 25 Drawing
        let bezier25Path = UIBezierPath()
        bezier25Path.move(to: CGPoint(x: 85.34, y: 589.2))
        bezier25Path.addLine(to: CGPoint(x: 129.84, y: 589.2))
        bezier25Path.addLine(to: CGPoint(x: 129.84, y: 544.7))
        bezier25Path.addLine(to: CGPoint(x: 85.34, y: 544.7))
        bezier25Path.addLine(to: CGPoint(x: 85.34, y: 589.2))
        bezier25Path.close()
        bezier25Path.move(to: CGPoint(x: 137.25, y: 604.04))
        bezier25Path.addLine(to: CGPoint(x: 77.92, y: 604.04))
        bezier25Path.addCurve(to: CGPoint(x: 70.5, y: 596.62), controlPoint1: CGPoint(x: 73.82, y: 604.04), controlPoint2: CGPoint(x: 70.5, y: 600.72))
        bezier25Path.addLine(to: CGPoint(x: 70.5, y: 537.28))
        bezier25Path.addCurve(to: CGPoint(x: 77.92, y: 529.87), controlPoint1: CGPoint(x: 70.5, y: 533.19), controlPoint2: CGPoint(x: 73.82, y: 529.87))
        bezier25Path.addLine(to: CGPoint(x: 137.26, y: 529.87))
        bezier25Path.addCurve(to: CGPoint(x: 144.67, y: 537.28), controlPoint1: CGPoint(x: 141.35, y: 529.87), controlPoint2: CGPoint(x: 144.67, y: 533.19))
        bezier25Path.addLine(to: CGPoint(x: 144.67, y: 596.62))
        bezier25Path.addCurve(to: CGPoint(x: 137.25, y: 604.04), controlPoint1: CGPoint(x: 144.67, y: 600.72), controlPoint2: CGPoint(x: 141.35, y: 604.04))
        bezier25Path.close()
        bezier25Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier25Path.fill()


        //// Bezier 26 Drawing
        let bezier26Path = UIBezierPath()
        bezier26Path.move(to: CGPoint(x: 174.34, y: 589.2))
        bezier26Path.addLine(to: CGPoint(x: 218.84, y: 589.2))
        bezier26Path.addLine(to: CGPoint(x: 218.84, y: 544.7))
        bezier26Path.addLine(to: CGPoint(x: 174.34, y: 544.7))
        bezier26Path.addLine(to: CGPoint(x: 174.34, y: 589.2))
        bezier26Path.close()
        bezier26Path.move(to: CGPoint(x: 226.26, y: 604.04))
        bezier26Path.addLine(to: CGPoint(x: 166.92, y: 604.04))
        bezier26Path.addCurve(to: CGPoint(x: 159.5, y: 596.62), controlPoint1: CGPoint(x: 162.82, y: 604.04), controlPoint2: CGPoint(x: 159.5, y: 600.72))
        bezier26Path.addLine(to: CGPoint(x: 159.5, y: 537.28))
        bezier26Path.addCurve(to: CGPoint(x: 166.92, y: 529.87), controlPoint1: CGPoint(x: 159.5, y: 533.19), controlPoint2: CGPoint(x: 162.82, y: 529.87))
        bezier26Path.addLine(to: CGPoint(x: 226.26, y: 529.87))
        bezier26Path.addCurve(to: CGPoint(x: 233.67, y: 537.28), controlPoint1: CGPoint(x: 230.35, y: 529.87), controlPoint2: CGPoint(x: 233.67, y: 533.19))
        bezier26Path.addLine(to: CGPoint(x: 233.67, y: 596.62))
        bezier26Path.addCurve(to: CGPoint(x: 226.26, y: 604.04), controlPoint1: CGPoint(x: 233.67, y: 600.72), controlPoint2: CGPoint(x: 230.35, y: 604.04))
        bezier26Path.close()
        bezier26Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier26Path.fill()


        //// Bezier 27 Drawing
        let bezier27Path = UIBezierPath()
        bezier27Path.move(to: CGPoint(x: 263.34, y: 589.2))
        bezier27Path.addLine(to: CGPoint(x: 307.84, y: 589.2))
        bezier27Path.addLine(to: CGPoint(x: 307.84, y: 544.7))
        bezier27Path.addLine(to: CGPoint(x: 263.34, y: 544.7))
        bezier27Path.addLine(to: CGPoint(x: 263.34, y: 589.2))
        bezier27Path.close()
        bezier27Path.move(to: CGPoint(x: 315.26, y: 604.04))
        bezier27Path.addLine(to: CGPoint(x: 255.92, y: 604.04))
        bezier27Path.addCurve(to: CGPoint(x: 248.5, y: 596.62), controlPoint1: CGPoint(x: 251.82, y: 604.04), controlPoint2: CGPoint(x: 248.5, y: 600.72))
        bezier27Path.addLine(to: CGPoint(x: 248.5, y: 537.28))
        bezier27Path.addCurve(to: CGPoint(x: 255.92, y: 529.87), controlPoint1: CGPoint(x: 248.5, y: 533.19), controlPoint2: CGPoint(x: 251.82, y: 529.87))
        bezier27Path.addLine(to: CGPoint(x: 315.26, y: 529.87))
        bezier27Path.addCurve(to: CGPoint(x: 322.67, y: 537.28), controlPoint1: CGPoint(x: 319.36, y: 529.87), controlPoint2: CGPoint(x: 322.67, y: 533.19))
        bezier27Path.addLine(to: CGPoint(x: 322.67, y: 596.62))
        bezier27Path.addCurve(to: CGPoint(x: 315.26, y: 604.04), controlPoint1: CGPoint(x: 322.67, y: 600.72), controlPoint2: CGPoint(x: 319.36, y: 604.04))
        bezier27Path.close()
        bezier27Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier27Path.fill()


        //// Bezier 28 Drawing
        let bezier28Path = UIBezierPath()
        bezier28Path.move(to: CGPoint(x: 352.34, y: 589.2))
        bezier28Path.addLine(to: CGPoint(x: 396.84, y: 589.2))
        bezier28Path.addLine(to: CGPoint(x: 396.84, y: 544.7))
        bezier28Path.addLine(to: CGPoint(x: 352.34, y: 544.7))
        bezier28Path.addLine(to: CGPoint(x: 352.34, y: 589.2))
        bezier28Path.close()
        bezier28Path.move(to: CGPoint(x: 404.26, y: 604.04))
        bezier28Path.addLine(to: CGPoint(x: 344.93, y: 604.04))
        bezier28Path.addCurve(to: CGPoint(x: 337.51, y: 596.62), controlPoint1: CGPoint(x: 340.83, y: 604.04), controlPoint2: CGPoint(x: 337.51, y: 600.72))
        bezier28Path.addLine(to: CGPoint(x: 337.51, y: 537.28))
        bezier28Path.addCurve(to: CGPoint(x: 344.93, y: 529.87), controlPoint1: CGPoint(x: 337.51, y: 533.19), controlPoint2: CGPoint(x: 340.83, y: 529.87))
        bezier28Path.addLine(to: CGPoint(x: 404.26, y: 529.87))
        bezier28Path.addCurve(to: CGPoint(x: 411.68, y: 537.28), controlPoint1: CGPoint(x: 408.36, y: 529.87), controlPoint2: CGPoint(x: 411.68, y: 533.19))
        bezier28Path.addLine(to: CGPoint(x: 411.68, y: 596.62))
        bezier28Path.addCurve(to: CGPoint(x: 404.26, y: 604.04), controlPoint1: CGPoint(x: 411.68, y: 600.72), controlPoint2: CGPoint(x: 408.36, y: 604.04))
        bezier28Path.close()
        bezier28Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier28Path.fill()


        //// Bezier 29 Drawing
        let bezier29Path = UIBezierPath()
        bezier29Path.move(to: CGPoint(x: 433.93, y: 604.04))
        bezier29Path.addCurve(to: CGPoint(x: 426.51, y: 596.62), controlPoint1: CGPoint(x: 429.83, y: 604.04), controlPoint2: CGPoint(x: 426.51, y: 600.72))
        bezier29Path.addLine(to: CGPoint(x: 426.51, y: 537.28))
        bezier29Path.addCurve(to: CGPoint(x: 433.93, y: 529.87), controlPoint1: CGPoint(x: 426.51, y: 533.19), controlPoint2: CGPoint(x: 429.83, y: 529.87))
        bezier29Path.addLine(to: CGPoint(x: 493.27, y: 529.87))
        bezier29Path.addCurve(to: CGPoint(x: 500.68, y: 537.28), controlPoint1: CGPoint(x: 497.37, y: 529.87), controlPoint2: CGPoint(x: 500.68, y: 533.19))
        bezier29Path.addCurve(to: CGPoint(x: 493.27, y: 544.7), controlPoint1: CGPoint(x: 500.68, y: 541.38), controlPoint2: CGPoint(x: 497.37, y: 544.7))
        bezier29Path.addLine(to: CGPoint(x: 441.34, y: 544.7))
        bezier29Path.addLine(to: CGPoint(x: 441.34, y: 596.62))
        bezier29Path.addCurve(to: CGPoint(x: 433.93, y: 604.04), controlPoint1: CGPoint(x: 441.34, y: 600.72), controlPoint2: CGPoint(x: 438.03, y: 604.04))
        bezier29Path.close()
        bezier29Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier29Path.fill()


        //// Bezier 30 Drawing
        let bezier30Path = UIBezierPath()
        bezier30Path.move(to: CGPoint(x: 263.34, y: 678.21))
        bezier30Path.addLine(to: CGPoint(x: 307.84, y: 678.21))
        bezier30Path.addLine(to: CGPoint(x: 307.84, y: 633.71))
        bezier30Path.addLine(to: CGPoint(x: 263.34, y: 633.71))
        bezier30Path.addLine(to: CGPoint(x: 263.34, y: 678.21))
        bezier30Path.close()
        bezier30Path.move(to: CGPoint(x: 315.26, y: 693.04))
        bezier30Path.addLine(to: CGPoint(x: 255.92, y: 693.04))
        bezier30Path.addCurve(to: CGPoint(x: 248.5, y: 685.62), controlPoint1: CGPoint(x: 251.82, y: 693.04), controlPoint2: CGPoint(x: 248.5, y: 689.72))
        bezier30Path.addLine(to: CGPoint(x: 248.5, y: 626.29))
        bezier30Path.addCurve(to: CGPoint(x: 255.92, y: 618.87), controlPoint1: CGPoint(x: 248.5, y: 622.19), controlPoint2: CGPoint(x: 251.82, y: 618.87))
        bezier30Path.addLine(to: CGPoint(x: 315.26, y: 618.87))
        bezier30Path.addCurve(to: CGPoint(x: 322.67, y: 626.29), controlPoint1: CGPoint(x: 319.36, y: 618.87), controlPoint2: CGPoint(x: 322.67, y: 622.19))
        bezier30Path.addLine(to: CGPoint(x: 322.67, y: 685.62))
        bezier30Path.addCurve(to: CGPoint(x: 315.26, y: 693.04), controlPoint1: CGPoint(x: 322.67, y: 689.72), controlPoint2: CGPoint(x: 319.36, y: 693.04))
        bezier30Path.close()
        bezier30Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier30Path.fill()


        //// Bezier 31 Drawing
        let bezier31Path = UIBezierPath()
        bezier31Path.move(to: CGPoint(x: 352.34, y: 678.21))
        bezier31Path.addLine(to: CGPoint(x: 396.84, y: 678.21))
        bezier31Path.addLine(to: CGPoint(x: 396.84, y: 633.71))
        bezier31Path.addLine(to: CGPoint(x: 352.34, y: 633.71))
        bezier31Path.addLine(to: CGPoint(x: 352.34, y: 678.21))
        bezier31Path.close()
        bezier31Path.move(to: CGPoint(x: 404.26, y: 693.04))
        bezier31Path.addLine(to: CGPoint(x: 344.93, y: 693.04))
        bezier31Path.addCurve(to: CGPoint(x: 337.51, y: 685.62), controlPoint1: CGPoint(x: 340.83, y: 693.04), controlPoint2: CGPoint(x: 337.51, y: 689.72))
        bezier31Path.addLine(to: CGPoint(x: 337.51, y: 626.29))
        bezier31Path.addCurve(to: CGPoint(x: 344.93, y: 618.87), controlPoint1: CGPoint(x: 337.51, y: 622.19), controlPoint2: CGPoint(x: 340.83, y: 618.87))
        bezier31Path.addLine(to: CGPoint(x: 404.26, y: 618.87))
        bezier31Path.addCurve(to: CGPoint(x: 411.68, y: 626.29), controlPoint1: CGPoint(x: 408.36, y: 618.87), controlPoint2: CGPoint(x: 411.68, y: 622.19))
        bezier31Path.addLine(to: CGPoint(x: 411.68, y: 685.62))
        bezier31Path.addCurve(to: CGPoint(x: 404.26, y: 693.04), controlPoint1: CGPoint(x: 411.68, y: 689.72), controlPoint2: CGPoint(x: 408.36, y: 693.04))
        bezier31Path.close()
        bezier31Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier31Path.fill()


        //// Bezier 32 Drawing
        let bezier32Path = UIBezierPath()
        bezier32Path.move(to: CGPoint(x: 478.44, y: 693.04))
        bezier32Path.addLine(to: CGPoint(x: 433.92, y: 693.04))
        bezier32Path.addCurve(to: CGPoint(x: 426.51, y: 685.62), controlPoint1: CGPoint(x: 429.83, y: 693.04), controlPoint2: CGPoint(x: 426.51, y: 689.72))
        bezier32Path.addLine(to: CGPoint(x: 426.51, y: 626.29))
        bezier32Path.addCurve(to: CGPoint(x: 433.92, y: 618.87), controlPoint1: CGPoint(x: 426.51, y: 622.19), controlPoint2: CGPoint(x: 429.82, y: 618.87))
        bezier32Path.addLine(to: CGPoint(x: 478.44, y: 618.87))
        bezier32Path.addCurve(to: CGPoint(x: 485.85, y: 626.29), controlPoint1: CGPoint(x: 482.53, y: 618.87), controlPoint2: CGPoint(x: 485.85, y: 622.19))
        bezier32Path.addCurve(to: CGPoint(x: 478.44, y: 633.7), controlPoint1: CGPoint(x: 485.85, y: 630.39), controlPoint2: CGPoint(x: 482.53, y: 633.7))
        bezier32Path.addLine(to: CGPoint(x: 441.34, y: 633.7))
        bezier32Path.addLine(to: CGPoint(x: 441.34, y: 678.2))
        bezier32Path.addLine(to: CGPoint(x: 478.44, y: 678.2))
        bezier32Path.addCurve(to: CGPoint(x: 485.85, y: 685.62), controlPoint1: CGPoint(x: 482.53, y: 678.2), controlPoint2: CGPoint(x: 485.85, y: 681.52))
        bezier32Path.addCurve(to: CGPoint(x: 478.44, y: 693.04), controlPoint1: CGPoint(x: 485.85, y: 689.72), controlPoint2: CGPoint(x: 482.53, y: 693.04))
        bezier32Path.close()
        bezier32Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier32Path.fill()


        //// Bezier 33 Drawing
        let bezier33Path = UIBezierPath()
        bezier33Path.move(to: CGPoint(x: 263.34, y: 767.21))
        bezier33Path.addLine(to: CGPoint(x: 307.84, y: 767.21))
        bezier33Path.addLine(to: CGPoint(x: 307.84, y: 722.71))
        bezier33Path.addLine(to: CGPoint(x: 263.34, y: 722.71))
        bezier33Path.addLine(to: CGPoint(x: 263.34, y: 767.21))
        bezier33Path.close()
        bezier33Path.move(to: CGPoint(x: 315.26, y: 782.04))
        bezier33Path.addLine(to: CGPoint(x: 255.92, y: 782.04))
        bezier33Path.addCurve(to: CGPoint(x: 248.5, y: 774.62), controlPoint1: CGPoint(x: 251.82, y: 782.04), controlPoint2: CGPoint(x: 248.5, y: 778.72))
        bezier33Path.addLine(to: CGPoint(x: 248.5, y: 715.29))
        bezier33Path.addCurve(to: CGPoint(x: 255.92, y: 707.87), controlPoint1: CGPoint(x: 248.5, y: 711.19), controlPoint2: CGPoint(x: 251.82, y: 707.87))
        bezier33Path.addLine(to: CGPoint(x: 315.26, y: 707.87))
        bezier33Path.addCurve(to: CGPoint(x: 322.67, y: 715.29), controlPoint1: CGPoint(x: 319.36, y: 707.87), controlPoint2: CGPoint(x: 322.67, y: 711.19))
        bezier33Path.addLine(to: CGPoint(x: 322.67, y: 774.62))
        bezier33Path.addCurve(to: CGPoint(x: 315.26, y: 782.04), controlPoint1: CGPoint(x: 322.67, y: 778.72), controlPoint2: CGPoint(x: 319.36, y: 782.04))
        bezier33Path.close()
        bezier33Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier33Path.fill()


        //// Bezier 34 Drawing
        let bezier34Path = UIBezierPath()
        bezier34Path.move(to: CGPoint(x: 352.34, y: 767.21))
        bezier34Path.addLine(to: CGPoint(x: 396.84, y: 767.21))
        bezier34Path.addLine(to: CGPoint(x: 396.84, y: 722.71))
        bezier34Path.addLine(to: CGPoint(x: 352.34, y: 722.71))
        bezier34Path.addLine(to: CGPoint(x: 352.34, y: 767.21))
        bezier34Path.close()
        bezier34Path.move(to: CGPoint(x: 404.26, y: 782.04))
        bezier34Path.addLine(to: CGPoint(x: 344.93, y: 782.04))
        bezier34Path.addCurve(to: CGPoint(x: 337.51, y: 774.62), controlPoint1: CGPoint(x: 340.83, y: 782.04), controlPoint2: CGPoint(x: 337.51, y: 778.72))
        bezier34Path.addLine(to: CGPoint(x: 337.51, y: 715.29))
        bezier34Path.addCurve(to: CGPoint(x: 344.93, y: 707.87), controlPoint1: CGPoint(x: 337.51, y: 711.19), controlPoint2: CGPoint(x: 340.83, y: 707.87))
        bezier34Path.addLine(to: CGPoint(x: 404.26, y: 707.87))
        bezier34Path.addCurve(to: CGPoint(x: 411.68, y: 715.29), controlPoint1: CGPoint(x: 408.36, y: 707.87), controlPoint2: CGPoint(x: 411.68, y: 711.19))
        bezier34Path.addLine(to: CGPoint(x: 411.68, y: 774.62))
        bezier34Path.addCurve(to: CGPoint(x: 404.26, y: 782.04), controlPoint1: CGPoint(x: 411.68, y: 778.72), controlPoint2: CGPoint(x: 408.36, y: 782.04))
        bezier34Path.close()
        bezier34Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier34Path.fill()


        //// Bezier 35 Drawing
        let bezier35Path = UIBezierPath()
        bezier35Path.move(to: CGPoint(x: 493.27, y: 782.04))
        bezier35Path.addLine(to: CGPoint(x: 433.93, y: 782.04))
        bezier35Path.addCurve(to: CGPoint(x: 426.51, y: 774.62), controlPoint1: CGPoint(x: 429.83, y: 782.04), controlPoint2: CGPoint(x: 426.51, y: 778.72))
        bezier35Path.addLine(to: CGPoint(x: 426.51, y: 715.29))
        bezier35Path.addCurve(to: CGPoint(x: 433.93, y: 707.87), controlPoint1: CGPoint(x: 426.51, y: 711.19), controlPoint2: CGPoint(x: 429.83, y: 707.87))
        bezier35Path.addCurve(to: CGPoint(x: 441.34, y: 715.29), controlPoint1: CGPoint(x: 438.03, y: 707.87), controlPoint2: CGPoint(x: 441.34, y: 711.19))
        bezier35Path.addLine(to: CGPoint(x: 441.34, y: 767.2))
        bezier35Path.addLine(to: CGPoint(x: 493.27, y: 767.2))
        bezier35Path.addCurve(to: CGPoint(x: 500.68, y: 774.62), controlPoint1: CGPoint(x: 497.37, y: 767.2), controlPoint2: CGPoint(x: 500.68, y: 770.52))
        bezier35Path.addCurve(to: CGPoint(x: 493.27, y: 782.04), controlPoint1: CGPoint(x: 500.68, y: 778.72), controlPoint2: CGPoint(x: 497.37, y: 782.04))
        bezier35Path.close()
        bezier35Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier35Path.fill()


        //// Bezier 36 Drawing
        let bezier36Path = UIBezierPath()
        bezier36Path.move(to: CGPoint(x: 567.43, y: 856.21))
        bezier36Path.addLine(to: CGPoint(x: 33.42, y: 856.21))
        bezier36Path.addCurve(to: CGPoint(x: 26, y: 848.79), controlPoint1: CGPoint(x: 29.32, y: 856.21), controlPoint2: CGPoint(x: 26, y: 852.89))
        bezier36Path.addCurve(to: CGPoint(x: 33.42, y: 841.38), controlPoint1: CGPoint(x: 26, y: 844.69), controlPoint2: CGPoint(x: 29.32, y: 841.38))
        bezier36Path.addLine(to: CGPoint(x: 567.43, y: 841.38))
        bezier36Path.addCurve(to: CGPoint(x: 574.84, y: 848.79), controlPoint1: CGPoint(x: 571.53, y: 841.38), controlPoint2: CGPoint(x: 574.84, y: 844.69))
        bezier36Path.addCurve(to: CGPoint(x: 567.43, y: 856.21), controlPoint1: CGPoint(x: 574.85, y: 852.89), controlPoint2: CGPoint(x: 571.53, y: 856.21))
        bezier36Path.close()
        bezier36Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier36Path.fill()


        //// Bezier 37 Drawing
        let bezier37Path = UIBezierPath()
        bezier37Path.move(to: CGPoint(x: 611.93, y: 885.88))
        bezier37Path.addLine(to: CGPoint(x: 33.42, y: 885.88))
        bezier37Path.addCurve(to: CGPoint(x: 26, y: 878.46), controlPoint1: CGPoint(x: 29.32, y: 885.88), controlPoint2: CGPoint(x: 26, y: 882.56))
        bezier37Path.addCurve(to: CGPoint(x: 33.42, y: 871.04), controlPoint1: CGPoint(x: 26, y: 874.36), controlPoint2: CGPoint(x: 29.32, y: 871.04))
        bezier37Path.addLine(to: CGPoint(x: 611.93, y: 871.04))
        bezier37Path.addCurve(to: CGPoint(x: 619.35, y: 878.46), controlPoint1: CGPoint(x: 616.03, y: 871.04), controlPoint2: CGPoint(x: 619.35, y: 874.36))
        bezier37Path.addCurve(to: CGPoint(x: 611.93, y: 885.88), controlPoint1: CGPoint(x: 619.35, y: 882.56), controlPoint2: CGPoint(x: 616.03, y: 885.88))
        bezier37Path.close()
        bezier37Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier37Path.fill()


        //// Bezier 38 Drawing
        let bezier38Path = UIBezierPath()
        bezier38Path.move(to: CGPoint(x: 152.08, y: 826.54))
        bezier38Path.addCurve(to: CGPoint(x: 146.84, y: 824.37), controlPoint1: CGPoint(x: 150.19, y: 826.54), controlPoint2: CGPoint(x: 148.29, y: 825.82))
        bezier38Path.addLine(to: CGPoint(x: 28.17, y: 705.7))
        bezier38Path.addCurve(to: CGPoint(x: 28.17, y: 695.21), controlPoint1: CGPoint(x: 25.27, y: 702.8), controlPoint2: CGPoint(x: 25.27, y: 698.11))
        bezier38Path.addCurve(to: CGPoint(x: 38.66, y: 695.21), controlPoint1: CGPoint(x: 31.07, y: 692.31), controlPoint2: CGPoint(x: 35.77, y: 692.31))
        bezier38Path.addLine(to: CGPoint(x: 157.33, y: 813.88))
        bezier38Path.addCurve(to: CGPoint(x: 157.33, y: 824.37), controlPoint1: CGPoint(x: 160.23, y: 816.78), controlPoint2: CGPoint(x: 160.23, y: 821.47))
        bezier38Path.addCurve(to: CGPoint(x: 152.08, y: 826.54), controlPoint1: CGPoint(x: 155.88, y: 825.82), controlPoint2: CGPoint(x: 153.98, y: 826.54))
        bezier38Path.close()
        bezier38Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier38Path.fill()


        //// Rectangle 35 Drawing
        let rectangle35Path = UIBezierPath(roundedRect: CGRect(x: 144.68, y: 693.05, width: 14.85, height: 133.5), cornerRadius: 7.4)
        dark.setFill()
        rectangle35Path.fill()


        //// Bezier 39 Drawing
        let bezier39Path = UIBezierPath()
        bezier39Path.move(to: CGPoint(x: 152.08, y: 707.87))
        bezier39Path.addLine(to: CGPoint(x: 33.42, y: 707.87))
        bezier39Path.addCurve(to: CGPoint(x: 26, y: 700.45), controlPoint1: CGPoint(x: 29.32, y: 707.87), controlPoint2: CGPoint(x: 26, y: 704.55))
        bezier39Path.addCurve(to: CGPoint(x: 33.42, y: 693.04), controlPoint1: CGPoint(x: 26, y: 696.36), controlPoint2: CGPoint(x: 29.32, y: 693.04))
        bezier39Path.addLine(to: CGPoint(x: 152.08, y: 693.04))
        bezier39Path.addCurve(to: CGPoint(x: 159.5, y: 700.45), controlPoint1: CGPoint(x: 156.19, y: 693.04), controlPoint2: CGPoint(x: 159.5, y: 696.36))
        bezier39Path.addCurve(to: CGPoint(x: 152.08, y: 707.87), controlPoint1: CGPoint(x: 159.5, y: 704.55), controlPoint2: CGPoint(x: 156.19, y: 707.87))
        bezier39Path.close()
        bezier39Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier39Path.fill()


        //// Bezier 40 Drawing
        let bezier40Path = UIBezierPath()
        bezier40Path.move(to: CGPoint(x: 33.42, y: 856.21))
        bezier40Path.addCurve(to: CGPoint(x: 26, y: 848.79), controlPoint1: CGPoint(x: 29.32, y: 856.21), controlPoint2: CGPoint(x: 26, y: 852.89))
        bezier40Path.addLine(to: CGPoint(x: 26, y: 741.87))
        bezier40Path.addCurve(to: CGPoint(x: 33.42, y: 734.45), controlPoint1: CGPoint(x: 26, y: 737.77), controlPoint2: CGPoint(x: 29.32, y: 734.45))
        bezier40Path.addCurve(to: CGPoint(x: 40.83, y: 741.87), controlPoint1: CGPoint(x: 37.52, y: 734.45), controlPoint2: CGPoint(x: 40.83, y: 737.77))
        bezier40Path.addLine(to: CGPoint(x: 40.83, y: 848.79))
        bezier40Path.addCurve(to: CGPoint(x: 33.42, y: 856.21), controlPoint1: CGPoint(x: 40.83, y: 852.89), controlPoint2: CGPoint(x: 37.52, y: 856.21))
        bezier40Path.close()
        bezier40Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier40Path.fill()


        //// Rectangle 36 Drawing
        let rectangle36Path = UIBezierPath(roundedRect: CGRect(x: 70.53, y: 618.88, width: 74.15, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle36Path.fill()


        //// Rectangle 37 Drawing
        let rectangle37Path = UIBezierPath(roundedRect: CGRect(x: 129.83, y: 618.88, width: 14.85, height: 59.35), cornerRadius: 7.4)
        dark.setFill()
        rectangle37Path.fill()


        //// Rectangle 38 Drawing
        let rectangle38Path = UIBezierPath(roundedRect: CGRect(x: 70.48, y: 618.88, width: 14.85, height: 59.35), cornerRadius: 7.4)
        dark.setFill()
        rectangle38Path.fill()


        //// Rectangle 39 Drawing
        let rectangle39Path = UIBezierPath(roundedRect: CGRect(x: 159.47, y: 618.88, width: 14.85, height: 59.35), cornerRadius: 7.4)
        dark.setFill()
        rectangle39Path.fill()


        //// Rectangle 40 Drawing
        let rectangle40Path = UIBezierPath(roundedRect: CGRect(x: 159.53, y: 618.88, width: 74.15, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle40Path.fill()


        //// Rectangle 41 Drawing
        let rectangle41Path = UIBezierPath(roundedRect: CGRect(x: 218.82, y: 618.88, width: 14.85, height: 74.15), cornerRadius: 7.4)
        dark.setFill()
        rectangle41Path.fill()


        //// Rectangle 42 Drawing
        let rectangle42Path = UIBezierPath(roundedRect: CGRect(x: 174.32, y: 678.17, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle42Path.fill()


        //// Rectangle 43 Drawing
        let rectangle43Path = UIBezierPath(roundedRect: CGRect(x: 218.82, y: 707.88, width: 14.85, height: 74.15), cornerRadius: 7.4)
        dark.setFill()
        rectangle43Path.fill()


        //// Rectangle 44 Drawing
        let rectangle44Path = UIBezierPath(roundedRect: CGRect(x: 174.32, y: 767.17, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle44Path.fill()


        //// Rectangle 45 Drawing
        let rectangle45Path = UIBezierPath(roundedRect: CGRect(x: 174.32, y: 707.88, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle45Path.fill()


        //// Rectangle 46 Drawing
        let rectangle46Path = UIBezierPath(roundedRect: CGRect(x: 77.93, y: 277.67, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle46Path.fill()


        //// Rectangle 47 Drawing
        let rectangle47Path = UIBezierPath(roundedRect: CGRect(x: 166.93, y: 277.67, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle47Path.fill()


        //// Rectangle 48 Drawing
        let rectangle48Path = UIBezierPath(roundedRect: CGRect(x: 255.93, y: 277.67, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle48Path.fill()


        //// Rectangle 49 Drawing
        let rectangle49Path = UIBezierPath(roundedRect: CGRect(x: 344.93, y: 277.67, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle49Path.fill()


        //// Rectangle 50 Drawing
        let rectangle50Path = UIBezierPath(roundedRect: CGRect(x: 433.93, y: 277.67, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle50Path.fill()


        //// Rectangle 51 Drawing
        let rectangle51Path = UIBezierPath(roundedRect: CGRect(x: 522.93, y: 277.67, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle51Path.fill()


        //// Rectangle 52 Drawing
        let rectangle52Path = UIBezierPath(roundedRect: CGRect(x: 611.93, y: 277.67, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle52Path.fill()


        //// Bezier 41 Drawing
        let bezier41Path = UIBezierPath()
        bezier41Path.move(to: CGPoint(x: 152.08, y: 129.36))
        bezier41Path.addCurve(to: CGPoint(x: 144.67, y: 136.78), controlPoint1: CGPoint(x: 148, y: 129.36), controlPoint2: CGPoint(x: 144.67, y: 132.68))
        bezier41Path.addLine(to: CGPoint(x: 144.67, y: 225.78))
        bezier41Path.addCurve(to: CGPoint(x: 152.08, y: 233.2), controlPoint1: CGPoint(x: 144.67, y: 229.87), controlPoint2: CGPoint(x: 148, y: 233.2))
        bezier41Path.addCurve(to: CGPoint(x: 159.5, y: 225.78), controlPoint1: CGPoint(x: 156.18, y: 233.2), controlPoint2: CGPoint(x: 159.5, y: 229.87))
        bezier41Path.addLine(to: CGPoint(x: 159.5, y: 136.78))
        bezier41Path.addCurve(to: CGPoint(x: 152.08, y: 129.36), controlPoint1: CGPoint(x: 159.5, y: 132.68), controlPoint2: CGPoint(x: 156.18, y: 129.36))
        bezier41Path.close()
        bezier41Path.move(to: CGPoint(x: 152.08, y: 248.03))
        bezier41Path.addCurve(to: CGPoint(x: 129.84, y: 225.78), controlPoint1: CGPoint(x: 139.82, y: 248.03), controlPoint2: CGPoint(x: 129.84, y: 238.05))
        bezier41Path.addLine(to: CGPoint(x: 129.84, y: 136.78))
        bezier41Path.addCurve(to: CGPoint(x: 152.08, y: 114.53), controlPoint1: CGPoint(x: 129.84, y: 124.51), controlPoint2: CGPoint(x: 139.82, y: 114.53))
        bezier41Path.addCurve(to: CGPoint(x: 174.34, y: 136.78), controlPoint1: CGPoint(x: 164.36, y: 114.53), controlPoint2: CGPoint(x: 174.34, y: 124.51))
        bezier41Path.addLine(to: CGPoint(x: 174.34, y: 225.78))
        bezier41Path.addCurve(to: CGPoint(x: 152.08, y: 248.03), controlPoint1: CGPoint(x: 174.34, y: 238.05), controlPoint2: CGPoint(x: 164.36, y: 248.03))
        bezier41Path.close()
        bezier41Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier41Path.fill()


        //// Bezier 42 Drawing
        let bezier42Path = UIBezierPath()
        bezier42Path.move(to: CGPoint(x: 300.42, y: 129.36))
        bezier42Path.addCurve(to: CGPoint(x: 293.01, y: 136.78), controlPoint1: CGPoint(x: 296.33, y: 129.36), controlPoint2: CGPoint(x: 293.01, y: 132.68))
        bezier42Path.addLine(to: CGPoint(x: 293.01, y: 225.78))
        bezier42Path.addCurve(to: CGPoint(x: 300.42, y: 233.2), controlPoint1: CGPoint(x: 293.01, y: 229.87), controlPoint2: CGPoint(x: 296.33, y: 233.2))
        bezier42Path.addCurve(to: CGPoint(x: 307.84, y: 225.78), controlPoint1: CGPoint(x: 304.52, y: 233.2), controlPoint2: CGPoint(x: 307.84, y: 229.87))
        bezier42Path.addLine(to: CGPoint(x: 307.84, y: 136.78))
        bezier42Path.addCurve(to: CGPoint(x: 300.42, y: 129.36), controlPoint1: CGPoint(x: 307.84, y: 132.68), controlPoint2: CGPoint(x: 304.52, y: 129.36))
        bezier42Path.close()
        bezier42Path.move(to: CGPoint(x: 300.42, y: 248.03))
        bezier42Path.addCurve(to: CGPoint(x: 278.17, y: 225.78), controlPoint1: CGPoint(x: 288.15, y: 248.03), controlPoint2: CGPoint(x: 278.17, y: 238.05))
        bezier42Path.addLine(to: CGPoint(x: 278.17, y: 136.78))
        bezier42Path.addCurve(to: CGPoint(x: 300.42, y: 114.53), controlPoint1: CGPoint(x: 278.17, y: 124.51), controlPoint2: CGPoint(x: 288.15, y: 114.53))
        bezier42Path.addCurve(to: CGPoint(x: 322.67, y: 136.78), controlPoint1: CGPoint(x: 312.69, y: 114.53), controlPoint2: CGPoint(x: 322.67, y: 124.51))
        bezier42Path.addLine(to: CGPoint(x: 322.67, y: 225.78))
        bezier42Path.addCurve(to: CGPoint(x: 300.42, y: 248.03), controlPoint1: CGPoint(x: 322.67, y: 238.05), controlPoint2: CGPoint(x: 312.69, y: 248.03))
        bezier42Path.close()
        bezier42Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier42Path.fill()


        //// Bezier 43 Drawing
        let bezier43Path = UIBezierPath()
        bezier43Path.move(to: CGPoint(x: 448.77, y: 129.36))
        bezier43Path.addCurve(to: CGPoint(x: 441.34, y: 136.78), controlPoint1: CGPoint(x: 444.68, y: 129.36), controlPoint2: CGPoint(x: 441.34, y: 132.68))
        bezier43Path.addLine(to: CGPoint(x: 441.34, y: 225.78))
        bezier43Path.addCurve(to: CGPoint(x: 448.77, y: 233.2), controlPoint1: CGPoint(x: 441.34, y: 229.87), controlPoint2: CGPoint(x: 444.67, y: 233.2))
        bezier43Path.addCurve(to: CGPoint(x: 456.18, y: 225.78), controlPoint1: CGPoint(x: 452.86, y: 233.2), controlPoint2: CGPoint(x: 456.18, y: 229.87))
        bezier43Path.addLine(to: CGPoint(x: 456.18, y: 136.78))
        bezier43Path.addCurve(to: CGPoint(x: 448.77, y: 129.36), controlPoint1: CGPoint(x: 456.18, y: 132.68), controlPoint2: CGPoint(x: 452.86, y: 129.36))
        bezier43Path.close()
        bezier43Path.move(to: CGPoint(x: 448.77, y: 248.03))
        bezier43Path.addCurve(to: CGPoint(x: 426.51, y: 225.78), controlPoint1: CGPoint(x: 436.5, y: 248.03), controlPoint2: CGPoint(x: 426.51, y: 238.05))
        bezier43Path.addLine(to: CGPoint(x: 426.51, y: 136.78))
        bezier43Path.addCurve(to: CGPoint(x: 448.77, y: 114.53), controlPoint1: CGPoint(x: 426.51, y: 124.51), controlPoint2: CGPoint(x: 436.5, y: 114.53))
        bezier43Path.addCurve(to: CGPoint(x: 471.02, y: 136.78), controlPoint1: CGPoint(x: 461.04, y: 114.53), controlPoint2: CGPoint(x: 471.02, y: 124.51))
        bezier43Path.addLine(to: CGPoint(x: 471.02, y: 225.78))
        bezier43Path.addCurve(to: CGPoint(x: 448.77, y: 248.03), controlPoint1: CGPoint(x: 471.02, y: 238.05), controlPoint2: CGPoint(x: 461.04, y: 248.03))
        bezier43Path.close()
        bezier43Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier43Path.fill()


        //// Bezier 44 Drawing
        let bezier44Path = UIBezierPath()
        bezier44Path.move(to: CGPoint(x: 597.1, y: 129.36))
        bezier44Path.addCurve(to: CGPoint(x: 589.68, y: 136.78), controlPoint1: CGPoint(x: 593.01, y: 129.36), controlPoint2: CGPoint(x: 589.68, y: 132.68))
        bezier44Path.addLine(to: CGPoint(x: 589.68, y: 225.78))
        bezier44Path.addCurve(to: CGPoint(x: 597.1, y: 233.2), controlPoint1: CGPoint(x: 589.68, y: 229.87), controlPoint2: CGPoint(x: 593.01, y: 233.2))
        bezier44Path.addCurve(to: CGPoint(x: 604.51, y: 225.78), controlPoint1: CGPoint(x: 601.18, y: 233.2), controlPoint2: CGPoint(x: 604.51, y: 229.87))
        bezier44Path.addLine(to: CGPoint(x: 604.51, y: 136.78))
        bezier44Path.addCurve(to: CGPoint(x: 597.1, y: 129.36), controlPoint1: CGPoint(x: 604.51, y: 132.68), controlPoint2: CGPoint(x: 601.18, y: 129.36))
        bezier44Path.close()
        bezier44Path.move(to: CGPoint(x: 597.1, y: 248.03))
        bezier44Path.addCurve(to: CGPoint(x: 574.85, y: 225.78), controlPoint1: CGPoint(x: 584.83, y: 248.03), controlPoint2: CGPoint(x: 574.85, y: 238.05))
        bezier44Path.addLine(to: CGPoint(x: 574.85, y: 136.78))
        bezier44Path.addCurve(to: CGPoint(x: 597.1, y: 114.53), controlPoint1: CGPoint(x: 574.85, y: 124.51), controlPoint2: CGPoint(x: 584.83, y: 114.53))
        bezier44Path.addCurve(to: CGPoint(x: 619.35, y: 136.78), controlPoint1: CGPoint(x: 609.37, y: 114.53), controlPoint2: CGPoint(x: 619.35, y: 124.51))
        bezier44Path.addLine(to: CGPoint(x: 619.35, y: 225.78))
        bezier44Path.addCurve(to: CGPoint(x: 597.1, y: 248.03), controlPoint1: CGPoint(x: 619.35, y: 238.05), controlPoint2: CGPoint(x: 609.37, y: 248.03))
        bezier44Path.close()
        bezier44Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier44Path.fill()


        //// Rectangle 53 Drawing
        let rectangle53Path = UIBezierPath(roundedRect: CGRect(x: 189.18, y: 173.87, width: 74.15, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle53Path.fill()


        //// Rectangle 54 Drawing
        let rectangle54Path = UIBezierPath(roundedRect: CGRect(x: 337.53, y: 173.87, width: 74.15, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle54Path.fill()


        //// Rectangle 55 Drawing
        let rectangle55Path = UIBezierPath(roundedRect: CGRect(x: 485.88, y: 173.87, width: 74.15, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle55Path.fill()


        //// Bezier 45 Drawing
        let bezier45Path = UIBezierPath()
        bezier45Path.move(to: CGPoint(x: 738.01, y: 885.88))
        bezier45Path.addCurve(to: CGPoint(x: 730.6, y: 878.46), controlPoint1: CGPoint(x: 733.92, y: 885.88), controlPoint2: CGPoint(x: 730.6, y: 882.56))
        bezier45Path.addCurve(to: CGPoint(x: 738.01, y: 871.04), controlPoint1: CGPoint(x: 730.6, y: 874.36), controlPoint2: CGPoint(x: 733.92, y: 871.04))
        bezier45Path.addCurve(to: CGPoint(x: 960.52, y: 648.54), controlPoint1: CGPoint(x: 860.71, y: 871.04), controlPoint2: CGPoint(x: 960.52, y: 771.23))
        bezier45Path.addCurve(to: CGPoint(x: 967.94, y: 641.12), controlPoint1: CGPoint(x: 960.52, y: 644.44), controlPoint2: CGPoint(x: 963.84, y: 641.12))
        bezier45Path.addCurve(to: CGPoint(x: 975.35, y: 648.54), controlPoint1: CGPoint(x: 972.03, y: 641.12), controlPoint2: CGPoint(x: 975.35, y: 644.44))
        bezier45Path.addCurve(to: CGPoint(x: 738.01, y: 885.88), controlPoint1: CGPoint(x: 975.35, y: 779.4), controlPoint2: CGPoint(x: 868.88, y: 885.88))
        bezier45Path.close()
        bezier45Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier45Path.fill()


        //// Bezier 46 Drawing
        let bezier46Path = UIBezierPath()
        bezier46Path.move(to: CGPoint(x: 738.01, y: 885.88))
        bezier46Path.addCurve(to: CGPoint(x: 500.68, y: 648.54), controlPoint1: CGPoint(x: 607.15, y: 885.88), controlPoint2: CGPoint(x: 500.68, y: 779.4))
        bezier46Path.addCurve(to: CGPoint(x: 508.1, y: 641.12), controlPoint1: CGPoint(x: 500.68, y: 644.44), controlPoint2: CGPoint(x: 504, y: 641.12))
        bezier46Path.addCurve(to: CGPoint(x: 515.51, y: 648.54), controlPoint1: CGPoint(x: 512.2, y: 641.12), controlPoint2: CGPoint(x: 515.51, y: 644.44))
        bezier46Path.addCurve(to: CGPoint(x: 738.02, y: 871.04), controlPoint1: CGPoint(x: 515.51, y: 771.23), controlPoint2: CGPoint(x: 615.32, y: 871.04))
        bezier46Path.addCurve(to: CGPoint(x: 745.43, y: 878.46), controlPoint1: CGPoint(x: 742.12, y: 871.04), controlPoint2: CGPoint(x: 745.43, y: 874.36))
        bezier46Path.addCurve(to: CGPoint(x: 738.01, y: 885.88), controlPoint1: CGPoint(x: 745.43, y: 882.56), controlPoint2: CGPoint(x: 742.12, y: 885.88))
        bezier46Path.close()
        bezier46Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier46Path.fill()


        //// Bezier 47 Drawing
        let bezier47Path = UIBezierPath()
        bezier47Path.move(to: CGPoint(x: 967.94, y: 655.95))
        bezier47Path.addCurve(to: CGPoint(x: 960.52, y: 648.54), controlPoint1: CGPoint(x: 963.84, y: 655.95), controlPoint2: CGPoint(x: 960.52, y: 652.64))
        bezier47Path.addCurve(to: CGPoint(x: 848.41, y: 369.53), controlPoint1: CGPoint(x: 960.52, y: 508.82), controlPoint2: CGPoint(x: 870, y: 394.73))
        bezier47Path.addCurve(to: CGPoint(x: 755.04, y: 379.37), controlPoint1: CGPoint(x: 832.44, y: 381.78), controlPoint2: CGPoint(x: 787.02, y: 411.25))
        bezier47Path.addCurve(to: CGPoint(x: 746.65, y: 272.68), controlPoint1: CGPoint(x: 728.53, y: 352.75), controlPoint2: CGPoint(x: 738.38, y: 301.17))
        bezier47Path.addCurve(to: CGPoint(x: 515.51, y: 648.54), controlPoint1: CGPoint(x: 690.36, y: 309.86), controlPoint2: CGPoint(x: 515.51, y: 442))
        bezier47Path.addCurve(to: CGPoint(x: 508.1, y: 655.95), controlPoint1: CGPoint(x: 515.51, y: 652.64), controlPoint2: CGPoint(x: 512.2, y: 655.95))
        bezier47Path.addCurve(to: CGPoint(x: 500.68, y: 648.54), controlPoint1: CGPoint(x: 503.99, y: 655.95), controlPoint2: CGPoint(x: 500.68, y: 652.64))
        bezier47Path.addCurve(to: CGPoint(x: 756.65, y: 248.97), controlPoint1: CGPoint(x: 500.68, y: 394.8), controlPoint2: CGPoint(x: 754.1, y: 250.4))
        bezier47Path.addCurve(to: CGPoint(x: 765.16, y: 249.87), controlPoint1: CGPoint(x: 759.38, y: 247.46), controlPoint2: CGPoint(x: 762.8, y: 247.81))
        bezier47Path.addCurve(to: CGPoint(x: 767.15, y: 258.2), controlPoint1: CGPoint(x: 767.53, y: 251.95), controlPoint2: CGPoint(x: 768.32, y: 255.29))
        bezier47Path.addCurve(to: CGPoint(x: 765.52, y: 368.87), controlPoint1: CGPoint(x: 766.83, y: 259.01), controlPoint2: CGPoint(x: 735.41, y: 338.63))
        bezier47Path.addCurve(to: CGPoint(x: 844.34, y: 353.74), controlPoint1: CGPoint(x: 794.32, y: 397.57), controlPoint2: CGPoint(x: 843.84, y: 354.19))
        bezier47Path.addCurve(to: CGPoint(x: 854.69, y: 354.21), controlPoint1: CGPoint(x: 847.33, y: 351.06), controlPoint2: CGPoint(x: 851.94, y: 351.27))
        bezier47Path.addCurve(to: CGPoint(x: 975.36, y: 648.53), controlPoint1: CGPoint(x: 859.61, y: 359.47), controlPoint2: CGPoint(x: 975.36, y: 484.91))
        bezier47Path.addCurve(to: CGPoint(x: 967.94, y: 655.95), controlPoint1: CGPoint(x: 975.35, y: 652.64), controlPoint2: CGPoint(x: 972.03, y: 655.95))
        bezier47Path.close()
        bezier47Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier47Path.fill()


        //// Oval 2 Drawing
        let oval2Path = UIBezierPath(ovalIn: CGRect(x: 730.95, y: 470.55, width: 14.9, height: 14.8))
        dark.setFill()
        oval2Path.fill()


        //// Oval 3 Drawing
        let oval3Path = UIBezierPath(ovalIn: CGRect(x: 730.95, y: 811.7, width: 14.9, height: 14.8))
        dark.setFill()
        oval3Path.fill()


        //// Oval 4 Drawing
        let oval4Path = UIBezierPath(ovalIn: CGRect(x: 645.65, y: 493.4, width: 14.9, height: 14.8))
        dark.setFill()
        oval4Path.fill()


        //// Oval 5 Drawing
        let oval5Path = UIBezierPath(ovalIn: CGRect(x: 816.2, y: 788.85, width: 14.9, height: 14.8))
        dark.setFill()
        oval5Path.fill()


        //// Oval 6 Drawing
        let oval6Path = UIBezierPath(ovalIn: CGRect(x: 583.2, y: 555.85, width: 14.9, height: 14.8))
        dark.setFill()
        oval6Path.fill()


        //// Oval 7 Drawing
        let oval7Path = UIBezierPath(ovalIn: CGRect(x: 878.65, y: 726.45, width: 14.9, height: 14.8))
        dark.setFill()
        oval7Path.fill()


        //// Oval 8 Drawing
        let oval8Path = UIBezierPath(ovalIn: CGRect(x: 560.3, y: 641.15, width: 14.9, height: 14.8))
        dark.setFill()
        oval8Path.fill()


        //// Oval 9 Drawing
        let oval9Path = UIBezierPath(ovalIn: CGRect(x: 901.5, y: 641.15, width: 14.9, height: 14.8))
        dark.setFill()
        oval9Path.fill()


        //// Oval 10 Drawing
        let oval10Path = UIBezierPath(ovalIn: CGRect(x: 583.15, y: 726.45, width: 14.9, height: 14.8))
        dark.setFill()
        oval10Path.fill()


        //// Oval 11 Drawing
        let oval11Path = UIBezierPath(ovalIn: CGRect(x: 878.65, y: 555.85, width: 14.9, height: 14.8))
        dark.setFill()
        oval11Path.fill()


        //// Oval 12 Drawing
        let oval12Path = UIBezierPath(ovalIn: CGRect(x: 645.6, y: 788.9, width: 14.9, height: 14.8))
        dark.setFill()
        oval12Path.fill()


        //// Oval 13 Drawing
        let oval13Path = UIBezierPath(ovalIn: CGRect(x: 816.2, y: 493.4, width: 14.9, height: 14.8))
        dark.setFill()
        oval13Path.fill()


        //// Group 6
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)

        //// Clip Clip 4
        let clip4Path = UIBezierPath()
        clip4Path.move(to: CGPoint(x: 738.01, y: 455.7))
        clip4Path.addCurve(to: CGPoint(x: 545.18, y: 648.54), controlPoint1: CGPoint(x: 631.69, y: 455.7), controlPoint2: CGPoint(x: 545.18, y: 542.21))
        clip4Path.addCurve(to: CGPoint(x: 738.01, y: 841.38), controlPoint1: CGPoint(x: 545.18, y: 754.86), controlPoint2: CGPoint(x: 631.69, y: 841.38))
        clip4Path.addCurve(to: CGPoint(x: 930.85, y: 648.54), controlPoint1: CGPoint(x: 844.34, y: 841.38), controlPoint2: CGPoint(x: 930.85, y: 754.86))
        clip4Path.addCurve(to: CGPoint(x: 738.01, y: 455.7), controlPoint1: CGPoint(x: 930.85, y: 542.21), controlPoint2: CGPoint(x: 844.34, y: 455.7))
        clip4Path.close()
        clip4Path.move(to: CGPoint(x: 738.01, y: 856.21))
        clip4Path.addCurve(to: CGPoint(x: 530.34, y: 648.54), controlPoint1: CGPoint(x: 623.5, y: 856.21), controlPoint2: CGPoint(x: 530.34, y: 763.05))
        clip4Path.addCurve(to: CGPoint(x: 738.01, y: 440.86), controlPoint1: CGPoint(x: 530.34, y: 534.02), controlPoint2: CGPoint(x: 623.5, y: 440.86))
        clip4Path.addCurve(to: CGPoint(x: 945.69, y: 648.54), controlPoint1: CGPoint(x: 852.53, y: 440.86), controlPoint2: CGPoint(x: 945.69, y: 534.02))
        clip4Path.addCurve(to: CGPoint(x: 738.01, y: 856.21), controlPoint1: CGPoint(x: 945.69, y: 763.05), controlPoint2: CGPoint(x: 852.53, y: 856.21))
        clip4Path.close()
        clip4Path.usesEvenOddFillRule = true
        clip4Path.addClip()


        //// Rectangle 56 Drawing
        let rectangle56Path = UIBezierPath(rect: CGRect(x: 525.33, y: 435.88, width: 425.35, height: 425.35))
        dark.setFill()
        rectangle56Path.fill()


        context.endTransparencyLayer()
        context.restoreGState()


        //// Rectangle 57 Drawing
        let rectangle57Path = UIBezierPath(roundedRect: CGRect(x: 730.58, y: 515.05, width: 14.85, height: 140.9), cornerRadius: 7.4)
        dark.setFill()
        rectangle57Path.fill()


        //// Bezier 49 Drawing
        let bezier49Path = UIBezierPath()
        bezier49Path.move(to: CGPoint(x: 819.6, y: 737.54))
        bezier49Path.addCurve(to: CGPoint(x: 814.36, y: 735.37), controlPoint1: CGPoint(x: 817.7, y: 737.54), controlPoint2: CGPoint(x: 815.81, y: 736.81))
        bezier49Path.addLine(to: CGPoint(x: 732.77, y: 653.78))
        bezier49Path.addCurve(to: CGPoint(x: 732.77, y: 643.29), controlPoint1: CGPoint(x: 729.88, y: 650.88), controlPoint2: CGPoint(x: 729.88, y: 646.19))
        bezier49Path.addCurve(to: CGPoint(x: 743.26, y: 643.29), controlPoint1: CGPoint(x: 735.67, y: 640.39), controlPoint2: CGPoint(x: 740.36, y: 640.39))
        bezier49Path.addLine(to: CGPoint(x: 824.85, y: 724.88))
        bezier49Path.addCurve(to: CGPoint(x: 824.85, y: 735.37), controlPoint1: CGPoint(x: 827.74, y: 727.78), controlPoint2: CGPoint(x: 827.74, y: 732.47))
        bezier49Path.addCurve(to: CGPoint(x: 819.6, y: 737.54), controlPoint1: CGPoint(x: 823.4, y: 736.81), controlPoint2: CGPoint(x: 821.5, y: 737.54))
        bezier49Path.close()
        bezier49Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier49Path.fill()


        //// Rectangle 58 Drawing
        let rectangle58Path = UIBezierPath(roundedRect: CGRect(x: 426.53, y: 589.17, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle58Path.fill()


        //// Rectangle 59 Drawing
        let rectangle59Path = UIBezierPath(roundedRect: CGRect(x: 574.83, y: 351.87, width: 14.85, height: 29.65), cornerRadius: 7.4)
        dark.setFill()
        rectangle59Path.fill()


        //// Rectangle 60 Drawing
        let rectangle60Path = UIBezierPath(roundedRect: CGRect(x: 515.53, y: 411.17, width: 29.65, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle60Path.fill()


        //// Rectangle 61 Drawing
        let rectangle61Path = UIBezierPath(roundedRect: CGRect(x: 485.82, y: 737.55, width: 14.85, height: 44.5), cornerRadius: 7.4)
        dark.setFill()
        rectangle61Path.fill()


        //// Rectangle 62 Drawing
        let rectangle62Path = UIBezierPath(roundedRect: CGRect(x: 426.53, y: 707.88, width: 59.35, height: 14.85), cornerRadius: 7.4)
        dark.setFill()
        rectangle62Path.fill()
        
        context.restoreGState()

    }
    
    @objc dynamic public class func drawHeadphones(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 1000, height: 1000), resizing: ResizingBehavior = .aspectFit, white: UIColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 1.000), light: UIColor = UIColor(red: 0.769, green: 0.847, blue: 0.984, alpha: 1.000), medium: UIColor = UIColor(red: 0.478, green: 0.663, blue: 0.973, alpha: 1.000), dark: UIColor = UIColor(red: 0.000, green: 0.478, blue: 1.000, alpha: 1.000)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 1000, height: 1000), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 1000, y: resizedFrame.height / 1000)
        
        
        //// Group 2
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 663.17, y: 669.21))
        bezierPath.addLine(to: CGPoint(x: 680.79, y: 629.17))
        bezierPath.addCurve(to: CGPoint(x: 757.34, y: 599.2), controlPoint1: CGPoint(x: 693.6, y: 599.77), controlPoint2: CGPoint(x: 727.93, y: 586.24))
        bezierPath.addCurve(to: CGPoint(x: 789.5, y: 634.86), controlPoint1: CGPoint(x: 773.34, y: 606.2), controlPoint2: CGPoint(x: 784.56, y: 619.42))
        bezierPath.addLine(to: CGPoint(x: 802.75, y: 640.69))
        bezierPath.addLine(to: CGPoint(x: 678.46, y: 924.59))
        bezierPath.addLine(to: CGPoint(x: 665.22, y: 918.76))
        bezierPath.addCurve(to: CGPoint(x: 617.34, y: 919.35), controlPoint1: CGPoint(x: 650.66, y: 925.61), controlPoint2: CGPoint(x: 633.34, y: 926.18))
        bezierPath.addCurve(to: CGPoint(x: 587.35, y: 842.61), controlPoint1: CGPoint(x: 587.93, y: 906.39), controlPoint2: CGPoint(x: 574.4, y: 872.04))
        bezierPath.addLine(to: CGPoint(x: 604.82, y: 802.57))
        bezierPath.addLine(to: CGPoint(x: 634.06, y: 735.89))
        bezierPath.addLine(to: CGPoint(x: 663.17, y: 669.21))
        bezierPath.close()
        bezierPath.usesEvenOddFillRule = true
        medium.setFill()
        bezierPath.fill()
        
        
        //// Group 3
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        //// Clip Clip
        let clipPath = UIBezierPath()
        clipPath.move(to: CGPoint(x: 616.92, y: 857.07))
        clipPath.addLine(to: CGPoint(x: 634.37, y: 817.05))
        clipPath.addLine(to: CGPoint(x: 663.6, y: 750.39))
        clipPath.addLine(to: CGPoint(x: 692.69, y: 683.73))
        clipPath.addLine(to: CGPoint(x: 710.31, y: 643.71))
        clipPath.addCurve(to: CGPoint(x: 773.55, y: 609.88), controlPoint1: CGPoint(x: 721.21, y: 618.67), controlPoint2: CGPoint(x: 747.76, y: 605.31))
        clipPath.addCurve(to: CGPoint(x: 757.71, y: 599.2), controlPoint1: CGPoint(x: 768.94, y: 605.62), controlPoint2: CGPoint(x: 763.79, y: 601.84))
        clipPath.addCurve(to: CGPoint(x: 681.22, y: 629.16), controlPoint1: CGPoint(x: 728.33, y: 586.23), controlPoint2: CGPoint(x: 694.01, y: 599.76))
        clipPath.addLine(to: CGPoint(x: 663.6, y: 669.18))
        clipPath.addLine(to: CGPoint(x: 634.51, y: 735.83))
        clipPath.addLine(to: CGPoint(x: 605.28, y: 802.49))
        clipPath.addLine(to: CGPoint(x: 587.83, y: 842.51))
        clipPath.addCurve(to: CGPoint(x: 617.8, y: 919.23), controlPoint1: CGPoint(x: 574.89, y: 871.93), controlPoint2: CGPoint(x: 588.41, y: 906.27))
        clipPath.addCurve(to: CGPoint(x: 630.99, y: 923.07), controlPoint1: CGPoint(x: 622.13, y: 921.08), controlPoint2: CGPoint(x: 626.55, y: 922.27))
        clipPath.addCurve(to: CGPoint(x: 616.92, y: 857.07), controlPoint1: CGPoint(x: 613.24, y: 906.67), controlPoint2: CGPoint(x: 606.65, y: 880.4))
        clipPath.close()
        clipPath.usesEvenOddFillRule = true
        clipPath.addClip()
        
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 577.92, y: 589.25, width: 200.65, height: 338.8))
        light.setFill()
        rectanglePath.fill()
        
        
        context.endTransparencyLayer()
        context.restoreGState()
        
        
        //// Bezier 34 Drawing
        let bezier34Path = UIBezierPath()
        bezier34Path.move(to: CGPoint(x: 690.76, y: 686.15))
        bezier34Path.addCurve(to: CGPoint(x: 687.85, y: 685.55), controlPoint1: CGPoint(x: 689.78, y: 686.15), controlPoint2: CGPoint(x: 688.8, y: 685.95))
        bezier34Path.addLine(to: CGPoint(x: 661.21, y: 673.9))
        bezier34Path.addCurve(to: CGPoint(x: 657.46, y: 664.31), controlPoint1: CGPoint(x: 657.53, y: 672.27), controlPoint2: CGPoint(x: 655.86, y: 667.98))
        bezier34Path.addCurve(to: CGPoint(x: 667.04, y: 660.56), controlPoint1: CGPoint(x: 659.07, y: 660.62), controlPoint2: CGPoint(x: 663.37, y: 658.94))
        bezier34Path.addLine(to: CGPoint(x: 693.67, y: 672.22))
        bezier34Path.addCurve(to: CGPoint(x: 697.42, y: 681.8), controlPoint1: CGPoint(x: 697.37, y: 673.81), controlPoint2: CGPoint(x: 699.05, y: 678.1))
        bezier34Path.addCurve(to: CGPoint(x: 690.76, y: 686.15), controlPoint1: CGPoint(x: 696.23, y: 684.53), controlPoint2: CGPoint(x: 693.56, y: 686.15))
        bezier34Path.close()
        bezier34Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier34Path.fill()
        
        
        //// Bezier 3 Drawing
        let bezier3Path = UIBezierPath()
        bezier3Path.move(to: CGPoint(x: 847.27, y: 639.24))
        bezier3Path.addCurve(to: CGPoint(x: 853.82, y: 644.33), controlPoint1: CGPoint(x: 849.46, y: 640.55), controlPoint2: CGPoint(x: 851.79, y: 642.28))
        bezier3Path.addLine(to: CGPoint(x: 874.72, y: 657.44))
        bezier3Path.addCurve(to: CGPoint(x: 762.28, y: 927.95), controlPoint1: CGPoint(x: 857.69, y: 757.31), controlPoint2: CGPoint(x: 820.78, y: 845.82))
        bezier3Path.addLine(to: CGPoint(x: 744.96, y: 944.98))
        bezier3Path.addCurve(to: CGPoint(x: 697.23, y: 954.27), controlPoint1: CGPoint(x: 726.18, y: 966.96), controlPoint2: CGPoint(x: 707.71, y: 958.8))
        bezier3Path.addLine(to: CGPoint(x: 670.6, y: 942.64))
        bezier3Path.addLine(to: CGPoint(x: 678.46, y: 924.59))
        bezier3Path.addLine(to: CGPoint(x: 802.75, y: 640.69))
        bezier3Path.addLine(to: CGPoint(x: 810.75, y: 622.49))
        bezier3Path.addLine(to: CGPoint(x: 837.38, y: 634.29))
        bezier3Path.addCurve(to: CGPoint(x: 847.27, y: 639.24), controlPoint1: CGPoint(x: 840.3, y: 635.46), controlPoint2: CGPoint(x: 843.78, y: 637.05))
        bezier3Path.close()
        bezier3Path.usesEvenOddFillRule = true
        light.setFill()
        bezier3Path.fill()
        
        
        //// Bezier 4 Drawing
        let bezier4Path = UIBezierPath()
        bezier4Path.move(to: CGPoint(x: 495.09, y: 71.44))
        bezier4Path.addCurve(to: CGPoint(x: 169.82, y: 264.93), controlPoint1: CGPoint(x: 308.51, y: 71.44), controlPoint2: CGPoint(x: 215.23, y: 176.56))
        bezier4Path.addCurve(to: CGPoint(x: 165.16, y: 274.39), controlPoint1: CGPoint(x: 168.22, y: 267.98), controlPoint2: CGPoint(x: 166.62, y: 271.19))
        bezier4Path.addCurve(to: CGPoint(x: 242, y: 927.95), controlPoint1: CGPoint(x: 73.48, y: 463.36), controlPoint2: CGPoint(x: 105.2, y: 736.21))
        bezier4Path.addLine(to: CGPoint(x: 218.43, y: 944.98))
        bezier4Path.addCurve(to: CGPoint(x: 495.09, y: 42.32), controlPoint1: CGPoint(x: -19.52, y: 611.86), controlPoint2: CGPoint(x: 51.93, y: 42.32))
        bezier4Path.addCurve(to: CGPoint(x: 786, y: 944.98), controlPoint1: CGPoint(x: 938.37, y: 42.32), controlPoint2: CGPoint(x: 1023.8, y: 611.86))
        bezier4Path.addLine(to: CGPoint(x: 762.28, y: 927.95))
        bezier4Path.addCurve(to: CGPoint(x: 876.38, y: 648.11), controlPoint1: CGPoint(x: 820.78, y: 845.82), controlPoint2: CGPoint(x: 859.35, y: 747.98))
        bezier4Path.addCurve(to: CGPoint(x: 830.83, y: 275.99), controlPoint1: CGPoint(x: 898.79, y: 517.51), controlPoint2: CGPoint(x: 884.68, y: 383.29))
        bezier4Path.addCurve(to: CGPoint(x: 828.64, y: 271.62), controlPoint1: CGPoint(x: 830.11, y: 274.54), controlPoint2: CGPoint(x: 829.38, y: 273.08))
        bezier4Path.addCurve(to: CGPoint(x: 495.09, y: 71.44), controlPoint1: CGPoint(x: 781.64, y: 180.34), controlPoint2: CGPoint(x: 685.74, y: 71.44))
        bezier4Path.close()
        bezier4Path.usesEvenOddFillRule = true
        light.setFill()
        bezier4Path.fill()
        
        
        //// Bezier 5 Drawing
        let bezier5Path = UIBezierPath()
        bezier5Path.move(to: CGPoint(x: 861.61, y: 649.22))
        bezier5Path.addCurve(to: CGPoint(x: 718.58, y: 959.48), controlPoint1: CGPoint(x: 844.5, y: 748.66), controlPoint2: CGPoint(x: 786.05, y: 879.38))
        bezier5Path.addCurve(to: CGPoint(x: 744.96, y: 944.98), controlPoint1: CGPoint(x: 726.71, y: 959.2), controlPoint2: CGPoint(x: 735.79, y: 955.7))
        bezier5Path.addLine(to: CGPoint(x: 762.28, y: 927.95))
        bezier5Path.addCurve(to: CGPoint(x: 874.72, y: 657.44), controlPoint1: CGPoint(x: 820.78, y: 845.82), controlPoint2: CGPoint(x: 857.69, y: 757.31))
        bezier5Path.addLine(to: CGPoint(x: 861.61, y: 649.22))
        bezier5Path.close()
        bezier5Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier5Path.fill()
        
        
        //// Bezier 6 Drawing
        let bezier6Path = UIBezierPath()
        bezier6Path.move(to: CGPoint(x: 324.01, y: 629.17))
        bezier6Path.addCurve(to: CGPoint(x: 247.47, y: 599.2), controlPoint1: CGPoint(x: 311.21, y: 599.77), controlPoint2: CGPoint(x: 276.86, y: 586.24))
        bezier6Path.addCurve(to: CGPoint(x: 215.3, y: 634.86), controlPoint1: CGPoint(x: 231.46, y: 606.2), controlPoint2: CGPoint(x: 220.25, y: 619.42))
        bezier6Path.addLine(to: CGPoint(x: 202.06, y: 640.69))
        bezier6Path.addLine(to: CGPoint(x: 326.34, y: 924.59))
        bezier6Path.addLine(to: CGPoint(x: 339.59, y: 918.76))
        bezier6Path.addCurve(to: CGPoint(x: 387.47, y: 919.35), controlPoint1: CGPoint(x: 354.14, y: 925.61), controlPoint2: CGPoint(x: 371.46, y: 926.18))
        bezier6Path.addCurve(to: CGPoint(x: 417.45, y: 842.61), controlPoint1: CGPoint(x: 416.87, y: 906.39), controlPoint2: CGPoint(x: 430.4, y: 872.04))
        bezier6Path.addLine(to: CGPoint(x: 399.98, y: 802.57))
        bezier6Path.addLine(to: CGPoint(x: 370.73, y: 735.89))
        bezier6Path.addLine(to: CGPoint(x: 341.63, y: 669.21))
        bezier6Path.addLine(to: CGPoint(x: 324.01, y: 629.17))
        bezier6Path.close()
        bezier6Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier6Path.fill()
        
        
        //// Group 4
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        //// Clip Clip 2
        let clip2Path = UIBezierPath()
        clip2Path.move(to: CGPoint(x: 388.67, y: 857.07))
        clip2Path.addLine(to: CGPoint(x: 371.21, y: 817.05))
        clip2Path.addLine(to: CGPoint(x: 341.98, y: 750.39))
        clip2Path.addLine(to: CGPoint(x: 312.89, y: 683.73))
        clip2Path.addLine(to: CGPoint(x: 295.28, y: 643.71))
        clip2Path.addCurve(to: CGPoint(x: 232.03, y: 609.88), controlPoint1: CGPoint(x: 284.38, y: 618.67), controlPoint2: CGPoint(x: 257.82, y: 605.31))
        clip2Path.addCurve(to: CGPoint(x: 247.87, y: 599.2), controlPoint1: CGPoint(x: 236.65, y: 605.62), controlPoint2: CGPoint(x: 241.79, y: 601.84))
        clip2Path.addCurve(to: CGPoint(x: 324.37, y: 629.16), controlPoint1: CGPoint(x: 277.25, y: 586.23), controlPoint2: CGPoint(x: 311.58, y: 599.76))
        clip2Path.addLine(to: CGPoint(x: 341.98, y: 669.18))
        clip2Path.addLine(to: CGPoint(x: 371.07, y: 735.83))
        clip2Path.addLine(to: CGPoint(x: 400.3, y: 802.49))
        clip2Path.addLine(to: CGPoint(x: 417.75, y: 842.51))
        clip2Path.addCurve(to: CGPoint(x: 387.79, y: 919.23), controlPoint1: CGPoint(x: 430.69, y: 871.93), controlPoint2: CGPoint(x: 417.17, y: 906.27))
        clip2Path.addCurve(to: CGPoint(x: 374.6, y: 923.07), controlPoint1: CGPoint(x: 383.46, y: 921.08), controlPoint2: CGPoint(x: 379.04, y: 922.27))
        clip2Path.addCurve(to: CGPoint(x: 388.67, y: 857.07), controlPoint1: CGPoint(x: 392.35, y: 906.67), controlPoint2: CGPoint(x: 398.93, y: 880.4))
        clip2Path.close()
        clip2Path.usesEvenOddFillRule = true
        clip2Path.addClip()
        
        
        //// Rectangle 2 Drawing
        let rectangle2Path = UIBezierPath(rect: CGRect(x: 227.03, y: 589.25, width: 200.65, height: 338.8))
        light.setFill()
        rectangle2Path.fill()
        
        
        context.endTransparencyLayer()
        context.restoreGState()
        
        
        //// Group 5
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        //// Clip Clip 3
        let clip3Path = UIBezierPath()
        clip3Path.move(to: CGPoint(x: 150.75, y: 644.15))
        clip3Path.addLine(to: CGPoint(x: 129.82, y: 657.28))
        clip3Path.addCurve(to: CGPoint(x: 242.43, y: 928.21), controlPoint1: CGPoint(x: 146.87, y: 757.3), controlPoint2: CGPoint(x: 183.84, y: 845.96))
        clip3Path.addLine(to: CGPoint(x: 259.78, y: 945.27))
        clip3Path.addCurve(to: CGPoint(x: 307.58, y: 954.58), controlPoint1: CGPoint(x: 278.58, y: 967.28), controlPoint2: CGPoint(x: 297.09, y: 959.11))
        clip3Path.addLine(to: CGPoint(x: 334.26, y: 942.93))
        clip3Path.addLine(to: CGPoint(x: 326.38, y: 924.85))
        clip3Path.addLine(to: CGPoint(x: 201.91, y: 640.5))
        clip3Path.addLine(to: CGPoint(x: 193.9, y: 622.27))
        clip3Path.addLine(to: CGPoint(x: 167.22, y: 634.09))
        clip3Path.addCurve(to: CGPoint(x: 157.31, y: 639.05), controlPoint1: CGPoint(x: 164.3, y: 635.26), controlPoint2: CGPoint(x: 160.81, y: 636.86))
        clip3Path.addCurve(to: CGPoint(x: 150.75, y: 644.15), controlPoint1: CGPoint(x: 155.12, y: 640.36), controlPoint2: CGPoint(x: 152.79, y: 642.1))
        clip3Path.close()
        clip3Path.usesEvenOddFillRule = true
        clip3Path.addClip()
        
        
        //// Rectangle 3 Drawing
        let rectangle3Path = UIBezierPath(rect: CGRect(x: 124.83, y: 617.3, width: 214.45, height: 347.6))
        light.setFill()
        rectangle3Path.fill()
        
        
        context.endTransparencyLayer()
        context.restoreGState()
        
        
        //// Bezier 9 Drawing
        let bezier9Path = UIBezierPath()
        bezier9Path.move(to: CGPoint(x: 143.18, y: 649.22))
        bezier9Path.addCurve(to: CGPoint(x: 286.22, y: 959.48), controlPoint1: CGPoint(x: 160.3, y: 748.66), controlPoint2: CGPoint(x: 218.76, y: 879.38))
        bezier9Path.addCurve(to: CGPoint(x: 259.84, y: 944.98), controlPoint1: CGPoint(x: 278.08, y: 959.2), controlPoint2: CGPoint(x: 269, y: 955.7))
        bezier9Path.addLine(to: CGPoint(x: 242.52, y: 927.95))
        bezier9Path.addCurve(to: CGPoint(x: 130.08, y: 657.44), controlPoint1: CGPoint(x: 184.01, y: 845.82), controlPoint2: CGPoint(x: 147.11, y: 757.31))
        bezier9Path.addLine(to: CGPoint(x: 143.18, y: 649.22))
        bezier9Path.close()
        bezier9Path.usesEvenOddFillRule = true
        medium.setFill()
        bezier9Path.fill()
        
        
        //// Bezier 10 Drawing
        let bezier10Path = UIBezierPath()
        bezier10Path.move(to: CGPoint(x: 495.09, y: 42.32))
        bezier10Path.addCurve(to: CGPoint(x: 487.81, y: 42.47), controlPoint1: CGPoint(x: 492.63, y: 42.32), controlPoint2: CGPoint(x: 490.25, y: 42.43))
        bezier10Path.addCurve(to: CGPoint(x: 776.28, y: 937.98), controlPoint1: CGPoint(x: 921.66, y: 48.68), controlPoint2: CGPoint(x: 1006.71, y: 605.83))
        bezier10Path.addLine(to: CGPoint(x: 786, y: 944.98))
        bezier10Path.addCurve(to: CGPoint(x: 495.09, y: 42.32), controlPoint1: CGPoint(x: 1023.8, y: 611.86), controlPoint2: CGPoint(x: 938.38, y: 42.32))
        bezier10Path.close()
        bezier10Path.usesEvenOddFillRule = true
        white.setFill()
        bezier10Path.fill()
        
        
        //// Bezier 11 Drawing
        let bezier11Path = UIBezierPath()
        bezier11Path.move(to: CGPoint(x: 502.36, y: 42.47))
        bezier11Path.addCurve(to: CGPoint(x: 495.09, y: 42.32), controlPoint1: CGPoint(x: 499.93, y: 42.43), controlPoint2: CGPoint(x: 497.55, y: 42.32))
        bezier11Path.addCurve(to: CGPoint(x: 218.43, y: 944.98), controlPoint1: CGPoint(x: 51.93, y: 42.32), controlPoint2: CGPoint(x: -19.52, y: 611.86))
        bezier11Path.addLine(to: CGPoint(x: 228.13, y: 937.95))
        bezier11Path.addCurve(to: CGPoint(x: 502.36, y: 42.47), controlPoint1: CGPoint(x: -2.61, y: 605.8), controlPoint2: CGPoint(x: 68.81, y: 48.68))
        bezier11Path.close()
        bezier11Path.usesEvenOddFillRule = true
        white.setFill()
        bezier11Path.fill()
        
        
        //// Group 6
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        //// Clip Clip 4
        let clip4Path = UIBezierPath()
        clip4Path.move(to: CGPoint(x: 187.66, y: 285.29))
        clip4Path.addLine(to: CGPoint(x: 167.3, y: 275.54))
        clip4Path.addLine(to: CGPoint(x: 165.41, y: 274.67))
        clip4Path.addCurve(to: CGPoint(x: 170.06, y: 265.21), controlPoint1: CGPoint(x: 166.87, y: 271.47), controlPoint2: CGPoint(x: 168.46, y: 268.27))
        clip4Path.addCurve(to: CGPoint(x: 495.17, y: 71.88), controlPoint1: CGPoint(x: 215.45, y: 176.91), controlPoint2: CGPoint(x: 308.69, y: 71.88))
        clip4Path.addCurve(to: CGPoint(x: 828.56, y: 271.9), controlPoint1: CGPoint(x: 685.72, y: 71.88), controlPoint2: CGPoint(x: 781.58, y: 180.69))
        clip4Path.addCurve(to: CGPoint(x: 830.74, y: 276.26), controlPoint1: CGPoint(x: 829.29, y: 273.36), controlPoint2: CGPoint(x: 830.02, y: 274.82))
        clip4Path.addLine(to: CGPoint(x: 802.67, y: 285.28))
        clip4Path.addCurve(to: CGPoint(x: 495.17, y: 100.97), controlPoint1: CGPoint(x: 759.46, y: 201.21), controlPoint2: CGPoint(x: 671.02, y: 100.97))
        clip4Path.addCurve(to: CGPoint(x: 187.66, y: 285.29), controlPoint1: CGPoint(x: 319.45, y: 100.97), controlPoint2: CGPoint(x: 231.01, y: 201.21))
        clip4Path.close()
        clip4Path.usesEvenOddFillRule = true
        clip4Path.addClip()
        
        
        //// Rectangle 4 Drawing
        let rectangle4Path = UIBezierPath(rect: CGRect(x: 160.43, y: 66.9, width: 675.35, height: 223.4))
        medium.setFill()
        rectangle4Path.fill()
        
        
        context.endTransparencyLayer()
        context.restoreGState()
        
        
        //// Bezier 13 Drawing
        let bezier13Path = UIBezierPath()
        bezier13Path.move(to: CGPoint(x: 786, y: 952.26))
        bezier13Path.addCurve(to: CGPoint(x: 781.78, y: 950.89), controlPoint1: CGPoint(x: 784.54, y: 952.26), controlPoint2: CGPoint(x: 783.06, y: 951.8))
        bezier13Path.addCurve(to: CGPoint(x: 780.09, y: 940.74), controlPoint1: CGPoint(x: 778.52, y: 948.56), controlPoint2: CGPoint(x: 777.75, y: 944.01))
        bezier13Path.addCurve(to: CGPoint(x: 848.13, y: 261.75), controlPoint1: CGPoint(x: 920.64, y: 743.85), controlPoint2: CGPoint(x: 949.25, y: 458.31))
        bezier13Path.addCurve(to: CGPoint(x: 495.09, y: 49.6), controlPoint1: CGPoint(x: 777.73, y: 124.94), controlPoint2: CGPoint(x: 652.37, y: 49.6))
        bezier13Path.addCurve(to: CGPoint(x: 487.81, y: 42.32), controlPoint1: CGPoint(x: 491.06, y: 49.6), controlPoint2: CGPoint(x: 487.81, y: 46.34))
        bezier13Path.addCurve(to: CGPoint(x: 495.09, y: 35.04), controlPoint1: CGPoint(x: 487.81, y: 38.3), controlPoint2: CGPoint(x: 491.06, y: 35.04))
        bezier13Path.addCurve(to: CGPoint(x: 861.06, y: 255.09), controlPoint1: CGPoint(x: 658.08, y: 35.04), controlPoint2: CGPoint(x: 788.06, y: 113.19))
        bezier13Path.addCurve(to: CGPoint(x: 791.93, y: 949.21), controlPoint1: CGPoint(x: 964.54, y: 456.22), controlPoint2: CGPoint(x: 935.46, y: 748.15))
        bezier13Path.addCurve(to: CGPoint(x: 786, y: 952.26), controlPoint1: CGPoint(x: 790.51, y: 951.17), controlPoint2: CGPoint(x: 788.28, y: 952.26))
        bezier13Path.close()
        bezier13Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier13Path.fill()
        
        
        //// Bezier 14 Drawing
        let bezier14Path = UIBezierPath()
        bezier14Path.move(to: CGPoint(x: 218.44, y: 952.26))
        bezier14Path.addCurve(to: CGPoint(x: 212.51, y: 949.21), controlPoint1: CGPoint(x: 216.16, y: 952.26), controlPoint2: CGPoint(x: 213.93, y: 951.2))
        bezier14Path.addCurve(to: CGPoint(x: 137.44, y: 248.33), controlPoint1: CGPoint(x: 65.79, y: 743.8), controlPoint2: CGPoint(x: 34.21, y: 449.04))
        bezier14Path.addCurve(to: CGPoint(x: 495.09, y: 35.04), controlPoint1: CGPoint(x: 208.17, y: 110.79), controlPoint2: CGPoint(x: 335.18, y: 35.04))
        bezier14Path.addCurve(to: CGPoint(x: 502.36, y: 42.32), controlPoint1: CGPoint(x: 499.11, y: 35.04), controlPoint2: CGPoint(x: 502.36, y: 38.3))
        bezier14Path.addCurve(to: CGPoint(x: 495.09, y: 49.6), controlPoint1: CGPoint(x: 502.36, y: 46.34), controlPoint2: CGPoint(x: 499.11, y: 49.6))
        bezier14Path.addCurve(to: CGPoint(x: 150.38, y: 254.99), controlPoint1: CGPoint(x: 297.48, y: 49.6), controlPoint2: CGPoint(x: 198.56, y: 161.29))
        bezier14Path.addCurve(to: CGPoint(x: 224.35, y: 940.74), controlPoint1: CGPoint(x: 49.5, y: 451.13), controlPoint2: CGPoint(x: 80.62, y: 739.53))
        bezier14Path.addCurve(to: CGPoint(x: 222.66, y: 950.89), controlPoint1: CGPoint(x: 226.69, y: 944.01), controlPoint2: CGPoint(x: 225.93, y: 948.56))
        bezier14Path.addCurve(to: CGPoint(x: 218.44, y: 952.26), controlPoint1: CGPoint(x: 221.38, y: 951.8), controlPoint2: CGPoint(x: 219.9, y: 952.26))
        bezier14Path.close()
        bezier14Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier14Path.fill()
        
        
        //// Bezier 15 Drawing
        let bezier15Path = UIBezierPath()
        bezier15Path.move(to: CGPoint(x: 762.27, y: 935.22))
        bezier15Path.addCurve(to: CGPoint(x: 758.06, y: 933.86), controlPoint1: CGPoint(x: 760.81, y: 935.22), controlPoint2: CGPoint(x: 759.34, y: 934.77))
        bezier15Path.addCurve(to: CGPoint(x: 756.36, y: 923.71), controlPoint1: CGPoint(x: 754.78, y: 931.53), controlPoint2: CGPoint(x: 754.03, y: 926.98))
        bezier15Path.addCurve(to: CGPoint(x: 869.22, y: 646.89), controlPoint1: CGPoint(x: 812.82, y: 844.46), controlPoint2: CGPoint(x: 851.85, y: 748.75))
        bezier15Path.addCurve(to: CGPoint(x: 824.32, y: 279.25), controlPoint1: CGPoint(x: 892.16, y: 513.21), controlPoint2: CGPoint(x: 876.21, y: 382.64))
        bezier15Path.addLine(to: CGPoint(x: 822.15, y: 274.89))
        bezier15Path.addCurve(to: CGPoint(x: 495.09, y: 78.72), controlPoint1: CGPoint(x: 776.07, y: 185.44), controlPoint2: CGPoint(x: 681.91, y: 78.72))
        bezier15Path.addCurve(to: CGPoint(x: 487.81, y: 71.44), controlPoint1: CGPoint(x: 491.06, y: 78.72), controlPoint2: CGPoint(x: 487.81, y: 75.46))
        bezier15Path.addCurve(to: CGPoint(x: 495.09, y: 64.16), controlPoint1: CGPoint(x: 487.81, y: 67.41), controlPoint2: CGPoint(x: 491.06, y: 64.16))
        bezier15Path.addCurve(to: CGPoint(x: 835.11, y: 268.29), controlPoint1: CGPoint(x: 689.25, y: 64.16), controlPoint2: CGPoint(x: 787.15, y: 175.16))
        bezier15Path.addLine(to: CGPoint(x: 837.34, y: 272.73))
        bezier15Path.addCurve(to: CGPoint(x: 883.56, y: 649.36), controlPoint1: CGPoint(x: 890.61, y: 378.87), controlPoint2: CGPoint(x: 907.02, y: 512.62))
        bezier15Path.addCurve(to: CGPoint(x: 768.21, y: 932.15), controlPoint1: CGPoint(x: 865.82, y: 753.35), controlPoint2: CGPoint(x: 825.94, y: 851.14))
        bezier15Path.addCurve(to: CGPoint(x: 762.27, y: 935.22), controlPoint1: CGPoint(x: 766.79, y: 934.14), controlPoint2: CGPoint(x: 764.54, y: 935.22))
        bezier15Path.close()
        bezier15Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier15Path.fill()
        
        
        //// Bezier 16 Drawing
        let bezier16Path = UIBezierPath()
        bezier16Path.move(to: CGPoint(x: 242.01, y: 935.22))
        bezier16Path.addCurve(to: CGPoint(x: 236.08, y: 932.15), controlPoint1: CGPoint(x: 239.73, y: 935.22), controlPoint2: CGPoint(x: 237.5, y: 934.14))
        bezier16Path.addCurve(to: CGPoint(x: 158.62, y: 271.21), controlPoint1: CGPoint(x: 98.76, y: 739.7), controlPoint2: CGPoint(x: 66.18, y: 461.73))
        bezier16Path.addCurve(to: CGPoint(x: 163.37, y: 261.55), controlPoint1: CGPoint(x: 160.05, y: 268.06), controlPoint2: CGPoint(x: 161.71, y: 264.72))
        bezier16Path.addCurve(to: CGPoint(x: 495.09, y: 64.16), controlPoint1: CGPoint(x: 209.63, y: 171.53), controlPoint2: CGPoint(x: 304.75, y: 64.16))
        bezier16Path.addCurve(to: CGPoint(x: 502.36, y: 71.44), controlPoint1: CGPoint(x: 499.11, y: 64.16), controlPoint2: CGPoint(x: 502.36, y: 67.42))
        bezier16Path.addCurve(to: CGPoint(x: 495.09, y: 78.72), controlPoint1: CGPoint(x: 502.36, y: 75.46), controlPoint2: CGPoint(x: 499.11, y: 78.72))
        bezier16Path.addCurve(to: CGPoint(x: 176.29, y: 268.25), controlPoint1: CGPoint(x: 312.1, y: 78.72), controlPoint2: CGPoint(x: 220.72, y: 181.79))
        bezier16Path.addCurve(to: CGPoint(x: 171.78, y: 277.41), controlPoint1: CGPoint(x: 174.73, y: 271.25), controlPoint2: CGPoint(x: 173.18, y: 274.33))
        bezier16Path.addCurve(to: CGPoint(x: 247.92, y: 923.71), controlPoint1: CGPoint(x: 81.46, y: 463.58), controlPoint2: CGPoint(x: 113.51, y: 735.32))
        bezier16Path.addCurve(to: CGPoint(x: 246.23, y: 933.86), controlPoint1: CGPoint(x: 250.26, y: 926.98), controlPoint2: CGPoint(x: 249.5, y: 931.53))
        bezier16Path.addCurve(to: CGPoint(x: 242.01, y: 935.22), controlPoint1: CGPoint(x: 244.95, y: 934.77), controlPoint2: CGPoint(x: 243.47, y: 935.22))
        bezier16Path.close()
        bezier16Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier16Path.fill()
        
        
        //// Bezier 17 Drawing
        let bezier17Path = UIBezierPath()
        bezier17Path.move(to: CGPoint(x: 786, y: 952.26))
        bezier17Path.addCurve(to: CGPoint(x: 781.77, y: 950.89), controlPoint1: CGPoint(x: 784.53, y: 952.26), controlPoint2: CGPoint(x: 783.05, y: 951.8))
        bezier17Path.addLine(to: CGPoint(x: 758.03, y: 933.86))
        bezier17Path.addCurve(to: CGPoint(x: 756.37, y: 923.68), controlPoint1: CGPoint(x: 754.78, y: 931.5), controlPoint2: CGPoint(x: 754.03, y: 926.95))
        bezier17Path.addCurve(to: CGPoint(x: 766.52, y: 922.03), controlPoint1: CGPoint(x: 758.72, y: 920.41), controlPoint2: CGPoint(x: 763.24, y: 919.67))
        bezier17Path.addLine(to: CGPoint(x: 790.25, y: 939.06))
        bezier17Path.addCurve(to: CGPoint(x: 791.92, y: 949.21), controlPoint1: CGPoint(x: 793.51, y: 941.39), controlPoint2: CGPoint(x: 794.26, y: 945.94))
        bezier17Path.addCurve(to: CGPoint(x: 786, y: 952.26), controlPoint1: CGPoint(x: 790.49, y: 951.2), controlPoint2: CGPoint(x: 788.26, y: 952.26))
        bezier17Path.close()
        bezier17Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier17Path.fill()
        
        
        //// Bezier 18 Drawing
        let bezier18Path = UIBezierPath()
        bezier18Path.move(to: CGPoint(x: 218.44, y: 952.26))
        bezier18Path.addCurve(to: CGPoint(x: 212.53, y: 949.24), controlPoint1: CGPoint(x: 216.18, y: 952.26), controlPoint2: CGPoint(x: 213.96, y: 951.2))
        bezier18Path.addCurve(to: CGPoint(x: 214.17, y: 939.06), controlPoint1: CGPoint(x: 210.18, y: 945.97), controlPoint2: CGPoint(x: 210.91, y: 941.42))
        bezier18Path.addLine(to: CGPoint(x: 237.74, y: 922.03))
        bezier18Path.addCurve(to: CGPoint(x: 247.9, y: 923.68), controlPoint1: CGPoint(x: 241, y: 919.64), controlPoint2: CGPoint(x: 245.54, y: 920.44))
        bezier18Path.addCurve(to: CGPoint(x: 246.27, y: 933.83), controlPoint1: CGPoint(x: 250.25, y: 926.92), controlPoint2: CGPoint(x: 249.52, y: 931.47))
        bezier18Path.addLine(to: CGPoint(x: 222.7, y: 950.86))
        bezier18Path.addCurve(to: CGPoint(x: 218.44, y: 952.26), controlPoint1: CGPoint(x: 221.4, y: 951.8), controlPoint2: CGPoint(x: 219.92, y: 952.26))
        bezier18Path.close()
        bezier18Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier18Path.fill()
        
        
        //// Bezier 19 Drawing
        let bezier19Path = UIBezierPath()
        bezier19Path.move(to: CGPoint(x: 287.3, y: 966.79))
        bezier19Path.addCurve(to: CGPoint(x: 254.22, y: 949.7), controlPoint1: CGPoint(x: 277.2, y: 966.79), controlPoint2: CGPoint(x: 265.53, y: 962.92))
        bezier19Path.addCurve(to: CGPoint(x: 255.03, y: 939.43), controlPoint1: CGPoint(x: 251.61, y: 946.65), controlPoint2: CGPoint(x: 251.98, y: 942.05))
        bezier19Path.addCurve(to: CGPoint(x: 265.29, y: 940.23), controlPoint1: CGPoint(x: 258.08, y: 936.81), controlPoint2: CGPoint(x: 262.67, y: 937.18))
        bezier19Path.addCurve(to: CGPoint(x: 304.58, y: 947.62), controlPoint1: CGPoint(x: 280.56, y: 958.11), controlPoint2: CGPoint(x: 294.44, y: 952.03))
        bezier19Path.addCurve(to: CGPoint(x: 314.16, y: 951.37), controlPoint1: CGPoint(x: 308.26, y: 946.03), controlPoint2: CGPoint(x: 312.55, y: 947.71))
        bezier19Path.addCurve(to: CGPoint(x: 310.4, y: 960.96), controlPoint1: CGPoint(x: 315.77, y: 955.04), controlPoint2: CGPoint(x: 314.09, y: 959.34))
        bezier19Path.addCurve(to: CGPoint(x: 287.3, y: 966.79), controlPoint1: CGPoint(x: 305.41, y: 963.15), controlPoint2: CGPoint(x: 297.1, y: 966.79))
        bezier19Path.close()
        bezier19Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier19Path.fill()
        
        
        //// Bezier 20 Drawing
        let bezier20Path = UIBezierPath()
        bezier20Path.move(to: CGPoint(x: 150.9, y: 651.61))
        bezier20Path.addCurve(to: CGPoint(x: 145.58, y: 649.28), controlPoint1: CGPoint(x: 148.95, y: 651.61), controlPoint2: CGPoint(x: 147.01, y: 650.81))
        bezier20Path.addCurve(to: CGPoint(x: 145.94, y: 638.98), controlPoint1: CGPoint(x: 142.84, y: 646.35), controlPoint2: CGPoint(x: 143, y: 641.74))
        bezier20Path.addCurve(to: CGPoint(x: 154.03, y: 632.87), controlPoint1: CGPoint(x: 148.83, y: 636.31), controlPoint2: CGPoint(x: 151.41, y: 634.35))
        bezier20Path.addCurve(to: CGPoint(x: 164.79, y: 627.53), controlPoint1: CGPoint(x: 157.02, y: 631), controlPoint2: CGPoint(x: 160.64, y: 629.18))
        bezier20Path.addCurve(to: CGPoint(x: 174.25, y: 631.59), controlPoint1: CGPoint(x: 168.48, y: 626.05), controlPoint2: CGPoint(x: 172.77, y: 627.87))
        bezier20Path.addCurve(to: CGPoint(x: 170.2, y: 641.03), controlPoint1: CGPoint(x: 175.74, y: 635.32), controlPoint2: CGPoint(x: 173.93, y: 639.55))
        bezier20Path.addCurve(to: CGPoint(x: 161.46, y: 645.41), controlPoint1: CGPoint(x: 166.87, y: 642.37), controlPoint2: CGPoint(x: 164.01, y: 643.79))
        bezier20Path.addCurve(to: CGPoint(x: 155.86, y: 649.65), controlPoint1: CGPoint(x: 159.57, y: 646.46), controlPoint2: CGPoint(x: 157.88, y: 647.77))
        bezier20Path.addCurve(to: CGPoint(x: 150.9, y: 651.61), controlPoint1: CGPoint(x: 154.46, y: 650.96), controlPoint2: CGPoint(x: 152.68, y: 651.61))
        bezier20Path.close()
        bezier20Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier20Path.fill()
        
        
        //// Bezier 21 Drawing
        let bezier21Path = UIBezierPath()
        bezier21Path.move(to: CGPoint(x: 167.5, y: 641.57))
        bezier21Path.addCurve(to: CGPoint(x: 160.84, y: 637.22), controlPoint1: CGPoint(x: 164.71, y: 641.57), controlPoint2: CGPoint(x: 162.04, y: 639.95))
        bezier21Path.addCurve(to: CGPoint(x: 164.54, y: 627.64), controlPoint1: CGPoint(x: 159.21, y: 633.55), controlPoint2: CGPoint(x: 160.87, y: 629.26))
        bezier21Path.addLine(to: CGPoint(x: 191.17, y: 615.84))
        bezier21Path.addCurve(to: CGPoint(x: 200.77, y: 619.53), controlPoint1: CGPoint(x: 194.86, y: 614.19), controlPoint2: CGPoint(x: 199.14, y: 615.87))
        bezier21Path.addCurve(to: CGPoint(x: 197.07, y: 629.15), controlPoint1: CGPoint(x: 202.4, y: 623.2), controlPoint2: CGPoint(x: 200.74, y: 627.53))
        bezier21Path.addLine(to: CGPoint(x: 170.44, y: 640.94))
        bezier21Path.addCurve(to: CGPoint(x: 167.5, y: 641.57), controlPoint1: CGPoint(x: 169.48, y: 641.37), controlPoint2: CGPoint(x: 168.48, y: 641.57))
        bezier21Path.close()
        bezier21Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier21Path.fill()
        
        
        //// Bezier 22 Drawing
        let bezier22Path = UIBezierPath()
        bezier22Path.move(to: CGPoint(x: 307.5, y: 961.55))
        bezier22Path.addCurve(to: CGPoint(x: 300.83, y: 957.2), controlPoint1: CGPoint(x: 304.69, y: 961.55), controlPoint2: CGPoint(x: 302.02, y: 959.93))
        bezier22Path.addCurve(to: CGPoint(x: 304.58, y: 947.62), controlPoint1: CGPoint(x: 299.21, y: 953.51), controlPoint2: CGPoint(x: 300.9, y: 949.21))
        bezier22Path.addLine(to: CGPoint(x: 331.21, y: 935.96))
        bezier22Path.addCurve(to: CGPoint(x: 340.79, y: 939.71), controlPoint1: CGPoint(x: 334.9, y: 934.4), controlPoint2: CGPoint(x: 339.19, y: 936.05))
        bezier22Path.addCurve(to: CGPoint(x: 337.04, y: 949.3), controlPoint1: CGPoint(x: 342.41, y: 943.41), controlPoint2: CGPoint(x: 340.72, y: 947.71))
        bezier22Path.addLine(to: CGPoint(x: 310.41, y: 960.96))
        bezier22Path.addCurve(to: CGPoint(x: 307.5, y: 961.55), controlPoint1: CGPoint(x: 309.46, y: 961.35), controlPoint2: CGPoint(x: 308.46, y: 961.55))
        bezier22Path.close()
        bezier22Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier22Path.fill()
        
        
        //// Bezier 23 Drawing
        let bezier23Path = UIBezierPath()
        bezier23Path.move(to: CGPoint(x: 334.13, y: 949.92))
        bezier23Path.addCurve(to: CGPoint(x: 327.45, y: 945.55), controlPoint1: CGPoint(x: 331.32, y: 949.92), controlPoint2: CGPoint(x: 328.65, y: 948.28))
        bezier23Path.addLine(to: CGPoint(x: 187.46, y: 625.42))
        bezier23Path.addCurve(to: CGPoint(x: 191.19, y: 615.81), controlPoint1: CGPoint(x: 185.84, y: 621.72), controlPoint2: CGPoint(x: 187.51, y: 617.43))
        bezier23Path.addCurve(to: CGPoint(x: 200.78, y: 619.56), controlPoint1: CGPoint(x: 194.9, y: 614.22), controlPoint2: CGPoint(x: 199.17, y: 615.87))
        bezier23Path.addLine(to: CGPoint(x: 208.79, y: 637.77))
        bezier23Path.addLine(to: CGPoint(x: 340.8, y: 939.75))
        bezier23Path.addCurve(to: CGPoint(x: 337.03, y: 949.3), controlPoint1: CGPoint(x: 342.4, y: 943.42), controlPoint2: CGPoint(x: 340.71, y: 947.71))
        bezier23Path.addCurve(to: CGPoint(x: 334.13, y: 949.92), controlPoint1: CGPoint(x: 336.09, y: 949.72), controlPoint2: CGPoint(x: 335.1, y: 949.92))
        bezier23Path.close()
        bezier23Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier23Path.fill()
        
        
        //// Bezier 24 Drawing
        let bezier24Path = UIBezierPath()
        bezier24Path.move(to: CGPoint(x: 314.93, y: 688.15))
        bezier24Path.addCurve(to: CGPoint(x: 308.25, y: 683.8), controlPoint1: CGPoint(x: 312.12, y: 688.15), controlPoint2: CGPoint(x: 309.45, y: 686.53))
        bezier24Path.addCurve(to: CGPoint(x: 312, y: 674.22), controlPoint1: CGPoint(x: 306.64, y: 680.1), controlPoint2: CGPoint(x: 308.32, y: 675.81))
        bezier24Path.addLine(to: CGPoint(x: 338.64, y: 662.56))
        bezier24Path.addCurve(to: CGPoint(x: 348.22, y: 666.31), controlPoint1: CGPoint(x: 342.32, y: 660.97), controlPoint2: CGPoint(x: 346.62, y: 662.61))
        bezier24Path.addCurve(to: CGPoint(x: 344.46, y: 675.89), controlPoint1: CGPoint(x: 349.83, y: 669.98), controlPoint2: CGPoint(x: 348.15, y: 674.27))
        bezier24Path.addLine(to: CGPoint(x: 317.83, y: 687.55))
        bezier24Path.addCurve(to: CGPoint(x: 314.93, y: 688.15), controlPoint1: CGPoint(x: 316.89, y: 687.95), controlPoint2: CGPoint(x: 315.9, y: 688.15))
        bezier24Path.close()
        bezier24Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier24Path.fill()
        
        
        //// Bezier 25 Drawing
        let bezier25Path = UIBezierPath()
        bezier25Path.move(to: CGPoint(x: 344.17, y: 754.83))
        bezier25Path.addCurve(to: CGPoint(x: 337.5, y: 750.48), controlPoint1: CGPoint(x: 341.37, y: 754.83), controlPoint2: CGPoint(x: 338.7, y: 753.21))
        bezier25Path.addCurve(to: CGPoint(x: 341.25, y: 740.9), controlPoint1: CGPoint(x: 335.89, y: 746.78), controlPoint2: CGPoint(x: 337.57, y: 742.49))
        bezier25Path.addLine(to: CGPoint(x: 367.89, y: 729.24))
        bezier25Path.addCurve(to: CGPoint(x: 377.47, y: 732.99), controlPoint1: CGPoint(x: 371.57, y: 727.65), controlPoint2: CGPoint(x: 375.87, y: 729.29))
        bezier25Path.addCurve(to: CGPoint(x: 373.71, y: 742.58), controlPoint1: CGPoint(x: 379.08, y: 736.66), controlPoint2: CGPoint(x: 377.4, y: 740.95))
        bezier25Path.addLine(to: CGPoint(x: 347.08, y: 754.23))
        bezier25Path.addCurve(to: CGPoint(x: 344.17, y: 754.83), controlPoint1: CGPoint(x: 346.14, y: 754.63), controlPoint2: CGPoint(x: 345.15, y: 754.83))
        bezier25Path.close()
        bezier25Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier25Path.fill()
        
        
        //// Bezier 26 Drawing
        let bezier26Path = UIBezierPath()
        bezier26Path.move(to: CGPoint(x: 373.28, y: 821.51))
        bezier26Path.addCurve(to: CGPoint(x: 366.61, y: 817.13), controlPoint1: CGPoint(x: 370.47, y: 821.51), controlPoint2: CGPoint(x: 367.8, y: 819.86))
        bezier26Path.addCurve(to: CGPoint(x: 370.36, y: 807.55), controlPoint1: CGPoint(x: 365, y: 813.46), controlPoint2: CGPoint(x: 366.68, y: 809.17))
        bezier26Path.addLine(to: CGPoint(x: 397, y: 795.92))
        bezier26Path.addCurve(to: CGPoint(x: 406.57, y: 799.67), controlPoint1: CGPoint(x: 400.69, y: 794.3), controlPoint2: CGPoint(x: 404.98, y: 796))
        bezier26Path.addCurve(to: CGPoint(x: 402.82, y: 809.25), controlPoint1: CGPoint(x: 408.19, y: 803.34), controlPoint2: CGPoint(x: 406.5, y: 807.63))
        bezier26Path.addLine(to: CGPoint(x: 376.19, y: 820.89))
        bezier26Path.addCurve(to: CGPoint(x: 373.28, y: 821.51), controlPoint1: CGPoint(x: 375.24, y: 821.31), controlPoint2: CGPoint(x: 374.25, y: 821.51))
        bezier26Path.close()
        bezier26Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier26Path.fill()
        
        
        //// Bezier 27 Drawing
        let bezier27Path = UIBezierPath()
        bezier27Path.move(to: CGPoint(x: 364.04, y: 931.44))
        bezier27Path.addCurve(to: CGPoint(x: 336.44, y: 925.36), controlPoint1: CGPoint(x: 354.56, y: 931.44), controlPoint2: CGPoint(x: 345.13, y: 929.42))
        bezier27Path.addCurve(to: CGPoint(x: 332.92, y: 915.69), controlPoint1: CGPoint(x: 332.8, y: 923.68), controlPoint2: CGPoint(x: 331.22, y: 919.33))
        bezier27Path.addCurve(to: CGPoint(x: 342.58, y: 912.16), controlPoint1: CGPoint(x: 334.6, y: 912.08), controlPoint2: CGPoint(x: 338.92, y: 910.43))
        bezier27Path.addCurve(to: CGPoint(x: 384.68, y: 912.64), controlPoint1: CGPoint(x: 355.74, y: 918.27), controlPoint2: CGPoint(x: 371.09, y: 918.47))
        bezier27Path.addCurve(to: CGPoint(x: 410.84, y: 845.51), controlPoint1: CGPoint(x: 410.27, y: 901.35), controlPoint2: CGPoint(x: 422.04, y: 871.24))
        bezier27Path.addLine(to: CGPoint(x: 317.41, y: 632.1))
        bezier27Path.addCurve(to: CGPoint(x: 250.31, y: 605.86), controlPoint1: CGPoint(x: 306.09, y: 606.4), controlPoint2: CGPoint(x: 275.99, y: 594.6))
        bezier27Path.addCurve(to: CGPoint(x: 222.32, y: 637.02), controlPoint1: CGPoint(x: 236.84, y: 611.8), controlPoint2: CGPoint(x: 226.63, y: 623.17))
        bezier27Path.addCurve(to: CGPoint(x: 213.21, y: 641.83), controlPoint1: CGPoint(x: 221.12, y: 640.86), controlPoint2: CGPoint(x: 217.06, y: 643.02))
        bezier27Path.addCurve(to: CGPoint(x: 208.43, y: 632.7), controlPoint1: CGPoint(x: 209.38, y: 640.63), controlPoint2: CGPoint(x: 207.23, y: 636.54))
        bezier27Path.addCurve(to: CGPoint(x: 244.45, y: 592.55), controlPoint1: CGPoint(x: 213.98, y: 614.81), controlPoint2: CGPoint(x: 227.12, y: 600.17))
        bezier27Path.addCurve(to: CGPoint(x: 330.74, y: 626.24), controlPoint1: CGPoint(x: 277.46, y: 578.02), controlPoint2: CGPoint(x: 316.17, y: 593.17))
        bezier27Path.addLine(to: CGPoint(x: 424.18, y: 839.68))
        bezier27Path.addCurve(to: CGPoint(x: 390.47, y: 926.01), controlPoint1: CGPoint(x: 438.57, y: 872.75), controlPoint2: CGPoint(x: 423.44, y: 911.48))
        bezier27Path.addCurve(to: CGPoint(x: 364.04, y: 931.44), controlPoint1: CGPoint(x: 381.99, y: 929.62), controlPoint2: CGPoint(x: 372.99, y: 931.44))
        bezier27Path.close()
        bezier27Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier27Path.fill()
        
        
        //// Bezier 28 Drawing
        let bezier28Path = UIBezierPath()
        bezier28Path.move(to: CGPoint(x: 717.59, y: 966.87))
        bezier28Path.addCurve(to: CGPoint(x: 694.52, y: 961.04), controlPoint1: CGPoint(x: 708.05, y: 966.87), controlPoint2: CGPoint(x: 699.88, y: 963.34))
        bezier28Path.addCurve(to: CGPoint(x: 690.64, y: 951.43), controlPoint1: CGPoint(x: 690.84, y: 959.45), controlPoint2: CGPoint(x: 689.05, y: 955.13))
        bezier28Path.addCurve(to: CGPoint(x: 700.12, y: 947.59), controlPoint1: CGPoint(x: 692.23, y: 947.74), controlPoint2: CGPoint(x: 696.41, y: 946.03))
        bezier28Path.addCurve(to: CGPoint(x: 739.43, y: 940.23), controlPoint1: CGPoint(x: 710.41, y: 952.03), controlPoint2: CGPoint(x: 724.25, y: 958))
        bezier28Path.addCurve(to: CGPoint(x: 749.69, y: 939.43), controlPoint1: CGPoint(x: 742.03, y: 937.19), controlPoint2: CGPoint(x: 746.63, y: 936.82))
        bezier28Path.addCurve(to: CGPoint(x: 750.5, y: 949.7), controlPoint1: CGPoint(x: 752.75, y: 942.05), controlPoint2: CGPoint(x: 753.1, y: 946.66))
        bezier28Path.addCurve(to: CGPoint(x: 717.59, y: 966.87), controlPoint1: CGPoint(x: 739.15, y: 962.98), controlPoint2: CGPoint(x: 727.62, y: 966.87))
        bezier28Path.close()
        bezier28Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier28Path.fill()
        
        
        //// Bezier 29 Drawing
        let bezier29Path = UIBezierPath()
        bezier29Path.move(to: CGPoint(x: 853.82, y: 651.61))
        bezier29Path.addCurve(to: CGPoint(x: 848.68, y: 649.48), controlPoint1: CGPoint(x: 851.96, y: 651.61), controlPoint2: CGPoint(x: 850.1, y: 650.9))
        bezier29Path.addCurve(to: CGPoint(x: 843.54, y: 645.47), controlPoint1: CGPoint(x: 847.22, y: 648), controlPoint2: CGPoint(x: 845.38, y: 646.58))
        bezier29Path.addCurve(to: CGPoint(x: 834.68, y: 641.03), controlPoint1: CGPoint(x: 840.85, y: 643.79), controlPoint2: CGPoint(x: 837.99, y: 642.37))
        bezier29Path.addCurve(to: CGPoint(x: 830.62, y: 631.59), controlPoint1: CGPoint(x: 830.94, y: 639.55), controlPoint2: CGPoint(x: 829.13, y: 635.32))
        bezier29Path.addCurve(to: CGPoint(x: 840.08, y: 627.52), controlPoint1: CGPoint(x: 832.11, y: 627.84), controlPoint2: CGPoint(x: 836.36, y: 626.04))
        bezier29Path.addCurve(to: CGPoint(x: 851.14, y: 633.07), controlPoint1: CGPoint(x: 844.22, y: 629.17), controlPoint2: CGPoint(x: 847.83, y: 630.99))
        bezier29Path.addCurve(to: CGPoint(x: 858.97, y: 639.18), controlPoint1: CGPoint(x: 853.9, y: 634.72), controlPoint2: CGPoint(x: 856.65, y: 636.85))
        bezier29Path.addCurve(to: CGPoint(x: 858.97, y: 649.48), controlPoint1: CGPoint(x: 861.81, y: 642.02), controlPoint2: CGPoint(x: 861.81, y: 646.63))
        bezier29Path.addCurve(to: CGPoint(x: 853.82, y: 651.61), controlPoint1: CGPoint(x: 857.55, y: 650.9), controlPoint2: CGPoint(x: 855.69, y: 651.61))
        bezier29Path.close()
        bezier29Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier29Path.fill()
        
        
        //// Bezier 30 Drawing
        let bezier30Path = UIBezierPath()
        bezier30Path.move(to: CGPoint(x: 837.37, y: 641.57))
        bezier30Path.addCurve(to: CGPoint(x: 834.43, y: 640.95), controlPoint1: CGPoint(x: 836.39, y: 641.57), controlPoint2: CGPoint(x: 835.39, y: 641.37))
        bezier30Path.addLine(to: CGPoint(x: 807.79, y: 629.15))
        bezier30Path.addCurve(to: CGPoint(x: 804.1, y: 619.54), controlPoint1: CGPoint(x: 804.13, y: 627.53), controlPoint2: CGPoint(x: 802.46, y: 623.2))
        bezier30Path.addCurve(to: CGPoint(x: 813.69, y: 615.84), controlPoint1: CGPoint(x: 805.72, y: 615.9), controlPoint2: CGPoint(x: 810.02, y: 614.22))
        bezier30Path.addLine(to: CGPoint(x: 840.32, y: 627.64))
        bezier30Path.addCurve(to: CGPoint(x: 844.03, y: 637.22), controlPoint1: CGPoint(x: 844, y: 629.26), controlPoint2: CGPoint(x: 845.65, y: 633.56))
        bezier30Path.addCurve(to: CGPoint(x: 837.37, y: 641.57), controlPoint1: CGPoint(x: 842.83, y: 639.95), controlPoint2: CGPoint(x: 840.17, y: 641.57))
        bezier30Path.close()
        bezier30Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier30Path.fill()
        
        
        //// Bezier 31 Drawing
        let bezier31Path = UIBezierPath()
        bezier31Path.move(to: CGPoint(x: 697.22, y: 961.55))
        bezier31Path.addCurve(to: CGPoint(x: 694.32, y: 960.96), controlPoint1: CGPoint(x: 696.25, y: 961.55), controlPoint2: CGPoint(x: 695.26, y: 961.35))
        bezier31Path.addLine(to: CGPoint(x: 667.69, y: 949.3))
        bezier31Path.addCurve(to: CGPoint(x: 663.93, y: 939.72), controlPoint1: CGPoint(x: 664.01, y: 947.71), controlPoint2: CGPoint(x: 662.31, y: 943.41))
        bezier31Path.addCurve(to: CGPoint(x: 673.52, y: 935.96), controlPoint1: CGPoint(x: 665.54, y: 936.05), controlPoint2: CGPoint(x: 669.83, y: 934.4))
        bezier31Path.addLine(to: CGPoint(x: 700.15, y: 947.62))
        bezier31Path.addCurve(to: CGPoint(x: 703.9, y: 957.2), controlPoint1: CGPoint(x: 703.83, y: 949.21), controlPoint2: CGPoint(x: 705.51, y: 953.51))
        bezier31Path.addCurve(to: CGPoint(x: 697.22, y: 961.55), controlPoint1: CGPoint(x: 702.71, y: 959.93), controlPoint2: CGPoint(x: 700.03, y: 961.55))
        bezier31Path.close()
        bezier31Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier31Path.fill()
        
        
        //// Bezier 32 Drawing
        let bezier32Path = UIBezierPath()
        bezier32Path.move(to: CGPoint(x: 670.59, y: 949.92))
        bezier32Path.addCurve(to: CGPoint(x: 667.69, y: 949.3), controlPoint1: CGPoint(x: 669.62, y: 949.92), controlPoint2: CGPoint(x: 668.64, y: 949.73))
        bezier32Path.addCurve(to: CGPoint(x: 663.92, y: 939.74), controlPoint1: CGPoint(x: 664.01, y: 947.71), controlPoint2: CGPoint(x: 662.31, y: 943.41))
        bezier32Path.addLine(to: CGPoint(x: 804.08, y: 619.56))
        bezier32Path.addCurve(to: CGPoint(x: 813.67, y: 615.81), controlPoint1: CGPoint(x: 805.7, y: 615.87), controlPoint2: CGPoint(x: 809.97, y: 614.22))
        bezier32Path.addCurve(to: CGPoint(x: 817.4, y: 625.42), controlPoint1: CGPoint(x: 817.35, y: 617.43), controlPoint2: CGPoint(x: 819.02, y: 621.72))
        bezier32Path.addLine(to: CGPoint(x: 677.27, y: 945.55))
        bezier32Path.addCurve(to: CGPoint(x: 670.59, y: 949.92), controlPoint1: CGPoint(x: 676.07, y: 948.28), controlPoint2: CGPoint(x: 673.4, y: 949.92))
        bezier32Path.close()
        bezier32Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier32Path.fill()
        
        
        //// Bezier 33 Drawing
        let bezier33Path = UIBezierPath()
        bezier33Path.move(to: CGPoint(x: 660.7, y: 754.83))
        bezier33Path.addCurve(to: CGPoint(x: 657.78, y: 754.23), controlPoint1: CGPoint(x: 659.72, y: 754.83), controlPoint2: CGPoint(x: 658.73, y: 754.63))
        bezier33Path.addLine(to: CGPoint(x: 631.15, y: 742.58))
        bezier33Path.addCurve(to: CGPoint(x: 627.39, y: 732.99), controlPoint1: CGPoint(x: 627.47, y: 740.95), controlPoint2: CGPoint(x: 625.79, y: 736.66))
        bezier33Path.addCurve(to: CGPoint(x: 636.97, y: 729.24), controlPoint1: CGPoint(x: 629, y: 729.3), controlPoint2: CGPoint(x: 633.31, y: 727.62))
        bezier33Path.addLine(to: CGPoint(x: 663.61, y: 740.9))
        bezier33Path.addCurve(to: CGPoint(x: 667.36, y: 750.48), controlPoint1: CGPoint(x: 667.3, y: 742.49), controlPoint2: CGPoint(x: 668.98, y: 746.78))
        bezier33Path.addCurve(to: CGPoint(x: 660.7, y: 754.83), controlPoint1: CGPoint(x: 666.17, y: 753.21), controlPoint2: CGPoint(x: 663.49, y: 754.83))
        bezier33Path.close()
        bezier33Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier33Path.fill()
        
        
        //// Bezier 35 Drawing
        let bezier35Path = UIBezierPath()
        bezier35Path.move(to: CGPoint(x: 631.59, y: 821.51))
        bezier35Path.addCurve(to: CGPoint(x: 628.69, y: 820.91), controlPoint1: CGPoint(x: 630.62, y: 821.51), controlPoint2: CGPoint(x: 629.64, y: 821.31))
        bezier35Path.addLine(to: CGPoint(x: 601.91, y: 809.26))
        bezier35Path.addCurve(to: CGPoint(x: 598.15, y: 799.67), controlPoint1: CGPoint(x: 598.23, y: 807.66), controlPoint2: CGPoint(x: 596.54, y: 803.37))
        bezier35Path.addCurve(to: CGPoint(x: 607.71, y: 795.89), controlPoint1: CGPoint(x: 599.74, y: 796), controlPoint2: CGPoint(x: 604, y: 794.33))
        bezier35Path.addLine(to: CGPoint(x: 634.49, y: 807.55))
        bezier35Path.addCurve(to: CGPoint(x: 638.27, y: 817.13), controlPoint1: CGPoint(x: 638.18, y: 809.14), controlPoint2: CGPoint(x: 639.88, y: 813.43))
        bezier35Path.addCurve(to: CGPoint(x: 631.59, y: 821.51), controlPoint1: CGPoint(x: 637.07, y: 819.86), controlPoint2: CGPoint(x: 634.4, y: 821.51))
        bezier35Path.close()
        bezier35Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier35Path.fill()
        
        
        //// Bezier 36 Drawing
        let bezier36Path = UIBezierPath()
        bezier36Path.move(to: CGPoint(x: 640.78, y: 931.44))
        bezier36Path.addCurve(to: CGPoint(x: 614.48, y: 926.04), controlPoint1: CGPoint(x: 631.88, y: 931.44), controlPoint2: CGPoint(x: 622.92, y: 929.65))
        bezier36Path.addCurve(to: CGPoint(x: 580.69, y: 839.68), controlPoint1: CGPoint(x: 581.29, y: 911.39), controlPoint2: CGPoint(x: 566.17, y: 872.69))
        bezier36Path.addLine(to: CGPoint(x: 674.13, y: 626.24))
        bezier36Path.addCurve(to: CGPoint(x: 710.27, y: 591.5), controlPoint1: CGPoint(x: 681.1, y: 610.23), controlPoint2: CGPoint(x: 693.94, y: 597.87))
        bezier36Path.addCurve(to: CGPoint(x: 760.27, y: 592.52), controlPoint1: CGPoint(x: 726.53, y: 585.13), controlPoint2: CGPoint(x: 744.28, y: 585.5))
        bezier36Path.addCurve(to: CGPoint(x: 796.42, y: 632.64), controlPoint1: CGPoint(x: 777.49, y: 600.06), controlPoint2: CGPoint(x: 790.67, y: 614.67))
        bezier36Path.addCurve(to: CGPoint(x: 791.72, y: 641.8), controlPoint1: CGPoint(x: 797.66, y: 636.48), controlPoint2: CGPoint(x: 795.54, y: 640.57))
        bezier36Path.addCurve(to: CGPoint(x: 782.57, y: 637.08), controlPoint1: CGPoint(x: 787.89, y: 642.99), controlPoint2: CGPoint(x: 783.79, y: 640.92))
        bezier36Path.addCurve(to: CGPoint(x: 754.42, y: 605.86), controlPoint1: CGPoint(x: 778.09, y: 623.11), controlPoint2: CGPoint(x: 767.83, y: 611.71))
        bezier36Path.addCurve(to: CGPoint(x: 715.55, y: 605.06), controlPoint1: CGPoint(x: 742.02, y: 600.4), controlPoint2: CGPoint(x: 728.2, y: 600.11))
        bezier36Path.addCurve(to: CGPoint(x: 687.46, y: 632.1), controlPoint1: CGPoint(x: 702.86, y: 610.01), controlPoint2: CGPoint(x: 692.88, y: 619.62))
        bezier36Path.addLine(to: CGPoint(x: 594.03, y: 845.53))
        bezier36Path.addCurve(to: CGPoint(x: 620.26, y: 912.7), controlPoint1: CGPoint(x: 582.71, y: 871.21), controlPoint2: CGPoint(x: 594.49, y: 901.32))
        bezier36Path.addCurve(to: CGPoint(x: 662.12, y: 912.19), controlPoint1: CGPoint(x: 633.83, y: 918.47), controlPoint2: CGPoint(x: 649.11, y: 918.3))
        bezier36Path.addCurve(to: CGPoint(x: 671.79, y: 915.66), controlPoint1: CGPoint(x: 665.71, y: 910.45), controlPoint2: CGPoint(x: 670.08, y: 912.05))
        bezier36Path.addCurve(to: CGPoint(x: 668.3, y: 925.35), controlPoint1: CGPoint(x: 673.5, y: 919.29), controlPoint2: CGPoint(x: 671.94, y: 923.65))
        bezier36Path.addCurve(to: CGPoint(x: 640.78, y: 931.44), controlPoint1: CGPoint(x: 659.66, y: 929.42), controlPoint2: CGPoint(x: 650.26, y: 931.44))
        bezier36Path.close()
        bezier36Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier36Path.fill()
        
        
        //// Bezier 37 Drawing
        let bezier37Path = UIBezierPath()
        bezier37Path.move(to: CGPoint(x: 802.75, y: 292.3))
        bezier37Path.addCurve(to: CGPoint(x: 795.81, y: 287.24), controlPoint1: CGPoint(x: 799.66, y: 292.3), controlPoint2: CGPoint(x: 796.81, y: 290.33))
        bezier37Path.addCurve(to: CGPoint(x: 800.52, y: 278.08), controlPoint1: CGPoint(x: 794.59, y: 283.42), controlPoint2: CGPoint(x: 796.69, y: 279.31))
        bezier37Path.addLine(to: CGPoint(x: 828.6, y: 269.06))
        bezier37Path.addCurve(to: CGPoint(x: 837.75, y: 273.76), controlPoint1: CGPoint(x: 832.44, y: 267.83), controlPoint2: CGPoint(x: 836.53, y: 269.92))
        bezier37Path.addCurve(to: CGPoint(x: 833.05, y: 282.92), controlPoint1: CGPoint(x: 838.99, y: 277.59), controlPoint2: CGPoint(x: 836.88, y: 281.69))
        bezier37Path.addLine(to: CGPoint(x: 804.96, y: 291.95))
        bezier37Path.addCurve(to: CGPoint(x: 802.75, y: 292.3), controlPoint1: CGPoint(x: 804.23, y: 292.18), controlPoint2: CGPoint(x: 803.49, y: 292.3))
        bezier37Path.close()
        bezier37Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier37Path.fill()
        
        
        //// Bezier 38 Drawing
        let bezier38Path = UIBezierPath()
        bezier38Path.move(to: CGPoint(x: 802.75, y: 292.3))
        bezier38Path.addCurve(to: CGPoint(x: 796.27, y: 288.34), controlPoint1: CGPoint(x: 800.1, y: 292.3), controlPoint2: CGPoint(x: 797.56, y: 290.85))
        bezier38Path.addCurve(to: CGPoint(x: 495.09, y: 107.84), controlPoint1: CGPoint(x: 753.97, y: 205.99), controlPoint2: CGPoint(x: 667.38, y: 107.84))
        bezier38Path.addCurve(to: CGPoint(x: 487.81, y: 100.56), controlPoint1: CGPoint(x: 491.07, y: 107.84), controlPoint2: CGPoint(x: 487.81, y: 104.58))
        bezier38Path.addCurve(to: CGPoint(x: 495.09, y: 93.27), controlPoint1: CGPoint(x: 487.81, y: 96.53), controlPoint2: CGPoint(x: 491.07, y: 93.27))
        bezier38Path.addCurve(to: CGPoint(x: 809.21, y: 281.69), controlPoint1: CGPoint(x: 674.72, y: 93.27), controlPoint2: CGPoint(x: 765.06, y: 195.73))
        bezier38Path.addCurve(to: CGPoint(x: 806.07, y: 291.49), controlPoint1: CGPoint(x: 811.05, y: 285.26), controlPoint2: CGPoint(x: 809.64, y: 289.65))
        bezier38Path.addCurve(to: CGPoint(x: 802.75, y: 292.3), controlPoint1: CGPoint(x: 805.01, y: 292.04), controlPoint2: CGPoint(x: 803.87, y: 292.3))
        bezier38Path.close()
        bezier38Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier38Path.fill()
        
        
        //// Group 7
        context.saveGState()
        context.beginTransparencyLayer(auxiliaryInfo: nil)
        
        //// Clip Clip 5
        let clip5Path = UIBezierPath()
        clip5Path.move(to: CGPoint(x: 187.04, y: 292.25))
        clip5Path.addCurve(to: CGPoint(x: 183.71, y: 291.44), controlPoint1: CGPoint(x: 185.91, y: 292.25), controlPoint2: CGPoint(x: 184.77, y: 291.99))
        clip5Path.addCurve(to: CGPoint(x: 180.57, y: 281.61), controlPoint1: CGPoint(x: 180.13, y: 289.59), controlPoint2: CGPoint(x: 178.73, y: 285.19))
        clip5Path.addCurve(to: CGPoint(x: 494.98, y: 92.78), controlPoint1: CGPoint(x: 224.91, y: 195.46), controlPoint2: CGPoint(x: 315.44, y: 92.78))
        clip5Path.addCurve(to: CGPoint(x: 502.26, y: 100.07), controlPoint1: CGPoint(x: 499, y: 92.78), controlPoint2: CGPoint(x: 502.26, y: 96.04))
        clip5Path.addCurve(to: CGPoint(x: 494.98, y: 107.37), controlPoint1: CGPoint(x: 502.26, y: 104.11), controlPoint2: CGPoint(x: 499, y: 107.37))
        clip5Path.addCurve(to: CGPoint(x: 193.52, y: 288.3), controlPoint1: CGPoint(x: 322.78, y: 107.37), controlPoint2: CGPoint(x: 236, y: 205.76))
        clip5Path.addCurve(to: CGPoint(x: 187.04, y: 292.25), controlPoint1: CGPoint(x: 192.22, y: 290.81), controlPoint2: CGPoint(x: 189.67, y: 292.25))
        clip5Path.close()
        clip5Path.usesEvenOddFillRule = true
        clip5Path.addClip()
        
        
        //// Rectangle 5 Drawing
        let rectangle5Path = UIBezierPath(rect: CGRect(x: 174.75, y: 87.75, width: 332.5, height: 209.5))
        dark.setFill()
        rectangle5Path.fill()
        
        
        context.endTransparencyLayer()
        context.restoreGState()
        
        
        //// Bezier 40 Drawing
        let bezier40Path = UIBezierPath()
        bezier40Path.move(to: CGPoint(x: 187.42, y: 292.3))
        bezier40Path.addCurve(to: CGPoint(x: 184.29, y: 291.58), controlPoint1: CGPoint(x: 186.37, y: 292.3), controlPoint2: CGPoint(x: 185.3, y: 292.07))
        bezier40Path.addLine(to: CGPoint(x: 163.91, y: 281.83))
        bezier40Path.addCurve(to: CGPoint(x: 160.49, y: 272.12), controlPoint1: CGPoint(x: 160.29, y: 280.1), controlPoint2: CGPoint(x: 158.75, y: 275.75))
        bezier40Path.addCurve(to: CGPoint(x: 170.19, y: 268.69), controlPoint1: CGPoint(x: 162.22, y: 268.49), controlPoint2: CGPoint(x: 166.56, y: 266.97))
        bezier40Path.addLine(to: CGPoint(x: 190.57, y: 278.45))
        bezier40Path.addCurve(to: CGPoint(x: 193.99, y: 288.16), controlPoint1: CGPoint(x: 194.19, y: 280.18), controlPoint2: CGPoint(x: 195.73, y: 284.53))
        bezier40Path.addCurve(to: CGPoint(x: 187.42, y: 292.3), controlPoint1: CGPoint(x: 192.74, y: 290.78), controlPoint2: CGPoint(x: 190.13, y: 292.3))
        bezier40Path.close()
        bezier40Path.usesEvenOddFillRule = true
        dark.setFill()
        bezier40Path.fill()
        
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
}
