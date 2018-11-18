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

class SPNativeLoginViewController: SPNativeTableViewController {
    
    weak var delegate: SPLoginControllerDelegate?
    var content: SPNativeLoginNavigationController.LoginContent!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self.navigationController as! SPNativeLoginNavigationController
        self.content = self.delegate?.loginContent
        
        self.setPrefersLargeNavigationTitle(self.content.navigationTitle)
        self.dismissKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? SPFormTextFiledTableViewCell  {
            cell.textField.becomeFirstResponder()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var labelWidth: CGFloat = 0
        for text in [self.content.loginTitle, self.content.passwordTitle] {
            let font = UIFont.system(type: .Regular, size: 17)
            let fontAttributes = [NSAttributedString.Key.font: font]
            let calculatedSize = NSString.init(string: text).size(withAttributes: fontAttributes)
            labelWidth.setIfFewer(when: calculatedSize.width + 1)
        }
        
        switch indexPath {
        case IndexPath.init(row: 0, section: 0):
            let cell = self.dequeueTextFiledTableViewCell(indexPath: indexPath)
            cell.label.text = self.content.loginTitle
            cell.textField.placeholder = self.content.loginPlaceholder
            cell.textField.keyboardType = self.content.loginKeyboardType
            cell.textField.delegate = self
            cell.textField.returnKeyType = .next
            cell.textField.autocapitalizationType = .none
            cell.textField.autocorrectionType = .no
            cell.fixWidthLabel = labelWidth
            cell.textAligmentToSide = false
            return cell
        case IndexPath.init(row: 1, section: 0):
            let cell = self.dequeueTextFiledTableViewCell(indexPath: indexPath)
            cell.label.text = self.content.passwordTitle
            cell.textField.placeholder = self.content.passwordPlaceholder
            cell.textField.isSecureTextEntry = true
            cell.textField.delegate = self
            cell.textField.returnKeyType = .done
            cell.textField.autocapitalizationType = .none
            cell.textField.autocorrectionType = .no
            cell.separatorInset.left = 0
            cell.fixWidthLabel = labelWidth
            cell.separatorInsetStyle = .all
            cell.textAligmentToSide = false
            return cell
        case IndexPath.init(row: 0, section: 1):
            let cell = self.dequeueButtonTableViewCell(indexPath: indexPath)
            cell.button.setTitle(self.content.buttonTitle, for: .normal)
            cell.separatorInset.left = 0
            cell.button.addTarget(self, action: #selector(self.enterAction), for: .touchUpInside)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0:
            return self.content.commentTitle
        default:
            return nil
        }
    }
    
    @objc func enterAction() {
        var loginCell: SPFormTextFiledTableViewCell? = nil
        var passwordCell: SPFormTextFiledTableViewCell? = nil
        var buttonCell: SPFormButtonTableViewCell? = nil
        
        if let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? SPFormTextFiledTableViewCell  {
            loginCell = cell
        }
        if let cell = self.tableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as? SPFormTextFiledTableViewCell  {
            passwordCell = cell
        }
        if let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as? SPFormButtonTableViewCell  {
            buttonCell = cell
        }
        
        if loginCell?.textField.isEmptyText ?? false {
            loginCell?.highlight()
            return
        }
        
        if passwordCell?.textField.isEmptyText ?? false {
            passwordCell?.highlight()
            return
        }
        
        buttonCell?.button.startLoading()
        
        loginCell?.textField.isEnabled = false
        passwordCell?.textField.isEnabled = false
        
        self.delegate?.login(with: loginCell?.textField.text ?? "", password: passwordCell?.textField.text ?? "") { (oAuthState) in
            
            buttonCell?.button.stopLoading()
            
            switch oAuthState {
            case .succsess:
                break
            case .needTwoFactor:
                self.delegate?.needRequestCode()
                break
            default:
                loginCell?.textField.isEnabled = true
                passwordCell?.textField.isEnabled = true
                passwordCell?.textField.becomeFirstResponder()
                UIAlertController.show(
                    title: self.content.errorOauthTitle,
                    message: self.content.errorOauthSubtitle,
                    buttonTitle: self.content.errorOauthButtonTitle,
                    on: self
                )
                break
            }
        }
    }
}

extension SPNativeLoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.superview == self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0))?.contentView {
            if let passwordCell = self.tableView.cellForRow(at: IndexPath.init(row: 1, section: 0)) as? SPFormTextFiledTableViewCell  {
                passwordCell.textField.becomeFirstResponder()
                return false
            }
        }
        
        if textField.superview == self.tableView.cellForRow(at: IndexPath.init(row: 1, section: 0))?.contentView  {
            textField.resignFirstResponder()
            self.enterAction()
            return true
        }
        
        return true
    }
}

protocol SPLoginControllerDelegate: class {
    
    var loginContent: SPNativeLoginNavigationController.LoginContent {get}
    
    func login(with login: String, password: String, complection: @escaping (SPOauthState)->())
    
    func needRequestCode() -> ()
}

