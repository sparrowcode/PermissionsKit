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

enum PresenterService {
    
    @available(iOSApplicationExtension, unavailable)
    static func presentAlertAboutDeniedPermission(_ permission: SPPermissions.Permission, dataSource: SPPermissionsDataSource?, on controller: UIViewController) {
        
        let data = dataSource?.deniedAlertTexts(for: permission)
        
        /*
         Text is nil and data sources was set.
         So developer special return nil for alert texts.
         In this case developer don't want show alert.
         */
        if (data == nil) && (dataSource != nil) { return }
        let texts = data ?? SPPermissionsDeniedAlertTexts.default
        
        let alertController = UIAlertController(title: texts.titleText, message: texts.descriptionText, preferredStyle: .alert)
        alertController.addAction(.init(title: texts.cancelText, style: .cancel))
        alertController.addAction(.init(title: texts.actionText, style: .default, handler: { _ in
            permission.openSettingPage()
        }))
        controller.present(alertController, animated: true, completion: nil)
    }
}
