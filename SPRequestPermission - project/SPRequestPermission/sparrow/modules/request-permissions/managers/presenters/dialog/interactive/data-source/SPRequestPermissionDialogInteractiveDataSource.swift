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

open class SPRequestPermissionDialogInteractiveDataSource: NSObject, SPRequestPermissionDialogInteractiveDataSourceInterface {
    
    open func iconForNormalPermissionControl(_ permission: SPRequestPermissionType) -> UIImage {
        var iconBezierPath = UIBezierPath()
        let requestWidth: CGFloat = 100
        switch permission {
        case .camera:
            iconBezierPath = SPBezierPathFigure.icons.camera()
        case .photoLibrary:
            iconBezierPath = SPBezierPathFigure.icons.photo_library()
        case .notification:
            iconBezierPath = SPBezierPathFigure.icons.notification()
        case .microphone:
            iconBezierPath = SPBezierPathFigure.icons.microphone()
        case .calendar:
            iconBezierPath = SPBezierPathFigure.icons.calendar()
        case .locationWhenInUse:
            iconBezierPath = SPBezierPathFigure.icons.location()
        case .locationAlways:
            iconBezierPath = SPBezierPathFigure.icons.location()
        case .locationWithBackground:
            iconBezierPath = SPBezierPathFigure.icons.location()
        case .contacts:
            iconBezierPath = SPBezierPathFigure.icons.contacts()
        case .reminders:
            iconBezierPath = SPBezierPathFigure.icons.reminders()
        }

        iconBezierPath.resizeTo(width: requestWidth)
        return iconBezierPath.convertToImage(fill: true, stroke: false, color: UIColor.black)
    }
    
    open func iconForAllowedPermissionControl(_ permission: SPRequestPermissionType) -> UIImage {
        let requestWidth: CGFloat = 100
        let checkedBezierPath  = SPBezierPathFigure.icons.checked()
        checkedBezierPath.resizeTo(width: requestWidth)
        return checkedBezierPath.convertToImage(fill: true, stroke: false, color: UIColor.black)
    }
    
    open func titleForPermissionControl(_ permission: SPRequestPermissionType) -> String {
        var title = String()
        switch permission {
        case .camera:
            title = SPRequestPermissionData.texts.enable_camera()
        case .photoLibrary:
            title = SPRequestPermissionData.texts.enable_photoLibrary()
        case .notification:
            title = SPRequestPermissionData.texts.enable_notification()
        case .microphone:
            title = SPRequestPermissionData.texts.enable_microphone()
        case .calendar:
            title = SPRequestPermissionData.texts.enable_calendar()
        case .locationWhenInUse:
            title = SPRequestPermissionData.texts.enable_location()
        case .locationAlways:
            title = SPRequestPermissionData.texts.enable_location()
        case .locationWithBackground:
            title = SPRequestPermissionData.texts.enable_location()
        case .contacts:
            title = SPRequestPermissionData.texts.enable_contacts()
        case .reminders:
            title = SPRequestPermissionData.texts.enable_reminedrs()
        }
        return title
    }
    
    open func headerBackgroundView() -> UIView {
        let patternView = SPRequestPermissionData.views.patternView()
        let gradientView = SPGradientWithPictureView.init()
        gradientView.startColor = SPRequestPermissionData.colors.gradient.dark.lightColor()
        gradientView.endColor = SPRequestPermissionData.colors.gradient.dark.darkColor()
        gradientView.startColorPoint = CGPoint.init(x: 0.5, y: 0)
        gradientView.endColorPoint = CGPoint.init(x: 0.5, y: 1)
        gradientView.pictureView = patternView
        return gradientView
    }
    
    open func headerTitle() -> String {
        return SPRequestPermissionData.texts.title()
    }
    
    open func headerSubtitle() -> String {
        return SPRequestPermissionData.texts.subtitile()
    }
    
    open func topAdviceTitle() -> String {
        return SPRequestPermissionData.texts.advice()
    }
    
    open func bottomAdviceTitle() -> String {
        return SPRequestPermissionData.texts.advice_additional()
    }
    
    open func underDialogAdviceTitle() -> String {
        return SPRequestPermissionData.texts.swipe_for_hide()
    }
    
    open func titleForAlertDenidPermission() -> String {
        return SPRequestPermissionData.texts.titleForDenidPermission()
    }
    
    open func subtitleForAlertDenidPermission() -> String {
        return SPRequestPermissionData.texts.subtitleForDenidPermission()
    }

    open func cancelForAlertDenidPermission() -> String {
        return SPRequestPermissionData.texts.cancel()
    }
    
    open func settingForAlertDenidPermission() -> String {
        return SPRequestPermissionData.texts.settings()
    }
    
    open func mainColor() -> UIColor {
        return UIColor.init(hex: "#27AEE8")
    }
    
    open func secondColor() -> UIColor {
        return UIColor.white
    }
}


