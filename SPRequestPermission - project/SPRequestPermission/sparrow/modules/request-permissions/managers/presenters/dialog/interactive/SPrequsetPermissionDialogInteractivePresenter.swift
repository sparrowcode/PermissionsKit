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

class SPRequestPermissionDialogInteractivePresenter: SPRequestPermissionPresenterInterface, SPRequestPermissionDialogInteractivePresenterDelegate {
    
    weak var assistantDelegate: SPRequestPermissionAssistantDelegate?
    
    private let viewController: SPRequestPermissionDialogInteractiveViewControllerInterface
    private let dataSource: SPRequestPermissionDialogInteractiveDataSourceInterface
    
    private var controls = [SPRequestPermissionTwiceControlInterface]()
    
    func present(on viewController: UIViewController) {
        self.updatePermissionsStyle()
        self.viewController.present(on: viewController)
    }
    
    func set(permissions: [SPRequestPermissionType]) {
        for permission in permissions {
            let control = self.createControlForPermission(permission)
            controls.append(control)
            control.addAction(self, action: #selector(self.actionForControl(sender:)))
            self.viewController.addControl(control)
        }
    }
    
    init(viewController: SPRequestPermissionDialogInteractiveViewControllerInterface, dataSource: SPRequestPermissionDialogInteractiveDataSourceInterface) {
        self.dataSource = dataSource
        self.viewController = viewController
        self.viewController.presenterDelegate = self
        self.viewController.setHeaderBackgroundView(self.dataSource.headerBackgroundView())
        self.viewController.setHeaderTitle(self.dataSource.headerTitle())
        self.viewController.setHeaderSubtitle(self.dataSource.headerSubtitle())
        self.viewController.setTopTitle(self.dataSource.topAdviceTitle())
        self.viewController.setBottomTitle(self.dataSource.bottomAdviceTitle())
        self.viewController.setUnderDialogTitle(self.dataSource.underDialogAdviceTitle())
        self.viewController.setHeaderBackgroundView(self.dataSource.headerBackgroundView())
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
    
    @objc func actionForControl(sender: AnyObject) {
        let control = sender as! SPRequestPermissionTwiceControlInterface
        assistantDelegate?.requestPersmisson(control.permission, with: {
            if self.assistantDelegate?.isAllowPermission(control.permission) ?? false {
                control.setSelectedState(animated: true)
            } else {
                control.setNormalState(animated: true)
                self.showDialogForProtectPermissionOnViewController()
            }
            if self.assistantDelegate?.isAllowPermissions() ?? false {
                delay(0.21, closure: {
                    self.viewController.hide()
                })
            }
        })
    }
    
    private func showDialogForProtectPermissionOnViewController() {
        let alert = UIAlertController.init(
            title: SPRequestPermissionData.texts.titleDisablePermissionAlertText(),
            message: SPRequestPermissionData.texts.subtitleDisablePermissionAlertText(),
            preferredStyle: UIAlertControllerStyle.alert
        )
        
        alert.addAction(UIAlertAction.init(
            title: SPRequestPermissionData.texts.cancel(),
            style: UIAlertActionStyle.cancel,
            handler: nil)
        )
        
        alert.addAction(UIAlertAction.init(
            title: SPRequestPermissionData.texts.settings(),
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
            if assistantDelegate?.isAllowPermission(control.permission) ?? false {
                control.setSelectedState(animated: false)
            } else {
                control.setNormalState(animated: false)
            }
        }
    }
    
    func isEnableHide() -> Bool {
        return true
    }
    
    func didHide(){
        self.assistantDelegate?.didHide()
    }
}

