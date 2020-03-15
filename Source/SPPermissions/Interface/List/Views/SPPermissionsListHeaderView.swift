// The MIT License (MIT)
// Copyright © 2019 Ivan Varabei (varabeis@icloud.com)
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

#if os(iOS)
class SPPermissionsListHeaderView: UITableViewHeaderFooterView {
    
    /**
     Text for header view.
     */
    let titleLabel = UILabel()
    
    /**
     ID for register in table view.
     */
    static var id = "SPPermissionsListHeaderView"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        titleLabel.textColor = SPPermissionsColor.secondaryLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: -2).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
#endif
