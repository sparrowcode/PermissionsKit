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

extension UIAlertController {
    
    static var elementsColor: UIColor {
        get {
            return UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor
        }
        set {
            UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = newValue
        }
    }
    
    
    static func show(title: String? = nil, message: String? = nil, buttonTitle: String, cancelButtonTitle: String? = nil, complection: @escaping ()->() = {}, on viewController: UIViewController) {
        let ac = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        if let cancelTitle = cancelButtonTitle {
            ac.addAction(UIAlertAction.init(
                title: cancelTitle,
                style: UIAlertAction.Style.cancel,
                handler: nil)
            )
        }
        
        ac.addAction(UIAlertAction.init(
            title: buttonTitle,
            style: UIAlertAction.Style.default,
            handler: { (action) in
                complection()
        }))
        
        viewController.present(ac, animated: true, completion: nil)
    }
    
    static func сonfirm(title: String? = nil, message: String? = nil, buttonTitle: String, cancelButtonTitle: String, isDestructive: Bool = false, complection: @escaping (Bool)->(), on viewController: UIViewController) {
        let ac = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .actionSheet
        )
        
        let style = isDestructive ? .destructive : UIAlertAction.Style.default

        ac.addAction(UIAlertAction.init(
            title: buttonTitle,
            style: style,
            handler: { (action) in
                complection(true)
        }))
        ac.addAction(UIAlertAction.init(
            title: cancelButtonTitle,
            style: UIAlertAction.Style.cancel,
            handler: { (action) in
                complection(false)
        }))
        viewController.present(ac, animated: true, completion: nil)
    }
}

extension UIAlertController {
    
    func addAction(title: String, complection: @escaping ()->()) {
        let action = UIAlertAction(title: title, style: .default) { (action) in
            complection()
        }
        self.addAction(action)
    }
    
    func addDestructiveAction(title: String, complection: @escaping ()->()) {
        let action = UIAlertAction(title: title, style: .destructive) { (action) in
            complection()
        }
        self.addAction(action)
    }
    
    func addCancelAction(title: String, complection: @escaping ()->() = {}) {
        let action = UIAlertAction(title: title, style: .cancel) { (action) in
            complection()
        }
        self.addAction(action)
    }
}
