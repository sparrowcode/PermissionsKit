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

public class SPFooterActionsView: SPView {
    
    var sectionLabels = SPSectionLabelsView()
    private var buttons: [SPFooterActionButton] = []
    private var separators: [SPSeparatorView] = []
    
    override func commonInit() {
        super.commonInit()
        self.backgroundColor = UIColor.clear
        self.sectionLabels.titleLabel.text = "Actions"
        self.addSubview(self.sectionLabels)
    }
    
    func addButton(title: String, titleColor: UIColor, target: @escaping ()->()) {
        let button = SPFooterActionButton()
        button.setTitle(title)
        button.setTitleColor(titleColor)
        button.target { target() }
        self.buttons.append(button)
        self.addSubview(button)
        
        let separator = SPSeparatorView()
        self.separators.append(separator)
        self.addSubview(separator)
    }
    
    func button(for id: Int) -> SPFooterActionButton? {
        if (self.buttons.count - 1) < id {
            return nil
        }
        return self.buttons[id]
    }
    
    func layout(origin: CGPoint, width: CGFloat) {
        self.frame.origin = origin
        self.setWidth(width)
        self.layoutSubviews()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        self.sectionLabels.layout(origin: CGPoint.zero, width: self.frame.width)
        
        let buttonHeight: CGFloat = 50
        var yPositionButton: CGFloat = self.sectionLabels.frame.bottomYPosition + 12
        
        if !self.buttons.isEmpty {
            for i in 0...(buttons.count - 1) {
                let button = self.buttons[i]
                let separator = self.separators[i]
                
                separator.frame.origin.x = 0
                separator.frame.origin.y = yPositionButton
                separator.setWidth(self.frame.width)
                
                button.frame = CGRect.init(x: 0, y: yPositionButton, width: self.frame.width, height: buttonHeight)
                
                yPositionButton += buttonHeight
            }
            
            self.setHeight(yPositionButton)
        }
    }
}

class SPFooterActionButton: SPButton {
    
    var rightIconView: UIView? {
        willSet {
            self.rightIconView?.removeFromSuperview()
        }
        didSet {
            if let view = self.rightIconView {
                self.addSubview(view)
                self.layoutSubviews()
            }
        }
    }
    
    override func commonInit() {
        super.commonInit()
        self.setTitleColor(SPNativeColors.blue)
        self.titleLabel?.font = UIFont.system(type: .Regular, size: 21)
        self.contentHorizontalAlignment = .left
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let sideSize: CGFloat = self.frame.height * 0.36
        self.rightIconView?.frame = CGRect.init(x: 0, y: 0, width: sideSize, height: sideSize)
        self.rightIconView?.center.y = self.frame.height / 2
        self.rightIconView?.frame.bottomXPosition = self.frame.width - sideSize / 3
    }
}
