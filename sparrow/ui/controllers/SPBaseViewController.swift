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

public class SPBaseViewController: SPStatusBarManagerViewController {
    
    var activityIndicatorLayoutWithSafeArea: Bool = true
    let activityIndicatorView = UIActivityIndicatorView()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicatorView.style = .white
        self.activityIndicatorView.stopAnimating()
        self.view.addSubview(self.activityIndicatorView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        self.updateLayout(with: self.view.frame.size)
    }
    
    override public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    
    @available(iOS 11.0, *)
    override public func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        self.updateLayout(with: self.view.frame.size)
    }
    
    func updateLayout(with size: CGSize) {
        
        var contentHeight = size.height - self.topSafeArea
        if self.isShowKeyboard {
            contentHeight = contentHeight - (self.keyboardSize?.height ?? 0)
        } else {
            contentHeight = contentHeight - self.bottomSafeArea
        }
        
        let centerYPosition = self.topSafeArea + (contentHeight / 2)
        
        if self.activityIndicatorLayoutWithSafeArea {
            self.activityIndicatorView.center = CGPoint.init(
                x: size.width / 2,
                y: centerYPosition
            )
        } else {
            self.activityIndicatorView.center = CGPoint.init(
                x: size.width / 2,
                y: (size.height - (self.keyboardSize?.height ?? 0)) / 2
            )
        }
        
        var emptyProposeViewWidth = size.width * self.emptyProposeViewWidthFactor
        if emptyProposeViewWidth < (375 * self.emptyProposeViewWidthFactor) {
            emptyProposeViewWidth = size.width * 0.9
        }
        
        self.emptyProposeView?.frame = CGRect.init(
            x: 0, y: 0,
            width: emptyProposeViewWidth,
            height: (size.height - self.topSafeArea - self.bottomSafeArea) * self.emptyProposeViewHeightFactor
        )
        self.emptyProposeView?.center = CGPoint.init(
            x: size.width / 2,
            y: centerYPosition * self.emptyProposeViewCenterYFactor
        )
        
        if self.isShowKeyboard {
            self.emptyProposeView?.center = CGPoint.init(
                x: size.width / 2,
                y: centerYPosition
            )
        }
    }
    
    //MARK: - keyboard
    var isShowKeyboard: Bool = false
    var keyboardSize: CGSize? = nil
    
    func keyboardWillShow(duration: TimeInterval) {
        SPAnimation.animate(duration, animations: {
            self.updateLayout(with: self.view.frame.size)
        })
    }
    
    func keyboardDidShow(duration: TimeInterval) {
        SPAnimation.animate(duration, animations: {
            self.updateLayout(with: self.view.frame.size)
        })
    }
    
    func keyboardWillHide(duration: TimeInterval) {
        SPAnimation.animate(duration, animations: {
            self.updateLayout(with: self.view.frame.size)
        })
    }
    
    func keyboardDidHide(duration: TimeInterval) {
        SPAnimation.animate(duration, animations: {
            self.updateLayout(with: self.view.frame.size)
        })
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        self.isShowKeyboard = true
        self.keyboardSize = self.keyboardSize(from: notification)
        let duration = self.keyboardAnimateDuration(from: notification) ?? 0.3
        self.keyboardWillShow(duration: duration)
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {
        self.isShowKeyboard = true
        self.keyboardSize = self.keyboardSize(from: notification)
        let duration = self.keyboardAnimateDuration(from: notification) ?? 0.3
        self.keyboardDidShow(duration: duration)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        self.isShowKeyboard = false
        self.keyboardSize = nil
        let duration = self.keyboardAnimateDuration(from: notification) ?? 0.3
        self.keyboardWillHide(duration: duration)
    }
    
    @objc func keyboardDidHide(notification: NSNotification) {
        self.isShowKeyboard = false
        self.keyboardSize = nil
        let duration = self.keyboardAnimateDuration(from: notification) ?? 0.3
        self.keyboardDidHide(duration: duration)
    }
    
    func keyboardSize(from notification: NSNotification) -> CGSize? {
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        return keyboardFrame?.cgRectValue.size
    }
    
    func keyboardAnimateDuration(from notification: NSNotification) -> TimeInterval? {
        return notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
    }
    
    //MARK: - Search
    @available(iOS 11.0, *)
    func addSearchController(placeholder: String, resultController: UIViewController?, searchResultsUpdater: UISearchResultsUpdating?, searchBarDelegate: UISearchBarDelegate?) -> UISearchController {
        
        let searchController = UISearchController(searchResultsController: resultController)
        searchController.searchBar.placeholder = placeholder
        searchController.searchResultsUpdater = searchResultsUpdater
        searchController.searchBar.delegate = searchBarDelegate
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        return searchController
    }
    
    //MARK: - Empty propose view
    var emptyProposeViewCenterYFactor: CGFloat = 0.94
    var emptyProposeViewWidthFactor: CGFloat = 0.7
    var emptyProposeViewHeightFactor: CGFloat = 1
    private var emptyProposeView: UIView? {
        didSet {
            if self.emptyProposeView != nil {
                self.view.addSubview(self.emptyProposeView!)
                self.updateLayout(with: self.view.frame.size)
            }
        }
    }
    
    func setEmptyProposeView(_ view: UIView) {
        self.emptyProposeView = view
    }
    
    func hideEmptyProposeView(animated: Bool) {
        let hideFunc = {
            self.emptyProposeView?.isHidden = true
            self.emptyProposeView?.alpha = 0
        }
        
        if animated {
            SPAnimation.animate(0.3, animations: {
                self.emptyProposeView?.alpha = 0
            }, withComplection: {
                hideFunc()
            })
        } else {
            hideFunc()
        }
    }
    
    func showEmptyProposeView(animated: Bool) {
        
        self.emptyProposeView?.isHidden = false
        
        if animated {
            SPAnimation.animate(0.3, animations: {
                self.emptyProposeView?.alpha = 1
            })
        } else {
            self.emptyProposeView?.alpha = 1
        }
    }
}
