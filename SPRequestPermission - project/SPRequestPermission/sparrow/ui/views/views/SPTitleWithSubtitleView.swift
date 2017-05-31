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

class SPTitleWithSubtitleView: UIView {
    
    var titleLabel: UILabel = UILabel.init()
    var subtitleLabel: UILabel = UILabel.init()
    private var backgroundView: UIView = UIView()
    
    var maxTextWidthFactor: CGFloat = 1
    var spaceBetweenText: CGFloat = 0
    
    var isShowShadow: Bool = true
    
    init() {
        super.init(frame: CGRect.zero)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor.clear
        
        self.subtitleLabel.text = "Subtitle"
        self.subtitleLabel.layer.shadowColor = UIColor.black.cgColor
        self.subtitleLabel.font = UIFont.fonts.AvenirNext(type: .Medium, size: 14)
        self.subtitleLabel.textColor = UIColor.white
        self.subtitleLabel.setCenteringAlignment()
        self.subtitleLabel.numberOfLines = 0
        self.addSubview(self.subtitleLabel)
        
        self.titleLabel.text = "Title"
        self.titleLabel.font = UIFont.fonts.AvenirNext(type: .DemiBold, size: 25)
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.setCenteringAlignment()
        self.addSubview(self.titleLabel)
        
        self.backgroundView.backgroundColor = UIColor.clear
        self.addSubview(self.backgroundView)
    }
    
    func setBackgroundView(_ view: UIView) {
        self.backgroundView = view
        self.insertSubview(view, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundView.setEqualsFrameFromBounds(self)
        
        let textWidth = self.frame.width * self.maxTextWidthFactor
        
        self.titleLabel.setWidth(textWidth)
        self.titleLabel.sizeToFit()
        
        self.subtitleLabel.setWidth(textWidth)
        self.subtitleLabel.sizeToFit()
        
        let spaceBetweenText = self.spaceBetweenText
        
        let allNeedHeight: CGFloat = self.titleLabel.frame.height + self.subtitleLabel.frame.height + spaceBetweenText
        self.titleLabel.frame.origin.y = (self.frame.height - allNeedHeight) / 2
        self.titleLabel.center.x = self.frame.width / 2
        self.subtitleLabel.frame.origin.y = self.titleLabel.frame.bottomYPosition + spaceBetweenText
        self.subtitleLabel.center.x = self.frame.width / 2

        if self.isShowShadow {
            let offset = self.titleLabel.frame.height * 0.03
            self.titleLabel.setShadowOffsetForLetters(heightOffset: offset, opacity: 0.35)
            self.subtitleLabel.setShadowOffsetForLetters(heightOffset: offset, opacity: 0.35)
        } else {
            self.titleLabel.removeShadowForLetters()
            self.subtitleLabel.removeShadowForLetters()
        }
    }
    
    //OLD
    /*
     
     override func layoutSubviews() {
     super.layoutSubviews()
     
     self.backgroundView.setEqualsFrameFromBounds(self)
     
     let heightFactor: CGFloat = 0.565
     self.titleLabel.frame = CGRect.init(x: 0, y: 0, width: self.frame.width, height: self.frame.height * heightFactor)
     
     self.subtitleLabel.frame = CGRect.init(x: 0, y: (self.titleLabel.frame.origin.y + self.titleLabel.frame.height), width: self.frame.width, height: self.frame.height * (1 - heightFactor))
     
     if self.isShowShadow {
     let offset = self.titleLabel.frame.height * 0.03
     self.titleLabel.setShadowOffsetForLetters(heightOffset: offset, opacity: 0.35)
     self.subtitleLabel.setShadowOffsetForLetters(heightOffset: offset, opacity: 0.35)
     } else {
     self.titleLabel.removeShadowForLetters()
     self.subtitleLabel.removeShadowForLetters()
     }
     }
 */
}
