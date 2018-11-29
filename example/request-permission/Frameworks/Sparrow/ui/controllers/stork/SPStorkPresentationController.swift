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

final class SPStorkPresentationController: UIPresentationController, UIGestureRecognizerDelegate {
    
    var indicatorView = SPStorkIndicatorView()
    var isSwipeToDismissEnabled: Bool = true
    var transitioningDelegate: SPStorkTransitioningDelegate?
    private var pan: UIPanGestureRecognizer?
    
    private var scaleFactor: CGFloat {
        return 349 / 375
    }
    
    private var topSpace: CGFloat {
        if presentingViewController.statusBarHeight < 25 {
            return 30
        } else {
            return presentingViewController.statusBarHeight
        }
    }
    
    private var transform: CGAffineTransform {
        let translate: CGFloat = ((self.containerView?.frame.height ?? 0) * (1 - self.scaleFactor)) / 2
        return CGAffineTransform.identity.scaledBy(x: scaleFactor, y: scaleFactor).translatedBy(x: 0, y: -translate + topSpace)
    }
    
    private var alpha: CGFloat {
        return 0.51
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout()
        }, completion: nil)
    }
    
    private func updateLayout() {
        guard let presentedView = self.presentedView else { return }
        self.indicatorView.style = .line
        self.indicatorView.sizeToFit()
        self.indicatorView.frame.origin.y = 12
        self.indicatorView.center.x = presentedView.frame.width / 2
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        if let containerView = self.containerView {
            let yOffset: CGFloat = topSpace + 13
            return CGRect(x: 0, y: yOffset, width: containerView.bounds.width, height: containerView.bounds.height - yOffset)
        } else {
            return .zero
        }
    }
    
    override func presentationTransitionWillBegin() {
        self.updateLayout()
        self.indicatorView.style = .arrow
        
        guard let containerView = self.containerView, let presentedView = self.presentedView, let presentingView = self.presentingViewController.view else { return }

        presentedView.addSubview(self.indicatorView)
        
        presentedView.addCornerRadiusAnimation(to: 10, duration: 0.6)
        presentedView.layer.masksToBounds = true
        presentingView.layer.cornerRadius = 10
        presentingView.layer.masksToBounds = true
        containerView.addSubview(presentedView)
        
        guard let transitionCoordinator = self.presentingViewController.transitionCoordinator else { return }
        transitionCoordinator.animateAlongsideTransition(in: self.presentingViewController.view, animation: { _ in
            if !self.isPresentingControllerUseStork {
                self.presentingViewController.view.transform = self.transform
                self.presentingViewController.view.alpha = self.alpha
            }
        })
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if self.isSwipeToDismissEnabled {
            self.pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
            self.pan!.delegate = self
            self.pan!.maximumNumberOfTouches = 1
            self.pan!.cancelsTouchesInView = false
            self.presentedViewController.view.addGestureRecognizer(pan!)
        }
    }
    
    override func dismissalTransitionWillBegin() {
        guard let transitionCoordinator = presentingViewController.transitionCoordinator else { return }
        
        transitionCoordinator.animate(alongsideTransition: { _ in
            self.presentingViewController.view.alpha = 1
        })
        
        transitionCoordinator.animateAlongsideTransition(in: presentingViewController.view, animation: { _ in
            self.presentingViewController.view.transform = CGAffineTransform.identity
            if self.presentingViewController.view.frame.origin != CGPoint.zero {
                self.presentingViewController.view.frame = CGRect.displayFrame
            }
        })
        
        if !self.isPresentingControllerUseStork {
            self.presentingViewController.view.addCornerRadiusAnimation(to: 0, duration: 0.6)
        }
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if !self.isPresentingControllerUseStork {
            if let presentingView = self.presentingViewController.view {
                presentingView.layer.cornerRadius = 0
                presentingView.layer.masksToBounds = false
            }
        }
    }
}

extension SPStorkPresentationController {
    
    @objc fileprivate func handlePan(gestureRecognizer: UIPanGestureRecognizer) {
        guard gestureRecognizer.isEqual(pan), self.isSwipeToDismissEnabled else {
            return
        }
        
        switch gestureRecognizer.state {
        case .began:
            self.indicatorView.style = .line
            self.presentingViewController.view.removeAllAnimations()
            gestureRecognizer.setTranslation(CGPoint(x: 0, y: 0), in: containerView)
        case .changed:
            if self.isSwipeToDismissEnabled {
                let translation = gestureRecognizer.translation(in: presentedView)
                updatePresentedViewForTranslation(inVerticalDirection: translation.y)
            } else {
                gestureRecognizer.setTranslation(.zero, in: presentedView)
            }
        case .ended:
            let translation = gestureRecognizer.translation(in: presentedView).y
            if translation >= 240 {
                presentedViewController.dismiss(animated: true, completion: nil)
            } else {
                self.indicatorView.style = .arrow
                UIView.animate(
                    withDuration: 0.6,
                    delay: 0,
                    usingSpringWithDamping: 1,
                    initialSpringVelocity: 1,
                    options: [.curveEaseOut, .allowUserInteraction],
                    animations: {
                        self.presentedView?.transform = .identity
                        if !self.isPresentingControllerUseStork {
                            self.presentingViewController.view.transform = self.transform
                            self.presentingViewController.view.alpha = self.alpha
                        }
                })
            }
        default:
            break
        }
    }
    
    private func updatePresentedViewForTranslation(inVerticalDirection translation: CGFloat) {
        
        let elasticThreshold: CGFloat = 120
        let translationFactor: CGFloat = 1 / 2

        if translation >= 0 {
            let translationForModal: CGFloat = {
                if translation >= elasticThreshold {
                    let frictionLength = translation - elasticThreshold
                    let frictionTranslation = 30 * atan(frictionLength / 120) + frictionLength / 10
                    return frictionTranslation + (elasticThreshold * translationFactor)
                } else {
                    return translation * translationFactor
                }
            }()

            self.presentedView?.transform = CGAffineTransform(translationX: 0, y: translationForModal)
            
            if !self.isPresentingControllerUseStork {
                let factor = 1 + (translationForModal / 6000)
                self.presentingViewController.view.transform = self.transform.scaledBy(x: factor, y: factor)
                self.presentingViewController.view.alpha = self.alpha + ((factor - 1) * 15)
            }
        }
    }
    

    private var isPresentingControllerUseStork: Bool {
        let controller = self.presentingViewController
        return controller.transitioningDelegate is SPStorkTransitioningDelegate
            && controller.modalPresentationStyle == .custom
            && controller.presentingViewController != nil
    }
}
