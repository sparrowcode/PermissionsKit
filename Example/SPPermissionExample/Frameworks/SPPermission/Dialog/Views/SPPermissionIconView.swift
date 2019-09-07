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

class SPPermissionIconView: UIView {
    
    var type: IconType {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var whiteColor = SPPermissionStyle.DefaultColors.white {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var lightColor = SPPermissionStyle.DefaultColors.lightIcon {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var mediumColor = SPPermissionStyle.DefaultColors.mediumIcon {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var darkColor = SPPermissionStyle.DefaultColors.darkIcon {
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
            SPPermissionDraw.PermissionPack.drawCamera(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .photoLibrary:
            SPPermissionDraw.PermissionPack.drawPhotoLibrary(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .ball:
            SPPermissionDraw.PermissionPack.drawBall(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .micro:
            SPPermissionDraw.PermissionPack.drawMicro(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .book:
            SPPermissionDraw.PermissionPack.drawBook(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .documents:
            SPPermissionDraw.PermissionPack.drawDocuments(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .calendar:
            SPPermissionDraw.PermissionPack.drawCalendar(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .compass:
            SPPermissionDraw.PermissionPack.drawCompass(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .headphones:
            SPPermissionDraw.PermissionPack.drawHeadphones(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        case .windmill:
            SPPermissionDraw.PermissionPack.drawWindmill(frame: rect, resizing: .aspectFit, white: self.whiteColor, light: self.lightColor, medium: self.mediumColor, dark: self.darkColor)
            break
        }
    }
    
    public enum IconType {
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

