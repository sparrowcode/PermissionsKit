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

class SPFormButtonTableViewCell: UITableViewCell {
    
    let button = SPDownloadingButton()
    
    var separatorInsetStyle: SPSeparatorInsetStyle = SPSeparatorInsetStyle.beforeImage {
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
    
    private func commonInit() {
        self.backgroundColor = UIColor.white
        self.button.setTitle("Button", for: .normal)
        self.button.backgroundColor = UIColor.clear
        self.button.setTitleColor(SPNativeColors.blue)
        self.button.titleLabel?.font = UIFont.system(weight: .medium, size: 17)
        self.selectionStyle = .none
        self.contentView.addSubview(self.button)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.button.setTitle("Button", for: .normal)
        self.button.removeAllTargets()
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.button.setSuperviewBounds()
        
        switch self.separatorInsetStyle {
        case .all:
            self.separatorInset.left = 0
        case .beforeImage:
            self.separatorInset.left = 0
        case .none:
            self.separatorInset.left = self.frame.width
        case .auto:
            self.separatorInset.left = self.layoutMargins.left
        }
    }
}
