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

class SPBannerWithTitlesView: UIView {
    
    let titleLabel: UILabel = UILabel()
    let subTitleLabel: UILabel = UILabel()
    private var backgroundView: UIView = UIView()
    
    //MARK: layout
    var titleWidthFactor: CGFloat = 0.8
    var subTitleWidthFactor: CGFloat = 0.8
    
    init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    init(title: String, subTitle: String, backgroundView: UIView) {
        super.init(frame: CGRect.zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        self.backgroundView = backgroundView
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackgroundView(_ view: UIView) {
        self.backgroundView = view
        self.insertSubview(view, at: 0)
    }
    
    private func commonInit() {
        self.addSubview(self.backgroundView)
        self.addSubview(self.titleLabel)
        self.addSubview(self.subTitleLabel)
        self.titleLabel.setCenteringAlignment()
        self.titleLabel.textColor = UIColor.white
        self.subTitleLabel.setCenteringAlignment()
        self.subTitleLabel.textColor = UIColor.white
        self.titleLabel.setShadowOffsetForLetters(blurRadius: 0, widthOffset: 0, heightOffset: 1, opacity: 1)
        self.subTitleLabel.setShadowOffsetForLetters(blurRadius: 0, widthOffset: 0, heightOffset: 1, opacity: 1)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundView.frame = self.bounds
        
        let titleWidth = self.frame.width * self.titleWidthFactor
        let subTitleWidth = self.frame.width * self.subTitleWidthFactor
        
        self.titleLabel.frame = CGRect.init(x: 0, y: 0, width: titleWidth, height: self.frame.height)
        self.subTitleLabel.frame = CGRect.init(x: 0, y: 0, width: subTitleWidth, height: self.frame.height)
        
        self.titleLabel.sizeToFit()
        self.subTitleLabel.sizeToFit()
        
        let titleHeight = self.titleLabel.frame.height
        let subTitleHeight = self.subTitleLabel.frame.height
        
        let titleYPosition = (self.frame.height - (titleHeight + subTitleHeight)) / 2
        let subtitleYPosition = titleYPosition + titleHeight
        
        self.titleLabel.frame = CGRect.init(x: 0, y: titleYPosition, width: titleWidth, height: titleHeight)
        self.titleLabel.center.x = self.frame.width / 2
        self.subTitleLabel.frame = CGRect.init(x: 0, y: subtitleYPosition, width: subTitleWidth, height: subTitleHeight)
        self.subTitleLabel.center.x = self.frame.width / 2
        self.backgroundView.frame = self.bounds
    }
}

