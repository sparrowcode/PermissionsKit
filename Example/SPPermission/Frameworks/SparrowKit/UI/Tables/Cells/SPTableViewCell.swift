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

class SPTableViewCell: UITableViewCell {
    
    var contentViews: [UIView] {
        return self.contentView.subviews
    }
    
    let processActivityIndicatorView = UIActivityIndicatorView()
    let activityIndicatorView = UIActivityIndicatorView.init()
    var currentIndexPath: IndexPath? = nil
    
    override var accessoryType: UITableViewCell.AccessoryType {
        didSet {
            if self.accessoryType == .disclosureIndicator {
                self.selectionStyle = .default
            } else {
                self.selectionStyle = .none
            }
        }
    }
    
    var separatorInsetStyle: SPSeparatorInsetStyle = SPSeparatorInsetStyle.auto {
        didSet {
            layoutSubviews()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        
        self.contentView.addSubview(self.processActivityIndicatorView)
        self.processActivityIndicatorView.style = .gray
        self.processActivityIndicatorView.stopAnimating()
        
        let marginGuide = contentView.layoutMarginsGuide
        
        self.contentView.addSubview(self.activityIndicatorView)
        self.activityIndicatorView.color = UIColor.lightGray
        self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicatorView.centerXAnchor.constraint(equalTo: marginGuide.centerXAnchor, constant: 0).isActive = true
        self.activityIndicatorView.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor, constant: 0).isActive = true
        self.activityIndicatorView.style = .gray
        self.activityIndicatorView.stopAnimating()
    }
    
    func startLoadingProcess() {
        self.processActivityIndicatorView.startAnimating()
        self.accessoryView?.isHidden = true
    }
    
    func stopLoadingProcess() {
        self.processActivityIndicatorView.stopAnimating()
        self.accessoryView?.isHidden = false
    }
    
    func startLoading(animated: Bool) {
        if animated {
            self.activityIndicatorView.startAnimating()
            SPAnimationAlpha.hideList(views: self.contentViews)
        } else {
            self.activityIndicatorView.startAnimating()
            for view in self.contentViews {
                view.alpha = 0
            }
        }
    }
    
    func stopLoading(animated: Bool) {
        if animated {
            self.activityIndicatorView.stopAnimating()
            SPAnimationAlpha.showList(views: self.contentViews)
        } else {
            self.activityIndicatorView.stopAnimating()
            for view in self.contentViews {
                view.alpha = 1
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.currentIndexPath = nil
        self.separatorInsetStyle = .auto
        self.activityIndicatorView.stopAnimating()
        self.processActivityIndicatorView.stopAnimating()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let accessoryView = self.accessoryView {
            self.processActivityIndicatorView.center = accessoryView.center
        }
    }
}
