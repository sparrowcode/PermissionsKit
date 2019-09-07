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

class SPAppleMusicButton: SPButton {
    
    var type: SPSelectionType = .unselect {
        didSet {
            self.updateType(animated: false)
        }
    }
    
    var selectColor: UIColor = UIColor.init(hex: "FD2D55") {
        didSet {
            self.updateType(animated: false)
        }
    }
    
    var baseColor: UIColor = UIColor.init(hex: "F8F7FC") {
        didSet {
            self.updateType(animated: false)
        }
    }
    
    override func commonInit() {
        super.commonInit()
        self.layer.cornerRadius = 8
        self.titleLabel?.font = UIFont.system(weight: .demiBold, size: 15)
        self.contentEdgeInsets = UIEdgeInsets.init(top: 12, left: 27, bottom: 12, right: 27)
        self.type = .unselect
    }
    
    private func updateType(animated: Bool) {
        switch self.type {
        case .select:
            self.backgroundColor = self.selectColor
            self.setTitleColor(UIColor.white)
            break
        case .unselect:
            self.backgroundColor = self.baseColor
            self.setTitleColor(self.selectColor)
            break
        }
    }
}

