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

public class SPRequestPermissionAssistant: SPRequestPermissionAssistantInterface, SPRequestPermissionAssistantDelegate {
    
    private var permissions: [SPRequestPermissionType]
    
    private let permissionManager: SPPermissionManagerInterface
    private let presenterManager: SPRequestPermissionPresenterInterface
    
    weak public var eventsDelegate: SPRequestPermissionEventsDelegate?
    
    init(with permissions: [SPRequestPermissionType], permissionManager: SPPermissionManagerInterface, presenterManager: SPRequestPermissionPresenterInterface) {
        self.permissions = permissions
        self.permissions.removeDuplicates()
        self.permissionManager = permissionManager
        self.presenterManager = presenterManager
        self.presenterManager.assistantDelegate = self
        self.presenterManager.set(permissions: permissions)
    }
    
    public func present(on viewController: UIViewController) {
        self.presenterManager.present(on: viewController)
    }
    
    public func requestPersmisson(_ permission: SPRequestPermissionType, with complectionHandler: @escaping ()->()) {
        self.permissionManager.requestPermission(permission, withComlectionHandler: {
            [unowned self] in
            self.eventsDelegate?.didSelectedPermission(permission: permission)
            if self.permissionManager.isAuthorizedPermission(permission) {
                self.eventsDelegate?.didAllowPermission(permission: permission)
            } else {
                self.eventsDelegate?.didDeniedPermission(permission: permission)
            }
            complectionHandler()
        })
    }
    
    public func isAllowPermission(_ permission: SPRequestPermissionType) -> Bool {
        return self.permissionManager.isAuthorizedPermission(permission)
    }
    
    public func isAllowPermissions() -> Bool {
        for permission in self.permissions {
            guard self.permissionManager.isAuthorizedPermission(permission) else {
                return false
            }
        }
        return true
    }
    
    public func didHide() {
        self.eventsDelegate?.didHide()
    }
    
    //MARK: - Modules
    public struct modules {
        
        public struct dialog {
            
            public struct interactive {
                
                public static func create(with permissions: [SPRequestPermissionType], dataSourceForController dataSource: SPRequestPermissionDialogInteractiveDataSourceInterface = SPRequestPermissionDialogInteractiveDataSource()) -> SPRequestPermissionAssistantInterface {
                    let permissionManager = SPPermissionsManagers.base()
                    let presenterManager = SPRequestPermissionPresenters.dialog.interactive.create(dataSource: dataSource)
                    let assistant = SPRequestPermissionAssistant.init(
                        with: permissions,
                        permissionManager: permissionManager,
                        presenterManager: presenterManager
                    )
                    return assistant
                }
            }
        }
        
        public struct native {
            public static func create(with permissions: [SPRequestPermissionType]) -> SPRequestPermissionAssistantInterface {
                let permissionManager = SPPermissionsManagers.base()
                let presenterManager = SPRequestPermissionPresenters.native.create()
                let assistant = SPRequestPermissionAssistant.init(
                    with: permissions,
                    permissionManager: permissionManager,
                    presenterManager: presenterManager
                )
                return assistant
            }
        }
    }
}
