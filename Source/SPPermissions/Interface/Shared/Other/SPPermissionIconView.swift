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

import UIKit

#if os(iOS)
/**
 Draw with code icon for permission.
 */
public class SPPermissionIconView: UIView {
    
    /**
     Icon for this permission draw in view.
     */
    var permission: SPPermission { didSet { self.setNeedsDisplay() } }
    
    /**
     Color if icon.
     */
    public var color = SPPermissionsColor.base { didSet { self.setNeedsDisplay() } }
    
    init(_ permission: SPPermission) {
        self.permission = permission
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Using draw with code. No images.
     */
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        switch permission {
        case .camera:
            SPPermissionsDraw.drawCamera(frame: rect, resizing: .aspectFit, color: color)
        case .photoLibrary:
            SPPermissionsDraw.drawPhotos(frame: rect, resizing: .aspectFit, color: color)
        case .notification:
            SPPermissionsDraw.drawNotifications(frame: rect, resizing: .aspectFit, color: color)
        case .microphone:
            SPPermissionsDraw.drawMicrophone(frame: rect, resizing: .aspectFit, color: color)
        case .calendar:
            SPPermissionsDraw.drawCalendar(frame: rect, resizing: .aspectFit, color: color)
        case .contacts:
            SPPermissionsDraw.drawContacts(frame: rect, resizing: .aspectFit, color: color)
        case .reminders:
            SPPermissionsDraw.drawReminders(frame: rect, resizing: .aspectFit, color: color)
        case .speech:
            SPPermissionsDraw.drawSpeech(frame: rect, resizing: .aspectFit, color: color)
        case .locationWhenInUse:
            SPPermissionsDraw.drawLocations(frame: rect, resizing: .aspectFit, color: color)
        case .locationAlwaysAndWhenInUse:
            SPPermissionsDraw.drawLocations(frame: rect, resizing: .aspectFit, color: color)
        case .motion:
            SPPermissionsDraw.drawMotion(frame: rect, resizing: .aspectFit, color: color)
        case .mediaLibrary:
            SPPermissionsDraw.drawMedia(frame: rect, resizing: .aspectFit, color: color)
        case .bluetooth:
            SPPermissionsDraw.drawBluetooth(frame: rect, resizing: .aspectFit, color: color)
        }
    }
}
#endif
