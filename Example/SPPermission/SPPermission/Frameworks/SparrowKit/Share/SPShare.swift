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

struct SPShare {
    
    struct Native {
        
        static func share(text: String? = nil, fileNames: [String] = [], images: [UIImage] = [], complection: ((_ isSharing: Bool)->())? = nil, sourceView: UIView, on viewController: UIViewController) {
            
            var shareData: [Any] = []
            if text != nil {
                shareData.append(text!)
            }
            
            for file in fileNames {
                let path = Bundle.main.path(forResource: file, ofType: "")
                if path != nil {
                    let fileData = URL.init(fileURLWithPath: path!)
                    shareData.append(fileData)
                }
            }
            
            for image in images {
                shareData.append(image)
            }
            
            let shareViewController = UIActivityViewController(activityItems: shareData, applicationActivities: nil)
            shareViewController.completionWithItemsHandler = {(activityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
                if !completed {
                    complection?(false)
                    return
                }
                complection?(true)
            }
            shareViewController.modalPresentationStyle = .popover
            shareViewController.popoverPresentationController?.sourceView = sourceView
            shareViewController.popoverPresentationController?.sourceRect = sourceView.bounds

            viewController.present(shareViewController, animated: true, completion: nil)
        }
        
        private init() {}
    }
    
    private init() {}
}
