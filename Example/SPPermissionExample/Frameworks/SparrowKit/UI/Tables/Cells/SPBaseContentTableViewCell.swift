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

class SPBaseContentTableViewCell: SPTableViewCell {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let descriptionLabel = UILabel()
    let iconImageView = SPDownloadingImageView()
    let button = SPAppStoreActionButton()
    
    var withImage: Bool = true {
        didSet {
            if withImage {
                self.iconImageView.isHidden = false
                self.iconImageWidthConstraint.constant = self.imageSide
                self.iconImageHeightConstraint.constant = self.imageSide
                self.titleLabelLeadingConstraint.isActive = true
                self.separatorInsetStyle = .beforeImage
            } else {
                self.iconImageView.isHidden = true
                self.iconImageWidthConstraint.constant = 0
                self.iconImageHeightConstraint.constant = 0
                self.titleLabelLeadingConstraint.isActive = false
                self.separatorInsetStyle = .auto
            }
            self.updateConstraints()
        }
    }
    
    var roundImage: Bool = false {
        didSet {
            self.layoutSubviews()
        }
    }
    
    var withSubtitle: Bool = true {
        didSet {
            self.descriptionLabelTopConstraint.isActive = false
            self.descriptionLabel.removeConstraint(self.descriptionLabelTopConstraint)
            if withSubtitle {
                self.subtitleLabel.isHidden = false
                self.descriptionLabelTopConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: self.spaceAfterSubtitle)
            } else {
                self.subtitleLabel.isHidden = true
                self.descriptionLabelTopConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: self.spaceAfterSubtitle)
            }
            self.descriptionLabelTopConstraint.isActive = true
            self.updateConstraints()
        }
    }
    
    var withButton: Bool = false {
        didSet {
            if withButton {
                self.button.isHidden = false
                self.descriptionLabelBottomConstraint.isActive = false
                self.buttonTopConstraint.isActive = true
                self.buttonBottomConstraint.isActive = true
            } else {
                self.button.isHidden = true
                self.buttonTopConstraint.isActive = false
                self.buttonBottomConstraint.isActive = false
                self.descriptionLabelBottomConstraint.isActive = true
            }
            self.updateConstraints()
        }
    }
    
    var centerXButton: Bool = false {
        didSet {
            if self.centerXButton {
                self.buttonLeadingConstraint.isActive = false
                self.buttonCenterXConstraint.isActive = true
            } else {
                self.buttonCenterXConstraint.isActive = false
                self.buttonLeadingConstraint.isActive = true
            }
            self.updateConstraints()
        }
    }
    
    var imageSide: CGFloat = 63 {
        didSet {
            self.iconImageWidthConstraint.constant = self.imageSide
            self.iconImageHeightConstraint.constant = self.imageSide
            self.updateConstraints()
        }
    }
    
    var topSpace: CGFloat = 11 {
        didSet {
            self.iconImageTopConstraint.constant = self.topSpace
            self.titleLabelTopConstraint.constant = self.topSpace - 2
            self.updateConstraints()
        }
    }
    
    var spaceAfterTitle: CGFloat = 2 {
        didSet {
            if self.withSubtitle {
                self.subtitleLabelTopConstraint.constant = self.spaceAfterTitle
            } else {
                self.descriptionLabelTopConstraint.constant = self.spaceAfterTitle
            }
            self.updateConstraints()
        }
    }
    
    var spaceAfterSubtitle: CGFloat = 2 {
        didSet {
            if self.withSubtitle {
                self.descriptionLabelTopConstraint.constant = self.spaceAfterSubtitle
            }
            self.updateConstraints()
        }
    }
    
    var spaceAfterDescribtion: CGFloat = 19 {
        didSet {
            self.buttonTopConstraint.constant = self.spaceAfterDescribtion
            self.updateConstraints()
        }
    }
    
    var bottomSpace: CGFloat = 7 {
        didSet {
            if self.withButton {
                self.buttonBottomConstraint.constant = -self.bottomSpace
            } else {
                self.descriptionLabelBottomConstraint.constant = -self.bottomSpace
            }
            self.updateConstraints()
        }
    }
    
    var spaceBetweenImageAndTitles: CGFloat = 14 {
        didSet {
            self.titleLabelLeadingConstraint.constant = self.spaceBetweenImageAndTitles
            self.updateConstraints()
        }
    }
    
    override var contentViews: [UIView] {
        return [self.iconImageView, self.titleLabel, self.subtitleLabel, self.descriptionLabel]
    }
    
    //constraints
    private var iconImageTopConstraint: NSLayoutConstraint!
    private var iconImageBottomConstraint: NSLayoutConstraint!
    private var iconImageWidthConstraint: NSLayoutConstraint!
    private var iconImageHeightConstraint: NSLayoutConstraint!
    private var titleLabelLeadingConstraint: NSLayoutConstraint!
    private var titleLabelTopConstraint: NSLayoutConstraint!
    private var subtitleLabelTopConstraint: NSLayoutConstraint!
    private var descriptionLabelTopConstraint: NSLayoutConstraint!
    private var descriptionLabelBottomConstraint: NSLayoutConstraint!
    private var buttonTopConstraint: NSLayoutConstraint!
    private var buttonLeadingConstraint: NSLayoutConstraint!
    private var buttonCenterXConstraint: NSLayoutConstraint!
    private var buttonBottomConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func commonInit() {
        super.commonInit()
        let marginGuide = contentView.layoutMarginsGuide
        
        //iconImageView
        self.iconImageView.layer.cornerRadius = 10
        self.contentView.addSubview(self.iconImageView)
        self.iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        self.iconImageView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        
        self.iconImageTopConstraint = self.iconImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: self.topSpace)
        self.iconImageTopConstraint.isActive = true
        
        self.iconImageWidthConstraint = self.iconImageView.widthAnchor.constraint(equalToConstant: self.imageSide)
        self.iconImageWidthConstraint.isActive = true
        
        self.iconImageHeightConstraint = self.iconImageView.heightAnchor.constraint(equalToConstant: self.imageSide)
        self.iconImageHeightConstraint.isActive = true
        
        self.iconImageBottomConstraint = self.iconImageView.bottomAnchor.constraint(lessThanOrEqualTo: marginGuide.bottomAnchor, constant: -(self.bottomSpace))
        self.iconImageBottomConstraint.priority = UILayoutPriority.init(900)
        self.iconImageBottomConstraint.isActive = true

        //titleLabel
        self.titleLabel.numberOfLines = 0
        self.titleLabel.font = UIFont.system(weight: UIFont.FontWeight.medium, size: 17)
        self.titleLabel.textAlignment = .left
        self.titleLabel.textColor = UIColor.black
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleLabelLeadingConstraint = self.titleLabel.leadingAnchor.constraint(equalTo: self.iconImageView.trailingAnchor, constant: self.spaceBetweenImageAndTitles)
        self.titleLabelLeadingConstraint.isActive = true
        
        let titleLabelAdditionalLeadingConstraint = self.titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor)
        titleLabelAdditionalLeadingConstraint.priority = UILayoutPriority.init(900)
        titleLabelAdditionalLeadingConstraint.isActive = true
        
        self.titleLabelTopConstraint = self.titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: self.topSpace - 2)
        self.titleLabelTopConstraint.isActive = true
        
        self.titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        
        //subtitleLabel
        self.subtitleLabel.numberOfLines = 0
        self.subtitleLabel.font = UIFont.system(weight: UIFont.FontWeight.regular, size: 15)
        self.subtitleLabel.textAlignment = .left
        self.subtitleLabel.textColor = UIColor.black
        self.contentView.addSubview(self.subtitleLabel)
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.subtitleLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor).isActive = true
        self.subtitleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        
        self.subtitleLabelTopConstraint = self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: self.spaceAfterTitle)
        self.subtitleLabelTopConstraint.isActive = true
    
        //descriptionLabel
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.font = UIFont.system(weight: UIFont.FontWeight.regular, size: 15)
        self.descriptionLabel.textAlignment = .left
        self.descriptionLabel.textColor = SPNativeColors.gray
        self.contentView.addSubview(self.descriptionLabel)
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor).isActive = true
        self.descriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        
        self.descriptionLabelTopConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.subtitleLabel.bottomAnchor, constant: self.spaceAfterSubtitle)
        self.descriptionLabelTopConstraint.isActive = true
        
        self.descriptionLabelBottomConstraint = self.descriptionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -self.bottomSpace)
        self.descriptionLabelBottomConstraint.isActive = true
        
        //button
        self.contentView.addSubview(self.button)
        self.button.titleLabel?.numberOfLines = 0
        self.button.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        self.button.translatesAutoresizingMaskIntoConstraints = false
        
        self.buttonLeadingConstraint = self.button.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor)
        self.buttonLeadingConstraint.isActive = true
        
        self.buttonCenterXConstraint = self.button.centerXAnchor.constraint(equalTo: self.titleLabel.centerXAnchor)
        self.buttonCenterXConstraint.isActive = false
        
        self.buttonTopConstraint = self.button.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: self.spaceAfterDescribtion)
        self.buttonTopConstraint.isActive = false
        
        self.buttonBottomConstraint = self.button.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -self.bottomSpace)
        self.buttonBottomConstraint.isActive = false
        
        self.setDefaultParametrs()
    }
    
    private func setDefaultParametrs() {
        self.withImage = true
        self.withSubtitle = true
        self.withButton = false
        
        self.accessoryType = .none
        self.separatorInsetStyle = .beforeImage
        self.iconImageView.removeImage()
        self.iconImageView.setNative()
        
        self.titleLabel.text = "Title"
        self.titleLabel.font = UIFont.system(weight: UIFont.FontWeight.medium, size: 17)
        self.titleLabel.textAlignment = .left
        self.titleLabel.textColor = UIColor.black
        self.subtitleLabel.text = "Subtitle"
        self.subtitleLabel.font = UIFont.system(weight: UIFont.FontWeight.regular, size: 15)
        self.subtitleLabel.textAlignment = .left
        self.subtitleLabel.textColor = UIColor.black
        self.descriptionLabel.text = "Description"
        self.descriptionLabel.font = UIFont.system(weight: UIFont.FontWeight.regular, size: 15)
        self.descriptionLabel.textAlignment = .left
        self.descriptionLabel.textColor = SPNativeColors.gray
        self.button.setTitle("Button")
        
        self.imageSide = 63
        self.roundImage = false
        self.topSpace = 11
        self.spaceAfterTitle = 2
        self.spaceAfterSubtitle = 2
        self.spaceAfterDescribtion = 15
        self.bottomSpace = 7
        self.spaceBetweenImageAndTitles = 15
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let myViewBackgroundColor = self.iconImageView.gradeView.backgroundColor
        super.setHighlighted(highlighted, animated: animated)
        self.iconImageView.gradeView.backgroundColor = myViewBackgroundColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        let myViewBackgroundColor = self.iconImageView.gradeView.backgroundColor
        super.setSelected(selected, animated: animated)
        self.iconImageView.gradeView.backgroundColor = myViewBackgroundColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.setDefaultParametrs()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.roundImage {
            self.iconImageView.layer.cornerRadius = self.imageSide / 2
        } else {
            self.iconImageView.layer.cornerRadius = self.imageSide * 0.158
        }
        
        switch self.separatorInsetStyle {
        case .all:
            self.separatorInset.left = 0
        case .beforeImage:
            self.separatorInset.left = self.layoutMargins.left + self.imageSide + self.spaceBetweenImageAndTitles - 2
        case .none:
            self.separatorInset.left = self.frame.width
        case .auto:
            self.separatorInset.left = self.layoutMargins.left
        }
    }
}
