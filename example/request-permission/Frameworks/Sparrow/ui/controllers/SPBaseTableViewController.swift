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

class SPBaseTableViewController: SPStatusBarManagerTableViewController {
    
    var activityIndicatorView = UIActivityIndicatorView.init()
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        self.activityIndicatorView.stopAnimating()
        self.activityIndicatorView.color = SPNativeStyleKit.Colors.gray
        self.view.addSubview(self.activityIndicatorView)
        
        self.updateLayout(with: self.view.frame.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    
    @available(iOS 11.0, *)
    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        self.updateLayout(with: self.view.frame.size)
    }
    
    func updateLayout(with size: CGSize) {
        let layoutIfShowKeyboard = {
            let height = size.height - (self.keyboardSize?.height ?? 0) - self.topSafeArea
            self.emptyProposeView?.frame = CGRect.init(
                x: 0, y: 0,
                width: size.width * self.emptyProposeViewWidthFactor,
                height: height
            )
            self.emptyProposeView?.center.x = size.width / 2
        }
        
        let layoutIfNotShowKeyboard = {
            let height = size.height - self.topSafeArea - self.bottomSafeArea
            self.emptyProposeView?.frame = CGRect.init(
                x: 0, y: 0,
                width: size.width * self.emptyProposeViewWidthFactor,
                height: height
            )
            self.emptyProposeView?.center.x = size.width  / 2
        }
        
        if self.isShowKeyboard {
            if self.isAllowLayoutWithKeyboardEvents {
                layoutIfShowKeyboard()
            } else {
                layoutIfNotShowKeyboard()
            }
        } else {
            layoutIfNotShowKeyboard()
        }
        
        if let center = self.emptyProposeView?.center {
            self.activityIndicatorView.center = center
        } else {
            self.activityIndicatorView.center = CGPoint.init(
                x: size.width / 2,
                y: (size.height - self.topSafeArea - self.bottomSafeArea) / 2
            )
        }
    }
    
    //MARK: - Keyboard
    var isShowKeyboard: Bool = false
    var isAllowLayoutWithKeyboardEvents: Bool = false
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
    
    //MARK: - Empty Propose View
    var emptyProposeViewYTranslateFactor: CGFloat = 0.98
    var emptyProposeViewWidthFactor: CGFloat = 0.7
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
        self.hideEmptyProposeView(animated: false)
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
    
    //MARK: - Cache
    private var cacheImages: [(link: String, image: UIImage)] = []
    
    func toCache(link: String, image: UIImage?) {
        if image == nil {
            return
        }
        if self.fromCahce(link: link) == nil {
            self.cacheImages.append((link: link, image: image!))
        }
    }
    
    func fromCahce(link: String) -> UIImage? {
        let cachedData = self.cacheImages.first(where: {
            $0.link == link
        })
        return cachedData?.image
    }
    
    //MARK: - Reload Table View
    func reloadTableView(animated: Bool, complection: @escaping ()->() = {}) {
        if animated {
            UIView.transition(
                with: self.tableView,
                duration: 0.3,
                options: [.transitionCrossDissolve, UIView.AnimationOptions.beginFromCurrentState],
                animations: {
                    self.tableView.reloadData()
            }, completion: {(state) in
                complection()
            })
        } else {
            self.tableView.reloadData()
            complection()
        }
    }
    
    func startLoading() {
        if self.tableView.isEmpty {
            self.activityIndicatorView.startAnimating()
            if self.refreshControl == nil {
                self.tableView.isScrollEnabled = false
            }
        }
        self.hideEmptyProposeView(animated: false)
    }
    
    func endLoading() {
        self.activityIndicatorView.stopAnimating()
        
        if self.tableView.isEmpty {
            self.reloadTableView(animated: true)
        } else {
            self.reloadTableView(animated: false)
        }
        
        if self.tableView.isEmpty {
            if self.refreshControl == nil {
                self.tableView.isScrollEnabled = false
            }
            self.showEmptyProposeView(animated: true)
        } else {
            self.tableView.isScrollEnabled = true
            self.hideEmptyProposeView(animated: true)
        }
        if self.refreshControl?.isRefreshing ?? false {
            delay(0.12, closure: {
                self.refreshControl?.endRefreshing()
            })
        }
    }
    
    //MARK: - Search
    @available(iOS 11.0, *)
    func addSearchController(placeholder: String, resultController: UIViewController?, searchResultsUpdater: UISearchResultsUpdating?, searchBarDelegate: UISearchBarDelegate?) {
        
        self.searchController = UISearchController(searchResultsController: resultController)
        self.searchController?.searchBar.placeholder = placeholder
        self.searchController?.searchResultsUpdater = searchResultsUpdater
        self.searchController?.searchBar.delegate = searchBarDelegate
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        self.searchController?.searchBar.tintColor = UINavigationController.elementsColor
    }
    
    //MARK: - Other
    @objc func dismiss(sender: Any) {
        self.dismiss()
    }
}
