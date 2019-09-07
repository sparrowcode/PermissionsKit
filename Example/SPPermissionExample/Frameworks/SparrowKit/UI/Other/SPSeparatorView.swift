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

class SPSeparatorView: SPView {
    
    private var height: CGFloat {
        return 0.5
    }
    
    override func commonInit() {
        super.commonInit()
        self.backgroundColor = UIColor.init(hex: "515B66").withAlphaComponent(0.25)
        self.round = true
        self.frame.set(height: self.height)
    }
    
    func layout(origin: CGPoint, width: CGFloat) {
        self.frame.origin = CGPoint.init(x: floor(origin.x), y: floor(origin.y))
        self.frame.set(width: floor(width))
        self.frame.set(height: self.height)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.set(height: self.height)
    }
}
