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
import FaceIDPermission
import SiriPermission
import HealthPermission

import CoreLocation

class RootController: UITableViewController {
    
    var availablePermissions: [Permission] = [.camera, .photoLibrary, .notification, .microphone, .calendar, .contacts, .reminders, .speech, .locationWhenInUse, .locationAlways, .motion, .mediaLibrary, .bluetooth, /*.tracking,*/ .faceID, .siri, .health]
    
    var selectedPermissions: [Permission] = []
    
    // MARK: Init
    
    init() {
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .plain)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose Style"
        
        // Available styles: List, Dialog & Native.
        let segmentedControl = UISegmentedControl(items: ["List", "Dialog", "Native"])
        navigationItem.titleView = segmentedControl
        segmentedControl.selectedSegmentIndex = 0
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .play, target: self, action: #selector(self.requestPermissions))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: Actions
    
    @objc func requestPermissions() {
        if selectedPermissions.isEmpty { return }
        guard let segmentControl = navigationItem.titleView as? UISegmentedControl else { return }
        switch segmentControl.selectedSegmentIndex {
        case 0:
            let controller = PermissionsKit.list(selectedPermissions)
            controller.dataSource = self
            controller.delegate = self
            controller.present(on: self)
        case 1:
            let controller = PermissionsKit.dialog(selectedPermissions)
            controller.dataSource = self
            controller.delegate = self
            //controller.bounceAnimationEnabled = false
            //controller.allowSwipeDismiss = true
            //controller.showCloseButton = true
            controller.present(on: self)
        case 2:
            let controller = PermissionsKit.native(selectedPermissions)
            controller.delegate = self
            // controller.allowSwipeDismiss = true
            // controller.showCloseButton = true
            controller.present(on: self)
        default:
            break
        }
    }
}

// MARK: - Permissions Data Source

extension RootController: PermissionsDataSource {
    
    func configure(_ cell: PermissionTableViewCell, for permission: Permission) {

        // Here you can customise cell, like texts or colors.
        
        /*
        cell.permissionTitleLabel.text = "Title"
        cell.permissionDescriptionLabel.text = "Description"
        */
        
        // If you need change icon, choose one of this:
        
        /*
        cell.permissionIconView.setPermissionType(.bluetooth)
        cell.permissionIconView.setCustomImage(UIImage.init(named: "custom-name"))
        cell.permissionIconView.setCustomView(YourView())
        */
    }
    
    func deniedPermissionAlertTexts(for permission: Permission) -> DeniedPermissionAlertTexts? {
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
        
        // For hide alert, simple return nil.
        // return nil
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
