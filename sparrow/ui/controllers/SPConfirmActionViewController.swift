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

class SPConfirmActionViewController: UIViewController {
    
    let navigationBarView = SPConfirmActionNavigationBar.init()
    let cellsView = SPConfirmActionCellsView.init()
    let confirmActionView = SPConfirmActionButtonView.init()
    
    var confirmedAction: (_ controller: SPConfirmActionViewController)->() = { controller in
        controller.hide()
    }
    
    private var animationDuration: TimeInterval {
        return 0.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        self.confirmActionView.button.addTarget(self, action: #selector(self.tapConfirmButton), for: .touchUpInside)
        self.navigationBarView.button.addTarget(self, action: #selector(self.hide), for: .touchUpInside)
        
        self.view.addSubview(self.navigationBarView)
        self.view.addSubview(self.cellsView)
        self.view.addSubview(self.confirmActionView)
        self.updateLayout(size: self.view.frame.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.updateLayout(size: size)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        if #available(iOS 11.0, *) {
            super.viewSafeAreaInsetsDidChange()
            self.updateLayout(size: self.view.frame.size)
        }
    }
    
    private func updateLayout(size: CGSize) {
        self.confirmActionView.setWidth(size.width)
        self.confirmActionView.sizeToFit()
        self.confirmActionView.frame.origin.x = 0
        self.confirmActionView.frame.origin.y = size.height - self.confirmActionView.frame.height
        
        self.cellsView.setWidth(size.width)
        self.cellsView.sizeToFit()
        self.cellsView.frame.origin.x = 0
        self.cellsView.frame.origin.y = self.confirmActionView.frame.origin.y - self.cellsView.frame.height
        
        self.navigationBarView.setWidth(size.width)
        self.navigationBarView.sizeToFit()
        self.navigationBarView.frame.origin.x = 0
        self.navigationBarView.frame.origin.y = self.cellsView.frame.origin.y - self.navigationBarView.frame.height
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.confirmActionView.frame.origin.y = self.view.frame.size.height
        self.cellsView.frame.origin.y = self.view.frame.size.height
        self.navigationBarView.frame.origin.y = self.view.frame.size.height
        
        SPAnimationSpring.animate(self.animationDuration, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            
            self.confirmActionView.frame.origin.y = self.view.frame.height - self.confirmActionView.frame.height
            self.cellsView.frame.origin.y = self.confirmActionView.frame.origin.y - self.cellsView.frame.height
            self.navigationBarView.frame.origin.y = self.cellsView.frame.origin.y - self.navigationBarView.frame.height
        }, spring: 1,
           velocity: 1,
           options: .transitionCurlUp)
    }
    
    func present(on viewController: UIViewController) {
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        viewController.present(self, animated: false, completion: nil)
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        SPAnimationSpring.animate(self.animationDuration, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.confirmActionView.frame.origin.y = self.view.frame.size.height
            self.cellsView.frame.origin.y = self.view.frame.size.height
            self.navigationBarView.frame.origin.y = self.view.frame.size.height
        }, spring: 1,
           velocity: 1,
           options: .transitionCurlDown,
           withComplection: {
            super.dismiss(animated: false) {
                completion?()
            }})
    }
    
    func addCell(task: String, title: String, subtitle: String? = nil, imageLink: String? = nil, image: UIImage? = nil) {
        let cell = SPConfirmActionCellView.init(
            task: task,
            title: title,
            subtitle: subtitle,
            imageLink: imageLink,
            image: image
        )
        self.cellsView.addSubview(cell)
    }
    
    @objc func hide() {
        self.dismiss(animated: true)
    }
    
    @objc func tapConfirmButton() {
        self.confirmedAction(self)
    }
    
    class SPConfirmActionNavigationBar: UIView {
        
        let label: UILabel = UILabel.init()
        let button: UIButton = UIButton.init()
        let separatorView = UIView.init()
        let backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.extraLight))
        
        private var leftAndRightSpace: CGFloat {
            return 18
        }
        
        init() {
            super.init(frame: CGRect.zero)
            
            self.addSubview(self.backgroundView)
            
            self.separatorView.backgroundColor = UIColor.black.withAlphaComponent(0.15)
            self.addSubview(self.separatorView)
            
            self.label.numberOfLines = 1
            self.label.textColor = UIColor.black
            self.label.text = "SPConfirmAction"
            self.label.font = UIFont.system(type: .DemiBold, size: 16)
            self.addSubview(self.label)
            
            self.button.setTitle("Сancel", for: .normal)
            self.button.setTitleColorForNoramlAndHightlightedStates(color: SPNativeStyleKit.Colors.blue)
            self.button.titleLabel?.font = UIFont.system(type: .DemiBold, size: 16)
            self.addSubview(self.button)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func sizeToFit() {
            super.sizeToFit()
            self.setHeight(45)
            self.layoutSubviews()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.backgroundView.setEqualsBoundsFromSuperview()
            
            self.label.sizeToFit()
            self.label.frame.origin.x = self.leftAndRightSpace
            self.label.center.y = self.frame.height / 2
            
            self.button.sizeToFit()
            self.button.frame.origin.x = self.frame.width - self.leftAndRightSpace - self.button.frame.width
            self.button.center.y = self.frame.height / 2
            
            self.separatorView.frame = CGRect.init(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        }
    }
    
    class SPConfirmActionCellView: UIView {
        
        var taskLabel = UILabel.init()
        var titleLabel: UILabel = UILabel.init()
        var subtitleLabel: UILabel?
        var imageView: SPDownloadingImageView?
        var separatorView = UIView.init()
        
        var yLeftPosition: CGFloat = 0
        var baseSpace: CGFloat = 0
        
        init(task: String, title: String, subtitle: String? = nil, imageLink: String? = nil, image: UIImage? = nil) {
            super.init(frame: CGRect.zero)
            
            self.separatorView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
            self.addSubview(self.separatorView)
            
            self.taskLabel.text = task.uppercased()
            self.taskLabel.font = UIFont.system(type: .Medium, size: 13)
            self.taskLabel.textColor = SPNativeStyleKit.Colors.gray
            self.taskLabel.numberOfLines = 1
            self.taskLabel.textAlignment = .right
            self.addSubview(self.taskLabel)
            
            self.titleLabel.text = title.uppercased()
            self.titleLabel.font = UIFont.system(type: .Medium, size: 13)
            self.titleLabel.textColor = UIColor.black
            self.titleLabel.numberOfLines = 1
            self.titleLabel.textAlignment = .left
            self.addSubview(self.titleLabel)
            
            if subtitle != nil {
                self.subtitleLabel = UILabel.init()
                self.subtitleLabel?.text = subtitle?.uppercased()
                self.subtitleLabel?.font = UIFont.system(type: .Medium, size: 13)
                self.subtitleLabel?.textColor = SPNativeStyleKit.Colors.gray
                self.subtitleLabel?.numberOfLines = 0
                self.subtitleLabel?.textAlignment = .left
                self.addSubview(self.subtitleLabel!)
            }
            if imageLink != nil {
                self.imageView = SPDownloadingImageView.init()
                self.imageView?.setImage(link: imageLink!)
                self.imageView?.layer.cornerRadius = 12
                self.addSubview(self.imageView!)
            }
            if image != nil {
                self.imageView = SPDownloadingImageView.init()
                self.imageView?.setImage(image: image!, animatable: true)
                self.imageView?.layer.cornerRadius = 12
                self.addSubview(self.imageView!)
            }
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func sizeToFit() {
            super.sizeToFit()
            self.setHeight(45)
            if self.imageView != nil {
                self.setHeight(75)
            }
            if self.subtitleLabel != nil {
                var height = 45 + self.subtitleLabel!.frame.height
                height.setIfFewer(when: 75)
                self.setHeight(height)
            }
            self.layoutSubviews()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.taskLabel.sizeToFit()
            self.taskLabel.center.y = self.frame.height / 2
            self.taskLabel.frame.origin.x = self.yLeftPosition - self.taskLabel.frame.width
            
            self.titleLabel.sizeToFit()
            self.titleLabel.center.y = self.frame.height / 2
            self.titleLabel.frame.origin.x = self.yLeftPosition + self.baseSpace
            self.titleLabel.setWidth(self.frame.width - self.titleLabel.frame.origin.x - self.baseSpace)
            
            if subtitleLabel != nil {
                let allContentHeight: CGFloat = self.titleLabel.frame.height + self.subtitleLabel!.frame.height + 3
                self.titleLabel.frame.origin.y = (self.frame.height - allContentHeight) / 2
                self.subtitleLabel?.frame.origin.x = self.titleLabel.frame.origin.x
                self.subtitleLabel?.frame.origin.y = self.titleLabel.frame.bottomYPosition + 3
                self.subtitleLabel?.sizeToFit()
                self.subtitleLabel?.setWidth(self.titleLabel.frame.width)
                
            }
            
            if imageView != nil {
                self.taskLabel.frame = CGRect.zero
                var imageSideSize = self.frame.height - 10 * 2
                imageSideSize.setIfMore(when: 40)
                self.imageView?.frame = CGRect.init(x: self.yLeftPosition - imageSideSize, y: 0, width: imageSideSize, height: imageSideSize)
                self.imageView?.center.y = self.frame.height / 2
            }
            
            
            self.separatorView.frame = CGRect.init(x: 18, y: self.frame.height - 1, width: self.frame.width - 18, height: 1)
        }
    }
    
    class SPConfirmActionCellsView: UIView {
        
        let backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.extraLight))
        
        private var baseSpace: CGFloat = 18
        
        init() {
            super.init(frame: CGRect.zero)
            self.addSubview(self.backgroundView)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            self.backgroundView.setEqualsBoundsFromSuperview()
            
            var maxLabelWidth: CGFloat = 0
            for view in self.subviews {
                if view != self.backgroundView {
                    if let cellView = view as? SPConfirmActionCellView {
                        cellView.sizeToFit()
                        if maxLabelWidth < cellView.taskLabel.frame.width {
                            maxLabelWidth = cellView.taskLabel.frame.width
                        }
                    }
                }
            }
            
            for view in self.subviews {
                if view != self.backgroundView {
                    if let cellView = view as? SPConfirmActionCellView {
                        cellView.yLeftPosition = self.baseSpace * 2 + maxLabelWidth
                        cellView.baseSpace = self.baseSpace
                        cellView.layoutSubviews()
                    }
                }
            }
            
            var yPosition: CGFloat = 0
            
            for view in subviews {
                if view != self.backgroundView {
                    view.sizeToFit()
                    view.setWidth(self.frame.width)
                    view.frame.origin = CGPoint.init(x: 0, y: yPosition)
                    yPosition += view.frame.height
                }
            }
            self.setHeight(yPosition)
        }
        
        override func sizeToFit() {
            super.sizeToFit()

            var height: CGFloat = 0
            for view in subviews {
                if view != self.backgroundView {
                    view.sizeToFit()
                    height += view.frame.height
                }
            }
            self.setHeight(height)
            self.layoutSubviews()
        }
    }
    
    class SPConfirmActionButtonView: UIView {
        
        let button = SPAppStoreActionButton()
        let backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.extraLight))
        
        init() {
            super.init(frame: CGRect.zero)
            self.button.style = .buyInStore
            self.button.setTitle("Execute", for: .normal)
            self.button.titleLabel?.font = UIFont.system(type: .DemiBold, size: 16)
            self.addSubview(self.backgroundView)
            self.addSubview(self.button)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func sizeToFit() {
            super.sizeToFit()
            var baseHeight: CGFloat = 80
            if #available(iOS 11.0, *) {
                baseHeight += (self.superview?.safeAreaInsets.bottom ?? 0)
            }
            self.setHeight(baseHeight)
            self.layoutSubviews()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            self.backgroundView.setEqualsBoundsFromSuperview()
            self.button.sizeToFit()
            self.button.setXCenteringFromSuperview()
            
            var safeAreaInsetsBottom: CGFloat = 0
            if #available(iOS 11.0, *) {
                safeAreaInsetsBottom = (self.superview?.safeAreaInsets.bottom ?? 0)
            }
            self.button.center.y = (self.frame.height - safeAreaInsetsBottom) / 2
        }
    }
}

