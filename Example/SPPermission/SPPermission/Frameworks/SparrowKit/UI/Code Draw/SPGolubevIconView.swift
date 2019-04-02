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

class SPGolubevIconView: UIView {
    
    var type: IconType {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var whiteColor = SPNativeColors.white {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var lightColor = UIColor.init(hex: "C4D8FB") {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var mediumColor = UIColor.init(hex: "7AA9F8") {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var darkColor = UIColor.init(hex: "007AFF") {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    init() {
        self.type = .ball
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    init(type: IconType) {
        self.type = type
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        switch type {
        case .camera:
            SPCodeDraw.GolubevIconPack.drawCamera(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .photoLibrary:
            SPCodeDraw.GolubevIconPack.drawPhotoLibrary(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .ball:
            SPCodeDraw.GolubevIconPack.drawBall(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .micro:
            SPCodeDraw.GolubevIconPack.drawMicro(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .book:
            SPCodeDraw.GolubevIconPack.drawBook(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .documents:
            SPCodeDraw.GolubevIconPack.drawDocuments(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .calendar:
            SPCodeDraw.GolubevIconPack.drawCalendar(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .compass:
            SPCodeDraw.GolubevIconPack.drawCompass(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .headphones:
            SPCodeDraw.GolubevIconPack.drawHeadphones(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .windmill:
            SPCodeDraw.GolubevIconPack.drawWindmill(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        }
    }
    
    enum IconType {
        case camera
        case photoLibrary
        case ball
        case micro
        case calendar
        case book
        case documents
        case compass
        case headphones
        case windmill
    }
}

