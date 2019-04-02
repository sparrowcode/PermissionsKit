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

class SPPermissionDialogView: UIView {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    var views: [SPPermissionDialogLineView] = []
    let descriptionLabel = UILabel()
    
    var layoutWidth: CGFloat = 0 {
        didSet {
            self.frame = CGRect.init(origin: self.frame.origin, size: CGSize.init(width: self.layoutWidth, height: self.frame.height))
            self.layoutSubviews()
        }
    }
    
    var layoutHeight: CGFloat = 0
    
    var sideInset: CGFloat {
        return 22
    }
    
    init() {
        super.init(frame: .zero)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = SPPermissionStyle.DefaultColors.white
        self.layer.cornerRadius = 17
        
        self.subtitleLabel.text = "".uppercased()
        self.subtitleLabel.numberOfLines = 0
        self.subtitleLabel.textColor = SPPermissionStyle.DefaultColors.gray
        self.subtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        self.addSubview(self.subtitleLabel)
        
        self.titleLabel.text = ""
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textColor = SPPermissionStyle.DefaultColors.black
        self.titleLabel.font = UIFont.systemFont(ofSize: 27, weight: .bold)
        self.addSubview(self.titleLabel)
        
        self.descriptionLabel.text = ""
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.textColor = SPPermissionStyle.DefaultColors.gray
        self.descriptionLabel.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        self.addSubview(self.descriptionLabel)
    }
    
    func add(view: SPPermissionDialogLineView) {
        view.updateStyle()
        self.addSubview(view)
        self.views.append(view)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
 
        self.subtitleLabel.frame = CGRect.init(x: self.sideInset, y: 0, width: self.layoutWidth - self.sideInset * 2, height: 0)
        self.subtitleLabel.sizeToFit()
        
        if SPPermissionStyle.Orientation.isPortrait {
            self.subtitleLabel.frame.origin.y = 27
        } else {
            self.subtitleLabel.frame.origin.y = 17
        }
        
        self.titleLabel.frame = CGRect.init(x: self.sideInset, y: self.subtitleLabel.frame.origin.y + self.subtitleLabel.frame.height + 2, width: self.frame.width - self.sideInset * 2, height: 0)
        self.titleLabel.sizeToFit()
        
        var currentYPosition: CGFloat = 0
        if SPPermissionStyle.Orientation.isPortrait {
            currentYPosition = self.titleLabel.frame.origin.y + self.titleLabel.frame.height + 20
        } else {
            currentYPosition = self.titleLabel.frame.origin.y + self.titleLabel.frame.height - 2
        }
        
        for view in self.views {
            view.frame = CGRect.init(x: self.sideInset, y: currentYPosition, width: self.layoutWidth - sideInset * 2, height: 10)
            view.layoutSubviews()
            currentYPosition += view.frame.height
        }
        
        if let view = self.views.last {
            view.separatorView.isHidden = true
        }
        
        if SPPermissionStyle.Orientation.isPortrait {
            self.descriptionLabel.frame = CGRect.init(x: self.sideInset, y: currentYPosition + 20, width: self.layoutWidth - self.sideInset * 2, height: 0)
            self.descriptionLabel.sizeToFit()
            SPPermissionStyle.Animation.base(0.2, animations: {
                self.descriptionLabel.alpha = 1
            })
            self.layoutHeight = self.descriptionLabel.frame.origin.y + self.descriptionLabel.frame.height + 22
        } else {
            SPPermissionStyle.Animation.base(0.2, animations: {
                self.descriptionLabel.alpha = 0
            })
            self.layoutHeight = currentYPosition + 2
        }

        let shadowPath = UIBezierPath.init(
            roundedRect: CGRect.init(x: 0, y: 9, width: self.layoutWidth, height: self.layoutHeight),
            cornerRadius: self.layer.cornerRadius
        )
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = Float(0.07)
        self.layer.shadowRadius = 17
        self.layer.masksToBounds = false
        self.layer.shadowPath = shadowPath.cgPath
    }
}

class SPPermissionDialogLineView: UIView {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    var iconView = SPPermissionIconView()
    var imageView = UIImageView()
    var button = SPPermissionActionButton()
    var separatorView = UIView()
    
    var permission: SPPermissionType
    private var allowTitle: String
    private var allowedTitle: String
    
    init(permission: SPPermissionType, title: String, subtitle: String, allowTitle: String, allowedTitle: String, image: UIImage? = nil) {
        self.permission = permission
        self.allowTitle = allowTitle
        self.allowedTitle = allowedTitle
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        
        self.imageView.isHidden = true
        
        if let image = image {
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.image = image
            self.iconView.isHidden = true
            self.imageView.isHidden = false
        } else {
            switch permission {
            case .calendar:
                self.iconView.type = .calendar
            case .camera:
                self.iconView.type = .camera
            case .contacts:
                self.iconView.type = .book
            case .microphone:
                self.iconView.type = .micro
            case .notification:
                self.iconView.type = .ball
            case .photoLibrary:
                self.iconView.type = .photoLibrary
            case .reminders:
                self.iconView.type = .documents
            case .speech:
                self.iconView.type = .micro
            case .locationWhenInUse, .locationAlwaysAndWhenInUse:
                self.iconView.type = .compass
            case .motion:
                self.iconView.type = .windmill
            case .mediaLibrary:
                self.iconView.type = .headphones
            }
        }
        
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.permission = .notification
        self.allowTitle = "Allow"
        self.allowedTitle = "Allowed"
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = SPPermissionStyle.DefaultColors.white
        
        self.addSubview(self.imageView)
        self.addSubview(self.iconView)
        
        self.titleLabel.numberOfLines = 1
        self.titleLabel.textColor = SPPermissionStyle.DefaultColors.black
        self.titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        self.addSubview(self.titleLabel)
        
        self.subtitleLabel.numberOfLines = 2
        self.subtitleLabel.textColor = SPPermissionStyle.DefaultColors.gray
        self.subtitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        self.addSubview(self.subtitleLabel)
        
        self.button.setTitle(self.allowTitle, for: .normal)
        self.button.style = .base
        self.addSubview(self.button)
        
        self.separatorView.backgroundColor = SPPermissionStyle.DefaultColors.gray.withAlphaComponent(0.3)
        self.addSubview(self.separatorView)
    }
    
    func updateStyle() {
        if SPPermission.isAllowed(self.permission) {
            SPPermissionStyle.Animation.base(0.2, animations: {
                self.button.setTitle(self.allowedTitle, for: .normal)
                self.button.style = .select
                self.button.sizeToFit()
            })
        } else {
            SPPermissionStyle.Animation.base(0.2, animations: {
                self.button.setTitle(self.allowTitle, for: .normal)
                self.button.style = .base
                self.button.sizeToFit()
            })
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.frame = CGRect.init(origin: self.frame.origin, size: CGSize.init(width: self.frame.width, height: 79))
        
        self.iconView.frame = CGRect.init(x: 0, y: 0, width: 45, height: 45)
        self.iconView.center.y = self.frame.height / 2
        
        self.imageView.frame = self.iconView.frame
        
        self.button.sizeToFit()
        self.button.frame.origin.x = self.frame.width - self.button.frame.width
        self.button.center.y = self.frame.height / 2
        
        let titleInset: CGFloat = 15
        let titlesWidth: CGFloat = self.button.frame.origin.x - (self.iconView.frame.origin.x + self.iconView.frame.width)  - titleInset * 2
        
        self.titleLabel.frame = CGRect.init(x: 0, y: 8, width: titlesWidth, height: 0)
        self.titleLabel.sizeToFit()
        self.titleLabel.frame = CGRect.init(origin: self.titleLabel.frame.origin, size: CGSize.init(width: titlesWidth, height: self.titleLabel.frame.height))
        self.titleLabel.frame.origin.x = (self.iconView.frame.origin.x + self.iconView.frame.width) + titleInset
        
        self.subtitleLabel.frame = CGRect.init(x: self.titleLabel.frame.origin.x + titleInset, y: 0, width: titlesWidth, height: 0)
        self.subtitleLabel.sizeToFit()
        self.subtitleLabel.frame = CGRect.init(origin: self.subtitleLabel.frame.origin, size: CGSize.init(width: titlesWidth, height: self.subtitleLabel.frame.height))
        self.subtitleLabel.frame.origin.x = self.iconView.frame.origin.x + self.iconView.frame.width + titleInset
        
        let allHeight = self.titleLabel.frame.height + 2 + self.subtitleLabel.frame.height
        self.titleLabel.frame.origin.y = (self.frame.height - allHeight) / 2
        self.subtitleLabel.frame.origin.y = self.titleLabel.frame.origin.y + self.titleLabel.frame.height + 2

        self.separatorView.frame = CGRect.init(x: self.subtitleLabel.frame.origin.x, y: self.frame.height - 0.7, width: self.button.frame.origin.x + self.button.frame.width - self.subtitleLabel.frame.origin.x, height: 0.7)
        self.separatorView.layer.cornerRadius = self.separatorView.frame.height / 2
    }
}
