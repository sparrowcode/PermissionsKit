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

class SPMengTransformTableViewCell: UITableViewCell {
    
    let collectionView = SPMengTransformCollectionView()
    var collectionHeight: CGFloat = SPMengTransformCollectionView.recomendedHeight {
        didSet {
            self.collectionHeightConstraint.constant = self.collectionHeight
            self.updateConstraints()
        }
    }
    
    private var collectionHeightConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.collectionView)
        
        self.collectionView.leadingAnchor.constraint(equalTo:
            self.contentView.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo:
            self.contentView.trailingAnchor).isActive = true
        self.collectionView.topAnchor.constraint(equalTo:
            self.contentView.topAnchor).isActive = true
        let bottomAnchor = self.collectionView.bottomAnchor.constraint(equalTo:
            self.contentView.bottomAnchor)
        bottomAnchor.priority = UILayoutPriority(rawValue: 900)
        bottomAnchor.isActive = true
        
        self.collectionHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: SPMengTransformCollectionView.recomendedHeight)
        self.collectionHeightConstraint.isActive = true
    }
}
