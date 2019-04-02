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

import Foundation
import MessageUI

struct SPMail {
    
    static var canSendEmail: Bool {
        return MFMailComposeViewController.canSendMail()
    }
    
    static func openApp(to email: String, subject: String? = nil, body: String? = nil) {
        let parametrs = "mailto:\(email)?subject=\(subject ?? "")&body=\(body ?? "")".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        if parametrs != nil {
            if let url: URL = URL(string: parametrs!) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
                }
            }
        }
    }
    
    static func dialog(to email: String, subject: String? = nil, body: String? = nil, on viewController: UIViewController) {
        let mailVC = MFMailComposeViewController()
        mailVC.mailComposeDelegate = SPMailSingltone.sharedInstance

        mailVC.setToRecipients([email])
        
        if subject != nil {
            mailVC.setSubject(subject!)
        }
        
        if body != nil {
            mailVC.setMessageBody(body!, isHTML: false)
        }

        viewController.present(mailVC, animated: true, completion: nil)
    }
    
    fileprivate final class SPMailSingltone: NSObject, MFMailComposeViewControllerDelegate {
        
        static let sharedInstance = SPMailSingltone()
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    private init() {}
}

fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
