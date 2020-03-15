// The MIT License (MIT)
// Copyright © 2019 Ivan Varabei (varabeis@icloud.com)
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

#if SPPERMISSION_NOTIFICATION

import UIKit
import UserNotifications

struct SPNotificationPermission: SPPermissionProtocol {
    
    var isAuthorized: Bool {
        guard let authorizationStatus = fetchAuthorizationStatus() else { return false }
        return authorizationStatus == .authorized
    }
    
    var isDenied: Bool {
        guard let authorizationStatus = fetchAuthorizationStatus() else { return false }
        return authorizationStatus == .denied
    }
    
    private func fetchAuthorizationStatus() -> UNAuthorizationStatus? {
        var notificationSettings: UNNotificationSettings?
        let semaphore = DispatchSemaphore(value: 0)
        
        DispatchQueue.global().async {
            UNUserNotificationCenter.current().getNotificationSettings { setttings in
                notificationSettings = setttings
                semaphore.signal()
            }
        }
        
        semaphore.wait()
        return notificationSettings?.authorizationStatus
    }
    
    func request(completion: @escaping ()->()?) {
        if #available(iOS 10.0, tvOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in
                DispatchQueue.main.async {
                    completion()
                }
            }
        } else {
            #if os(iOS)
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
            #endif
            DispatchQueue.main.async {
                completion()
            }
        }
        
        UIApplication.shared.registerForRemoteNotifications()
    }
}

#endif
