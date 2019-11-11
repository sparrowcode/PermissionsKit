import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.systemBackground
        } else {
            view.backgroundColor = UIColor.white
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        /*let controller = SPPermissions.list([.calendar, .camera, .contacts])
        
        controller.dataSource = self
        controller.delegate = self
        
        controller.title = ""
        controller.headerText = ""
        controller.footerText = ""
        
        controller.present(on: self)*/
    }
}

