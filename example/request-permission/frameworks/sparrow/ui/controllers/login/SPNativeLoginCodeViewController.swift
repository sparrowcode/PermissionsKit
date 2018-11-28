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

class SPNativeLoginCodeViewController: SPNativeTableViewController {
    
    weak var delegate: SPLoginCodeControllerDelegate?
    var content: SPNativeLoginNavigationController.LoginCodeContent!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self.navigationController as! SPNativeLoginNavigationController
        self.content = self.delegate?.loginCodeContent

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
            return 1
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
        for text in [self.content.codeTitle] {
            let font = UIFont.system(type: .Regular, size: 17)
            let fontAttributes = [NSAttributedString.Key.font: font]
            let calculatedSize = NSString.init(string: text).size(withAttributes: fontAttributes)
            labelWidth.setIfFewer(when: calculatedSize.width + 1)
        }
        
        switch indexPath {
        case IndexPath.init(row: 0, section: 0):
            let cell = self.dequeueTextFiledTableViewCell(indexPath: indexPath)
            cell.label.text = self.content.codeTitle
            cell.textField.placeholder = self.content.codePlaceholder
            cell.textField.keyboardType = self.content.codeKeyboardType
            cell.textField.delegate = self
            cell.textField.returnKeyType = .done
            cell.textField.autocapitalizationType = .none
            cell.textField.autocorrectionType = .no
            cell.textField.isSecureTextEntry = true
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
        var сodeCell: SPFormTextFiledTableViewCell? = nil
        var buttonCell: SPFormButtonTableViewCell? = nil
        
        if let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? SPFormTextFiledTableViewCell  {
            сodeCell = cell
        }
        
        if сodeCell?.textField.isEmptyText ?? false {
            сodeCell?.highlight()
            return
        }
        
        if let cell = self.tableView.cellForRow(at: IndexPath.init(row: 0, section: 1)) as? SPFormButtonTableViewCell  {
            buttonCell = cell
        }
        
        buttonCell?.button.startLoading()
        
        сodeCell?.textField.isEnabled = false
        
        self.delegate?.login(with: сodeCell?.textField.text ?? "") { (oAuthState) in
            
            buttonCell?.button.stopLoading()
            
            if oAuthState != SPOauthState.succsess {
                UIAlertController.show(
                    title: self.content.errorOauthTitle,
                    message: self.content.errorOauthSubtitle,
                    buttonTitle: self.content.errorOauthButtonTitle,
                    on: self
                )
                сodeCell?.textField.isEnabled = true
                сodeCell?.textField.becomeFirstResponder()
            }
        }
    }
}

extension SPNativeLoginCodeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.enterAction()
        return true
    }
}

protocol SPLoginCodeControllerDelegate: class {
    
    var loginCodeContent: SPNativeLoginNavigationController.LoginCodeContent {get}
    
    func login(with code: String, complection: @escaping (SPOauthState)->())
}


