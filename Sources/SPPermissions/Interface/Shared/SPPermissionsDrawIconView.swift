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
@available(iOSApplicationExtension, unavailable)
public class SPPermissionsDrawIconView: UIView {
    
    var permission: SPPermissions.Permission? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: - Init
    
    init() {
        super.init(frame: CGRect.zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        self.backgroundColor = UIColor.clear
    }
    
    // MARK: - Draw
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        switch permission?.type {
        case .camera:
            DrawService.drawCamera(frame: rect, resizing: .aspectFit, color: tintColor)
        case .photoLibrary:
            DrawService.drawPhotos(frame: rect, resizing: .aspectFit, color: tintColor)
        case .notification:
            DrawService.drawNotifications(frame: rect, resizing: .aspectFit, color: tintColor)
        case .microphone:
            DrawService.drawMicrophone(frame: rect, resizing: .aspectFit, color: tintColor)
        case .calendar:
            DrawService.drawCalendar(frame: rect, resizing: .aspectFit, color: tintColor)
        case .contacts:
            DrawService.drawContacts(frame: rect, resizing: .aspectFit, color: tintColor)
        case .reminders:
            DrawService.drawReminders(frame: rect, resizing: .aspectFit, color: tintColor)
        case .speech:
            DrawService.drawSpeech(frame: rect, resizing: .aspectFit, color: tintColor)
        case .locationWhenInUse:
            DrawService.drawLocations(frame: rect, resizing: .aspectFit, color: tintColor)
        case .locationAlways:
            DrawService.drawLocations(frame: rect, resizing: .aspectFit, color: tintColor)
        case .motion:
            DrawService.drawMotion(frame: rect, resizing: .aspectFit, color: tintColor)
        case .mediaLibrary:
            DrawService.drawMedia(frame: rect, resizing: .aspectFit, color: tintColor)
        case .bluetooth:
            DrawService.drawBluetooth(frame: rect, resizing: .aspectFit, color: tintColor)
        case .tracking:
            DrawService.drawTracking(frame: rect, resizing: .aspectFit, color: tintColor)
        case .faceID, .siri, .health:
            // Not implemented old style icons.
            break
        case .none:
            break
        }
    }
}

#endif
