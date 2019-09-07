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

class SPSystemIconView: UIView {
    
    var icon: SPSystemIcon {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    var color = SPNativeColors.blue {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    init() {
        self.icon = .share
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    init(type: SPSystemIcon) {
        self.icon = type
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
        switch icon {
        case .share:
            SPCodeDraw.SystemIconPack.drawShare(frame: rect, resizing: .aspectFit, color: self.color)
            break
        case .close:
            SPCodeDraw.SystemIconPack.drawClose(frame: rect, resizing: .aspectFit, color: self.color)
            break
        case .favorite:
            SPCodeDraw.SystemIconPack.drawFavorite(frame: rect, resizing: .aspectFit, color: self.color)
            break
        case .favorite_fill:
            SPCodeDraw.SystemIconPack.drawFavoriteFill(frame: rect, resizing: .aspectFit, color: self.color)
            break
        }
    }
}

