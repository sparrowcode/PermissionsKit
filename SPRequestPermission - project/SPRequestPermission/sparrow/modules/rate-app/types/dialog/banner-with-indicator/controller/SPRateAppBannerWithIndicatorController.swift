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

class SPRateAppBannerWithIndicatorController: SPIndicationBannerController<UILabel> {
    
    var rateAppDataSource: SPRateAppBannerWithIndicatorDataSourceInterface
    weak var eventsDelegate: SPRateAppEventsDelegate?
    var applicationID: String
    
    init(applicationID: String, dataSource: SPRateAppBannerWithIndicatorDataSourceInterface) {
        self.applicationID = applicationID
        self.rateAppDataSource = dataSource
        super.init()
        self.dataSource = self
        self.delegate = self
        
        self.bottomView.font = UIFont.fonts.AvenirNext(type: .Regular, size: 12)
        self.bottomView.textColor = UIColor.white
        self.bottomView.setShadowOffsetForLetters(heightOffset: 1, opacity: 0.4)
        self.bottomView.setCenteringAlignment()
        self.bottomView.numberOfLines = 0
        self.bottomView.text = self.rateAppDataSource.bottomAdviceTitle()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func tapButton() {
        if self.listView.subviews.count == Int(1) {
            SPRateApp.rateApp(id: applicationID)
        }
        
        presentNextStage()
    }
    
    fileprivate func createAlertView(title: String, buttonTitle: String) -> SPRateAppBannerWithIndicatorAlertView {
        let alertView = SPRateAppBannerWithIndicatorAlertView.init(title: title, buttonTitle: buttonTitle, firstColor: self.rateAppDataSource.mainColor(), secondColor: self.rateAppDataSource.secondColor())
        return alertView
    }
}

extension SPRateAppBannerWithIndicatorController: SPIndicationBannerControllerDataSource {

    func titleForListStagesAt(index: Int) -> String? {
        switch index {
        case 0:
            return self.rateAppDataSource.titleFirstStageOnList()
        case 1:
            return self.rateAppDataSource.titleSecondStageOnList()
        default:
            return ""
        }
    }
    
    func alertViewAt(index: Int) -> UIView {
        var view: SPRateAppBannerWithIndicatorAlertView!
        switch index {
        case 0:
            view = self.createAlertView(title: self.rateAppDataSource.titleFirstStageOnAlert(), buttonTitle: self.rateAppDataSource.titleButtonFirstStage())
            break
        case 1:
            view = self.createAlertView(title: self.rateAppDataSource.titleSecondStageOnAlert(), buttonTitle: self.rateAppDataSource.titleButtonSecondStage())
            break
        default:
            return UIView()
        }
        view.button.addTarget(self, action: #selector(self.tapButton), for: .touchUpInside)
        return view
    }
    
    func countStages() -> Int {
        return 2
    }
}

extension SPRateAppBannerWithIndicatorController: SPIndicationBannerControllerDelegate {
    
    func didHide() {
        self.eventsDelegate?.didHide()
    }
}
