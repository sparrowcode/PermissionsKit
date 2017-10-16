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

class SPRateAppBannerWithIndicatorAlertView: UIView {
    
    let label = UILabel()
    let button: SPRateAppBannerWithIndicatorTwiceButton
    
    init(title: String, buttonTitle: String, firstColor: UIColor, secondColor: UIColor) {
        self.button = SPRateAppBannerWithIndicatorTwiceButton.init(title: buttonTitle, normalColor: firstColor, selectedColor: secondColor)
        super.init(frame: CGRect.zero)
        
        self.label.textColor = firstColor
        self.label.font = UIFont.fonts.AvenirNext(type: .Bold, size: 16)
        self.label.text = title
        self.label.adjustsFontSizeToFitWidth = true
        self.label.minimumScaleFactor = 0.5
        self.label.numberOfLines = 0
        self.addSubview(self.label)
        
        self.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.label.setEqualsFrameFromBounds(self, withWidthFactor: 0.4, maxWidth: nil, withHeightFactor: 0.6, maxHeight: nil, withCentering: false)
        
        self.label.frame.origin.y = (self.frame.height - self.label.frame.height) / 2
        
        let space = (self.frame.height - self.label.frame.height) * 0.8
        self.label.frame.origin.x = space
        
        let buttonWidth: CGFloat = self.frame.width - self.label.frame.bottomXPosition - space * 1.5
        self.button.frame = CGRect.init(x: self.label.frame.bottomXPosition + space / 2, y: 0, width: buttonWidth, height: self.frame.height * 0.465)
        self.button.center.y = self.frame.height / 2
    }
}
