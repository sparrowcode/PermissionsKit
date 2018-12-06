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

class SPSocialIconView: UIView {
    
    var type: SPSocialNetwork {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var color = SPNativeStyleKit.Colors.blue {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    init() {
        self.type = .facebook
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    init(type: SPSocialNetwork) {
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
        case .facebook:
            SPCodeDraw.SocialIconPack.drawFacebook(frame: rect, resizing: .aspectFit, fillColor: self.color)
            break
        case .telegram:
            SPCodeDraw.SocialIconPack.drawTelegram(frame: rect, resizing: .aspectFit, fillColor: self.color)
            break
        case .viber:
            SPCodeDraw.SocialIconPack.drawViber(frame: rect, resizing: .aspectFit, fillColor: self.color)
            break
        case .vk:
            SPCodeDraw.SocialIconPack.drawVK(frame: rect, resizing: .aspectFit, fillColor: self.color)
            break
        case .whatsapp:
            SPCodeDraw.SocialIconPack.drawWhatsapp(frame: rect, resizing: .aspectFit, fillColor: self.color)
            break
        }
    }
}


