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

class SPNativeTableController: SPTableController {
    
    let labelTableViewCellIdentifier: String = "labelTableViewCellIdentifier"
    let textFieldTableViewCellIdentifier: String = "textFieldTableViewCellIdentifier"
    let buttonTableViewCellIdentifier: String = "buttonTableViewCellIdentifier"
    let textTableViewCellIdentifier: String = "textTableViewCellIdentifier"
    let textInputTableViewCellIdentifier: String = "textInputTableViewCellIdentifier"
    let promoTableViewCellIdentifier: String = "promoTableViewCellIdentifier"
    let featuredTitleTableViewCellIdentifier: String = "featuredTitleTableViewCellIdentifier"
    let mailTableViewCellIdentifier: String = "mailTableViewCellIdentifier"
    let imageTableViewCellIdentifier: String = "imageTableViewCellIdentifier"
    let proposeTableViewCellIdentifier: String = "proposeTableViewCellIdentifier"
    let mengTransformTableViewCell = "mengTransformTableViewCell"
    
    var showTopInsets: Bool = true
    var showBottomInsets: Bool = true
    var autoTopSpace: Bool = true
    var autoBottomSpace: Bool = true
    
    private var autoSpaceHeight: CGFloat = 35
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.statusBar = .dark
        
        self.tableView = UITableView.init(frame: self.view.bounds, style: UITableView.Style.grouped)
        self.setPrefersLargeNavigationTitle("Title")
        
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .always
        }
        
        self.tableView.backgroundColor = SPNativeColors.customGray
        self.tableView.delaysContentTouches = false
        self.tableView.allowsSelection = false
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.sectionFooterHeight = UITableView.automaticDimension
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
        
        self.tableView.register(SPFormTextFiledTableViewCell.self, forCellReuseIdentifier: self.textFieldTableViewCellIdentifier)
        self.tableView.register(SPFormLabelTableViewCell.self, forCellReuseIdentifier: self.labelTableViewCellIdentifier)
        self.tableView.register(SPFormButtonTableViewCell.self, forCellReuseIdentifier: self.buttonTableViewCellIdentifier)
        self.tableView.register(SPFormTextTableViewCell.self, forCellReuseIdentifier: self.textTableViewCellIdentifier)
        self.tableView.register(SPFormTextInputTableViewCell.self, forCellReuseIdentifier: self.textInputTableViewCellIdentifier)
        self.tableView.register(SPPromoTableViewCell.self, forCellReuseIdentifier: self.promoTableViewCellIdentifier)
        self.tableView.register(SPFormFeaturedTitleTableViewCell.self, forCellReuseIdentifier: self.featuredTitleTableViewCellIdentifier)
        self.tableView.register(SPFormMailTableViewCell.self, forCellReuseIdentifier: self.mailTableViewCellIdentifier)
        self.tableView.register(SPImageTableViewCell.self, forCellReuseIdentifier: self.imageTableViewCellIdentifier)
        self.tableView.register(SPProposeTableViewCell.self, forCellReuseIdentifier: self.proposeTableViewCellIdentifier)
        self.tableView.register(SPMengTransformTableViewCell.self, forCellReuseIdentifier: self.mengTransformTableViewCell)
        
        self.activityIndicatorView.stopAnimating()
        self.activityIndicatorView.color = SPNativeColors.gray
        self.view.addSubview(self.activityIndicatorView)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return super.numberOfSections(in: tableView)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("SPNativeTableViewController - need ivveride cellForRowAt")
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return nil
    }
    
    func dequeueTextFiledTableViewCell(indexPath: IndexPath) -> SPFormTextFiledTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: self.textFieldTableViewCellIdentifier, for: indexPath as IndexPath) as! SPFormTextFiledTableViewCell
    }
    
    func dequeueLabelTableViewCell(indexPath: IndexPath) -> SPFormLabelTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: self.labelTableViewCellIdentifier, for: indexPath as IndexPath) as! SPFormLabelTableViewCell
    }
    
    func dequeueButtonTableViewCell(indexPath: IndexPath) -> SPFormButtonTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: self.buttonTableViewCellIdentifier, for: indexPath as IndexPath) as! SPFormButtonTableViewCell
    }
    
    func dequeueTextTableViewCell(indexPath: IndexPath) -> SPFormTextTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: self.textTableViewCellIdentifier, for: indexPath as IndexPath) as! SPFormTextTableViewCell
    }
    
    func dequeueTextInputTableViewCell(indexPath: IndexPath) -> SPFormTextInputTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.textInputTableViewCellIdentifier, for: indexPath as IndexPath) as! SPFormTextInputTableViewCell
        cell.currentIndexPath = indexPath
        return cell
    }
    
    func dequeuePromoTableViewCell(indexPath: IndexPath? = nil) -> SPPromoTableViewCell {
        if indexPath == nil {
            return tableView.dequeueReusableCell(withIdentifier: self.promoTableViewCellIdentifier) as! SPPromoTableViewCell
        } else {
            return tableView.dequeueReusableCell(withIdentifier: self.promoTableViewCellIdentifier, for: indexPath! as IndexPath) as! SPPromoTableViewCell
        }
    }
    
    func dequeueFeaturedTitleTableViewCell(indexPath: IndexPath) -> SPFormFeaturedTitleTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: self.featuredTitleTableViewCellIdentifier, for: indexPath as IndexPath) as! SPFormFeaturedTitleTableViewCell
    }
    
    func dequeueMailTableViewCell(indexPath: IndexPath) -> SPFormMailTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.mailTableViewCellIdentifier, for: indexPath as IndexPath) as! SPFormMailTableViewCell
        cell.currentIndexPath = indexPath
        return cell
    }
    
    func dequeueImageTableViewCell(indexPath: IndexPath) -> SPImageTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.imageTableViewCellIdentifier, for: indexPath as IndexPath) as! SPImageTableViewCell
        cell.currentIndexPath = indexPath
        return cell
    }
    
    func dequeueProposeTableViewCell(indexPath: IndexPath) -> SPProposeTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: self.proposeTableViewCellIdentifier, for: indexPath as IndexPath) as! SPProposeTableViewCell
    }
    
    func dequeueMengTransformTableViewCell(indexPath: IndexPath) -> SPMengTransformTableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: self.mengTransformTableViewCell, for: indexPath as IndexPath) as! SPMengTransformTableViewCell
    }
}

//MARK: - manage selection
extension SPNativeTableController {
    
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        
        if let _ = tableView.cellForRow(at: indexPath) as? SPFormFeaturedTitleTableViewCell {
            return false
        }
        
        return true
    }
    
}

//MARK: - manage spaces
extension SPNativeTableController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return self.showTopInsets ? super.tableView(tableView, viewForHeaderInSection: section) : nil
        } else {
            return super.tableView(tableView, viewForHeaderInSection: section)
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == self.tableView.lastSection {
            return self.showBottomInsets ? super.tableView(tableView, viewForFooterInSection: section) : nil
        } else {
            return super.tableView(tableView, viewForFooterInSection: section)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let firstSection = self.tableView.firstSectionWithRows
        if section == firstSection {
            if self.showTopInsets {
                if self.autoTopSpace {
                    if self.tableView(self.tableView, viewForHeaderInSection: firstSection!) != nil {
                        return UITableView.automaticDimension
                    }
                    if self.tableView(self.tableView, titleForHeaderInSection: firstSection!) != nil {
                        return UITableView.automaticDimension
                    }
                    return self.autoSpaceHeight
                } else {
                    return UITableView.automaticDimension
                }
            } else {
                return 0
            }
        } else {
            if self.tableView.numberOfRows(inSection: section) == 0 {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == self.tableView.lastSectionWithRows {
            if self.showBottomInsets {
                if self.autoBottomSpace {
                    if self.tableView(self.tableView, viewForFooterInSection: self.tableView.lastSectionWithRows!) != nil {
                        return UITableView.automaticDimension
                    }
                    if self.tableView(self.tableView, titleForFooterInSection: self.tableView.lastSectionWithRows!) != nil {
                        return UITableView.automaticDimension
                    }
                    return self.autoSpaceHeight
                } else {
                    return UITableView.automaticDimension
                }
            } else {
                return 0
            }
        } else {
            if self.tableView.numberOfRows(inSection: section) == 0 {
                return 0
            } else {
                return UITableView.automaticDimension
            }
        }
    }
}
