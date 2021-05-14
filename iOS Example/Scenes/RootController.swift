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
import Sources

class RootController: UIViewController, SPPermissionsDataSource, SPPermissionsDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let controller = SPPermissions.list([.notification, .calendar, .mediaLibrary])
        controller.dataSource = self
        controller.delegate = self
        controller.present(on: self)
    }
    
    // MARK: - SPPermissionsDataSource
    
    func deniedAlertTexts(for permission: SPPermission) -> SPPermissionDeniedAlertTexts? {
        
        // 1. For hide alert, return nil here:
        // return nil
        
        // 2. For use fault texts, leave it:
        return .default
        
        // 3. If you want have custom text:
        // return SPPermissionDeniedAlertTexts.init(title: "Your title", description: "Description", button: "Open Settings", cancel: "Cancel")
    }
    
    // MARK: - SPPermissionsDelegate
    
    func didAllowPermission(_ permission: SPPermission) {
        print("Example App: Did allow permission\(permission.name)")
    }
    
    func didDeniedPermission(_ permission: SPPermission) {
        print("Example App: Did denied permission \(permission.name)")
    }
    
    func didHidePermissions(_ ids: [Int]) {
        let permissions = ids.map { SPPermission(rawValue: $0)! }
        print("Example App: Did hide with permissions: ", permissions.map { $0.name })
    }
}

