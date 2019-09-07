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

class SPFormTextInputTableViewCell: SPTableViewCell {
    
    let textInputView: UITextView = UITextView()

    var textInputViewHeight: CGFloat = 150 {
        didSet {
            self.textInputViewHeightConstraint.constant = self.textInputViewHeight
        }
    }
    
    private var textInputViewHeightConstraint: NSLayoutConstraint!
    
    override var contentViews: [UIView] {
        return [self.textInputView]
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
        self.textInputView.textAlignment = .left
        self.textInputView.text = ""
        self.textInputView.font = UIFont.system(weight: .regular, size: 17)
        self.textInputView.translatesAutoresizingMaskIntoConstraints = false
        self.textInputView.showsVerticalScrollIndicator = false
        self.contentView.addSubview(self.textInputView)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        self.textInputView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        self.textInputView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        self.textInputView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        self.textInputView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        self.textInputViewHeightConstraint = self.textInputView.heightAnchor.constraint(equalToConstant: self.textInputViewHeight)
        self.textInputViewHeightConstraint.isActive = true
        
        self.stopLoading(animated: false)
        self.separatorInsetStyle = .auto
        self.accessoryType = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.textInputView.text = ""
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let xPosition: CGFloat = (self.imageView?.frame.bottomX ?? 0) + self.layoutMargins.left
        
        self.textInputView.frame = CGRect.init(
            x: xPosition, y: 0,
            width: self.frame.width - self.layoutMargins.left - self.layoutMargins.right,
            height: self.contentView.frame.height
        )
        
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

