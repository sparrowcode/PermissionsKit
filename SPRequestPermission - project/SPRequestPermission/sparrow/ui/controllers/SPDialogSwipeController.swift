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

public class SPDialogSwipeController<DialogView: UIView, BottomView: UIView>: UIViewController {
    
    //MARK: - views
    let dialogView: DialogView
    let backgroundView: SPGradeWithBlurView = SPGradeWithBlurView()
    let bottomView: BottomView = BottomView()
    internal var contentView: UIView = UIView()
    
    //MARK: - UI
    var backgroundGrade: CGFloat = 0.25
    var backgroundBlurFactor: CGFloat = 0.017
    var dialogShadowYtranslationFactor: CGFloat = 0.035
    var dialogShadowBlurRadiusFactor: CGFloat = 0.026
    var dialogShadowOpacity: CGFloat = 0.36
    private var dialogShadowWidthRelativeFactor: CGFloat = 0.8
    
    //MARK: - layout
    //dialog view
    var dialogViewMaxWidth: CGFloat = 300
    var dialogViewMaxHeight: CGFloat = 300
    var dialogViewWidthRelativeFactor: CGFloat = 0.8
    var dialogViewHeightRelativeFactor: CGFloat = 0.8
    //width divided height
    var dialogViewSidesRelativeFactor: CGFloat = 1
    var dialogViewPortraitYtranslationFactor: CGFloat = 0.96
    var dialogViewLandscapeYtranslationFactor: CGFloat = 1
    var dialogViewSize: CGSize {
        
        var widthArea = self.view.frame.width * self.dialogViewWidthRelativeFactor
        var heightArea = self.view.frame.height * self.dialogViewHeightRelativeFactor
        let isPortraitLayout: Bool = UIScreen.main.bounds.width < UIScreen.main.bounds.height
        if isPortraitLayout {
            widthArea = self.view.frame.width * self.dialogViewWidthRelativeFactor
            heightArea = self.view.frame.height * self.dialogViewHeightRelativeFactor
        } else {
            widthArea = self.view.frame.height * self.dialogViewWidthRelativeFactor
            heightArea = self.view.frame.width * self.dialogViewHeightRelativeFactor
        }
        
        widthArea.setIfMore(when: self.dialogViewMaxWidth)
        heightArea.setIfMore(when: self.dialogViewMaxHeight)
        
        var prepareWidth = widthArea
        var prepareHeight = widthArea / self.dialogViewSidesRelativeFactor
        if prepareHeight > heightArea {
            prepareHeight = heightArea
            prepareWidth = heightArea * self.dialogViewSidesRelativeFactor
        }
        
        if isPortraitLayout {
            return CGSize.init(width: prepareWidth, height: prepareHeight)
        } else {
            return CGSize.init(width: prepareHeight, height: prepareWidth)
        }
    }
    var dialogCenteringPoint: CGPoint {
        if SPDeviceOrientation.isPortraitOrienation() {
            return CGPoint(x: self.view.center.x, y: self.view.center.y * dialogViewPortraitYtranslationFactor)
        } else {
            return CGPoint(x: self.view.center.x, y: self.view.center.y * dialogViewLandscapeYtranslationFactor)
        }
    }
    //bottom view
    var bottomViewMaxWidth: CGFloat = 140
    var bottomViewMaxHeight: CGFloat = 75
    var bottomViewWidthRelativeFactor: CGFloat = 0.6
    //width divided height
    var bottomViewSidesRelativeFactor: CGFloat = 1.5
    var bottomViewMinToDialogSpace: CGFloat = 20
    var bottomViewYTranslationFactor: CGFloat = 0.1
    var bottomViewSize: CGSize {
        var prepareWidth: CGFloat = self.contentView.frame.width * self.bottomViewWidthRelativeFactor
        if prepareWidth > bottomViewMaxWidth {
            prepareWidth = bottomViewMaxWidth
        }
        var prepareHeight: CGFloat = prepareWidth / self.bottomViewSidesRelativeFactor
        if prepareHeight > self.bottomViewMaxHeight {
            prepareHeight = self.bottomViewMaxHeight
            prepareWidth = self.bottomViewMaxHeight * self.bottomViewSidesRelativeFactor
        }
        return CGSize.init(width: prepareWidth, height: prepareHeight)
    }
    var bottomViewCenter: CGPoint {
        let dialogHeigth = self.dialogViewSize.height
        let dialogCenter = self.dialogCenteringPoint
        let bottomHeight = self.bottomViewSize.height
        let dialogBottomSideYpoint = dialogCenter.y + (dialogHeigth / 2)
        let spaceBetweenDialogAndBottomSide = self.view.frame.height - dialogBottomSideYpoint
        var prepareSpace = spaceBetweenDialogAndBottomSide * bottomViewYTranslationFactor
        let minSpace = self.bottomViewMinToDialogSpace
        if prepareSpace < minSpace {
            prepareSpace = minSpace
        }
        return CGPoint(x: self.view.center.x, y: dialogBottomSideYpoint + prepareSpace + bottomHeight / 2)
    }
    
    //MARK: - animation
    var spring: CGFloat = 0.5
    var velocity: CGFloat = 0.85
    
    //MARK: - delegates
    weak var delegate: SPDialogSwipeControllerDelegate?
    
    private var isShowBottomView: Bool {
        return (bottomView.frame.origin.y + bottomView.frame.height) < (self.view.frame.height)
    }
    
    //MARK: - init
    init(dialogView: DialogView) {
        self.dialogView = dialogView
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        self.dialogView = DialogView()
        super.init(coder: aDecoder)
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    //MARK: - public func
    func present(on viewController: UIViewController) {
        self.animator.removeAllBehaviors()
        self.bottomView.alpha = 0
        self.contentView.alpha = 0
        self.contentView.transform = .identity
        self.modalPresentationStyle = .overCurrentContext
        viewController.present(self, animated: false, completion: {
            finished in
            self.updateLayoutAndSizes()
            self.updateContentViewShadow(yTranslationFactor: self.dialogShadowYtranslationFactor, blurRadiusFactor: self.dialogShadowBlurRadiusFactor, opacity: self.dialogShadowOpacity)
            self.contentView.center = CGPoint.init(
                x: self.view.center.x,
                y: self.view.center.y * 1.2
            )
            SPAnimation.animate(0.6, animations: {
                self.updateBackground()
            })
            delay(0.21, closure: {
                self.snapBehavior = UISnapBehavior(item: self.contentView, snapTo: self.dialogCenteringPoint)
                self.animator.addBehavior(self.snapBehavior)
                SPAnimation.animate(0.3, animations: {
                    self.contentView.alpha = 1
                    delay(0.2, closure: {
                        if self.delegate?.isEnableHideDialogController ?? true {
                            if self.isShowBottomView {
                                SPAnimation.animate(0.3, animations: {
                                    self.bottomView.alpha = 1
                                })
                            }
                        }
                    })
                })
            })
        })
    }
    
    func hide(withDialog: Bool) {
        if withDialog {
            SPAnimationSpring.animate(
                0.4,
                animations: {
                    self.animator.removeAllBehaviors()
                    self.contentView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
                    self.contentView.alpha = 0
            },
                options: [.curveEaseIn, .beginFromCurrentState],
                withComplection: {})
        }
        SPAnimation.animate(0.3, animations: {
            self.bottomView.alpha = 0
        })
        SPAnimation.animate(0.6, animations: {
            self.backgroundView.setGradeAlpha(0, blurRaius: 0)
        }, withComplection: {
            finished in
            self.dismiss(animated: false, completion: {
                finished in
                self.animator.removeAllBehaviors()
                self.contentView.transform = .identity
                self.delegate?.didHideDialogController()
            })
        })
    }
    
    //MARK: - ovveride func
    override public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        animator.removeAllBehaviors()
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (context) in
            self.contentView.transform = .identity
            self.updateLayoutAndSizes()
            if self.isShowBottomView {
                self.bottomView.alpha = 1
            } else {
                self.bottomView.alpha = 0
            }
            SPAnimationSpring.animate(0.3, animations: {
                self.actionBeforeRotation()
            }, spring: self.spring, velocity: self.velocity, options: UIViewAnimationOptions.curveEaseIn)
        }, completion: {
            finished in
            SPAnimationSpring.animate(0.35, animations: {
                self.actionAfterRotation()
            }, spring: self.spring, velocity: self.velocity, options: UIViewAnimationOptions.curveEaseOut)
            
            self.updateLayoutAndSizes()
        })
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.backgroundView)
        self.view.addSubview(self.bottomView)
        self.view.addSubview(self.contentView)
        SPConstraintsAssistent.setEqualSizeConstraint(backgroundView, superVuew: self.view)
        self.contentView.addSubview(self.dialogView)
        self.backgroundView.setGradeAlpha(0, blurRaius: 0)
        self.contentView.backgroundColor = UIColor.clear
        self.contentView.alpha = 0
        self.contentView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        self.dialogView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        self.bottomView.alpha = 0
        self.bottomView.backgroundColor = UIColor.clear
        self.contentView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(self.handleGesture(sender:)))
        panGesture.maximumNumberOfTouches = 1
        self.contentView.addGestureRecognizer(panGesture)
        animator = UIDynamicAnimator(referenceView: self.view)
    }
    
    //MARK: - inner func
    internal func updateLayoutAndSizes() {
        self.contentView.frame = CGRect.init(origin: CGPoint.zero, size: self.dialogViewSize)
        self.contentView.center = self.dialogCenteringPoint
        self.dialogView.frame = self.contentView.bounds
        self.contentView.layer.cornerRadius = self.dialogView.layer.cornerRadius
        self.bottomView.bounds = CGRect.init(origin: CGPoint.zero, size: self.bottomViewSize)
        self.bottomView.center = self.bottomViewCenter
    }
    
    internal func actionBeforeRotation() {
        self.contentView.transform = CGAffineTransform.init(scaleX: 1.1, y: 1.1)
        self.updateContentViewShadow(yTranslationFactor: 0, blurRadiusFactor: 0, opacity: 0)
    }
    
    internal func actionAfterRotation() {
        self.contentView.transform = CGAffineTransform.identity
        self.updateContentViewShadow(yTranslationFactor: self.dialogShadowYtranslationFactor, blurRadiusFactor: self.dialogShadowBlurRadiusFactor, opacity: self.dialogShadowOpacity)
    }
    
    private func updateContentViewShadow(yTranslationFactor: CGFloat, blurRadiusFactor: CGFloat, opacity: CGFloat) {
        self.contentView.updateShadow(
            xTranslationFactor: 0,
            yTranslationFactor: yTranslationFactor,
            widthRelativeFactor: self.dialogShadowWidthRelativeFactor,
            heightRelativeFactor: 1,
            blurRadiusFactor: blurRadiusFactor,
            shadowOpacity: opacity
        )
    }
    
    private func updateBackground() {
        let blurRadius = min(self.view.frame.width, self.view.frame.width) * self.backgroundBlurFactor
        self.backgroundView.setGradeAlpha(self.backgroundGrade, blurRaius: blurRadius)
    }
    
    //MARK: - animator
    var animator = UIDynamicAnimator()
    var attachmentBehavior : UIAttachmentBehavior!
    var gravityBehaviour : UIGravityBehavior!
    var snapBehavior : UISnapBehavior!
    
    //MARK: - handle gesture
    func handleGesture(sender: AnyObject) {
        let myView = self.contentView
        let location = sender.location(in: view)
        let boxLocation = sender.location(in: myView)
        
        if sender.state == UIGestureRecognizerState.began {
            animator.removeAllBehaviors()
            let centerOffset = UIOffsetMake(boxLocation.x - myView.bounds.midX, boxLocation.y - myView.bounds.midY);
            attachmentBehavior = UIAttachmentBehavior(item: myView, offsetFromCenter: centerOffset, attachedToAnchor: location)
            attachmentBehavior.frequency = 0
            animator.addBehavior(attachmentBehavior)
        }
        else if sender.state == UIGestureRecognizerState.changed {
            self.attachmentBehavior.anchorPoint = location
        }
        else if sender.state == UIGestureRecognizerState.ended {
            animator.removeBehavior(attachmentBehavior)
            snapBehavior = UISnapBehavior(item: myView, snapTo: self.dialogCenteringPoint)
            animator.addBehavior(snapBehavior)
            let translation = sender.translation(in: view)
            if translation.y > 100 {
                if delegate?.isEnableHideDialogController ?? true {
                    animator.removeAllBehaviors()
                    gravityBehaviour = UIGravityBehavior(items: [contentView])
                    gravityBehaviour.gravityDirection = CGVector.init(dx: 0, dy: 10)
                    animator.addBehavior(gravityBehaviour)
                    self.hide(withDialog: false)
                }
            }
        }
    }
}


protocol SPDialogSwipeControllerDelegate: class {
    
    var isEnableHideDialogController: Bool {get}
    
    func didHideDialogController()
}
