// The MIT License (MIT)
// Copyright © 2020 Ivan Vorobei (hello@ivanvorobei.by)
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

extension UIColor {
    
    enum Compability {
                
        static var systemBackground: UIColor {
            #if os(iOS)
            if #available(iOS 13.0, *) {
                return UIColor.systemBackground
            }
            #endif
            return UIColor.white
        }
        
        static var secondarySystemBackground: UIColor {
            #if os(iOS)
            if #available(iOS 13.0, *) {
                return UIColor.secondarySystemBackground
            }
            #endif
            return UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        }
        
        static var separator: UIColor {
            if #available(iOS 13.0, tvOS 13.0, *) {
                return UIColor.separator
            } else {
                return UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 1)
            }
        }
        
        static var label: UIColor {
            if #available(iOS 13.0, tvOS 13.0, *) {
                return UIColor.label
            } else {
                return UIColor.black
            }
        }
        
        static var secondaryLabel: UIColor {
            if #available(iOS 13.0, tvOS 13.0, *) {
                return UIColor.secondaryLabel
            } else {
                return UIColor(red: 138/255, green: 138/255, blue: 142/255, alpha: 1)
            }
        }
    }
    
    static var buttonArea: UIColor {
        if #available(iOS 13.0, tvOS 13.0, *) {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ? UIColor(red: 61/255, green: 62/255, blue: 66/255, alpha: 1) :
                    UIColor(red: 238/255, green: 238/255, blue: 240/255, alpha: 1)
            }
        } else {
            return UIColor(red: 238/255, green: 238/255, blue: 240/255, alpha: 1)
        }
    }
    
    @available(iOSApplicationExtension, unavailable)
    static var tint: UIColor {
        get {
            let value = UIApplication.shared.windows.first?.tintColor
            guard let tint = value else { return .systemBlue }
            return tint
        }
        set {
            UIApplication.shared.windows.forEach({ $0.tintColor = newValue })
        }
    }
}
