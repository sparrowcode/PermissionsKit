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

class SPFormLabelTableViewCell: SPTableViewCell {
    
    let label: UILabel = UILabel()
    let descriptionLabel: UILabel = UILabel()
    
    var fixWidthLabel: CGFloat? = nil
    var onlyLeftLabel: Bool = false
    
    override var contentViews: [UIView] {
        return [self.descriptionLabel]
    }
    
    override var accessoryType: UITableViewCell.AccessoryType {
        didSet {
            if self.accessoryType == .disclosureIndicator {
                self.selectionStyle = .default
            } else {
                self.selectionStyle = .none
            }
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
    
    override func commonInit() {
        super.commonInit()
        self.backgroundColor = UIColor.white
        self.label.textAlignment = .left
        self.label.text = "Title"
        self.label.numberOfLines = 1
        self.label.font = UIFont.system(weight: .regular, size: 17)
        self.contentView.addSubview(self.label)
        
        self.descriptionLabel.textAlignment = .right
        self.descriptionLabel.text = "Description"
        self.descriptionLabel.numberOfLines = 1
        self.descriptionLabel.font = UIFont.system(weight: .regular, size: 17)
        self.descriptionLabel.textColor = SPNativeColors.gray
        self.contentView.addSubview(self.descriptionLabel)

        self.stopLoading(animated: false)
        
        self.separatorInsetStyle = .auto
        self.accessoryType = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.label.text = "Title"
        self.descriptionLabel.text = "Description"
        self.separatorInsetStyle = .auto
        self.onlyLeftLabel = false
        self.fixWidthLabel = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let xPosition: CGFloat = (self.imageView?.frame.bottomX ?? 0) + self.layoutMargins.left
        
        var labelWidth: CGFloat = self.contentView.frame.width * 0.45
        if let width = self.fixWidthLabel {
            labelWidth = width
        } else {
            self.label.sizeToFit()
            labelWidth = self.label.frame.width
        }
        
        self.label.frame = CGRect.init(x: xPosition, y: 0, width: labelWidth, height: self.contentView.frame.height)
        
        let space: CGFloat = 15
        self.descriptionLabel.frame = CGRect.init(
            x: self.label.frame.bottomX + space,
            y: 0,
            width: self.contentView.frame.width - self.label.frame.bottomX -
                self.contentView.layoutMargins.right - space,
            height: self.contentView.frame.height)

        if onlyLeftLabel {
            self.label.frame = CGRect.init(x: xPosition, y: 0, width: self.frame.width - self.layoutMargins.left - self.layoutMargins.right, height: self.contentView.frame.height)
            self.descriptionLabel.isHidden = true
        } else {
            self.descriptionLabel.isHidden = false
        }
        
        switch self.separatorInsetStyle {
        case .all:
            self.separatorInset.left = 0
        case .beforeImage:
            if let imageView = self.imageView {
                self.separatorInset.left = imageView.frame.bottomY + self.layoutMargins.left
            } else {
                self.separatorInset.left = 0
            }
        case .none:
            self.separatorInset.left = self.frame.width
        case .auto:
            self.separatorInset.left = self.layoutMargins.left
        }
    }
}

