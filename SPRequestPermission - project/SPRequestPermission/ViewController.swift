//
//  ViewController.swift
//  SPRequestPermission
//
//  Created by Ivan Vorobei on 2/16/17.
//  Copyright © 2017 Ivan Vorobei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let permissionAssistant = SPRequestPermissionAssistant.modules.dialog.interactive.init(with: [.Camera, .PhotoLibrary, .Notification])

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(hex: "#00A3E8")
        self.patternView.setRhombusPattern()
        self.patternView.color = UIColor.white
        self.patternView.alpha = 0.1
        self.patternView.cellWidthMax = 70
    }
    
    @IBAction func tapPresentAction(_ sender: Any) {
        permissionAssistant.present(on: self)
    }
    
    //Mark: - Other
    @IBOutlet weak var patternView: SPPatternView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

