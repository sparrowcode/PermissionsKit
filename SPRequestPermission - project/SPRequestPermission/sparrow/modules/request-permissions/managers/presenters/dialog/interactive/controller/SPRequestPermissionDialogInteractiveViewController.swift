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

public class SPRequestPermissionDialogInteractiveViewController: SPDialogSwipeController<SPRequestPermissionDialogInteractiveView, UILabel> {
    
    public var presenter: SPRequestPermissionDialogInteractivePresenterDelegate
    
    init(presenter: SPRequestPermissionDialogInteractivePresenterDelegate) {
        self.presenter = presenter
        super.init(dialogView: SPRequestPermissionDialogInteractiveView())
        self.presenter.viewController = self
        self.delegate = self
        self.dialogViewMaxWidth = 300
        self.dialogViewMaxHeight = 450
        self.dialogViewWidthRelativeFactor = 0.8
        self.dialogViewHeightRelativeFactor = 0.8
        self.dialogViewSidesRelativeFactor = 0.667
        self.dialogViewPortraitYtranslationFactor = 0.96
        self.dialogViewLandscapeYtranslationFactor = 1
        
        self.bottomView.font = UIFont.init(
            name: SPRequestPermissionData.fonts.base() + "-Regular",
            size: 12
        )
        self.bottomView.textColor = UIColor.white
        self.bottomView.setShadowOffsetForLetters(heightOffset: 1, opacity: 0.4)
        self.bottomView.setCenteringAlignment()
        self.bottomView.numberOfLines = 0
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.dialogView.backgroundColor = UIColor.white
    }
    
    override public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (context) in
            self.dialogView.layoutIfNeeded()
        }, completion: nil)
    }
}

extension SPRequestPermissionDialogInteractiveViewController: SPRequestPermissionDialogInteractiveViewControllerInterface {
    
    public func hide() {
        self.hide(withDialog: true)
    }
    
    public func addControl(_ control: SPRequestPermissionTwiceControlInterface) {
        control.addAsSubviewTo(self.dialogView.buttonsContainerView)
    }
    
    public func setHeaderBackgroundView(_ view: UIView) {
        self.dialogView.headerView.setBackgroundView(view)
    }
    
    public func setHeaderTitle(_ title: String) {
        self.dialogView.headerView.titleLabel.text = title
        self.dialogView.layoutSubviews()
    }
    
    public func setHeaderSubtitle(_ title: String) {
        self.dialogView.headerView.subtitleLabel.text = title
        self.dialogView.layoutSubviews()
    }
    
    public func setTopTitle(_ title: String) {
        self.dialogView.topLabel.text = title
        self.dialogView.layoutSubviews()
    }
    
    public func setBottomTitle(_ title: String) {
        self.dialogView.bottomLabel.text = title
        self.dialogView.layoutSubviews()
    }
    
    public func setUnderDialogTitle(_ title: String) {
        self.bottomView.text = title
    }
}

extension SPRequestPermissionDialogInteractiveViewController: SPDialogSwipeControllerDelegate {
    
    internal var isEnableHideDialogController: Bool {
        return true
    }
    
    func didHideDialogController() {
        self.presenter.didHide()
    }
}


