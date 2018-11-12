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

class SPProposeViewController: SPBaseViewController {
    
    private let data: Data
    internal let areaView = AreaView()
    
    private var animationDuration: TimeInterval {
        return 0.5
    }
    
    private var space: CGFloat {
        return 6
    }
    
    init(title: String, subtitle: String, buttonTitle: String, imageLink: String? = nil, image: UIImage? = nil, complection: @escaping (_ isConfirmed: Bool)->() = {_ in }) {
        self.data = Data(
            title: title,
            subtitle: subtitle,
            buttonTitle: buttonTitle,
            imageLink: imageLink,
            image: image,
            complection: complection
        )
        super.init(nibName: nil, bundle: nil)
        
        self.modalPresentationStyle = .overCurrentContext
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.areaView.isHidden = true
        self.areaView.titleLabel.text = self.data.title
        self.areaView.subtitleLabel.text = self.data.subtitle
        self.areaView.button.setTitle(self.data.buttonTitle, for: UIControl.State.normal)
        
        self.areaView.button.addTarget(self, action: #selector(self.open), for: UIControl.Event.touchUpInside)
        self.areaView.closeButton.addTarget(self, action: #selector(self.close), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(self.areaView)
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(self.handleGesture(sender:)))
        panGesture.maximumNumberOfTouches = 1
        self.areaView.addGestureRecognizer(panGesture)
        
        self.areaView.imageView.setParalax(amount: 0.1)
        if let image = self.data.image {
            self.areaView.imageView.setImage(image: image, animatable: false)
        }
        
        self.updateLayout(with: self.view.frame.size)
    }
    
    override func updateLayout(with size: CGSize) {
        self.areaView.setWidth(size.width - (self.space * 2))
        self.areaView.layoutSubviews()
        self.areaView.sizeToFit()
        self.areaView.frame.origin.x = self.space
        self.areaView.frame.origin.y = self.view.frame.size.height - self.areaView.frame.height - (UIWindow.bottomSafeArea / 2) - self.space
        
    }
    
    func present(on viewController: UIViewController) {
        viewController.present(self, animated: false, completion: {
            SPVibration.impact(SPVibration.Mode.warning)
            self.areaView.frame.origin.y = self.view.frame.size.height
            self.areaView.isHidden = false
            SPAnimationSpring.animate(self.animationDuration, animations: {
                self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                
                self.areaView.frame.origin.y = self.view.frame.size.height - self.areaView.frame.height - (UIWindow.bottomSafeArea / 2) - self.space
            }, spring: 1,
               velocity: 1,
               options: .transitionCurlUp)
        })
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        
        let hide = {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.areaView.frame.origin.y = self.view.frame.size.height
        }
        
        let dismiss = {
            super.dismiss(animated: false) {
                completion?()
            }
        }
        
        if flag {
            SPAnimationSpring.animate(self.animationDuration, animations: {
                hide()
            }, spring: 1,
               velocity: 1,
               options: .transitionCurlDown,
               withComplection: {
                dismiss()
            })
        } else {
            hide()
            dismiss()
        }
    }
    
    @objc func handleGesture(sender: UIPanGestureRecognizer) {
        
        let returnAreaViewToPoint = {
            SPAnimationSpring.animate(self.animationDuration, animations: {
                self.areaView.frame.origin.y = self.view.frame.size.height - self.areaView.frame.height - (UIWindow.bottomSafeArea / 2) - self.space
            }, spring: 1,
               velocity: 1,
               options: .transitionCurlDown,
               withComplection: {
            })
        }
        
        switch sender.state {
        case .began:
            break
        case .cancelled:
            returnAreaViewToPoint()
        case .changed:
            let translation = sender.translation(in: self.view)
            self.areaView.center = CGPoint(x: areaView.center.x + 0, y: areaView.center.y + translation.y / 4)
            sender.setTranslation(CGPoint.zero, in: self.view)
        case .ended:
            returnAreaViewToPoint()
        default:
            break
        }
    }
    
    @objc func open() {
        self.data.complection(true)
        self.dismiss(animated: true)
    }
    
    @objc func close() {
        self.data.complection(false)
        self.dismiss(animated: true)
    }
    
    class AreaView: UIView {
        
        let titleLabel = UILabel()
        let subtitleLabel = UILabel()
        let imageView = SPDownloadingImageView()
        let button = SPNativeOS11Button()
        let closeButton = SPSystemIconButton(type: SPSystemIconType.close)
        
        var imageSideSize: CGFloat = 160
        
        private let space: CGFloat = 36
        
        init() {
            super.init(frame: CGRect.zero)
            self.backgroundColor = UIColor.white
            self.layer.masksToBounds = true
            self.layer.cornerRadius = 34
            
            self.titleLabel.font = UIFont.system(type: .Regular, size: 28)
            self.titleLabel.textColor = UIColor.init(hex: "939393")
            self.titleLabel.numberOfLines = 1
            self.titleLabel.adjustsFontSizeToFitWidth = true
            self.titleLabel.minimumScaleFactor = 0.5
            self.titleLabel.setCenteringAlignment()
            self.addSubview(self.titleLabel)
            
            self.subtitleLabel.font = UIFont.system(type: .Regular, size: 16)
            self.subtitleLabel.textColor = SPNativeStyleKit.Colors.black
            self.subtitleLabel.numberOfLines = 0
            self.subtitleLabel.setCenteringAlignment()
            self.addSubview(self.subtitleLabel)
            
            self.imageView.gradeView.backgroundColor = UIColor.white
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.layer.masksToBounds = true
            self.addSubview(self.imageView)
            
            self.button.titleLabel?.font = UIFont.system(type: UIFont.BoldType.Medium, size: 15)
            self.button.setTitleColorForNoramlAndHightlightedStates(color: SPNativeStyleKit.Colors.black)
            self.button.backgroundColor = UIColor.init(hex: "D4D3DB")
            self.addSubview(self.button)
            
            self.closeButton.widthIconFactor = 0.4
            self.closeButton.heightIconFactor = 0.4
            self.closeButton.backgroundColor = UIColor.init(hex: "EFEFF4")
            self.closeButton.color =  UIColor.init(hex: "979797")
            self.addSubview(self.closeButton)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.titleLabel.sizeToFit()
            self.titleLabel.frame.origin.y = self.space * 0.8
            self.titleLabel.setWidth(self.frame.width - self.space * 3)
            self.titleLabel.setXCenteringFromSuperview()
            
            self.subtitleLabel.sizeToFit()
            self.subtitleLabel.frame.origin.y = self.titleLabel.frame.bottomYPosition + 8
            self.subtitleLabel.setWidth(self.frame.width - self.space * 2)
            self.subtitleLabel.setXCenteringFromSuperview()
            
            self.imageView.frame = CGRect.init(
                x: 0, y: self.subtitleLabel.frame.bottomYPosition + self.space / 2,
                width: self.imageSideSize,
                height: self.imageSideSize
            )
            self.imageView.setXCenteringFromSuperview()
            
            self.button.sizeToFit()
            self.button.setWidth(self.frame.width - self.space * 2)
            self.button.frame.origin.y = self.imageView.frame.bottomYPosition + self.space / 2
            self.button.setXCenteringFromSuperview()
            
            self.closeButton.frame = CGRect.init(x: 0, y: 0, width: 24, height: 24)
            self.closeButton.frame.origin.x = self.frame.width - self.closeButton.frame.width - 20
            self.closeButton.frame.origin.y = 20
            self.closeButton.round()
        }
        
        override func sizeToFit() {
            super.sizeToFit()
            self.setHeight(self.button.frame.bottomYPosition + self.space)
        }
    }
    
    struct Data {
        var title: String
        var subtitle: String
        var buttonTitle: String
        var imageLink: String?
        var image: UIImage?
        var complection: (_ isConfirmed: Bool)->()
    }
}
