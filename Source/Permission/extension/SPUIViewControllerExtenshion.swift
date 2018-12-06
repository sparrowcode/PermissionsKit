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
import Photos

extension UIViewController {
    
    func present(_ viewControllerToPresent: UIViewController, completion: (() -> Swift.Void)? = nil) {
        self.present(viewControllerToPresent, animated: true, completion: completion)
    }
    
    @objc func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func wrapToNavigationController(statusBar: SPStatusBar = .dark) -> UINavigationController {
        let controller = SPStatusBarManagerNavigationController(rootViewController: self)
        controller.statusBar = statusBar
        return controller
    }
}

extension UIViewController {
    
    func dismissKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIViewController {
    
    func save(image: UIImage) {
        if SPPermission.isAllow(.photoLibrary) {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
        } else {
            SPPermission.request(.photoLibrary) {
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
            }
        }
    }
    
    func saveVideo(url: String, complection: @escaping (Bool)->()) {
        DispatchQueue.global(qos: .utility).async {
            let urls = URL(string: url)
            let urldata = try? Data(contentsOf: urls!)
            if urldata != nil {
                let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
                let filepath = "\(documentsPath)/tempfile.mp4"
                DispatchQueue.main.async {
                    let urlsave = URL(fileURLWithPath: filepath)
                    do {
                        try urldata!.write(to: urlsave, options: Data.WritingOptions.atomic)
                        PHPhotoLibrary.shared().performChanges({
                            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: urlsave)
                        }, completionHandler: { (status, error) in
                            try? FileManager.default.removeItem(atPath: filepath)
                            DispatchQueue.main.async {
                                complection(error == nil)
                            }
                        })
                    } catch {
                        try? FileManager.default.removeItem(atPath: filepath)
                        complection(false)
                    }
                }
            }
        }
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let _ = error {
            self.imageSaved(isSuccses: false)
        } else {
            self.imageSaved(isSuccses: true)
        }
    }
    
    @objc func imageSaved(isSuccses: Bool) {
        fatalError("SPUIViewControllerExtenshion - Need ovveride 'imageSaved' func")
    }
}

extension UIViewController {
    
    func setPrefersLargeNavigationTitle(_ title: String, smallScreenToSmallBar: Bool = true) {
        self.navigationItem.title = title
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .automatic
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        if smallScreenToSmallBar {
            if self.view.frame.width < 375 {
                self.setNavigationTitle(title, style: .small)
            }
        }
    }
    
    func setNavigationTitle(_ title: String, style: SPNavigationTitleStyle) {
        self.navigationItem.title = title
        switch style {
        case .large:
            if #available(iOS 11.0, *) {
                self.navigationController?.navigationBar.prefersLargeTitles = true
                self.navigationItem.largeTitleDisplayMode = .always
            }
        case .small:
            if #available(iOS 11.0, *) {
                self.navigationItem.largeTitleDisplayMode = .never
            }
        case .stork:
            if #available(iOS 11.0, *) {
                self.navigationItem.largeTitleDisplayMode = .never
            }
        }        
    }
}

extension UIViewController {
    
    var safeArea: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.view.safeAreaInsets
        } else {
            return UIEdgeInsets.zero
        }
    }
    
    var navigationBarHeight: CGFloat {
        return self.navigationController?.navigationBar.frame.height ?? 0
    }
    
    static var statusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }
}

extension UIViewController {
    
    var navigationTitleColor: UIColor? {
        get {
            return (self.navigationController?.navigationBar.titleTextAttributes?[NSAttributedString.Key.foregroundColor] as? UIColor) ?? nil
        }
        set {
            let textAttributes: [NSAttributedString.Key: Any]? = [NSAttributedString.Key.foregroundColor: newValue ?? UIColor.black]
            self.navigationController?.navigationBar.titleTextAttributes = textAttributes
            if #available(iOS 11.0, *) {
                self.navigationController?.navigationBar.largeTitleTextAttributes = textAttributes
            }
        }
    }
}
