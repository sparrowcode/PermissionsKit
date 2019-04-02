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

class SPProposeTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel.init()
    let button = SPAppStoreActionButton.init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        let marginGuide = self.layoutMarginsGuide
        
        self.addSubview(self.button)
        self.button.setTitle("Action", for: .normal)
        
        self.button.titleLabel?.font = UIFont.system(weight: .demiBold, size: 14)
        self.button.titleLabel?.numberOfLines = 0
        self.button.secondColor = SPNativeColors.blue
        self.button.baseColor = UIColor.white
        self.button.style = .base
        self.button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.widthAnchor.constraint(lessThanOrEqualToConstant: 160).isActive = true
        self.button.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        self.button.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        
        self.addSubview(self.titleLabel)
        self.titleLabel.numberOfLines = 0
        self.titleLabel.setCenterAlignment()
        self.titleLabel.textAlignment = .left
        self.titleLabel.font = UIFont.system(weight: .regular, size: 16)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 0).isActive = true
        self.titleLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        
        let trailingAnchorConstraint = self.titleLabel.trailingAnchor.constraint(equalTo: self.button.leadingAnchor, constant: -20)
        trailingAnchorConstraint.isActive = true
        
        self.layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.button.setTitle("Action", for: .normal)
        self.titleLabel.text = nil
        self.layoutIfNeeded()
    }
}
