import UIKit

enum Presenter {
    
    static func presentAlertAboutDeniedPermission(_ permission: SPPermissions.Permission, dataSource: SPPermissionsDataSource?, on controller: UIViewController) {
        
        let data = dataSource?.deniedAlertTexts(for: permission)
        
        /*
         Text is nil and data sources was set.
         So developer special return nil for alert texts.
         In this case developer don't want show alert.
         */
        if (data == nil) && (dataSource != nil) { return }
        let texts = data ?? SPPermissionDeniedAlertTexts.default
        
        let alertController = UIAlertController(title: texts.titleText, message: texts.descriptionText, preferredStyle: .alert)
        alertController.addAction(.init(title: texts.cancelText, style: .cancel))
        alertController.addAction(.init(title: texts.buttonText, style: .default, handler: { _ in
            OpenService.openSettings()
        }))
        controller.present(alertController, animated: true, completion: nil)
    }
}
