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

class SPProposeController: SPController {
    
    private let data: Data
    internal let areaView = AreaView()
    private var isPresent: Bool = false
    
    private var animationDuration: TimeInterval {
        return 0.5
    }
    
    private var gradeFactor: CGFloat {
        return 0.6
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !self.isPresent {
            self.present()
            self.isPresent = true
        }
    }
    
    private func present() {
        SPVibration.impact(.warning)
        self.areaView.frame.origin.y = self.view.frame.size.height
        self.areaView.isHidden = false
        SPAnimationSpring.animate(self.animationDuration, animations: {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(self.gradeFactor)
            self.areaView.frame.origin.y = self.view.frame.size.height - self.areaView.frame.height - (self.bottomSafeArea / 2) - self.space
        }, spring: 1,
           velocity: 1,
           options: .transitionCurlUp)
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
    
    override func updateLayout(with size: CGSize) {
        super.updateLayout(with: size)
        self.areaView.layout(origin: CGPoint.init(x: self.space, y: 0), width: size.width - (self.space * 2))
        self.areaView.frame.origin.y = self.view.frame.size.height - self.areaView.frame.height - (self.bottomSafeArea / 2) - self.space
        
    }
    
    @objc func handleGesture(sender: UIPanGestureRecognizer) {
        let returnAreaViewToPoint = {
            SPAnimationSpring.animate(self.animationDuration, animations: {
                self.areaView.frame.origin.y = self.view.frame.size.height - self.areaView.frame.height - (self.bottomSafeArea / 2) - self.space
                self.view.backgroundColor = UIColor.black.withAlphaComponent(self.gradeFactor)
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
            
            let baseY = self.view.frame.size.height - self.areaView.frame.height - (self.bottomSafeArea / 2) - self.space
            let dem = -(baseY - self.areaView.frame.origin.y) / 6
            var newGrade = self.gradeFactor - (dem / 100)
            newGrade.setIfFewer(when: 0.2)
            newGrade.setIfMore(when: self.gradeFactor + 0.05)
            self.view.backgroundColor = UIColor.black.withAlphaComponent(newGrade)
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
        let button = SPNativeLargeButton()
        let closeButton = SPSystemIconButton(type: SPSystemIcon.close)
        
        var imageSideSize: CGFloat = 160
        private let space: CGFloat = 36
        
        init() {
            super.init(frame: CGRect.zero)
            self.backgroundColor = UIColor.white
            self.layer.masksToBounds = true
            self.layer.cornerRadius = 34
            
            self.titleLabel.font = UIFont.system(weight: .regular, size: 31)
            self.titleLabel.textColor = UIColor.init(hex: "939393")
            self.titleLabel.numberOfLines = 1
            self.titleLabel.adjustsFontSizeToFitWidth = true
            self.titleLabel.minimumScaleFactor = 0.5
            self.titleLabel.setCenterAlignment()
            self.addSubview(self.titleLabel)
            
            self.subtitleLabel.font = UIFont.system(weight: .regular, size: 17)
            self.subtitleLabel.textColor = SPNativeColors.black
            self.subtitleLabel.numberOfLines = 0
            self.subtitleLabel.setCenterAlignment()
            self.addSubview(self.subtitleLabel)
            
            self.imageView.gradeView.backgroundColor = UIColor.white
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.layer.masksToBounds = true
            self.addSubview(self.imageView)
            
            self.button.titleLabel?.font = UIFont.system(weight: UIFont.FontWeight.medium, size: 15)
            self.button.setTitleColor(SPNativeColors.black)
            self.button.layer.cornerRadius = 13
            self.button.backgroundColor = SPNativeColors.lightGray
            self.addSubview(self.button)
            
            self.closeButton.widthIconFactor = 0.4
            self.closeButton.heightIconFactor = 0.4
            self.closeButton.backgroundColor = SPNativeColors.lightGray.withAlphaComponent(0.6)
            self.closeButton.color = UIColor.init(hex: "979797")
            self.addSubview(self.closeButton)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.titleLabel.sizeToFit()
            self.titleLabel.frame.origin.y = self.space * 0.9
            self.titleLabel.frame.set(width: self.frame.width - self.space * 3)
            self.titleLabel.setXCenter()
            
            self.subtitleLabel.sizeToFit()
            self.subtitleLabel.frame.origin.y = self.titleLabel.frame.bottomY + 8
            self.subtitleLabel.frame.set(width: self.frame.width - self.space * 2 + 10)
            self.subtitleLabel.setXCenter()
            
            self.imageView.frame = CGRect.init(
                x: 0, y: self.subtitleLabel.frame.bottomY + self.space / 1.4,
                width: self.imageSideSize,
                height: self.imageSideSize
            )
            self.imageView.setXCenter()
            
            self.button.sizeToFit()
            self.button.frame.set(height: 55)
            self.button.frame.set(width: self.frame.width - self.space * 2)
            self.button.frame.origin.y = self.imageView.frame.bottomY + self.space / 1.2
            self.button.setXCenter()
            
            self.closeButton.frame = CGRect.init(x: 0, y: 0, width: 28, height: 28)
            self.closeButton.frame.origin.x = self.frame.width - self.closeButton.frame.width - 20
            self.closeButton.frame.origin.y = 20
            self.closeButton.round()
            
            self.frame.set(height: self.button.frame.bottomY + self.space)
        }
        
        func layout(origin: CGPoint, width: CGFloat) {
            self.frame.origin = origin
            self.frame.set(width: width)
            self.layoutSubviews()
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
    
    var bottomSafeArea: CGFloat {
        var bottomSafeArea: CGFloat = 0
        if let window =  UIApplication.shared.keyWindow {
            if #available(iOS 11.0, *) {
                bottomSafeArea = window.safeAreaInsets.bottom
            }
        } else {
            bottomSafeArea = 0
        }
        
        return bottomSafeArea
    }
}
