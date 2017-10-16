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

public class SPShadowWithMaskView<ContentView: UIView>: UIView {
    
    public let contentView: ContentView = ContentView()
    
    public init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.contentView.layer.masksToBounds = true
        self.layer.masksToBounds = false
        self.contentView.layer.masksToBounds = true
        self.backgroundColor = UIColor.clear
        self.addSubview(contentView)
        self.updateShadow()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.bounds
        self.layer.cornerRadius = self.contentView.layer.cornerRadius
    }
    
    public override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.updateShadow()
    }
    
    var shadowXTranslationFactor: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    var shadowYTranslationFactor: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    var shadowWidthRelativeFactor: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    var shadowHeightRelativeFactor: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    var shadowBlurRadiusFactor: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    var shadowOpacity: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    
    private func updateShadow() {
        self.setShadow(
            xTranslationFactor: self.shadowXTranslationFactor,
            yTranslationFactor: self.shadowYTranslationFactor,
            widthRelativeFactor: self.shadowWidthRelativeFactor,
            heightRelativeFactor: self.shadowHeightRelativeFactor,
            blurRadiusFactor: self.shadowBlurRadiusFactor,
            shadowOpacity: self.shadowOpacity
        )
    }
}

public class SPShadowWithMaskControl: UIControl {
    
    public let contentView: UIView = UIView()
    
    public init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.contentView.layer.masksToBounds = true
        self.layer.masksToBounds = false
        self.backgroundColor = UIColor.clear
        self.addSubview(contentView)
        self.updateShadow()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.bounds
        self.layer.cornerRadius = self.contentView.layer.cornerRadius
    }
    
    public override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        self.updateShadow()
    }
    
    var shadowXTranslationFactor: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    var shadowYTranslationFactor: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    var shadowWidthRelativeFactor: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    var shadowHeightRelativeFactor: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    var shadowBlurRadiusFactor: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    var shadowOpacity: CGFloat = 0 {
        didSet {
            self.updateShadow()
        }
    }
    
    private func updateShadow() {
        self.setShadow(
            xTranslationFactor: self.shadowXTranslationFactor,
            yTranslationFactor: self.shadowYTranslationFactor,
            widthRelativeFactor: self.shadowWidthRelativeFactor,
            heightRelativeFactor: self.shadowHeightRelativeFactor,
            blurRadiusFactor: self.shadowBlurRadiusFactor,
            shadowOpacity: self.shadowOpacity
        )
    }
}
