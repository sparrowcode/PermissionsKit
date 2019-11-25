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
        controller.dataSource = self
        controller.present(on: self)
    }
}

/**
 DataSource for each permission. Return nil if you want use default data.
 */
extension ViewController: SPPermissionsDataSource, SPPermissionsDelegate {
    
    func data(for permission: SPPermission) -> SPPermissionData? {
        return nil
    }
}

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
