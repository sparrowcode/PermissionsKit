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

class SPEmptyProposeView: UIView {
    
    let imageView = SPDownloadingImageView()
    let label = UILabel()
    let button = UIButton.init(type: UIButton.ButtonType.system)
    
    init() {
        super.init(frame: CGRect.zero)
        self.label.text = "Description"
        self.button.setTitle("Button", for: UIControl.State.normal)
        self.commonInit()
    }
    
    init(image: UIImage, text: String, buttonTitle: String, buttonTarget: @escaping ()->()) {
        super.init(frame: CGRect.zero)
        self.imageView.setImage(image: image, animatable: false)
        self.label.text = text
        self.button.setTitle(buttonTitle)
        self.button.target {
            buttonTarget()
        }
        self.commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor.clear
        
        self.imageView.contentMode = .scaleAspectFit
        self.addSubview(self.imageView)
        
        self.label.numberOfLines = 0
        self.label.setCenteringAlignment()
        self.label.font = UIFont.system(type: .Regular, size: 13)
        self.label.textColor = SPNativeStyleKit.Colors.gray
        self.addSubview(self.label)
        
        self.addSubview(self.button)
        self.button.titleLabel?.font = UIFont.system(type: .Medium, size: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.button.sizeToFit()
        self.button.setXCenteringFromSuperview()
        
        self.label.setWidth(self.frame.width)
        self.label.sizeToFit()
        self.label.setXCenteringFromSuperview()
        
        var imageHeight: CGFloat = 90
        
        self.imageView.frame = CGRect.init(
            x: 0, y: 0,
            width: self.frame.width,
            height: imageHeight
        )
        
        let spaceBetwenImageAndTitle: CGFloat = 20
        let spaceBetwenTitleAndButton: CGFloat = 10
        var allHeight: CGFloat = self.imageView.frame.height + spaceBetwenImageAndTitle + self.label.frame.height + spaceBetwenTitleAndButton + self.button.frame.height
        
        if self.frame.height < allHeight {
            imageHeight.setIfMore(when: self.frame.height - spaceBetwenImageAndTitle + self.label.frame.height + spaceBetwenTitleAndButton + self.button.frame.height)
            if imageHeight < 0 {
                imageHeight.setIfFewer(when: 0)
                self.imageView.isHidden = true
            } else {
                self.imageView.frame = CGRect.init(
                    x: 0, y: 0,
                    width: self.frame.width,
                    height: imageHeight
                )
                self.imageView.isHidden = false
            }
        }
        
        allHeight = self.imageView.frame.height + spaceBetwenImageAndTitle + self.label.frame.height + spaceBetwenTitleAndButton + self.button.frame.height
        
        self.imageView.frame.origin.y = (self.frame.height - allHeight) / 2
        self.label.frame.origin.y = self.imageView.frame.bottomYPosition + spaceBetwenImageAndTitle
        self.button.frame.origin.y = self.label.frame.bottomYPosition + spaceBetwenTitleAndButton
    }
}
