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

class SPRequestPermissionDialogInteractivePresenter {
    
    var eventsDelegate: SPRequestPermissionEventsDelegate?
    
    private var permissions: [SPRequestPermissionType] = []
    private var controls = [SPRequestPermissionTwiceControlInterface]()

    private var dataSource: SPRequestPermissionDialogInteractiveDataSourceInterface
    private var permissionManager: SPPermissionsManagerInterface = SPPermissionsManager()
    weak var viewController: SPRequestPermissionDialogInteractiveViewControllerInterface! {
        didSet {
            self.configureController()
        }
    }
    
    //MARK: - init
    init(with permissions: [SPRequestPermissionType], dataSource: SPRequestPermissionDialogInteractiveDataSourceInterface) {
        self.dataSource = dataSource
        self.permissions = permissions
        self.permissions.removeDuplicates()
    }
    
    private func configureController() {
        self.viewController.setHeaderBackgroundView(self.dataSource.headerBackgroundView())
        self.viewController.setHeaderTitle(self.dataSource.headerTitle())
        self.viewController.setHeaderSubtitle(self.dataSource.headerSubtitle())
        self.viewController.setTopTitle(self.dataSource.topAdviceTitle())
        self.viewController.setBottomTitle(self.dataSource.bottomAdviceTitle())
        self.viewController.setUnderDialogTitle(self.dataSource.underDialogAdviceTitle())
        
        for permission in permissions {
            let control = self.createControlForPermission(permission)
            controls.append(control)
            control.addAction(self, action: #selector(self.actionForControl(sender:)))
            self.viewController.addControl(control)
        }
        
        self.updatePermissionsStyle()
    }
    
    private func createControlForPermission(_ permission: SPRequestPermissionType) -> SPRequestPermissionTwiceControlInterface {
        return SPRequestPermissionTwiceControl(
            permissionType: permission,
            title: self.dataSource.titleForPermissionControl(permission),
            normalIconImage: self.dataSource.iconForNormalPermissionControl(permission) ,
            selectedIconImage: self.dataSource.iconForAllowedPermissionControl(permission),
            normalColor: self.dataSource.secondColor(),
            selectedColor: self.dataSource.mainColor()
        )
    }
    
    var isPresentedNotificationRequest: Bool = false
    
    @objc func actionForControl(sender: AnyObject) {
        let control = sender as! SPRequestPermissionTwiceControlInterface
        self.eventsDelegate?.didSelectedPermission(permission: control.permission)
        permissionManager.requestPermission(control.permission, with: {
            if self.permissionManager.isAuthorizedPermission(control.permission) {
                self.eventsDelegate?.didAllowPermission(permission: control.permission)
                control.setSelectedState(animated: true)
            } else {
                self.eventsDelegate?.didDeniedPermission(permission: control.permission)
                control.setNormalState(animated: true)
                
                if !(control.permission == .notification) {
                    self.showDialogForProtectPermissionOnViewController()
                } else {
                    self.isPresentedNotificationRequest = true
                    
                    if #available(iOS 10.0, *){
                        self.showDialogForProtectPermissionOnViewController(cancelHandler: {
                            var denidedPermission: [SPRequestPermissionType] = []
                            for permission in self.permissions {
                                if !self.permissionManager.isAuthorizedPermission(permission) {
                                    denidedPermission.append(permission)
                                }
                            }
                            if denidedPermission.count == 1 {
                                if denidedPermission[0] == SPRequestPermissionType.notification {
                                    self.viewController.hide()
                                }
                            }
                        })
                    } else {
                        control.setSelectedState(animated: true)
                        var denidedPermission: [SPRequestPermissionType] = []
                        for permission in self.permissions {
                            if !self.permissionManager.isAuthorizedPermission(permission) {
                                denidedPermission.append(permission)
                            }
                        }
                        if denidedPermission.count == 1 {
                            if denidedPermission[0] == SPRequestPermissionType.notification {
                                self.viewController.hide()
                            }
                        }
                    }
                    
                    return
                }
                
            }
            var allPermissionAllowed: Bool = true
            for permission in self.permissions {
                if !self.permissionManager.isAuthorizedPermission(permission) {
                    allPermissionAllowed = false
                    break
                }
            }
            if allPermissionAllowed {
                delay(0.21, closure: {
                    self.viewController.hide()
                })
            } else {
                var denidedPermission: [SPRequestPermissionType] = []
                for permission in self.permissions {
                    if !self.permissionManager.isAuthorizedPermission(permission) {
                        denidedPermission.append(permission)
                    }
                }
                if denidedPermission.count == 1 {
                    if denidedPermission[0] == SPRequestPermissionType.notification {
                        if self.isPresentedNotificationRequest {
                            delay(0.21, closure: {
                                self.viewController.hide()
                            })
                        }
                    }
                }
            }
            
        })
    }
    
    private func showDialogForProtectPermissionOnViewController(cancelHandler: @escaping ()->() = {}) {
        let alert = UIAlertController.init(
            title: dataSource.titleForAlertDenidPermission(),
            message: dataSource.subtitleForAlertDenidPermission(),
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        alert.addAction(UIAlertAction.init(
            title: dataSource.cancelForAlertDenidPermission(),
            style: UIAlertActionStyle.cancel,
            handler: {
                finished in
                cancelHandler()
        })
        )
        
        alert.addAction(UIAlertAction.init(
            title: dataSource.settingForAlertDenidPermission(),
            style: UIAlertActionStyle.default,
            handler: {
                finished in
                
                NotificationCenter.default.addObserver(self, selector: #selector(self.updatePermissionsStyle), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
                
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(
                        URL.init(string: UIApplicationOpenSettingsURLString)!,
                        options: [:],
                        completionHandler: nil
                    )
                } else {
                    UIApplication.shared.openURL(URL.init(string: UIApplicationOpenSettingsURLString)!)
                }
        }))
        if let controller = self.viewController as? UIViewController {
            controller.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc private func updatePermissionsStyle() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        for control in controls {
            if permissionManager.isAuthorizedPermission(control.permission) {
                control.setSelectedState(animated: false)
            } else {
                control.setNormalState(animated: false)
            }
        }
    }
}

extension SPRequestPermissionDialogInteractivePresenter: SPRequestPermissionDialogInteractivePresenterDelegate {
    
    func didHide() {
        self.eventsDelegate?.didHide()
    }
}
