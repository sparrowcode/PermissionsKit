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

class SPEmptyLabelsView: SPView {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    init(title: String, subtitle: String) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func commonInit() {
        super.commonInit()
        
        self.titleLabel.font = UIFont.system(weight: .bold, size: 29)
        self.titleLabel.textColor = SPNativeColors.gray
        self.titleLabel.setCenterAlignment()
        self.titleLabel.numberOfLines = 0
        self.addSubview(self.titleLabel)
        
        self.subtitleLabel.font = UIFont.system(weight: .regular, size: 17)
        self.subtitleLabel.textColor = SPNativeColors.gray
        self.subtitleLabel.setCenterAlignment()
        self.subtitleLabel.numberOfLines = 0
        self.addSubview(self.subtitleLabel)
    }
    
    func layout(centerY: CGFloat) {
        if let superview = self.superview {
            self.frame.set(width: superview.frame.width * 0.7)
            self.layoutSubviews()
            self.center = CGPoint.init(x: superview.frame.width / 2, y: centerY)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel.frame.origin = .zero
        self.titleLabel.sizeToFit()
        self.titleLabel.frame.set(width: self.frame.width)
        
        self.subtitleLabel.frame.origin = CGPoint.init(x: 0, y: self.titleLabel.frame.bottomY + 5)
        self.subtitleLabel.sizeToFit()
        self.subtitleLabel.frame.set(width: self.frame.width)
        
        self.frame.set(height: self.subtitleLabel.frame.bottomY)
    }
}
