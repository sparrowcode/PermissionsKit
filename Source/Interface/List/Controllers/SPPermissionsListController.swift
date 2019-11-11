// The MIT License (MIT)
// Copyright © 2019 Ivan Vorobei (ivanvorobei@icloud.com)
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

/**
 Controller for List interface.
 */
public class SPPermissionsListController: UITableViewController, SPPermissionsControllerProtocol {
    
    public weak var dataSource: SPPermissionsDataSource?
    public weak var delegate: SPPermissionsDelegate?
    
    public var titleText: String = SPPermissionsText.titleText
    public var headerText: String = SPPermissionsText.subtitleText
    public var footerText: String = SPPermissionsText.commentText
    
    private var permissions: [SPPermission]
    
    init(_ permissions: [SPPermission]) {
        self.permissions = permissions
        if #available(iOS 13.0, *) {
            super.init(style: .insetGrouped)
        } else {
            super.init(style: .grouped)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissAnimated))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissAnimated))
        }
        navigationItem.title = titleText
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delaysContentTouches = false
        tableView.alwaysBounceVertical = false
        tableView.allowsSelection = false
        tableView.register(SPPermissionTableViewCell.self, forCellReuseIdentifier: SPPermissionTableViewCell.id)
        tableView.register(SPPermissionsListHeaderCommentView.self, forHeaderFooterViewReuseIdentifier: SPPermissionsListHeaderCommentView.id)
        tableView.register(SPPermissionsListFooterCommentView.self, forHeaderFooterViewReuseIdentifier: SPPermissionsListFooterCommentView.id)
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return permissions.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SPPermissionTableViewCell.id, for: indexPath) as! SPPermissionTableViewCell
        let permission = permissions[indexPath.row]
        cell.set(dataSource?.data(for: permission), permission: permission)
        cell.button.addTarget(self, action: #selector(self.process(button:)), for: .touchUpInside)
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SPPermissionsListHeaderCommentView.id) as! SPPermissionsListHeaderCommentView
        view.titleLabel.text = headerText
        return view
    }
    
    public override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: SPPermissionsListFooterCommentView.id) as! SPPermissionsListFooterCommentView
        view.titleLabel.text = footerText
        return view
    }
    
    @objc func process(button: SPPermissionActionButton) {
        let permission = button.permission
        permission.request {
            UIView.animate(withDuration: 0.3, animations: {
                let isAuthorized = permission.isAuthorized
                button.style = isAuthorized ? .allowed : .base
                isAuthorized ? self.delegate?.didAllow?(permission: permission) : self.delegate?.didDenied?(permission: permission)
                
                // Update `.locationWhenInUse` if allowed `.locationAlwaysAndWhenInUse`
                
                // Check if last permission when close auto
                
            })
            if permission.isDenied {
                print("Show alert about settings")
            }
        }
    }
    
    @objc func dismissAnimated() {
        self.dismiss(animated: true, completion: nil)
    }
    
    /**
     Call this method for present controller on other controller.
     In this method controller wrap to navigation and add other configure.
     
     - parameter controller: Controller, on which need present `SPPermissions` controller.
     */
    func present(on controller: UIViewController) {
        controller.present(UINavigationController(rootViewController: self), animated: true, completion: nil)
    }
}
