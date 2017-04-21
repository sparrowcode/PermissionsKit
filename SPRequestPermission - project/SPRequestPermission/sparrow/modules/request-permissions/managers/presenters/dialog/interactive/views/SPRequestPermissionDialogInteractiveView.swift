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

public class SPRequestPermissionDialogInteractiveView: UIView {
    
    let headerView: SPBannerWithTitlesView = SPBannerWithTitlesView()
    let topLabel: UILabel = UILabel()
    let buttonsContainerView: SPCenteringAligmentView = SPCenteringAligmentView.init(aliment: .vertical)
    let bottomLabel: UILabel = UILabel()
    
    init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.white
        self.addSubview(self.buttonsContainerView)
        self.addSubview(self.topLabel)
        self.addSubview(self.bottomLabel)
        self.addSubview(self.headerView)
        self.headerView.backgroundColor  = UIColor.clear
        self.headerView.titleLabel.textColor = UIColor.white
        self.headerView.titleLabel.font = UIFont.init(
            name: SPRequestPermissionData.fonts.base() + "-Regular",
            size: 24
        )
        self.headerView.titleLabel.minimumScaleFactor = 0.5
        self.headerView.subTitleLabel.textColor = UIColor.white
        self.headerView.subTitleLabel.font = UIFont.init(
            name: SPRequestPermissionData.fonts.base() + "-Medium",
            size: 12
        )
        self.headerView.subTitleLabel.minimumScaleFactor = 0.5
        self.headerView.subTitleLabel.numberOfLines = 0
        self.topLabel.setCenteringAlignment()
        self.topLabel.textColor = UIColor.black.withAlphaComponent(0.65)
        self.topLabel.font = UIFont.init(
            name: SPRequestPermissionData.fonts.base() + "-Regular",
            size: 12
        )
        self.topLabel.numberOfLines = 0
        self.bottomLabel.setCenteringAlignment()
        self.bottomLabel.textColor = UIColor.black.withAlphaComponent(0.4)
        self.bottomLabel.font = UIFont.init(
            name: SPRequestPermissionData.fonts.base() + "-Regular",
            size: 10
        )
        self.bottomLabel.numberOfLines = 0
        self.buttonsContainerView.maxItemSideSize = 50
        self.buttonsContainerView.spaceFactor = 0.055
        self.buttonsContainerView.minSpace = 8
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.updateLayoutAndSizes()
    }
    
    private func updateLayoutAndSizes() {
        
        self.layer.cornerRadius = self.frame.width * 0.013
        
        let width = self.frame.width
        let heigth = self.frame.height
        
        let isPortraitLayout = heigth > width * 1.3
        
        self.topLabel.sizeToFit()
        self.bottomLabel.sizeToFit()
        
        if isPortraitLayout {
            self.headerView.frame = CGRect.init(x: 0, y: 0, width: width, height: heigth * self.getHeadersHeightFactor(countElements: self.buttonsContainerView.subviews.count))
            
            self.topLabel.frame = CGRect.init(
                x: 0, y: self.headerView.frame.height,
                width: width * 0.7,
                height: self.frame.height * 0.138
            )
            self.topLabel.center.x = self.frame.width / 2
            
            let bottomLabelHeigth = self.frame.height * 0.094
            self.bottomLabel.frame = CGRect.init(x: 0, y: heigth - bottomLabelHeigth, width: width * 0.8, height: bottomLabelHeigth)
            self.bottomLabel.center.x = width / 2
            
            let buttonsContainerViewHeigth = heigth - (self.headerView.frame.height + self.topLabel.frame.height + self.bottomLabel.frame.height)
            let buttonsContainerViewWidth = width * 0.84
            
            self.buttonsContainerView.frame = CGRect.init(
                x: (width - buttonsContainerViewWidth) / 2,
                y: self.headerView.frame.height + self.topLabel.frame.height,
                width: buttonsContainerViewWidth,
                height: buttonsContainerViewHeigth
            )
        } else {
            var widthFactor: CGFloat = 0.4
            if self.buttonsContainerView.subviews.count == 0 {
                widthFactor = 1
            }
            self.headerView.frame = CGRect.init(
                x: 0, y: 0,
                width: width * widthFactor,
                height: heigth
            )
            self.topLabel.frame = CGRect.init(
                x: 0, y: 0,
                width: (width - self.topLabel.frame.width) * 0.8,
                height: self.frame.height * 0.26
            )
            self.topLabel.center.x = width - ((width - self.headerView.frame.width) / 2)
            
            let bottomLabelHeigth = self.frame.height * 0.16
            self.bottomLabel.frame = CGRect.init(
                x: 0, y: heigth - bottomLabelHeigth,
                width: width * 0.87,
                height: bottomLabelHeigth
            )
            self.bottomLabel.center.x = width - ((width - self.headerView.frame.width) / 2)
            
            let buttonsContainerViewHeigth = heigth - (self.topLabel.frame.height + self.bottomLabel.frame.height)
            let buttonsContainerViewWidth = (width - self.headerView.frame.width) * 0.84
            self.buttonsContainerView.frame = CGRect.init(
                x: 0, y: self.topLabel.frame.height,
                width: buttonsContainerViewWidth,
                height: buttonsContainerViewHeigth
            )
            self.buttonsContainerView.center.x = width - ((width - self.headerView.frame.width) / 2)
        }
    }
    
    private func getHeadersHeightFactor(countElements: Int) -> CGFloat {
        switch countElements {
        case 0:
            return 1
        case 1:
            return 0.64
        case 2:
            return 0.48
        case 3:
            return 0.42
        case countElements where countElements > 4:
            return 0.24
        default:
            return 0.36
        }
    }
}
