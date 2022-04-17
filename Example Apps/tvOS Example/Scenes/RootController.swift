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
import SparrowKit

import PermissionsKit
import CameraPermission
import PhotoLibraryPermission
import NotificationPermission
import MicrophonePermission
import CalendarPermission
import ContactsPermission
import RemindersPermission
import SpeechRecognizerPermission
import LocationWhenInUsePermission
import LocationAlwaysPermission
import MotionPermission
import MediaLibraryPermission
import BluetoothPermission
import TrackingPermission

class RootController: SPTableViewController {
    
    var availablePermissions: [Permission] = [.photoLibrary, .notification, .locationWhenInUse, .bluetooth, /*.tracking*/]
    
    var selectedPermissions: [Permission] = []
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose permissions"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .play, target: self, action: #selector(self.requestPermissions))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: Actions
    
    @objc func requestPermissions() {
        let controller = PermissionsKit.native(selectedPermissions)
        controller.delegate = self
        controller.present(on: self)
    }
}

// MARK: - Permissions Data Source

extension RootController: PermissionsDataSource {
    
    func deniedPermissionAlertTexts(for permission: Permission) -> DeniedPermissionAlertTexts? {
        if permission.kind == .notification {
            
            // If returned nil, alert will not show.
            
            print("Alert for \(permission.debugName) not show, becouse in datasource returned nil. If you need alert, configure this.")
            return nil
            
        } else {
            
            // You can create custom texts
            
            /*
             let texts = DeniedPermissionAlertTexts()
             texts.titleText = "Permission denied"
             texts.descriptionText = "Please, go to Settings and allow permission."
             texts.actionText = "Settings"
             texts.cancelText = "Cancel"
             return texts
             */
            
            // or use default texts.
            
            return .default
        }
    }
}

// MARK: - Permissions Delegate

extension RootController: PermissionsDelegate {
    
    func didHidePermissions(_ permissions: [Permission]) {
        print("Example App: did hide with permissions", permissions.map { $0.debugName })
    }
    
    func didAllowPermission(_ permission: Permission) {
        print("Example App: did allow", permission.debugName)
    }
    
    func didDeniedPermission(_ permission: Permission) {
        print("Example App: did denied", permission.debugName)
    }
}
