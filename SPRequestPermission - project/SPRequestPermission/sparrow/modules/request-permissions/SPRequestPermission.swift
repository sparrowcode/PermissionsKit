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

//MARK: - Interface
public struct SPRequestPermission {
    
    static public func isAllowPermission(_ permission: SPRequestPermissionType) -> Bool {
        let permissionManager = SPPermissionsManager.init()
        return permissionManager.isAuthorizedPermission(permission)
    }
    
    static public func isAllowPermissions(_ permissions: [SPRequestPermissionType]) -> Bool {
        for permission in permissions {
            if !self.isAllowPermission(permission) {
                return false
            }
        }
        return true
    }
}

//MARK: - Modules
extension SPRequestPermission {
    
    public struct dialog {
        
        public struct interactive {
            
            static public func present(
                on viewController: UIViewController,
                with permissions: [SPRequestPermissionType],
                dataSource: SPRequestPermissionDialogInteractiveDataSourceInterface = SPRequestPermissionDialogInteractiveDataSource(),
                delegate: SPRequestPermissionEventsDelegate? = nil) {
                
                let presenter = SPRequestPermissionDialogInteractivePresenter.init(with: permissions, dataSource: dataSource)
                presenter.eventsDelegate = delegate
                let controller = SPRequestPermissionDialogInteractiveViewController.init(presenter: presenter)
                controller.present(on: viewController)
                
            }
        }
    }
    
    public struct native {
        
        static public func present(with permissions: [SPRequestPermissionType], delegate: SPRequestPermissionEventsDelegate? = nil) {
            let presenter = SPRequestPermissionNativePresenter.init(with: permissions)
            presenter.eventsDelegate = delegate
            presenter.requestPermissions()
            
        }
    }
}
