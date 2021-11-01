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
@available(iOSApplicationExtension, unavailable)
public class SPPermissionsNativeController: NSObject, SPPermissionsControllerInterface {
    
    public weak var delegate: SPPermissionsDelegate?
    public weak var dataSource: SPPermissionsDataSource?
    
    // MARK: - Data
    
    private var permissions: [SPPermissions.Permission]
    private var proceseedPermissions: [SPPermissions.Permission] = []
    private var memoryLocker: SPPermissionsNativeController? = nil
    
    // MARK: - Init
    
    init(_ permissions: [SPPermissions.Permission]) {
        self.permissions = permissions
        super.init()
    }
    
    // MARK: - Public
    
    public func present(on controller: UIViewController) {
        self.memoryLocker = self
        self.proceseedPermissions = permissions
        for permission in permissions {
            permission.request(completion: { [weak self] in
                self?.proceseedPermissions = self?.proceseedPermissions.filter({ $0 != permission }) ?? []
                guard let self = self else { return }
                if permission.authorized {
                    self.delegate?.didAllowPermission(permission)
                } else {
                    self.delegate?.didDeniedPermission(permission)
                    PresenterService.presentAlertAboutDeniedPermission(permission, dataSource: self.dataSource, on: controller)
                }
                
                if self.proceseedPermissions.isEmpty {
                    self.memoryLocker = nil
                    self.delegate?.didHidePermissions(self.permissions)
                }
            })
        }
    }
}
