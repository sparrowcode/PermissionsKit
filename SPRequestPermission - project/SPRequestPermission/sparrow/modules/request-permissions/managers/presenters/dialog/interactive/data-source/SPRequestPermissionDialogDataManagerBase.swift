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

public class SPRequestPermissionDialogInteractiveDataSource: SPRequestPermissionDialogInteractiveDataSourceInterface {
    
    func createControlForPermission(_ permission: SPRequestPermissionType) -> SPRequestPermissionTwiceControlInterface {

        var normalIconBezierPath = UIBezierPath()
        var title = String()
        
        switch permission {
        case .Camera:
            normalIconBezierPath = SPBezierPathFigure.icons.camera(width: 100)
            title = SPRequestPermissionData.texts.enable_camera()
        case .PhotoLibrary:
            normalIconBezierPath = SPBezierPathFigure.icons.photo_library(width: 100)
            title = SPRequestPermissionData.texts.enable_photoLibrary()
        case .Notification:
            normalIconBezierPath = SPBezierPathFigure.icons.notification(width: 100)
            title = SPRequestPermissionData.texts.enable_notification()
        }
        
        let normalImage = normalIconBezierPath.convertToImage(fill: true, stroke: false, color: UIColor.black)

        let checkedBezierPath  = SPBezierPathFigure.icons.checked(width: 100)
        let checkedImage = checkedBezierPath.convertToImage(fill: true, stroke: false, color: UIColor.black)
        
        return SPRequestPermissionTwiceControl(
            permissionType: permission,
            title: title,
            normalIconImage: normalImage ,
            selectedIconImage: checkedImage,
            normalColor: self.secondColor(),
            selectedColor: self.mainColor()
        )
    }
    
    func headerBackgroundView() -> UIView {
        let patternView = SPRequestPermissionData.views.patternView()
        let gradientView = SPGradientWithPictureView.init()
        gradientView.setGradient(
            from: SPRequestPermissionData.colors.gradient.dark.lightColor(),
            to: SPRequestPermissionData.colors.gradient.dark.darkColor(),
            startPoint: CGPoint.init(x: 0.5, y: 0),
            endPoint: CGPoint.init(x: 0.5, y: 1)
        )
        gradientView.pictureView = patternView
        return gradientView
    }
    
    func headerTitle() -> String {
        return SPRequestPermissionData.texts.title()
    }
    
    func headerSubtitle() -> String {
        return SPRequestPermissionData.texts.subtitile()
    }
    
    func topAdviceTitle() -> String {
        return SPRequestPermissionData.texts.advice()
    }
    
    func bottomAdviceTitle() -> String {
        return SPRequestPermissionData.texts.advice_additional()
    }
    
    func underDialogAdviceTitle() -> String {
        return SPRequestPermissionData.texts.swipe_for_hide()
    }
    
    func mainColor() -> UIColor {
        return UIColor.init(hex: "#27AEE8")
    }
    
    func secondColor() -> UIColor {
        return UIColor.white
    }
}


