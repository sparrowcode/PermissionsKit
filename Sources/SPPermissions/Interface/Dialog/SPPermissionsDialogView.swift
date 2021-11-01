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

class SPPermissionsDialogView: UIView {
    
    let closeButton = SPPermissionsDialogCloseButton()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let tableView = UITableView(frame: .zero, style: .plain)
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = UIColor.Compability.systemBackground
        layer.cornerRadius = 15
        layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        insetsLayoutMarginsFromSafeArea = false
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.textColor = UIColor.Compability.label
        
        addSubview(titleLabel)
        
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        subtitleLabel.textColor = UIColor.Compability.secondaryLabel
        addSubview(subtitleLabel)
        
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.delaysContentTouches = false
        tableView.insetsContentViewsToSafeArea = false
        tableView.preservesSuperviewLayoutMargins = false
        tableView.insetsLayoutMarginsFromSafeArea = false
        tableView.allowsSelection = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 45 + 10 - 5, bottom: 0, right: 0)
        tableView.alwaysBounceVertical = false
        tableView.layer.cornerRadius = layer.cornerRadius
        tableView.layer.masksToBounds = true
        addSubview(tableView)
        
        closeButton.iconView.areaColor = .clear
        addSubview(closeButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(in view: UIView) {
        var width = view.bounds.width - 20 * 2
        if view.bounds.width > view.bounds.height * 1.35 {
            if width > 550 { width = 550 }
        } else {
            if width > 380 { width = 380 }
        }
        var height = tableView.frame.origin.y + tableView.contentSize.height + 12
        let maxHeight = (view.bounds.height - view.layoutMargins.top - view.layoutMargins.bottom) * 0.85
        if height > maxHeight { height = maxHeight }
        bounds = CGRect.init(x: 0, y: 0, width: width, height: height)
        
        // Shadow
        
        let shadowPath = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 9, width: bounds.width, height: bounds.height), cornerRadius: layer.cornerRadius)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = Float(0.07)
        layer.shadowRadius = layer.cornerRadius
        layer.masksToBounds = false
        layer.shadowPath = shadowPath.cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let inset: CGFloat = 19
        let contentWidth = bounds.width - inset - inset
        let closeSide: CGFloat = 34
        closeButton.frame = CGRect.init(x: bounds.width - inset / 2.5 - closeSide, y: inset / 2.5, width: closeSide, height: closeSide)
        subtitleLabel.layoutDynamicHeight(x: inset, y: inset, width: contentWidth)
        titleLabel.layoutDynamicHeight(x: inset, y: subtitleLabel.frame.origin.y + subtitleLabel.frame.height + 2, width: contentWidth)
        let contentHeight = tableView.contentSize.height
        let maxHeight = bounds.height - tableView.frame.origin.y
        tableView.frame = CGRect.init(x: 0, y: titleLabel.frame.origin.y + titleLabel.frame.height + 2, width: bounds.width, height: min(contentHeight, maxHeight))
        tableView.layoutMargins = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        
        // RTL
        
        if effectiveUserInterfaceLayoutDirection == .rightToLeft {
            closeButton.frame.origin.x = inset / 2.5
        }
    }
}

#endif
