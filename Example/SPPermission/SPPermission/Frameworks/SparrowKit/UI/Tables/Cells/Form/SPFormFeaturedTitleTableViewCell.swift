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

class SPFormFeaturedTitleTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let button = SPDownloadingButton()
    
    var type: VisualType = .large {
        didSet {
            switch type {
            case .large:
                self.titleLabel.font = UIFont.system(weight: .bold, size: 22)
                self.titleLabel.textColor = UIColor.black
            case .smallColorful:
                self.titleLabel.font = UIFont.system(weight: .demiBold, size: 11)
                self.titleLabel.textColor = SPNativeColors.blue
                self.titleLabel.text = self.titleLabel.text?.uppercased()
            }
        }
    }
    
    var withButton: Bool {
        get {
            return !self.button.isHidden
        }
        set {
            self.button.isHidden = !newValue
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
        let marginGuide = contentView.layoutMarginsGuide
        
        self.type = .large
        self.selectionStyle = .none
        
        contentView.addSubview(self.titleLabel)
        self.titleLabel.numberOfLines = 0
        self.titleLabel.text = "Title"
        self.titleLabel.font = UIFont.system(weight: .bold, size: 21)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.setLettersSpacing(-0.24)
        
        self.titleLabel.leadingAnchor.constraint(equalTo:
            marginGuide.leadingAnchor, constant: 0).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo:
            marginGuide.topAnchor, constant: 5).isActive = true
        self.titleLabel.bottomAnchor.constraint(equalTo:
            marginGuide.bottomAnchor, constant: self.layoutMargins.bottom).isActive = true
        
        self.withButton = false
        self.button.setTitle("Button Title", for: UIControl.State.normal)
        self.button.setTitleColor(SPNativeColors.blue)
        self.button.titleLabel?.font = UIFont.system(weight: .medium, size: 17)
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.button.titleLabel?.textAlignment = .right
        contentView.addSubview(self.button)
        
        self.button.trailingAnchor.constraint(equalTo:
            marginGuide.trailingAnchor, constant: 0).isActive = true
        self.button.centerYAnchor.constraint(equalTo: titleLabel.layoutMarginsGuide.centerYAnchor, constant: 0).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = "Title"
        self.withButton = false
        self.button.setTitle("Button Title", for: UIControl.State.normal)
        self.type = .large
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.separatorInset.left = self.frame.width
        
        if self.type == .smallColorful {
            self.titleLabel.text = self.titleLabel.text?.uppercased()
        }
    }
    
    enum VisualType {
        case smallColorful
        case large
    }
}
