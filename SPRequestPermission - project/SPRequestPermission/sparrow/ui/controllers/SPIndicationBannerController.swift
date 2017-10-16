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

public class SPIndicationBannerController<BottomView: UIView>: SPStatusBarManagerViewController {
    
    let listView: SPDinamicAligmentView = SPDinamicAligmentView.init(aliment: .vertical)
    var alertView: AlertView!
    var hidingView: AlertView?
    
    let bottomView: BottomView = BottomView()
    let backgroundView: SPGradeWithBlurView = SPGradeWithBlurView()
    
    weak var dataSource: SPIndicationBannerControllerDataSource?
    weak var delegate: SPIndicationBannerControllerDelegate?
    
    var alertCenteringPoint: CGPoint {
        let xPoint = (self.view.frame.width - self.alertView.frame.width) / 2 + (self.alertView.frame.width / 2)
        let yPoint = (self.listView.frame.origin.y + self.listView.needSize.height + 25 + self.cellHeight / 2)
        return CGPoint.init(x: xPoint, y: yPoint)
    }
    
    var cellHeight: CGFloat {
        return 100
    }
    
    //MARK: - layout
    //bottom view
    var bottomViewMaxWidth: CGFloat = 140
    var bottomViewMaxHeight: CGFloat = 75
    var bottomViewWidthRelativeFactor: CGFloat = 0.6
    //width divided height
    var bottomViewSidesRelativeFactor: CGFloat = 1.5
    var bottomViewSize: CGSize {
        var width = self.view.frame.width * 0.8
        width.setIfMore(when: 300)
        var prepareWidth: CGFloat = width * self.bottomViewWidthRelativeFactor
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
        let xCenter = self.view.frame.width / 2
        let yCenter = self.view.frame.height - bottomViewSize.height / 1.5
        return CGPoint.init(x: xCenter, y: yCenter)
    }
    
    private var isShowBottomView: Bool {
        return (bottomView.frame.origin.y + bottomView.frame.height) < (self.view.frame.height)
    }
    
    //MARK: - animation
    var spring: CGFloat = 0.5
    var velocity: CGFloat = 0.85
    
    
    //MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.isHiddenStatusBar = true
        self.view.addSubview(self.backgroundView)
        SPConstraintsAssistent.setEqualSizeConstraint(backgroundView, superVuew: self.view)
        
        self.listView.itemSideSize = 25
        self.listView.space = 8
        self.view.addSubview(listView)
        
        self.view.addSubview(self.bottomView)
        
        self.addAlertView()
        self.updateLayout()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presentAlertView()
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.animator.removeAllBehaviors()
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout()
        }, completion: {
            finished in
            self.updateLayout()
        })
    }
    
    private func updateLayout() {
        let listWidth = min(self.view.frame.width * 0.6, 230)
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        self.listView.frame = CGRect.init(x: 0, y: statusBarHeight + 25, width: listWidth, height: self.listView.needSize.height)
        self.listView.center.x = self.view.frame.width / 2
        
        let alertWidth = min(self.view.frame.width * 0.85, 319)
        self.alertView.frame = CGRect.init(x: 0, y: 0, width: alertWidth, height: self.cellHeight)
        self.alertView.center = self.alertCenteringPoint
        self.alertView.setDeepShadow()
        
        self.bottomView.bounds = CGRect.init(origin: CGPoint.zero, size: self.bottomViewSize)
        self.bottomView.center = self.bottomViewCenter
    }
    
    func present(on viewController: UIViewController) {
        self.bottomView.alpha = 0
        self.modalPresentationStyle = .overCurrentContext
        viewController.present(self, animated: false, completion: {
            SPHideWindow.dialog.presentWith(view: self.backgroundView)
            if self.isShowBottomView {
                SPAnimation.animate(0.3, animations: {
                    self.bottomView.alpha = 1
                }, delay: 0.41)
            }
        })
    }
    
    func hide(withDialg: Bool) {
        
        SPAnimation.animate(0.3, animations: {
            self.bottomView.alpha = 0
        })
        
        SPAnimationAlpha.hideReverseList(views: self.listView.subviews)
        
        SPAnimation.animate(0.2, animations: {
            self.listView.alpha = 0
        }, delay: SPHideWindow.dialog.duration - 0.2)
        
        SPAnimation.animate(SPHideWindow.dialog.duration, animations: {
            self.backgroundView.setGradeAlpha(0, blurRaius: 0)
        }, withComplection: {
            self.dismiss(animated: false, completion: {
                self.animator.removeAllBehaviors()
                self.delegate?.didHide()
            })
        })
    }
    
    public func presentNextStage() {
        
        self.animator.removeAllBehaviors()
        self.alertView.transform = .identity
        
        self.hidingView = self.alertView
        self.addItemToList()
        self.moveAlertToItemList()
        
        if self.listView.subviews.count >= self.dataSource?.countStages() ?? 3 {
            delay(0.8, closure: {
                self.hide(withDialg: true)
            })
        } else {
            self.addAlertView()
            self.updateLayout()
            self.presentAlertView()
        }
    }
    
    private func addItemToList() {
        let view = SPItemListView.init()
        view.iconView.alpha = 0
        view.labelView.alpha = 0
        if let text = self.dataSource?.titleForListStagesAt(index: self.listView.subviews.count) {
            view.labelView.text = text
        }
        self.listView.addSubview(view)
        self.listView.layoutSubviews()
        SPAnimationAlpha.showList(views: [view.labelView])
    }
    
    private func addAlertView() {
        let view = self.dataSource?.alertViewAt(index: self.listView.subviews.count) ?? UIView()
        self.alertView = AlertView.init(view: view)
        self.alertView.alpha = 0

        self.alertView.addSubview(view)
        
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(self.handleGesture(sender:)))
        panGesture.maximumNumberOfTouches = 1
        self.alertView.addGestureRecognizer(panGesture)
        animator = UIDynamicAnimator(referenceView: self.view)
        
        self.view.addSubview(self.alertView)
    }
    
    private func presentAlertView() {
        SPAnimationUpward.showList(views: [self.alertView])
    }
    
    private func moveAlertToItemList() {
        
        self.hidingView?.addShadowOpacityAnimation(to: 0, duration: 0.05)
        
        self.hidingView?.enableLayout = false
        SPAnimation.animate(0.12, animations: {
            self.hidingView?.layoutIfNeeded()
            for view in (self.hidingView?.subviews[0].subviews)! {
                view.alpha = 0
            }
        })
        
        SPAnimation.animate(0.3, animations: {
            let lastFrameViewInList = self.listView.subviews.last?.frame ?? CGRect.zero
            self.hidingView?.frame = CGRect.init(x: self.listView.frame.origin.x, y: self.listView.frame.bottomYPosition - lastFrameViewInList.height, width: lastFrameViewInList.height, height: lastFrameViewInList.height)
        }, options: .curveEaseInOut, withComplection: {
            SPAnimation.animate(0.05, animations: {
                let itemView = self.listView.subviews.last as! SPItemListView
                itemView.iconView.alpha = 1
            })
            SPAnimation.animate(0.1, animations: {
                self.hidingView?.alpha = 0
            }, withComplection: {
                self.hidingView?.removeFromSuperview()
                self.hidingView = nil
            })
        })
        
        delay(0.18, closure: {
            let lastFrameViewInList = self.listView.subviews.last?.frame ?? CGRect.zero
            self.hidingView?.addCornerRadiusAnimation(to: lastFrameViewInList.height / 2, duration: 0.15)
        })
    }
    
    
    //MARK: - animator
    var animator = UIDynamicAnimator()
    var attachmentBehavior : UIAttachmentBehavior!
    var gravityBehaviour : UIGravityBehavior!
    var snapBehavior : UISnapBehavior!
    
    //MARK: - handle gesture
    @objc func handleGesture(sender: AnyObject) {
        let myView = self.alertView!
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
            snapBehavior = UISnapBehavior(item: myView, snapTo: self.alertCenteringPoint)
            animator.addBehavior(snapBehavior)
            let translation = sender.translation(in: view)
            if translation.y > 100 {
                animator.removeAllBehaviors()
                gravityBehaviour = UIGravityBehavior(items: [myView])
                gravityBehaviour.gravityDirection = CGVector.init(dx: 0, dy: 10)
                animator.addBehavior(gravityBehaviour)
                self.hide(withDialg: false)
            }
        }
    }
}

extension SPIndicationBannerController {
    
    class AlertView: UIView {
        
        var view: UIView
        var enableLayout: Bool = true
        
        init(view: UIView) {
            self.view = view
            super.init(frame: CGRect.zero)
            self.layer.masksToBounds = true
            self.backgroundColor = UIColor.white
            self.layer.cornerRadius = 4
            self.addSubview(self.view)
            
            view.layer.masksToBounds = true
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            if enableLayout {
                self.view.setEqualsBoundsFromSuperview()
            }
        }
    }
    
    class SPItemListView: UIView {
        
        var labelView: UILabel = UILabel()
        var iconView: CheckIconView = CheckIconView()
        
        init() {
            super.init(frame: CGRect.zero)
            commonInit()
        }
        
        required public init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        private func commonInit() {
            self.backgroundColor = UIColor.clear
            self.labelView.font = UIFont.fonts.AvenirNext(type: .DemiBold, size: 14)
            self.labelView.minimumScaleFactor = 0.5
            self.labelView.adjustsFontSizeToFitWidth = true
            self.labelView.text = "Complete stage"
            self.labelView.textColor = UIColor.white
            self.labelView.numberOfLines = 0
            self.addSubview(self.labelView)
            
            self.iconView.backgroundColor = UIColor.clear
            self.addSubview(self.iconView)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            self.iconView.frame = CGRect.init(x: 0, y: 0, width: self.frame.height, height: self.frame.height)
            self.iconView.layer.cornerRadius = self.iconView.frame.width / 2
            
            self.labelView.frame = CGRect.init(x: self.iconView.frame.width + 10, y: 0, width: self.frame.width - self.iconView.frame.width, height: self.frame.height)
        }
    }
    
    class CheckIconView: UIView {
        
        override func draw(_ rect: CGRect) {
            super.draw(rect)
            SPBezierPathFigureDraw.drawFillChecked(frame: rect, resizing: .aspectFit, fillColor: .white)
        }
    }
}

public protocol SPIndicationBannerControllerDataSource: class {
    
    func titleForListStagesAt(index: Int) -> String?
    
    func alertViewAt(index: Int) -> UIView
    
    func countStages() -> Int
}

public protocol SPIndicationBannerControllerDelegate: class {
    
    func didHide()
}
