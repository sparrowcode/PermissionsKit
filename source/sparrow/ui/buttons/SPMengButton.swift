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

class SPMengButton: SPGradientButton {
    
    override init() {
        super.init()
        
        self.isFrameRounded = true
        
        self.contentEdgeInsets = UIEdgeInsets.init(top: 12, left: 21, bottom: 12, right: 21)
        self.titleLabel?.font = UIFont.system(type: UIFont.BoldType.Bold, size: 17)
        self.setTitleColorForNoramlAndHightlightedStates(color: UIColor.white)
        self.layer.masksToBounds = true
        self.gradientView.layer.masksToBounds = true
        
        self.gradientView.setStartColorPosition(SPGradientView.Position.MediumLeft)
        self.gradientView.setEndColorPosition(SPGradientView.Position.MediumRight)
        self.gradientView.startColor = UIColor.init(hex: "5737F6")
        self.gradientView.endColor = UIColor.init(hex: "956BFE")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.isFrameRounded {
            self.gradientView.round()
            self.round()
        }
    }
}
