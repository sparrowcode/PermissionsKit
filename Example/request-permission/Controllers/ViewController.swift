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

class ViewController: SPController {
    
    @objc func presentPermissonDialog() {
        SPAnimationAlpha.hideList(views: [self.presentButton, self.changeBackgroundButton])

        SPPermission.Dialog.request(
            with: [.camera, .calendar, .microphone],
            on: self,
            delegate: self,
            dataSource: self,
            colorSource: self
        )
    }
    
    @objc func changeBackground() {
        self.currentIndexImage += 1
        self.statusBar = .light
        if self.currentIndexImage > self.images.count - 1 {
            self.currentIndexImage = 0
            self.statusBar = .dark
        }
        self.backgroundView.image = self.images[self.currentIndexImage]
    }
    
    var presentButton = SPAppStoreActionButton()
    var changeBackgroundButton = SPAppStoreActionButton()
    var backgroundView = UIImageView.init()
    
    private var images = [UIImage.init(), UIImage.init(named: "background-1")!, UIImage.init(named: "background-2")!]
    private var currentIndexImage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = SPNativeColors.customGray
        self.backgroundView.contentMode = .scaleAspectFill
        self.view.addSubview(self.backgroundView)
        
        self.view.addSubview(self.presentButton)
        self.presentButton.style = .buyInStore
        self.presentButton.setTitle("Present")
        self.presentButton.addTarget(self, action: #selector(self.presentPermissonDialog), for: .touchUpInside)
        
        self.view.addSubview(self.changeBackgroundButton)
        self.changeBackgroundButton.style = .buyInStore
        self.changeBackgroundButton.setTitle("Change Background")
        self.changeBackgroundButton.addTarget(self, action: #selector(self.changeBackground), for: .touchUpInside)
    }
    
    override func updateLayout(with size: CGSize) {
        super.updateLayout(with: size)
        
        self.backgroundView.frame = CGRect.init(origin: .zero, size: size)
        
        self.presentButton.sizeToFit()
        self.presentButton.frame.bottomYPosition = self.view.frame.height - self.safeArea.bottom - 40
        
        self.changeBackgroundButton.sizeToFit()
        self.changeBackgroundButton.frame.bottomYPosition = self.presentButton.frame.bottomYPosition
        
        let allWidth = self.presentButton.frame.width + 10 + self.changeBackgroundButton.frame.width
        self.presentButton.frame.origin.x = (self.view.frame.width - allWidth) / 2
        self.changeBackgroundButton.frame.origin.x = self.presentButton.frame.bottomXPosition + 10
    }
}
