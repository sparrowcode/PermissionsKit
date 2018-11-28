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

class SPHiderViewController: SPBaseViewController {

    let backgroundView = SPGradeBlurView.init()
    
    private var durationAnimation: TimeInterval = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.statusBar = .light
        
        self.view.backgroundColor = UIColor.clear
        
        self.backgroundView.setGradeColor(UIColor.black)
        self.activityIndicatorView.alpha = 0
        self.backgroundView.setGradeAlpha(0, blurRaius: 0)
        self.view.addSubview(self.backgroundView)
        
        self.activityIndicatorView.startAnimating()
        self.view.addSubview(self.activityIndicatorView)
        
        self.updateLayout(with: self.view.frame.size)
    }
    
    override func updateLayout(with size: CGSize) {
        self.backgroundView.frame = CGRect.init(origin: CGPoint.zero, size: size)
        self.activityIndicatorView.center = CGPoint.init(x: size.width / 2, y: size.height / 2)
    }
    
    func present(on viewController: UIViewController) {
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overCurrentContext
        viewController.present(self, animated: false) {
            SPAnimation.animate(self.durationAnimation, animations: {
                self.backgroundView.setGradeAlpha(0.5, blurRaius: 8)
            })
            SPAnimation.animate(self.durationAnimation * 1.5, animations: {
                self.activityIndicatorView.alpha = 1
            }, delay: self.durationAnimation / 1.5)
        }
    }
    
    override func dismiss() {
        SPAnimation.animate(self.durationAnimation / 1.2, animations: { 
            self.activityIndicatorView.alpha = 0
        })
        SPAnimation.animate(self.durationAnimation, animations: {
            self.backgroundView.setGradeAlpha(0, blurRaius: 0)
        }, delay: 0) {
            self.dismiss(animated: false, completion: nil)
        }
    }
}
