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

class SPNativeLoginNavigationController: UINavigationController, SPLoginControllerDelegate, SPLoginCodeControllerDelegate {
    
    let loginViewController = SPNativeLoginViewController()
    let codeViewController = SPNativeLoginCodeViewController()
    
    init() {
        super.init(rootViewController: self.loginViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    var loginContent: SPNativeLoginNavigationController.LoginContent {
        return LoginContent()
    }
    
    var loginCodeContent: SPNativeLoginNavigationController.LoginCodeContent {
        return LoginCodeContent()
    }

    struct LoginContent {
        var navigationTitle: String = "Sign In"
        var loginTitle: String = "Login"
        var loginPlaceholder: String = "example@icloud.com"
        var loginKeyboardType: UIKeyboardType = .emailAddress
        var passwordTitle: String = "Password"
        var passwordPlaceholder: String = "Required"
        var commentTitle: String = "Please enter a pair of login and password"
        var buttonTitle: String = "Sign In"
        var errorOauthTitle: String = "Error"
        var errorOauthSubtitle: String = "Invalid login or password"
        var errorOauthButtonTitle: String = "Ok"
    }
    
    struct LoginCodeContent {
        var navigationTitle: String = "Auth Code"
        var codeTitle: String = "Code"
        var codePlaceholder: String = "Required"
        var codeKeyboardType: UIKeyboardType = .numberPad
        var commentTitle: String = "Please enter a code for authentication"
        var buttonTitle: String = "Sign In"
        var errorOauthTitle: String = "Error"
        var errorOauthSubtitle: String = "Invalid data"
        var errorOauthButtonTitle: String = "Ok"
    }
    
    func login(with login: String, password: String, complection: @escaping (SPOauthState) -> ()) {
        fatalError("SPLoginNavigationController - Need override func")
    }
    
    func login(with code: String, complection: @escaping (SPOauthState) -> ()) {
        fatalError("SPLoginNavigationController - Need override func")
    }
    
    func needRequestCode() {
        self.pushViewController(self.codeViewController, animated: true)
    }
}
