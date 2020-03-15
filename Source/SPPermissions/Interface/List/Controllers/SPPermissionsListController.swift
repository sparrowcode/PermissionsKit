// The MIT License (MIT)
// Copyright © 2019 Ivan Varabei (varabeis@icloud.com)
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

#if os(iOS)
/**
 Controller for List interface.
 */
public class SPPermissionsListController: UITableViewController, SPPermissionsControllerProtocol {
    
    /**
     Set for change data in cell. Allow customize text, fonts, colors and other.
     */
    public weak var dataSource: SPPermissionsDataSource?
    
    /**
     Check some events and denied alert.
     */
    public weak var delegate: SPPermissionsDelegate?
    
    /**
     Large title.
     */
    public var titleText: String = SPPermissionsText.titleText
    
    /**
     Header text before large title.
     */
    public var headerText: String = SPPermissionsText.subtitleText
    
    /**
     Small description in bottom.
     */
    public var footerText: String = SPPermissionsText.commentText
    
    /**
     Allow set small navigation bar. You shoud customize it here,
     becouse controller add to navigation only before call `present()` func.
     */
    public var prefersLargeTitles: Bool = true
    
    private var permissions: [SPPermission]
    
    init(_ permissions: [SPPermission]) {
        self.permissions = permissions
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .grouped)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissAnimated))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissAnimated))
        }

        navigationItem.title = titleText
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationController?.presentationController?.delegate = self
        
        tableView.delaysContentTouches = false
        tableView.allowsSelection = false
        tableView.register(SPPermissionTableViewCell.self, forCellReuseIdentifier: SPPermissionTableViewCell.id)
        tableView.register(SPPermissionsListHeaderView.self, forHeaderFooterViewReuseIdentifier: SPPermissionsListHeaderView.id)
        tableView.register(SPPermissionsListFooterCommentView.self, forHeaderFooterViewReuseIdentifier: SPPermissionsListFooterCommentView.id)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    /**
     Process tap permission button.
     */
    @objc func process(button: SPPermissionActionButton) {
        let permission = button.permission
        permission.request {
            
            button.update()
            let isAuthorized = permission.isAuthorized
            if isAuthorized { SPPermissionsHaptic.impact(.light) }
            isAuthorized ? self.delegate?.didAllow?(permission: permission) : self.delegate?.didDenied?(permission: permission)
            
            /**
             Update `.locationWhenInUse` if allowed `.locationAlwaysAndWhenInUse`
             */
            if permission == .locationAlwaysAndWhenInUse {
                if self.permissions.contains(.locationWhenInUse) {
                    if let index = self.permissions.firstIndex(of: .locationWhenInUse) {
                        if let cell = self.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? SPPermissionTableViewCell {
                            cell.button.update()
                        }
                    }
                }
            }
            
            /**
             Check if all permissions allowed
             */
            let allowedPermissions = self.permissions.filter { $0.isAuthorized }
            if allowedPermissions.count == self.permissions.count {
                SPPermissionsDelay.wait(0.2, closure: {
                    self.dismiss()
                })
            }
            
            /**
             Show alert with propose go to settings and allow permission.
             For disable it implement protocol `SPPermissionsDelegate`.
             */
            if permission.isDenied {
                var data = SPPermissionDeniedAlertData()
                if self.delegate != nil {
                    guard let userData = self.delegate?.deniedData?(for: permission) else { return }
                    data = userData
                }
                let alertController = UIAlertController.init(
                    title: data.alertOpenSettingsDeniedPermissionTitle,
                    message: data.alertOpenSettingsDeniedPermissionDescription,
                    preferredStyle: .alert
                )
                alertController.addAction(UIAlertAction.init(
                    title: data.alertOpenSettingsDeniedPermissionCancelTitle,
                    style: UIAlertAction.Style.cancel,
                    handler: nil)
                )
                alertController.addAction(UIAlertAction.init(
                    title: data.alertOpenSettingsDeniedPermissionButtonTitle,
                    style: UIAlertAction.Style.default,
                    handler: { (action) in
                        SPPermissionsOpener.openSettings()
                }))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    /**
     Call this method for present controller on other controller.
     In this method controller wrap to navigation and add other configure.
     
     - parameter controller: Controller, on which need present `SPPermissions` controller.
     */
    public func present(on controller: UIViewController) {
        let navController = UINavigationController(rootViewController: self)
        navController.modalPresentationStyle = .formSheet
        navController.preferredContentSize = CGSize.init(width: 480, height: 560)
        controller.present(navController, animated: true, completion: nil)
    }
    
    public func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissAnimated() {
        self.dismiss(animated: true, completion: nil)
    }
    
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: {
            completion?()
            let ids: [Int] = self.permissions.map { $0.rawValue }
            self.delegate?.didHide?(permissions: ids)
        })
    }
    
    /**
     Update buttons when app launch again. No need call manually.
     */
    @objc func applicationDidBecomeActive() {
        for cell in tableView.visibleCells {
            if let permissionCell = cell as? SPPermissionTableViewCell {
                permissionCell.button.update()
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }
}

// MARK: Table Data Source & Delegate

extension SPPermissionsListController {
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permissions.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: SPPermissionTableViewCell.id, for: indexPath) as! SPPermissionTableViewCell
        let permission = permissions[indexPath.row]
        cell.defaultConfigure(for: permission)
        cell = dataSource?.configure(cell, for: permission) ?? cell
        cell.button.addTarget(self, action: #selector(self.process(button:)), for: .touchUpInside)
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SPPermissionsListHeaderView.id) as! SPPermissionsListHeaderView
        view.titleLabel.text = headerText
        return view
    }
    
    public override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SPPermissionsListFooterCommentView.id) as! SPPermissionsListFooterCommentView
        view.titleLabel.text = footerText
        return view
    }
}

extension SPPermissionsListController: UIAdaptivePresentationControllerDelegate {
    
    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        let ids: [Int] = self.permissions.map { $0.rawValue }
        self.delegate?.didHide?(permissions: ids)
    }
}
#endif
