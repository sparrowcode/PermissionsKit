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

extension SPPermission {
    
    public struct Dialog {
        
        public static func request(with permissions: [SPPermissionType], on viewController: UIViewController, delegate: SPPermissionDialogDelegate? = nil, dataSource: SPPermissionDialogDataSource? = nil) {
            if permissions.isEmpty {  return }
            let controller = SPPermissionDialogController(permissions: permissions)
            controller.delegate = delegate
            controller.dataSource = dataSource
            controller.present(on: viewController)
        }
        
        private init() {}
    }
}

@objc public protocol SPPermissionDialogDelegate: class {
    
    @objc optional func didHide()
    @objc optional func didAllow(permission: SPPermissionType)
}

@objc public protocol SPPermissionDialogDataSource: class {
    
    @objc optional var dialogTitle: String { get }
    @objc optional var dialogSubtitle: String { get }
    @objc optional var dialogComment: String { get }
    @objc optional var allowTitle: String { get }
    @objc optional var allowedTitle: String { get }
    @objc optional var bottomComment: String { get }
    @objc optional var showCloseButton: Bool { get }
    @objc optional func name(for permission: SPPermissionType) -> String?
    @objc optional func description(for permission: SPPermissionType) -> String?
    @objc optional func image(for permission: SPPermissionType) -> UIImage?
    @objc optional func deniedTitle(for permission: SPPermissionType) -> String?
    @objc optional func deniedSubtitle(for permission: SPPermissionType) -> String?
    @objc optional var cancelTitle: String { get }
    @objc optional var settingsTitle: String { get }
}
