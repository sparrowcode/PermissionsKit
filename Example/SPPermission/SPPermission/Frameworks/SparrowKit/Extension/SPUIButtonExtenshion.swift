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

extension UIButton {
    
    typealias UIButtonTargetClosure = () -> ()
    
    private class ClosureWrapper: NSObject {
        let closure: UIButtonTargetClosure
        init(_ closure: @escaping UIButtonTargetClosure) {
            self.closure = closure
        }
    }
    
    private struct AssociatedKeys {
        static var targetClosure = "targetClosure"
    }
    
    private var targetClosure: UIButtonTargetClosure? {
        get {
            guard let closureWrapper = objc_getAssociatedObject(self, &AssociatedKeys.targetClosure) as? ClosureWrapper else { return nil }
            return closureWrapper.closure
        }
        set(newValue) {
            guard let newValue = newValue else { return }
            objc_setAssociatedObject(self, &AssociatedKeys.targetClosure, ClosureWrapper(newValue), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func target(_ action: @escaping UIButtonTargetClosure) {
        targetClosure = action
        addTarget(self, action: #selector(UIButton.targetAction), for: .touchUpInside)
    }
    
    @objc func targetAction() {
        guard let targetClosure = targetClosure else { return }
        targetClosure()
    }
}

extension UIButton {
    
    func setTitle(_ title: String, color: UIColor? = nil) {
        self.setTitle(title, for: .normal)
        if let color = color {
            self.setTitleColor(color)
        }
    }
    
    func setTitleColor(_ color: UIColor) {
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(color.withAlphaComponent(0.7), for: .highlighted)
    }
    
    func setImage(_ image: UIImage) {
        self.setImage(image, for: .normal)
        self.imageView?.contentMode = .scaleAspectFit
    }
    
    func removeAllTargets() {
        self.removeTarget(nil, action: nil, for: .allEvents)
    }
    
    func showText(_ text: String, withComplection completion: (() -> Void)! = {}) {
        let baseText = self.titleLabel?.text ?? " "
        SPAnimation.animate(0.2, animations: {
            self.titleLabel?.alpha = 0
        }, withComplection: {
            self.setTitle(text, for: .normal)
            SPAnimation.animate(0.2, animations: {
                self.titleLabel?.alpha = 1
            }, withComplection: {
                SPAnimation.animate(0.2, animations: {
                    self.titleLabel?.alpha = 0
                }, delay: 0.35,
                   withComplection: {
                    self.setTitle(baseText, for: .normal)
                    SPAnimation.animate(0.2, animations: {
                        self.titleLabel?.alpha = 1
                    }, withComplection: {
                        completion()
                    })
                })
            })
        })
    }
    
    func setAnimatableText(_ text: String, withComplection completion: (() -> Void)! = {}) {
        SPAnimation.animate(0.3, animations: {
            self.titleLabel?.alpha = 0
        }, withComplection: {
            self.setTitle(text, for: .normal)
            SPAnimation.animate(0.3, animations: {
                self.titleLabel?.alpha = 1
            }, withComplection: {   
                completion()
            })
        })
    }
    
    func hideContent(completion: (() -> Void)! = {}) {
        SPAnimation.animate(0.25, animations: {
            self.titleLabel?.alpha = 0
        }, withComplection: {
             completion()
        })
    }
    
    func showContent(completion: (() -> Void)! = {}) {
        SPAnimation.animate(0.25, animations: {
            self.titleLabel?.alpha = 1
        }, withComplection: {
            completion()
        })
    }
}
