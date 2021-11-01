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

import UIKit

#if os(iOS)
@available(iOSApplicationExtension, unavailable)
public class SPPermissionsDialogController: UIViewController, SPPermissionsControllerInterface {
    
    /**
     SPPermissions: Show or hide close button. By default `false`.
     
     New guidelines not allow has it, so for clean review you shoud left it `false`.
     */
    public var showCloseButton: Bool = false
    
    /**
     SPPermissions: Disable or allow dismiss dialog with gester.
     Default value is `true`.
     */
    public var allowSwipeDismiss: Bool = true
    
    /**
     SPPermissions: Manage dismising condition.
     
     By default dismiss controller hapen when all permission allowed.
     If you need dismiss controller when all permissions has state determinated, change it to `allPermissionsDeterminated`.
     */
    public var dismissCondition: SPPermissionsDismissCondition = .default
    
    /**
     SPPermissions: Manage bounce animation. If `false`,
     dialog can't be tracked. Default value is `true`.
     */
    public var bounceAnimationEnabled = true
    
    public weak var dataSource: SPPermissionsDataSource?
    public weak var delegate: SPPermissionsDelegate?
    
    public var titleText = Texts.header
    public var headerText = Texts.sub_header
    public var footerText = Texts.comment
    
    private let dialogView = SPPermissionsDialogView()
    private let backgroundView = SPPermissionsDialogGradeBlurView()
    
    private var permissions: [SPPermissions.Permission]
    
    // MARK: - Init
    
    init(_ permissions: [SPPermissions.Permission]) {
        self.permissions = permissions
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    // MARK: - Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backgroundView)
        
        // Dialog View
        
        dialogView.titleLabel.text = titleText
        dialogView.subtitleLabel.text = headerText.uppercased()
        dialogView.alpha = 0
        dialogView.tableView.dataSource = self
        dialogView.tableView.delegate = self
        dialogView.tableView.register(SPPermissionsDialogTableFooterView.self, forHeaderFooterViewReuseIdentifier: SPPermissionsDialogTableFooterView.id)
        dialogView.tableView.register(SPPermissionsTableViewCell.self, forCellReuseIdentifier: SPPermissionsTableViewCell.id)
        dialogView.closeButton.addTarget(self, action: #selector(self.dimissWithDialog), for: .touchUpInside)
        view.addSubview(dialogView)
        
        dialogView.closeButton.isHidden = !showCloseButton
        
        // Animator
        
        animator = UIDynamicAnimator(referenceView: view)
        snapBehavior = UISnapBehavior(item: dialogView, snapTo: dialogCenter)
        let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(self.handleGesture(sender:)))
        panGesture.maximumNumberOfTouches = 1
        dialogView.addGestureRecognizer(panGesture)
        
        // Observer
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /**
         Special layout call becouse table hasn't valid content size before appear for early ios 12 and lower.
         Happen only if `bounceAnimationEnabled` set to false.
         Related issue on github: https://github.com/ivanvorobei/SPPermissions/issues/262
         */
        if !bounceAnimationEnabled {
            if #available(iOS 13, *) {
                // All good for iOS 13+
            } else {
                DelayService.wait(0.2, closure: {
                    self.dialogView.layout(in: self.view)
                })
            }
        }
    }
    
    @objc func applicationDidBecomeActive() {
        dialogView.tableView.reloadData()
    }
    
    // MARK: - Layout
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundView.frame = view.bounds
        dialogView.layout(in: view)
        
        if bounceAnimationEnabled {
            snapBehavior.snapPoint = dialogCenter
        } else {
            dialogView.center = dialogCenter
        }
    }
    
    private var dialogCenter: CGPoint {
        let width = view.frame.width - view.layoutMargins.left - view.layoutMargins.right
        let height = view.frame.height - view.layoutMargins.top - view.layoutMargins.bottom
        return CGPoint(x: view.layoutMargins.left + width / 2, y: view.layoutMargins.top + height / 2)
    }
    
    // MARK: - Helpers
    
    public func present(on controller: UIViewController) {
        animator.removeAllBehaviors()
        dialogView.transform = .identity
        dialogView.center = CGPoint.init(x: dialogCenter.x, y: dialogCenter.y * 1.2)
        modalPresentationStyle = .overCurrentContext
        controller.present(self, animated: false, completion: {
            UIView.animate(withDuration: 0.3, animations: {
                self.backgroundView.setGradeAlpha(0.07)
                self.backgroundView.setBlurRadius(4)
            }, completion: nil)
            UIView.animate(withDuration: 0.3, delay: 0.21, animations: {
                self.dialogView.alpha = 1
            }, completion: nil)
            DelayService.wait(0.21, closure: { [weak self] in
                guard let self = self else { return }
                if self.bounceAnimationEnabled {
                    self.animator.addBehavior(self.snapBehavior)
                }
            })
        })
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
                        if let cell = self.dialogView.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? SPPermissionsTableViewCell {
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
                            self.dismiss(withDialog: true)
                        })
                        return true
                    }
                case .allPermissionsDeterminated:
                    let determiatedPermissions = self.permissions.filter { !$0.notDetermined }
                    if determiatedPermissions.count == self.permissions.count {
                        DelayService.wait(0.2, closure: {
                            self.dismiss(withDialog: true)
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
    
    @objc func dimissWithDialog() {
        dismiss(withDialog: true)
    }
    
    public func dismiss(withDialog: Bool) {
        if withDialog {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .beginFromCurrentState, animations: {
                self.animator.removeAllBehaviors()
                self.dialogView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
                self.dialogView.alpha = 0
            }, completion: nil)
        }
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.setGradeAlpha(0)
            self.backgroundView.setBlurRadius(0)
        }, completion: { finished in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        let shoudCallDelegate: Bool = {
            if presentedViewController == nil { return true }
            if presentedViewController is UIAlertController { return false }
            return true
        }()
        super.dismiss(animated: flag, completion: {
            completion?()
            if shoudCallDelegate {
                self.delegate?.didHidePermissions(self.permissions)
            }
        })
    }
    
    // MARK: - Animator
    
    private var animator = UIDynamicAnimator()
    private var attachmentBehavior : UIAttachmentBehavior!
    private var gravityBehaviour : UIGravityBehavior!
    private var snapBehavior : UISnapBehavior!
    
    @objc func handleGesture(sender: UIPanGestureRecognizer) {
        
        guard bounceAnimationEnabled, allowSwipeDismiss else {
            return
        }
        
        let location = sender.location(in: view)
        let boxLocation = sender.location(in: dialogView)
        
        switch sender.state {
        case .began:
            animator.removeAllBehaviors()
            let centerOffset = UIOffset(horizontal: boxLocation.x - dialogView.bounds.midX, vertical: boxLocation.y - dialogView.bounds.midY);
            attachmentBehavior = UIAttachmentBehavior(item: dialogView, offsetFromCenter: centerOffset, attachedToAnchor: location)
            attachmentBehavior.frequency = 0
            animator.addBehavior(attachmentBehavior)
        case .changed:
            attachmentBehavior.anchorPoint = location
        case .ended:
            animator.removeBehavior(attachmentBehavior)
            animator.addBehavior(snapBehavior)
            let translation = sender.translation(in: view)
            if translation.y > 100 {
                animator.removeAllBehaviors()
                gravityBehaviour = UIGravityBehavior(items: [dialogView])
                gravityBehaviour.gravityDirection = CGVector.init(dx: 0, dy: 10)
                animator.addBehavior(gravityBehaviour)
                dismiss(withDialog: false)
            }
        default:
            break
        }
    }
}

// MARK: - Table Data Source & Delegate

@available(iOSApplicationExtension, unavailable)
extension SPPermissionsDialogController: UITableViewDataSource, UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permissions.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SPPermissionsTableViewCell.id, for: indexPath) as! SPPermissionsTableViewCell
        let permission = permissions[indexPath.row]
        cell.defaultConfigure(for: permission)
        cell.permissionDescriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        dataSource?.configure(cell, for: permission)
        cell.permissionButton.addTarget(self, action: #selector(self.process(button:)), for: .touchUpInside)
        cell.updateInterface(animated: false)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SPPermissionsDialogTableFooterView.id) as! SPPermissionsDialogTableFooterView
        view.titleLabel.text = footerText
        view.contentView.backgroundColor = tableView.backgroundColor
        return view
    }
}

#endif
