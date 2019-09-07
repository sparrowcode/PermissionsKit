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

class SPController: SPStatusBarManagerController {
    
    let emptyTitlesView = SPEmptyLabelsView(title: "No Data", subtitle: "No data or information")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emptyTitlesView.isHidden = true
        self.view.addSubview(self.emptyTitlesView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.updateLayout(with: self.view.frame.size)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    
    func updateLayout(with size: CGSize) {
        self.emptyTitlesView.layout(centerY: size.height / 2)
    }
    
    func addHideButton(title: String) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(
            title: title,
            style: UIBarButtonItem.Style.done,
            target: self,
            action: #selector(self.dismiss(sender:))
        )
    }
    
    @objc func dismiss(sender: Any) {
        self.dismiss()
    }
}
