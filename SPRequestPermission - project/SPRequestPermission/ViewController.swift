//
//  ViewController.swift
//  SPRequestPermission
//
//  Created by Ivan Vorobei on 2/16/17.
//  Copyright © 2017 Ivan Vorobei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    let permissionAssistant = SPRequestPermissionAssistant.modules.dialog.interactive.init(with: [.Camera, .PhotoLibrary, .Notification])

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapPresentAction(_ sender: Any) {
        permissionAssistant.present(on: self)
    }
}

