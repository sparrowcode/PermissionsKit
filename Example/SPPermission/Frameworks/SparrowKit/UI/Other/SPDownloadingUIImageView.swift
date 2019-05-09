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

class SPDownloadingImageView: SPImageView {
    
    let gradeView = UIView.init()
    
    override func commonInit() {
        super.commonInit()
        self.backgroundColor = UIColor.clear
        self.layer.masksToBounds = true
        self.addSubview(self.gradeView)
        self.gradeView.backgroundColor = UIColor.init(hex: "F0F1F6")
    }
    
    func setImage(link: String, with complection: ((UIImage?)->())? = nil) {
        SPDownloader.image(link: link) { (image) in
            DispatchQueue.main.async {
                if let setupImage = image {
                    self.setImage(image: setupImage, animatable: true)
                }
                complection?(image)
            }
        }
    }
    
    func setImage(image: UIImage, animatable: Bool) {
        self.image = image
        
        if animatable {
            SPAnimation.animate(0.2, animations: {
                self.gradeView.alpha = 0
            })
        } else {
            self.gradeView.alpha = 0
        }
    }
    
    func removeImage() {
        self.image = nil
        self.gradeView.alpha = 1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.gradeView.setSuperviewBounds()
    }
}
