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

class SPSubscribtionTableViewCell: SPBaseContentTableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.commonInit()
    }
    
    private func commonInit() {
        
        self.titleLabel.font = UIFont.system(type: UIFont.BoldType.Medium, size: 17)
        self.titleLabel.numberOfLines = 1
        self.subtitleLabel.font = UIFont.system(type: UIFont.BoldType.Regular, size: 13)
        self.subtitleLabel.numberOfLines = 1
        self.descriptionLabel.font = UIFont.system(type: UIFont.BoldType.Regular, size: 13)
        
        self.withImage = true
        self.withButton = false
        self.withSubtitle = true
        self.topSpace = 11
        self.imageSide = 49
        self.iconImageView.layer.cornerRadius = 11
        self.spaceAfterTitle = 3
        self.spaceAfterSubtitle = 9
        self.bottomSpace = 9
        self.separatorInsetStyle = .beforeImage
    }
}
