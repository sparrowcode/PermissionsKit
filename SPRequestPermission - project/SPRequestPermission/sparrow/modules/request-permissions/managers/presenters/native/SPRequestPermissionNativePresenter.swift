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

public class SPRequestPermissionNativePresenter: SPRequestPermissionPresenterInterface {
    
    weak public var assistantDelegate: SPRequestPermissionAssistantDelegate?
    
    private var permissions = [SPRequestPermissionType]()
    
    public func present(on viewController: UIViewController) {
        var subPermissions = [SPRequestPermissionType]()
        for permission in permissions {
            if !(assistantDelegate?.isAllowPermission(permission) ?? true) {
                assistantDelegate?.requestPersmisson(permission, with: {
                    subPermissions.append(permission)
                    if subPermissions.count == self.permissions.count {
                        if !(self.assistantDelegate?.isAllowPermissions() ?? true) {
                            self.showDialogForProtectPermissionOnViewController(on: viewController)
                        }
                    }
                })
            }
        }
    }
    
    public func set(permissions: [SPRequestPermissionType]) {
        for permission in permissions {
            self.permissions.append(permission)
        }
    }
    
    private func showDialogForProtectPermissionOnViewController(on viewController: UIViewController) {
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
        viewController.present(alert, animated: true, completion: nil)
    }
}
