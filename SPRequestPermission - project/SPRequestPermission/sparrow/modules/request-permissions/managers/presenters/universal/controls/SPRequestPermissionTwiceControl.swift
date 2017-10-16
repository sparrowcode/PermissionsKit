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

class SPRequestPermissionTwiceControl: UIButton, SPRequestPermissionTwiceControlInterface {
    
    var permission: SPRequestPermissionType
    
    var iconView: SPRequestPermissionIconView!
    
    var normalColor: UIColor
    var selectedColor: UIColor
    
    init(permissionType: SPRequestPermissionType, title: String, normalIconImage: UIImage, selectedIconImage: UIImage, normalColor: UIColor, selectedColor: UIColor) {
        self.permission = permissionType
        
        let renderingNormalIconImage = normalIconImage.withRenderingMode(.alwaysTemplate)
        let renderingSelectedIconImage = selectedIconImage.withRenderingMode(.alwaysTemplate)
        
        self.iconView = SPRequestPermissionIconView(iconImage: renderingNormalIconImage, selectedIconImage: renderingSelectedIconImage)
        self.normalColor = normalColor
        self.selectedColor = selectedColor
        super.init(frame: CGRect.zero)
        self.setTitle(title, for: UIControlState.normal)
        self.commonInit()
        //self.iconView.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.layer.borderWidth = 1
        self.addSubview(self.iconView)
        self.titleLabel?.font = UIFont.init(name: SPRequestPermissionData.fonts.base() + "-Medium", size: 14)
        if UIScreen.main.bounds.width < 335 {
            self.titleLabel?.font = UIFont.init(name: SPRequestPermissionData.fonts.base() + "-Medium", size: 12)
        }
        self.titleLabel?.minimumScaleFactor = 0.5
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.setNormalState(animated: false)
    }
    
    func setNormalState(animated: Bool) {
        self.layer.borderColor = self.selectedColor.cgColor
        self.backgroundColor = self.normalColor
        self.setTitleColor(self.selectedColor, for: UIControlState.normal)
        self.iconView.setColor(self.selectedColor)
        self.iconView.setIconImageView(self.iconView.iconImage!)
        self.setTitleColor(self.selectedColor.withAlphaComponent(0.62), for: UIControlState.highlighted)
    }
    
    func setSelectedState(animated: Bool) {
        self.layer.borderColor = self.normalColor.cgColor
        if animated{
            UIView.animate(withDuration: 0.4, animations: {
               self.backgroundColor = self.selectedColor
            })
        } else {
             self.backgroundColor = self.selectedColor
        }
        var colorForTitle = self.normalColor
        if self.normalColor == UIColor.clear {
            colorForTitle = UIColor.white
        }
        self.setTitleColor(colorForTitle, for: UIControlState.normal)
        self.setTitleColor(colorForTitle.withAlphaComponent(0.62), for: UIControlState.highlighted)
        self.iconView.setSelectedState(with: self.normalColor) 
    }
    
    internal func addAction(_ target: Any?, action: Selector) {
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
    }
    
    internal func addAsSubviewTo(_ view: UIView) {
        view.addSubview(self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
        let sideSize: CGFloat = self.frame.height * 0.45
        let xTranslationIconView: CGFloat = self.frame.width * 0.075
        iconView.frame = CGRect.init(
            x: xTranslationIconView,
            y: (self.frame.height - sideSize) / 2,
            width: sideSize,
            height: sideSize
        )
    }
}

class SPRequestPermissionIconView: UIView {
    
    var imageView: UIImageView?
    var iconImage: UIImage?
    var selectedIconImage: UIImage?

    init(iconImage: UIImage, selectedIconImage: UIImage) {
        super.init(frame: CGRect.zero)
        self.imageView = UIImageView()
        self.imageView?.contentMode = .scaleAspectFit
        self.addSubview(imageView!)
        self.iconImage = iconImage
        self.selectedIconImage = selectedIconImage
        self.setIconImageView(self.iconImage!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setSelectedState(with color: UIColor = .white) {
        var settingColor = color
        if settingColor == UIColor.clear {
            settingColor = UIColor.white
        }
        self.setColor(settingColor)
        self.imageView?.layer.shadowRadius = 0
        self.imageView?.layer.shadowOffset = CGSize.init(width: 0, height: 1)
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi * 2
        rotationAnimation.duration = 0.18
        rotationAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        self.imageView?.layer.shouldRasterize = true
        self.imageView?.layer.rasterizationScale = UIScreen.main.scale
        self.imageView?.layer.add(rotationAnimation, forKey: nil)
        
        var blurView = UIView()
        
        if #available(iOS 9, *) {
            blurView = SPBlurView()
        }
        
        blurView.backgroundColor = UIColor.clear
        self.addSubview(blurView)
        blurView.frame = CGRect.init(x: 0, y: 0, width: self.frame.height, height: self.frame.height)
        blurView.center = (self.imageView?.center)!
        
        SPAnimation.animate(0.1, animations: {
            if #available(iOS 9, *) {
                if let view = blurView as? SPBlurView {
                    view.setBlurRadius(1.2)
                }
            }
            
        }, options: UIViewAnimationOptions.curveEaseIn,
           withComplection: {
            SPAnimation.animate(0.1, animations: {
                if #available(iOS 9, *) {
                    if let view = blurView as? SPBlurView {
                        view.setBlurRadius(0)
                    }
                }
            }, options: UIViewAnimationOptions.curveEaseOut,
               withComplection: {
                blurView.removeFromSuperview()
            })
        })
        delay(0.05, closure: {
            self.setIconImageView(self.selectedIconImage!)
        })
    }
    
    func setColor(_ color: UIColor) {
        UIView.transition(with: self.imageView!, duration: 0.2, options: UIViewAnimationOptions.beginFromCurrentState, animations: {
            self.imageView?.tintColor = color
        }, completion: nil)
    }
    
    func setIconImageView(_ iconImageView: UIImage) {
        self.imageView?.image = iconImageView
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = self.bounds
    }
}
