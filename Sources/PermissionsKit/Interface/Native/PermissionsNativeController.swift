// The MIT License (MIT)
// Copyright © 2020 Sparrow Code LTD (https://sparrowcode.io, hello@sparrowcode.io)
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
public class PermissionsNativeController: NSObject, PermissionsControllerInterface {
    
    public weak var delegate: PermissionsDelegate?
    public weak var dataSource: PermissionsDataSource?
    
    // MARK: - Data
    
    private var permissions: [Permission]
    private var proceseedPermissions: [Permission] = []
    private var memoryLocker: PermissionsNativeController? = nil
    
    // MARK: - Init
    
    init(_ permissions: [Permission]) {
        self.permissions = permissions
        super.init()
    }
    
    // MARK: - Public
    
    public func present(on controller: UIViewController, animated: Bool) {
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
                    PresenterService.presentAlertAboutDeniedPermission(permission, dataSource: self.dataSource, on: controller, animated: animated)
                }
                
                if self.proceseedPermissions.isEmpty {
                    self.memoryLocker = nil
                    self.delegate?.didHidePermissions(self.permissions)
                }
            })
        }
    }
}
