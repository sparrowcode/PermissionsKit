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

public class SPSegmentedControlCell: UIView {
    
    var imageView: UIImageView = UIImageView.init()
    var label: UILabel = UILabel()
    
    var layout: SPSegmentedControlCellLayout = .onlyText {
        didSet {
            layoutIfNeeded()
        }
    }
    
    var iconRelativeScaleFactor: CGFloat = 0.5
    var spaceBetweenImageAndLabelRelativeFactor: CGFloat = 0.044 {
        didSet {
            layoutIfNeeded()
        }
    }
    
    init(layout: SPSegmentedControlCellLayout) {
        super.init(frame: CGRect.zero)
        self.layout = layout
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.label.font = UIFont(name: "Avenir-Medium", size: 13.0)!
        self.label.text = ""
        self.label.textColor = UIColor.white
        self.label.backgroundColor = UIColor.clear
        self.addSubview(label)
        
        self.imageView.backgroundColor = UIColor.clear
        self.addSubview(self.imageView)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect.zero
        imageView.frame = CGRect.zero
        switch self.layout {
        case .onlyImage:
            let sideSize = min(self.frame.width , self.frame.height) * self.iconRelativeScaleFactor
            self.imageView.frame = CGRect.init(
                x: 0, y: 0,
                width: sideSize,
                height: sideSize
            )
            self.imageView.center = CGPoint.init(
                x: self.frame.width / 2,
                y: self.frame.height / 2
            )
        case .onlyText:
            label.textAlignment = .center
            label.frame = self.bounds
        case .textWithImage:
            label.sizeToFit()
            let sideSize = min(self.frame.width , self.frame.height) * self.iconRelativeScaleFactor
            self.imageView.frame = CGRect.init(
                x: 0, y: 0,
                width: sideSize,
                height: sideSize
            )
            let space: CGFloat = self.frame.width * self.spaceBetweenImageAndLabelRelativeFactor
            let elementsWidth: CGFloat = self.imageView.frame.width + space + self.label.frame.width
            let leftEdge = (self.frame.width - elementsWidth) / 2
            let centeringHeight = self.frame.height / 2
            self.imageView.center = CGPoint.init(
                x: leftEdge + self.imageView.frame.width / 2,
                y: centeringHeight
            )
            self.label.center = CGPoint.init(
                x: leftEdge + self.imageView.frame.width + space + label.frame.width / 2,
                y: centeringHeight
            )
        default:
            break
        }
    }
}

enum SPSegmentedControlCellLayout {
    case emptyData
    case onlyText
    case onlyImage
    case textWithImage
}
