// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
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

#if os(iOS)

import UIKit
@available(iOSApplicationExtension, unavailable)
public class SPPermissionsListController: UITableViewController, SPPermissionsControllerInterface {
    
    /**
     SPPermissions: Show or hide close button. By default `false`.
     
     New guidelines not allow has it, so for clean review you shoud left it `false`.
     */
    public var showCloseButton: Bool = false
    
    /**
     SPPermissions: Disable or allow dismiss controller with swipe.
     Default value is `true`.
     */
    public var allowSwipeDismiss: Bool = true
    
    /**
     SPPermissions: Manage dismising condition.
     
     By default dismiss controller hapen when all permission allowed.
     If you need dismiss controller when all permissions has state determinated, change it to `allPermissionsDeterminated`.
     */
    public var dismissCondition: SPPermissionsDismissCondition = .default
    
    public weak var dataSource: SPPermissionsDataSource?
    public weak var delegate: SPPermissionsDelegate?
    
    public var titleText = Texts.header
    public var headerText = Texts.description
    public var footerText = Texts.comment
    public var prefersLargeTitles = true
    
    private var permissions: [SPPermissions.Permission]
    
    // MARK: - Init
    
    init(_ permissions: [SPPermissions.Permission]) {
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
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    // MARK: - Lifecycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        if showCloseButton {
            let closeBarButtonItem: UIBarButtonItem = {
                if #available(iOS 13.0, *) {
                    return UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissAnimated))
                } else {
                    return UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissAnimated))
                }
            }()
            if view.effectiveUserInterfaceLayoutDirection == .leftToRight {
                navigationItem.rightBarButtonItem = closeBarButtonItem
            } else {
                navigationItem.leftBarButtonItem = closeBarButtonItem
            }
        }
        
        navigationItem.title = titleText
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationController?.presentationController?.delegate = self
        
        tableView.delaysContentTouches = false
        tableView.allowsSelection = false
        tableView.register(SPPermissionsTableViewCell.self, forCellReuseIdentifier: SPPermissionsTableViewCell.id)
        tableView.register(SPPermissionsListHeaderView.self, forHeaderFooterViewReuseIdentifier: SPPermissionsListHeaderView.id)
        tableView.register(SPPermissionsListFooterCommentView.self, forHeaderFooterViewReuseIdentifier: SPPermissionsListFooterCommentView.id)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @objc func applicationDidBecomeActive() {
        tableView.reloadData()
    }
    
    // MARK: - Helpers
    
    public func present(on controller: UIViewController) {
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.modalPresentationStyle = .formSheet
        navigationController.preferredContentSize = CGSize.init(width: 480, height: 560)
        controller.present(navigationController, animated: true, completion: nil)
    }
    
    @objc func process(button: SPPermissionsActionButton) {
        guard let permission = button.permission else { return }
        let firstRequest = permission.status == .notDetermined
        permission.request { [weak self] in
            
            guard let self = self else { return }
            if let cell = button.superview as? SPPermissionsTableViewCell {
                cell.updateInterface(animated: true)
            }
            
            let authorized = permission.authorized
            if authorized { HapticService.impact(.light) }
            
            // Update `.locationWhenInUse` if allowed `.locationAlwaysAndWhenInUse`
            
            if permission.type == .locationAlways {
                if self.permissions.contains(where: { $0.type == .locationWhenInUse }) {
                    if let index = self.permissions.firstIndex(where: { $0.type == .locationWhenInUse }) {
                        if let cell = self.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? SPPermissionsTableViewCell {
                            cell.updateInterface(animated: true)
                        }
                    }
                }
            }
            
            let dismissByCondition: () -> Bool = {
                switch self.dismissCondition {
                case .allPermissionsAuthorized:
                    let allowedPermissions = self.permissions.filter { $0.authorized }
                    if allowedPermissions.count == self.permissions.count {
                        DelayService.wait(0.2, closure: {
                            self.dismiss(animated: true)
                        })
                        return true
                    }
                    
                case .allPermissionsDeterminated:
                    let determiatedPermissions = self.permissions.filter { !$0.notDetermined }
                    if determiatedPermissions.count == self.permissions.count {
                        DelayService.wait(0.2, closure: {
                            self.dismiss(animated: true)
                        })
                        return true
                    }
                }
                
                return false
            }

            if permission.authorized {
                self.delegate?.didAllowPermission(permission)
                let _ = dismissByCondition()
            } else {
                self.delegate?.didDeniedPermission(permission)
                if firstRequest {
                    let _ = dismissByCondition()
                } else {
                    // Delay using for fix animation freeze.
                    DelayService.wait(0.3, closure: { [weak self] in
                        guard let self = self else { return }
                        PresenterService.presentAlertAboutDeniedPermission(permission, dataSource: self.dataSource, on: self)
                    })
                }
            }
        }
    }
    
    @objc func dismissAnimated() {
        self.dismiss(animated: true, completion: nil)
    }
    
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: { [weak self] in
            completion?()
            self?.processDissmissedEvent()
        })
    }
    
    private func processDissmissedEvent() {
        delegate?.didHidePermissions(permissions)
    }
}

// MARK: - Table Data Source & Delegate
@available(iOSApplicationExtension, unavailable)
extension SPPermissionsListController {
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permissions.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let permission = permissions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: SPPermissionsTableViewCell.id, for: indexPath) as! SPPermissionsTableViewCell
        cell.defaultConfigure(for: permission)
        dataSource?.configure(cell, for: permission)
        cell.permissionButton.addTarget(self, action: #selector(self.process(button:)), for: .touchUpInside)
        cell.updateInterface(animated: false)
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

// MARK: - UIAdaptivePresentationControllerDelegate
@available(iOSApplicationExtension, unavailable)
extension SPPermissionsListController: UIAdaptivePresentationControllerDelegate {
    
    public func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        return allowSwipeDismiss
    }
    
    public func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        self.processDissmissedEvent()
    }
}

#endif
