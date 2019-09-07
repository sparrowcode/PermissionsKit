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

class SPPromoTableViewCell: SPBaseContentTableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundColor = UIColor.clear
        self.commonInit()
    }
    
    override func commonInit() {
        super.commonInit()
        self.withImage = false
        self.withButton = true
        self.withSubtitle = false
        self.centerXButton = true

        self.topSpace = 14
        self.spaceAfterTitle = 6
        self.spaceAfterDescribtion = 16
        self.bottomSpace = 22
        
        self.titleLabel.font = UIFont.system(weight: .demiBold, size: 16)
        self.titleLabel.setCenterAlignment()
        self.descriptionLabel.font = UIFont.system(weight: .regular, size: 13)
        self.descriptionLabel.setCenterAlignment()
        self.subtitleLabel.textColor = UIColor.lightGray
        self.button.style = .main
    }
}
