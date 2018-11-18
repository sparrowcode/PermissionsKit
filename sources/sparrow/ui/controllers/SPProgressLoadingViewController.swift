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

class SPProgressLoadingViewController: SPBaseViewController {
    
    let titleLabel = UILabel.init()
    let subtitleLabel = UILabel.init()
    let progressView = UIProgressView.init(progressViewStyle: UIProgressView.Style.default)
    let commentLabel = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = SPNativeStyleKit.Colors.white
        
        self.titleLabel.text = "Title"
        self.titleLabel.font = UIFont.system(type: UIFont.BoldType.Medium, size: 23)
        self.titleLabel.textColor = SPNativeStyleKit.Colors.black
        self.titleLabel.numberOfLines = 1
        self.view.addSubview(self.titleLabel)
        
        self.subtitleLabel.text = "Subtitle..."
        self.subtitleLabel.setCenteringAlignment()
        self.subtitleLabel.font = UIFont.system(type: UIFont.BoldType.Regular, size: 13)
        self.subtitleLabel.textColor = SPNativeStyleKit.Colors.gray
        self.subtitleLabel.numberOfLines = 1
        self.view.addSubview(self.subtitleLabel)
        
        self.progressView.progress = 0
        self.view.addSubview(self.progressView)
        
        self.activityIndicatorView.color = SPNativeStyleKit.Colors.gray
        self.activityIndicatorView.startAnimating()
        self.view.addSubview(self.activityIndicatorView)
        
        self.commentLabel.text = "Comment"
        self.commentLabel.setCenteringAlignment()
        self.commentLabel.font = UIFont.system(type: UIFont.BoldType.Regular, size: 11)
        self.commentLabel.textColor = SPNativeStyleKit.Colors.gray
        self.commentLabel.numberOfLines = 1
        self.view.addSubview(self.commentLabel)
        
        self.updateLayout(with: self.view.frame.size)
    }
    
    func set(progress: Float) {
        self.progressView.setProgress(progress, animated: true)
    }
    
    override func updateLayout(with size: CGSize) {
        self.titleLabel.sizeToFit()
        self.titleLabel.center.x = size.width / 2
        
        self.subtitleLabel.sizeToFit()
        self.subtitleLabel.center.x = size.width / 2
        
        self.progressView.setWidth(size.width * 0.55)
        self.progressView.center.x  = size.width / 2
        
        self.activityIndicatorView.sizeToFit()
        self.activityIndicatorView.center.x = size.width / 2
        
        let allHeight = self.titleLabel.frame.height + 5 + self.subtitleLabel.frame.height + 30 + self.progressView.frame.height + 30 + self.activityIndicatorView.frame.height
        
        self.titleLabel.frame.origin.y = (size.height - allHeight - self.topSafeArea) / 2
        self.subtitleLabel.frame.origin.y = self.titleLabel.frame.bottomYPosition + 5
        self.progressView.frame.origin.y = self.subtitleLabel.frame.bottomYPosition + 30
        self.activityIndicatorView.frame.origin.y = self.progressView.frame.bottomYPosition + 30
        
        self.commentLabel.sizeToFit()
        self.commentLabel.center.x = size.width / 2
        self.commentLabel.frame.origin.y = size.height - (self.view.bottomSafeArea + self.commentLabel.frame.height + 5)
    }
}
