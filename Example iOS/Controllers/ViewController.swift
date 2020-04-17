// The MIT License (MIT)
// Copyright © 2019 Ivan Varabei (varabeis@icloud.com)
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
import SPPermissions

class ViewController: UITableViewController {
    
    var allPermissions: [SPPermission] = SPPermission.allCases
    var selectedPermissions: [SPPermission] = []
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose Style"
        let segmentedControl = UISegmentedControl(items: ["List", "Dialog", "Native"])
        navigationItem.titleView = segmentedControl
        segmentedControl.selectedSegmentIndex = 0
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .play, target: self, action: #selector(self.requestPermissions))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc func requestPermissions() {
        if selectedPermissions.isEmpty { return }
        guard let segmentControl = navigationItem.titleView as? UISegmentedControl else { return }
        switch segmentControl.selectedSegmentIndex {
        case 0:
            let controller = SPPermissions.list(selectedPermissions)
            controller.dataSource = self
            controller.delegate = self
            controller.present(on: self)
        case 1:
            let controller = SPPermissions.dialog(selectedPermissions)
            controller.dataSource = self
            controller.delegate = self
            
            /**
             You can disable bouns animation and gester if need.
             Removed start annimation, removed gester drag dialog.
             */
            // controller.bounceAnimationEnabled = false
            
            controller.present(on: self)
        case 2:
            let controller = SPPermissions.native(selectedPermissions)
            controller.delegate = self
            controller.present(on: self)
        default:
            break
        }
    }
}

// MARK: SPPermissions Data Source & Delegate

extension ViewController: SPPermissionsDataSource, SPPermissionsDelegate {
    
    /**
     Configure permission cell here.
     You can return permission if want use default values.
     
     - parameter cell: Cell for configure. You can change all data.
     - parameter permission: Configure cell for it permission.
     */
    func configure(_ cell: SPPermissionTableViewCell, for permission: SPPermission) -> SPPermissionTableViewCell {
        
        /*
         // Titles
         cell.permissionTitleLabel.text = "Notifications"
         cell.permissionDescriptionLabel.text = "Remind about payment to your bank"
         cell.button.allowTitle = "Allow"
         cell.button.allowedTitle = "Allowed"
         
         // Colors
         cell.iconView.color = .systemBlue
         cell.button.allowedBackgroundColor = .systemBlue
         cell.button.allowTitleColor = .systemBlue
         
         // If you want set custom image.
         cell.set(UIImage(named: "IMAGE-NAME")!)
         
         // Maybe need set custom color for your custom image
         // For it set rendering mode and set tint color
         cell.iconImageView.tintColor = .systemRed
         */
        
        return cell
    }
    
    /**
     Call when controller closed.
     
     - parameter ids: Permissions ids, which using this controller.
     */
    func didHide(permissions ids: [Int]) {
        let permissions = ids.map { SPPermission(rawValue: $0)! }
        print("Did hide with permissions: ", permissions.map { $0.name })
    }
    
    /**
    Call when permission allowed.
    Also call if you try request allowed permission.
    
    - parameter permission: Permission which allowed.
    */
    func didAllow(permission: SPPermission) {
        print("Did allow: ", permission.name)
    }
    
    /**
    Call when permission denied.
    Also call if you try request denied permission.
    
    - parameter permission: Permission which denied.
    */
    func didDenied(permission: SPPermission) {
        print("Did denied: ", permission.name)
    }
    
    /**
     Alert if permission denied. For disable alert return `nil`.
     If this method not implement, alert will be show with default titles.
     
     - parameter permission: Denied alert data for this permission.
     */
    func deniedData(for permission: SPPermission) -> SPPermissionDeniedAlertData? {
        if permission == .notification {
            let data = SPPermissionDeniedAlertData()
            data.alertOpenSettingsDeniedPermissionTitle = "Permission denied"
            data.alertOpenSettingsDeniedPermissionDescription = "Please, go to Settings and allow permission."
            data.alertOpenSettingsDeniedPermissionButtonTitle = "Settings"
            data.alertOpenSettingsDeniedPermissionCancelTitle = "Cancel"
            return data
        } else {
            // If returned nil, alert will not show.
            print("Alert for \(permission.name) not show, becouse in datasource returned nil for configure data. If you need alert, configure this.")
            return nil
        }
    }
}

// MARK: Table Data Source & Delegate

extension ViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPermissions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let permission = allPermissions[indexPath.row]
        cell.textLabel?.text = permission.name
        cell.accessoryType = selectedPermissions.contains(permission) ? .checkmark : .none
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let permission = allPermissions[indexPath.row]
        if selectedPermissions.contains(permission)  {
            cell?.accessoryType = .none
            selectedPermissions = selectedPermissions.filter { $0 != permission }
        } else {
            cell?.accessoryType = .checkmark
            selectedPermissions.append(permission)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose permissions"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "All need keys added. When you add SPPermissions to your project, need add some keys in Info.plist. See Readme.md for details."
    }
}
