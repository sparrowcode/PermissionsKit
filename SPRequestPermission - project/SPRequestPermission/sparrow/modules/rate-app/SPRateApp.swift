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
import StoreKit

//MARK: - Interface
public struct SPRateApp {
    
    static fileprivate let maxAttempts: Int = 3
    static fileprivate let expireDateKey: String = "SPRateAppExpireDateKey"
    static fileprivate let daysIntervalKey: String = "SPRateAppDaysIntervalKey"
    static fileprivate let countPresentedNativeDialogKey: String = "SPRateAppCountPresentedNativeDialogKey"
    
    static public func isShowDialog() -> Bool {
        let dateUnwrap = UserDefaults.standard.object(forKey: self.expireDateKey)
        if let date = dateUnwrap as? Date {
            if date < Date.init(timeIntervalSinceNow: 0) {
                return true
            } else {
                print("SPRateApp - Time not expired, not present")
                return false
            }
        } else {
            setBaseTimeInterval()
            print("SPRateApp - Not Set Time Interval. We set dafault value")
            return true
        }
    }
    
    static fileprivate func isAvailableNativeDialog() -> Bool {
        let countUnwrap = UserDefaults.standard.object(forKey: self.countPresentedNativeDialogKey)
        if let count = countUnwrap as? Int {
            if count > 0 {
                return true
            } else {
                return false
            }
        } else {
            UserDefaults.standard.set(Int(self.maxAttempts), forKey: self.countPresentedNativeDialogKey)
            return true
        }
    }
    
    static fileprivate func didPresentedNativeDialog() {
        let countUnwrap = UserDefaults.standard.object(forKey: self.countPresentedNativeDialogKey)
        if let count = countUnwrap as? Int {
            var newCount = count - 1
            newCount.setIfFewer(when: 0)
            UserDefaults.standard.set(Int(newCount), forKey: self.countPresentedNativeDialogKey)
        } else {
            UserDefaults.standard.set(Int(self.maxAttempts), forKey: self.countPresentedNativeDialogKey)
        }
    }
    
    static public func setBaseTimeInterval() {
        UserDefaults.standard.set(3, forKey: self.daysIntervalKey)

        let dateUnwrap = UserDefaults.standard.object(forKey: self.expireDateKey)
        
        if (dateUnwrap as? Date) == nil {
            self.setExpireDate()
        }
    }
    
    static public func setTimeInterval(days: Int) {
        UserDefaults.standard.set(days, forKey: self.daysIntervalKey)
        
        let dateUnwrap = UserDefaults.standard.object(forKey: self.expireDateKey)
        
        if (dateUnwrap as? Date) == nil {
            self.setExpireDate()
        }
    }
    
    static fileprivate func setExpireDate() {
        if UserDefaults.standard.value(forKey: daysIntervalKey) == nil {
            self.setBaseTimeInterval()
        }

        let countDays = UserDefaults.standard.integer(forKey: daysIntervalKey)
        let timeInterval: TimeInterval = TimeInterval(countDays * 24 * 60 * 60)
        let expireDate = Date.init(timeIntervalSinceNow: timeInterval)
        UserDefaults.standard.set(expireDate, forKey: self.expireDateKey)
    }
    
    static public func openPageInAppStore(id: String) {
        let appID = id
        
        if let checkURL = URL(string: "http://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(appID)&pageNumber=0&sortOrdering=2&type=Purple+Software&mt=8") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(checkURL, options: [:])
            } else {
                UIApplication.shared.openURL(checkURL)
            }
        } else {
            print("SPRateApp - Invalid AppID")
        }
    }
    
    static public func rateApp(id: String) {
        if SPRateApp.isAvailableNativeDialog() {
            if #available(iOS 10.3, *) {
                SKStoreReviewController.requestReview()
                SPRateApp.didPresentedNativeDialog()
            } else {
                delay(1, closure: {
                    self.openPageInAppStore(id: id)
                })
            }
        } else {
            delay(1, closure: {
                self.openPageInAppStore(id: id)
            })
        }
    }
    
    private init() {}
}

//MARK: - Modules
extension SPRateApp {
    
    public struct dialog {
        
        public struct bannerWithIndicator {
            
            static public func present(
                on viewController: UIViewController,
                applicationID: String,
                dataSource: SPRateAppBannerWithIndicatorDataSourceInterface = SPRateAppBannerWithIndicatorDataSource(),
                delegate: SPRateAppEventsDelegate? = nil) {

                SPRateApp.setExpireDate()
                let controller = SPRateAppBannerWithIndicatorController.init(applicationID: applicationID, dataSource: dataSource)
                controller.eventsDelegate = delegate
                controller.present(on: viewController)
            }
            
            private init() {}
        }
        
        private init() {}
    }
}
