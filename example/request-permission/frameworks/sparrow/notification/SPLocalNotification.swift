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
import UserNotifications

struct SPLocalNotification {
    
    static func add(from timeInterval: TimeInterval, body: String, title: String? = nil, identifier: String? = nil) {
        
        let content = UNMutableNotificationContent()
        content.body = body
        content.title = title ?? ""
        content.badge = NSNumber(value: SPBadge.number + 1)
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let identifier = identifier ?? "\(timeInterval)\(body)\(Int.random(min: 0, max: 1000))"
        
        let notification = UNNotificationRequest(
            identifier: identifier,
            content: content,
            trigger: trigger
        )
        
        let center = UNUserNotificationCenter.current()
        center.add(notification) { (error) in
            if let error = error {
                print("SPLocalNotification - \(error)")
            }
        }
    }
    
    static func add(in date: Date, body: String, title: String? = nil, identifier: String? = nil) {
        
        let content = UNMutableNotificationContent()
        content.body = body
        content.title = title ?? ""
        content.badge = NSNumber(value: SPBadge.number + 1)
        content.sound = UNNotificationSound.default
        
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: triggerDate, repeats: false)
        
        let identifier = identifier ?? "\(date)\(body)\(Int.random(min: 0, max: 1000))"
        
        let notification = UNNotificationRequest(
            identifier: identifier,
            content: content,
            trigger: trigger
        )
        
        let center = UNUserNotificationCenter.current()
        center.add(notification) { (error) in
            if let error = error {
                print("SPLocalNotification - \(error)")
            }
        }
    }
    
    static func remove(identifier: String) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
    
    private init() {}
}
