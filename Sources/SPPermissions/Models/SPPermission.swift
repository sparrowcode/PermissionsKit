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

@objc public enum SPPermission: Int {
    
    // MARK: iOS Permissions
    
    #if os(iOS)
    
    @available(iOS 11.0, macCatalyst 14.0, *)
    case camera = 0
    
    case photoLibrary = 1
    case microphone = 3
    case calendar = 4
    case contacts = 5
    case reminders = 6
    case speech = 7
    case locationAlwaysAndWhenInUse = 10
    case motion = 11
    case mediaLibrary = 12
    case bluetooth = 13
    
    @available(iOS 14.5, *)
    case tracking = 14
    
    #endif
    
    // MARK: Shared Permissions
    
    case notification = 2
    case locationWhenInUse = 9
    
    // MARK: - Status
    
    public var authorized: Bool {
        let manager = SPPermissions.manager(for: self)
        return manager.status == .authorized
    }
    
    public var denied: Bool {
        let manager = SPPermissions.manager(for: self)
        return manager.status == .denied
    }
    
    public var notDetermined: Bool {
        let manager = SPPermissions.manager(for: self)
        return manager.status == .notDetermined
    }
    
    // MARK: - Texts
    
    public var name: String {
        return SPTexts.permission_name(self)
    }
}
