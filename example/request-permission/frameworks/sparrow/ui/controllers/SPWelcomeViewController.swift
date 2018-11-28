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

class SPWelcomeViewController: SPBaseViewController {
    
    let imageView = SPDownloadingImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let descriptionLabel = UILabel()
    let commentLabel = UILabel()
    let button = SPNativeOS11Button()
    
    private var data: SPWelcomeData
    private var views: [UIView] = []
    private var isPresented: Bool = false
    
    static var isNeedPresent: Bool {
        return self.isFirstLaunch || self.hasBeenUpdated
    }
    
    init(data: SPWelcomeData) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.data = SPWelcomeData()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.statusBar = self.data.statusBarStyle
        self.view.backgroundColor = self.data.backgroundColor
        
        self.imageView.setImage(image: self.data.image, animatable: false)
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.layer.cornerRadius = 6
        self.imageView.layer.masksToBounds = true
        self.view.addSubview(self.imageView)
        self.views.append(self.imageView)
        
        self.titleLabel.text = self.data.title
        self.titleLabel.font = UIFont.system(type: UIFont.BoldType.Heavy, size: 50)
        self.titleLabel.numberOfLines = 1
        self.titleLabel.adjustsFontSizeToFitWidth = true
        self.titleLabel.minimumScaleFactor = 0.5
        self.titleLabel.textColor = self.data.textColor
        self.titleLabel.setLettersSpacing(-2)
        self.view.addSubview(self.titleLabel)
        self.views.append(self.titleLabel)
        
        self.subtitleLabel.text = self.data.subtitle
        self.subtitleLabel.font = UIFont.system(type: UIFont.BoldType.Heavy, size: 50)
        self.subtitleLabel.textColor = self.data.color
        self.subtitleLabel.numberOfLines = 1
        self.subtitleLabel.adjustsFontSizeToFitWidth = true
        self.subtitleLabel.minimumScaleFactor = 0.5
        self.subtitleLabel.setLettersSpacing(-2)
        self.view.addSubview(self.subtitleLabel)
        self.views.append(self.subtitleLabel)
        
        self.descriptionLabel.text = self.data.description
        if SPWelcomeViewController.hasBeenUpdated {
            self.descriptionLabel.text = self.data.changes
        }
        
        self.descriptionLabel.font = UIFont.system(type: UIFont.BoldType.Regular, size: 17)
        self.descriptionLabel.textColor = self.data.textColor
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.setLettersSpacing(-0.2)
        self.view.addSubview(self.descriptionLabel)
        self.views.append(self.descriptionLabel)
        
        self.commentLabel.text = self.data.comment
        self.commentLabel.font = UIFont.system(type: UIFont.BoldType.Regular, size: 13)
        self.commentLabel.textColor = UIColor.gray
        self.commentLabel.numberOfLines = 0
        self.commentLabel.setCenteringAlignment()
        self.view.addSubview(self.commentLabel)
        self.views.append(self.commentLabel)
        
        self.button.setTitle(self.data.buttonTitle, for: UIControl.State.normal)
        self.button.backgroundColor = self.data.color
        self.button.addTarget(self, action: #selector(self.tapButton(sender:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(self.button)
        self.views.append(self.button)
        
        for view in self.views {
            view.alpha = 0
        }
        
        self.updateLayout(with: self.view.frame.size)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !self.isPresented {
            SPAnimationAlpha.showList(0.5, views: self.views, delayPerItem: 0.09)
            self.isPresented = true
            SPWelcomeViewController.updateCurrentVersion()
        }
    }
    
    @objc func tapButton(sender: UIButton) {
        SPVibration.impact(SPVibration.Style.light)
        self.data.complection(self.button)
    }
    
    override func updateLayout(with size: CGSize) {
        super.updateLayout(with: size)
        
        let sideSpace: CGFloat = size.width * 0.112

        self.imageView.frame = CGRect.init(x: sideSpace, y: self.topSafeArea + (size.height * 0.1), width: 84, height: 84)
        
        let space: CGFloat = size.height * 0.025
        
        self.titleLabel.sizeToFit()
        self.titleLabel.frame = CGRect.init(x: sideSpace, y: self.imageView.frame.bottomYPosition + space, width: self.view.frame.width - sideSpace * 2, height: self.titleLabel.frame.height)
        
        self.subtitleLabel.sizeToFit()
        self.subtitleLabel.frame = CGRect.init(x: sideSpace, y: self.titleLabel.frame.bottomYPosition - 12, width: self.view.frame.width - sideSpace * 2, height: self.subtitleLabel.frame.height)
        
        self.descriptionLabel.frame = CGRect.init(x: sideSpace, y: self.subtitleLabel.frame.bottomYPosition + space, width: self.view.frame.width - sideSpace * 2, height: self.descriptionLabel.frame.height)
        self.descriptionLabel.sizeToFit()
        
        self.button.sizeToFit()
        self.button.frame.origin.y = size.height - self.bottomSafeArea - space - self.button.frame.height
        self.button.setWidth(size.width - sideSpace * 2)
        self.button.center.x = size.width / 2
        
        let sideSpaceForCommentLabel: CGFloat = sideSpace * 1.5
        self.commentLabel.frame = CGRect.init(x: sideSpaceForCommentLabel, y: 0, width: self.view.frame.width - sideSpaceForCommentLabel * 2, height: 0)
        self.commentLabel.sizeToFit()
        self.commentLabel.center.x = size.width / 2
        self.commentLabel.frame.origin.y = self.button.frame.origin.y - space - self.commentLabel.frame.height
    }
}

extension SPWelcomeViewController {
    
    static private let versionKey = "SPWelcomeControllerCurrentVersionKey"
    static private let firstLaucnhKey = "SPWelcomeControllerFirstLaucnhKey"
    
    static var isFirstLaunch: Bool {
        get {
            let value = UserDefaults.standard.value(forKey: self.firstLaucnhKey) as? Bool ?? true
            if value {
                SPWelcomeViewController.updateCurrentVersion()
            }
            self.isFirstLaunch = false
            return value
        }
        set {
            UserDefaults.standard.set(newValue, forKey: self.firstLaucnhKey)
        }
    }
    
    static var hasBeenUpdated: Bool {
        let userDefaults = UserDefaults.standard
        var bundleInfo = Bundle.main.infoDictionary!
        
        if let currentVersion = bundleInfo["CFBundleShortVersionString"] as? String {
            if let version = userDefaults.value(forKey: self.versionKey) as? String {
                return !(version == currentVersion)
            } else {
                return false
            }
        }
        
        return false
    }
    
    private static func updateCurrentVersion() {
        var bundleInfo = Bundle.main.infoDictionary!
        if let currentVersion = bundleInfo["CFBundleShortVersionString"] as? String {
            UserDefaults.standard.set(currentVersion, forKey: self.versionKey)
        }
    }
}

struct SPWelcomeData {
    var title: String = "Welcome to"
    var subtitle: String = "Sparrow"
    var description: String = "Simple and native welcome controller for all developers"
    var changes: String = "Description about this update"
    var comment: String = "Here you can place comment"
    var buttonTitle: String = "Continue"
    var image: UIImage = UIImage()
    var color: UIColor = SPNativeStyleKit.Colors.blue
    var backgroundColor: UIColor = UIColor.white
    var textColor: UIColor = UIColor.black
    var statusBarStyle: SPStatusBar = .dark
    var complection: (_ button: SPNativeOS11Button) -> () = { _ in }
}
