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

class SPDownloadingButton: SPButton {
    
    let activityIndicatorView = UIActivityIndicatorView.init()
    
    func startLoading() {
        self.activityIndicatorView.alpha = 0
        self.activityIndicatorView.isHidden = false
        self.activityIndicatorView.startAnimating()
        self.activityIndicatorView.color = self.titleLabel?.textColor
        self.addSubview(self.activityIndicatorView)
        self.hideContent(completion: {
            SPAnimation.animate(0.2, animations: {
                self.activityIndicatorView.alpha = 1
            })
        })
    }
    
    func stopLoading(newText: String? = nil) {
        if let newText = newText {
            self.setTitle(newText)
        }
        SPAnimation.animate(0.2, animations: {
            self.activityIndicatorView.alpha = 0
        }, withComplection: {
            self.activityIndicatorView.removeFromSuperview()
            self.activityIndicatorView.isHidden = true
            self.activityIndicatorView.stopAnimating()
            self.showContent()
        })
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.activityIndicatorView.center = CGPoint.init(x: self.frame.width / 2, y: self.frame.height / 2)
    }
}

