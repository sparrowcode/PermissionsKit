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

class SPAppleMusicSectionButtonsView: SPView {
    
    let topSeparatorView = SPSeparatorView()
    let bottomSeparatorView = SPSeparatorView()
    let leftButton = SPAppleMusicButton()
    let rightButton = SPAppleMusicButton()
    
    var sectionHeight: CGFloat = 92 {
        didSet { self.layoutSubviews() }
    }
    
    var buttonsSpace: CGFloat = 18 {
        didSet { self.layoutSubviews() }
    }
    
    var selectColor: UIColor = UIColor.init(hex: "FD2D55") {
        didSet {
            self.leftButton.selectColor = selectColor
            self.rightButton.selectColor = selectColor
        }
    }
    
    var baseColor: UIColor = UIColor.init(hex: "F8F7FC") {
        didSet {
            self.leftButton.baseColor = baseColor
            self.rightButton.baseColor = baseColor
        }
    }
    
    override func commonInit() {
        super.commonInit()
        self.addSubview(self.topSeparatorView)
        self.addSubview(self.bottomSeparatorView)
        
        for button in [self.leftButton, self.rightButton] {
            button.type = .unselect
            button.setTitle("Title")
            self.addSubview(button)
        }
    }
    
    func layout(origin: CGPoint, width: CGFloat) {
        self.frame.origin = origin
        self.frame.set(width: width, height: sectionHeight)
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.topSeparatorView.frame.origin = .zero
        self.topSeparatorView.frame.set(width: self.frame.width)
        
        self.bottomSeparatorView.frame.origin.x = 0
        self.bottomSeparatorView.frame.bottomY = self.frame.height
        self.bottomSeparatorView.frame.set(width: self.frame.width)
        
        let buttonWidth = (self.frame.width - self.buttonsSpace) / 2
        
        self.leftButton.sizeToFit()
        self.leftButton.frame.set(width: buttonWidth)
        self.leftButton.frame.origin.x = 0
        self.leftButton.center.y = self.frame.height / 2
        
        self.rightButton.sizeToFit()
        self.rightButton.frame.set(width: buttonWidth)
        self.rightButton.frame.bottomX = self.frame.width
        self.rightButton.center.y = self.frame.height / 2
    }
}
