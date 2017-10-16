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

class SPRateAppBannerWithIndicatorTwiceButton: UIButton {
    
    var normalColor: UIColor
    var selectedColor: UIColor
    
    init(title: String, normalColor: UIColor, selectedColor: UIColor) {
        self.normalColor = normalColor
        self.selectedColor = selectedColor
        super.init(frame: CGRect.zero)
        self.setTitle(title, for: UIControlState.normal)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.layer.borderWidth = 2
        self.titleLabel?.font = UIFont.fonts.AvenirNext(type: .DemiBold, size: 14)
        /*if UIScreen.main.bounds.width < 335 {
            self.titleLabel?.font = UIFont.fonts.AvenirNext(type: .DemiBold, size: 12)
        }*/
        self.titleLabel?.minimumScaleFactor = 0.5
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.setNormalState(animated: false)
        self.addTarget(self, action: #selector(self.pressButton), for: .touchUpInside)
    }
    
    @objc func pressButton() {
        self.setSelectedState(animated: true)
    }
    
    func setNormalState(animated: Bool) {
        self.layer.borderColor = self.normalColor.cgColor
        self.backgroundColor = self.selectedColor
        self.setTitleColor(self.normalColor, for: UIControlState.normal)
        self.setTitleColor(self.normalColor.withAlphaComponent(0.62), for: UIControlState.highlighted)
    }
    
    func setSelectedState(animated: Bool) {
        self.layer.borderColor = self.normalColor.cgColor
        if animated{
            UIView.animate(withDuration: 0.4, animations: {
                self.backgroundColor = self.selectedColor
            })
        } else {
            self.backgroundColor = self.selectedColor
        }
        var colorForTitle = self.normalColor
        if self.normalColor == UIColor.clear {
            colorForTitle = UIColor.white
        }
        self.setTitleColor(colorForTitle, for: UIControlState.normal)
        self.setTitleColor(colorForTitle.withAlphaComponent(0.62), for: UIControlState.highlighted)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
    }
}
