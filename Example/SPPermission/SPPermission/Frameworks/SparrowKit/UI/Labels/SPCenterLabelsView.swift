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

class SPCenterLabelsView: SPView {
    
    let titleLabel = SPLabel()
    let subtitleLabel = SPLabel()
    
    override func commonInit() {
        super.commonInit()
        
        self.titleLabel.font = UIFont.system(weight: .bold, size: 33)
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = UIColor.black
        self.titleLabel.numberOfLines = 0
        self.addSubview(self.titleLabel)
        
        self.subtitleLabel.font = UIFont.system(weight: .regular, size: 17)
        self.subtitleLabel.textAlignment = .center
        self.subtitleLabel.textColor = UIColor.black
        self.subtitleLabel.numberOfLines = 0
        self.addSubview(self.subtitleLabel)
    }
    
    func layout(x: CGFloat, y: CGFloat, width: CGFloat) {
        self.frame.origin = CGPoint.init(x: x, y: y)
        self.frame.set(width: width)
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel.frame.set(width: self.frame.width)
        self.titleLabel.sizeToFit()
        self.titleLabel.frame.set(width: self.frame.width)
        self.titleLabel.frame.origin = CGPoint.zero
        
        self.subtitleLabel.frame.set(width: self.frame.width)
        self.subtitleLabel.sizeToFit()
        self.subtitleLabel.frame.set(width: self.frame.width)
        self.subtitleLabel.frame.origin.x = 0
        self.subtitleLabel.frame.origin.y = self.titleLabel.frame.bottomY + 7
        
        self.frame.set(height: self.subtitleLabel.frame.bottomY)
    }
}
