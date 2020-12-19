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
import SPPermissions

class ViewController: UITableViewController {
    
    var allPermissions: [SPPermission] = SPPermission.allCases
    var selectedPermissions: [SPPermission] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose permissions"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .play, target: self, action: #selector(self.requestPermissions))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @objc func requestPermissions() {
        let controller = SPPermissions.native(selectedPermissions)
        controller.delegate = self
        controller.present(on: self)
    }
}

// MARK: SPPermissions Delegate

/**
 DataSource for each permission. Return nil if you want use default data.
 */
extension ViewController: SPPermissionsDelegate {
    
    /**
     Alert if permission denied. For disable alert return `nil`.
     If this method not implement, alert will be show with default titles.
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
