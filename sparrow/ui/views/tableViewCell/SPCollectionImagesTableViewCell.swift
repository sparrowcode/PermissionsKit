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

class SPCollectionImagesTableViewCell: SPTableViewCell {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let collectionView = SPImagesLineCollectionView()
    
    var topSpace: CGFloat = 11 {
        didSet {
            self.titleLabelTopConstraint.constant = self.topSpace
            self.updateConstraints()
        }
    }
    
    var collectionHeight: CGFloat = 63 {
        didSet {
            self.collectionHeightConstraint.constant = self.collectionHeight
            self.updateConstraints()
        }
    }
    
    //constraints
    private var collectionTopConstraint: NSLayoutConstraint!
    private var collectionHeightConstraint: NSLayoutConstraint!
    private var titleLabelTopConstraint: NSLayoutConstraint!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        let marginGuide = contentView.layoutMarginsGuide
        
        self.titleLabel.numberOfLines = 0
        self.titleLabel.font = UIFont.system(type: UIFont.BoldType.Medium, size: 21)
        self.titleLabel.textAlignment = .left
        self.titleLabel.textColor = UIColor.black
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.leadingAnchor.constraint(equalTo:
            marginGuide.leadingAnchor, constant: 0).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo:
            marginGuide.trailingAnchor).isActive = true
        self.titleLabelTopConstraint = self.titleLabel.topAnchor.constraint(equalTo:
            marginGuide.topAnchor, constant: 0)
        self.titleLabelTopConstraint.isActive = true
        
        self.subtitleLabel.numberOfLines = 3
        self.subtitleLabel.font = UIFont.system(type: UIFont.BoldType.Regular, size: 15)
        self.subtitleLabel.textAlignment = .left
        self.subtitleLabel.textColor = SPNativeStyleKit.Colors.gray
        self.contentView.addSubview(self.subtitleLabel)
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subtitleLabel.leadingAnchor.constraint(equalTo:
            self.titleLabel.leadingAnchor).isActive = true
        self.subtitleLabel.trailingAnchor.constraint(equalTo:
            marginGuide.trailingAnchor).isActive = true
        self.subtitleLabel.topAnchor.constraint(equalTo:
            titleLabel.bottomAnchor, constant: 3).isActive = true
        
        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.collectionView)
        self.collectionView.leadingAnchor.constraint(equalTo:
            self.leadingAnchor).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo:
            self.trailingAnchor).isActive = true
        self.collectionHeightConstraint = self.collectionView.heightAnchor.constraint(equalToConstant: 63)
        self.collectionHeightConstraint.isActive = true
        self.collectionTopConstraint = self.collectionView.topAnchor.constraint(equalTo:
            subtitleLabel.bottomAnchor, constant: 10)
        self.collectionTopConstraint.isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo:
            marginGuide.bottomAnchor, constant: -7).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.collectionView.reloadData()
        self.accessoryType = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView.contentInset.left = self.contentView.layoutMargins.left
        self.collectionView.contentInset.right = self.contentView.layoutMargins.right
        self.accessoryView?.center.y = self.titleLabel.frame.bottomYPosition + self.subtitleLabel.frame.height / 2
        if self.accessoryView?.frame.origin.y ?? 0 < 5 {
            self.accessoryView?.center.y = self.frame.height / 2
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        var backgroundColor = SPNativeStyleKit.Colors.customGray
        if let cell = self.collectionView.cellForItem(at: IndexPath.init(row: 0, section: 0)) as? SPImageCollectionViewCell {
            if let color = cell.view.gradeView.backgroundColor {
                backgroundColor = color
            }
        }
        
        super.setHighlighted(highlighted, animated: animated)
        
        for cell in self.collectionView.visibleCells {
            if let imageCell = cell as? SPImageCollectionViewCell {
                imageCell.view.gradeView.backgroundColor = backgroundColor
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        var backgroundColor = SPNativeStyleKit.Colors.customGray
        if let cell = self.collectionView.cellForItem(at: IndexPath.init(row: 0, section: 0)) as? SPImageCollectionViewCell {
            if let color = cell.view.gradeView.backgroundColor {
                backgroundColor = color
            }
        }
        
        super.setSelected(selected, animated: animated)
        
        for cell in self.collectionView.visibleCells {
            if let imageCell = cell as? SPImageCollectionViewCell {
                imageCell.view.gradeView.backgroundColor = backgroundColor
            }
        }
    }
}
