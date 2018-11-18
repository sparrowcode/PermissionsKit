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
import SafariServices

struct SPOpener {
    
    struct App {
        
        static func system(app: SPSystemApp) {
            switch app {
            case SPSystemApp.photos:
                guard let settingsUrl = URL(string: "photos-redirect://") else {
                    return
                }
                
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            print("SPOpener - Photos opened: \(success)")
                        })
                    } else {
                        UIApplication.shared.openURL(settingsUrl as URL)
                    }
                } else {
                    print("SPOpener - Photos not opened")
                }
            case SPSystemApp.setting:
                DispatchQueue.main.async {
                    guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                        return
                    }
                    
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                                print("SPOpener - Settings opened: \(success)")
                            })
                        } else {
                            UIApplication.shared.openURL(settingsUrl as URL)
                        }
                    } else {
                        print("SPOpener - Settings not opened")
                    }
                }
            }
        }
        
        private init() {}
    }
    
    struct Link {
        
        public static func redirectToBrowserAndOpen(link: String) {
            
            guard let url = URL(string: link) else {
                print("SPOpener - can not create URL")
                return
            }
            
            self.redirectToBrowserAndOpen(link: url)
        }
        
        public static func redirectToBrowserAndOpen(link: URL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(link, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            } else {
                UIApplication.shared.openURL(link)
            }
        }
        
        public static func openInsideApp(link: String, on viewController: UIViewController) {
            if let url = URL.init(string: link) {
                let safariController = SFSafariViewController.init(url: url)
                viewController.present(safariController, animated: true, completion: nil)
            } else {
                print("SPOpener - openInsideApp - invalid link")
            }
        }
        
        private init() {}
    }
    
    private init() {}
}



// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
