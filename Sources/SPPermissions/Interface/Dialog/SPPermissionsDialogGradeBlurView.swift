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

#if os(iOS)

class SPPermissionsDialogGradeBlurView: UIView {
    
    private var gradeView: UIView = UIView()
    private var blurView: UIView = UIView()
    
    // MARK: - Init
    
    init() {
        super.init(frame: CGRect.zero)
        backgroundColor = .clear
        setGradeColor(UIColor.black)
        setGradeAlpha(0)
        setBlurRadius(0)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        blurView = SPPermissionsBlurView()
        layer.masksToBounds = true
        addSubview(gradeView)
        addSubview(blurView)
    }
    
    // MARK: - Helpers
    
    func setGradeColor(_ color: UIColor) {
        gradeView.backgroundColor = UIColor.black
    }
    
    func setGradeAlpha(_ alpha: CGFloat) {
        gradeView.alpha = alpha
    }
    
    func setBlurRadius(_ radius: CGFloat) {
        if let blurView = self.blurView as? SPPermissionsBlurView {
            blurView.setBlurRadius(radius)
        }
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradeView.frame = bounds
        blurView.frame = bounds
    }
}

public class SPPermissionsBlurView: UIVisualEffectView {
    
    private let blurEffect: UIBlurEffect
    open var blurRadius: CGFloat {
        return blurEffect.value(forKeyPath: "blurRadius") as! CGFloat
    }
    
    public convenience init() {
        self.init(withRadius: 0)
    }
    
    public init(withRadius radius: CGFloat) {
        if #available(iOS 14, *) {
            self.blurEffect = UIBlurEffect(style: .prominent)
            super.init(effect: blurEffect)
            alpha = 0
        } else {
            let customBlurClass: AnyObject.Type = NSClassFromString("_UICustomBlurEffect")!
            let customBlurObject: NSObject.Type = customBlurClass as! NSObject.Type
            blurEffect = customBlurObject.init() as! UIBlurEffect
            blurEffect.setValue(1.0, forKeyPath: "scale")
            blurEffect.setValue(radius, forKeyPath: "blurRadius")
            super.init(effect: radius == 0 ? nil : self.blurEffect)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setBlurRadius(_ radius: CGFloat) {
        if #available(iOS 14, *) {
            alpha = (radius == 0) ? 0 : 1
        } else {
            guard radius != blurRadius else { return }
            blurEffect.setValue(radius, forKeyPath: "blurRadius")
            self.effect = blurEffect
        }
    }
}

#endif
