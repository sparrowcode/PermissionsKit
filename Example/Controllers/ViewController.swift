import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        SPPermissions.request(mode: .native, permissions: [.notification])
    }
}

