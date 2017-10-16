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

public class SPLinesCircleButtonsView: UIView {
    
    fileprivate var minSpace: CGFloat = 15
    var items = [UIButton]()

    init(frame: CGRect = CGRect.zero, buttons: [UIButton]) {
        super.init(frame: frame)
        commonInit()
        self.addButtons(buttons)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
    }
    
    func addButtons(_ buttons: [UIButton]) {
        for button in buttons {
            self.items.append(button)
            self.addSubview(button)
        }
    }
    
    fileprivate func commonInit() {
        self.backgroundColor = UIColor.clear
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        let counts: CGFloat = CGFloat(self.items.count)
        var sideSize = self.frame.height
        var space = (self.frame.width - (sideSize * counts)) / (counts - 1)
        if (space < self.minSpace) {
            sideSize = (self.frame.width - (self.minSpace * (counts - 1))) / counts
            space = self.minSpace
        }
        
        var xItemPosition: CGFloat = 0
        let yItemPosition: CGFloat = (self.frame.height / 2) - (sideSize / 2)
        
        for view in self.subviews {
            view.frame = CGRect.init(
                x: xItemPosition,
                y: yItemPosition,
                width: sideSize,
                height: sideSize
            )
            xItemPosition = xItemPosition + sideSize + space
        }
    }
}
