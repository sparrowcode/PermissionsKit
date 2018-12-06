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
            self.setWidth(self.layoutWidth)
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
        self.backgroundColor = SPNativeStyleKit.Colors.white
        self.layer.cornerRadius = 17
        
        self.subtitleLabel.text = "".uppercased()
        self.subtitleLabel.numberOfLines = 0
        self.subtitleLabel.textColor = SPNativeStyleKit.Colors.gray
        self.subtitleLabel.font = UIFont.system(type: .DemiBold, size: 15)
        self.addSubview(self.subtitleLabel)
        
        self.titleLabel.text = ""
        self.titleLabel.numberOfLines = 0
        self.titleLabel.textColor = SPNativeStyleKit.Colors.black
        self.titleLabel.font = UIFont.system(type: .Bold, size: 27)
        self.addSubview(self.titleLabel)
        
        self.descriptionLabel.text = ""
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.textColor = SPNativeStyleKit.Colors.gray
        self.descriptionLabel.font = UIFont.system(type: .Regular, size: 11)
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
        
        if SPDevice.Orientation.isPortrait {
            self.subtitleLabel.frame.origin.y = 27
        } else {
            self.subtitleLabel.frame.origin.y = 17
        }
        
        self.titleLabel.frame = CGRect.init(x: self.sideInset, y: self.subtitleLabel.frame.bottomYPosition + 2, width: self.frame.width - self.sideInset * 2, height: 0)
        self.titleLabel.sizeToFit()
        
        var currentYPosition: CGFloat = 0
        if SPDevice.Orientation.isPortrait {
            currentYPosition = self.titleLabel.frame.bottomYPosition + 20
        } else {
            currentYPosition = self.titleLabel.frame.bottomYPosition - 2
        }
        
        for view in self.views {
            view.frame = CGRect.init(x: self.sideInset, y: currentYPosition, width: self.layoutWidth - sideInset * 2, height: 10)
            view.layoutSubviews()
            currentYPosition += view.frame.height
        }
        
        if let view = self.views.last {
            view.separatorView.isHidden = true
        }
        
        if SPDevice.Orientation.isPortrait {
            self.descriptionLabel.frame = CGRect.init(x: self.sideInset, y: currentYPosition + 20, width: self.layoutWidth - self.sideInset * 2, height: 0)
            self.descriptionLabel.sizeToFit()
            SPAnimation.animate(0.2, animations: {
                self.descriptionLabel.alpha = 1
            })
            self.layoutHeight = self.descriptionLabel.frame.bottomYPosition + 22
        } else {
            SPAnimation.animate(0.2, animations: {
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
    var iconView: SPGolubevIconView = SPGolubevIconView.init()
    var imageView = UIImageView()
    var button = SPAppStoreActionButton()
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
                self.iconView.type = .calendar
            case .speech:
                self.iconView.type = .micro
            case .locationWhenInUse:
                self.iconView.type = .compass
            case .locationAlways:
                self.iconView.type = .compass
            case .locationWithBackground:
                self.iconView.type = .compass
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
        self.backgroundColor = SPNativeStyleKit.Colors.white
        
        self.addSubview(self.imageView)
        self.addSubview(self.iconView)
        
        self.titleLabel.numberOfLines = 1
        self.titleLabel.textColor = SPNativeStyleKit.Colors.black
        self.titleLabel.font = UIFont.system(type: .DemiBold, size: 15)
        self.addSubview(self.titleLabel)
        
        self.subtitleLabel.numberOfLines = 2
        self.subtitleLabel.textColor = SPNativeStyleKit.Colors.gray
        self.subtitleLabel.font = UIFont.system(type: .Regular, size: 13)
        self.addSubview(self.subtitleLabel)
        
        self.button.setTitle(self.allowTitle)
        self.button.style = .base
        self.addSubview(self.button)
        
        self.separatorView.backgroundColor = SPNativeStyleKit.Colors.gray.withAlphaComponent(0.3)
        self.addSubview(self.separatorView)
    }
    
    func updateStyle() {
        if SPPermission.isAllow(self.permission) {
            SPAnimation.animate(0.2, animations: {
                self.button.setTitle(self.allowedTitle)
                self.button.style = .main
                self.button.sizeToFit()
            })
        } else {
            SPAnimation.animate(0.2, animations: {
                self.button.setTitle(self.allowTitle)
                self.button.style = .base
                self.button.sizeToFit()
            })
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setHeight(79)
        
        self.iconView.frame = CGRect.init(x: 0, y: 0, width: 45, height: 45)
        self.iconView.center.y = self.frame.height / 2
        
        self.imageView.frame = self.iconView.frame
        
        self.button.sizeToFit()
        self.button.frame.bottomXPosition = self.frame.width
        self.button.center.y = self.frame.height / 2
        
        let titleInset: CGFloat = 15
        let titlesWidth: CGFloat = self.button.frame.origin.x - self.iconView.frame.bottomXPosition - titleInset * 2
        
        self.titleLabel.frame = CGRect.init(x: 0, y: 8, width: titlesWidth, height: 0)
        self.titleLabel.sizeToFit()
        self.titleLabel.setWidth(titlesWidth)
        self.titleLabel.frame.origin.x = self.iconView.frame.bottomXPosition + titleInset
        
        self.subtitleLabel.frame = CGRect.init(x: self.titleLabel.frame.origin.x + titleInset, y: 0, width: titlesWidth, height: 0)
        self.subtitleLabel.sizeToFit()
        self.subtitleLabel.setWidth(titlesWidth)
        self.subtitleLabel.frame.origin.x = self.iconView.frame.bottomXPosition + titleInset
        
        let allHeight = self.titleLabel.frame.height + 2 + self.subtitleLabel.frame.height
        self.titleLabel.frame.origin.y = (self.frame.height - allHeight) / 2
        self.subtitleLabel.frame.origin.y = self.titleLabel.frame.bottomYPosition + 2

        self.separatorView.frame = CGRect.init(x: self.subtitleLabel.frame.origin.x, y: self.frame.height - 0.7, width: self.button.frame.bottomXPosition - self.subtitleLabel.frame.origin.x, height: 0.7)
        self.separatorView.round()
        /*self.setHeight(75)
        
        self.iconView.frame = CGRect.init(x: 0, y: 0, width: 45, height: 45)
        self.iconView.center.y = self.frame.width / 2
        
        self.button.sizeToFit()
        self.button.frame.bottomXPosition = self.frame.width
        self.button.center.y = self.frame.height / 2
        
        let titleInset: CGFloat = 15
        let titlesWidth: CGFloat = self.button.frame.origin.x - self.iconView.frame.bottomXPosition - titleInset * 2
        
        self.titleLabel.frame = CGRect.init(x: self.iconView.frame.bottomXPosition + titleInset, y: 8, width: titlesWidth, height: 0)
        self.titleLabel.sizeToFit()
        
        self.subtitleLabel.frame = CGRect.init(x: self.iconView.frame.bottomXPosition + titleInset, y: self.titleLabel.frame.bottomYPosition + 2, width: titlesWidth, height: 0)
        self.subtitleLabel.setHeight(self.frame.height - 12 - self.subtitleLabel.frame.origin.y)
        //self.subtitleLabel.sizeToFit()
        
        //let height = (self.iconView.frame.bottomYPosition + 12) > (self.subtitleLabel.frame.bottomYPosition + 12) ? self.iconView.frame.bottomYPosition + 12 : self.subtitleLabel.frame.bottomYPosition + 12
        //self.setHeight(75)
        
        self.separatorView.frame = CGRect.init(x: self.subtitleLabel.frame.origin.x, y: self.frame.height - 0.7, width: self.button.frame.bottomXPosition - self.subtitleLabel.frame.origin.x, height: 0.7)
        self.separatorView.round()*/
    }
}
