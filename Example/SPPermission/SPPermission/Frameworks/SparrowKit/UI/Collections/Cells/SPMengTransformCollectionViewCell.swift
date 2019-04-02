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

class SPMengTransformCollectionViewCell: SPCollectionViewCell {
    
    let backgroundImageView = SPDownloadingImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let gradientView = SPGradientView.init()
    let gradeView = UIView()
    let shadowContainerView = UIView()
    
    var withShadow: Bool = true {
        didSet {
            if self.withShadow {
                shadowContainerView.layer.shadowOpacity = 0.25
                shadowContainerView.layer.shadowOffset = CGSize.init(width: 0, height: 10)
                shadowContainerView.layer.shadowRadius = 20
            } else {
                shadowContainerView.layer.shadowOpacity = 0
                shadowContainerView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
                shadowContainerView.layer.shadowRadius = 0
            }
        }
    }
    
    override func commonInit() {
        shadowContainerView.backgroundColor = UIColor.white
        shadowContainerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(shadowContainerView)
        
        shadowContainerView.leadingAnchor.constraint(equalTo:
            self.leadingAnchor).isActive = true
        shadowContainerView.trailingAnchor.constraint(equalTo:
            self.trailingAnchor).isActive = true
        shadowContainerView.topAnchor.constraint(equalTo:
            self.topAnchor, constant: 0).isActive = true
        shadowContainerView.bottomAnchor.constraint(equalTo:
            self.bottomAnchor, constant: 0).isActive = true
        
        let contentView = UIView()
        contentView.backgroundColor = UIColor.clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        shadowContainerView.addSubview(contentView)
        
        contentView.leadingAnchor.constraint(equalTo:
            shadowContainerView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo:
            shadowContainerView.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo:
            shadowContainerView.topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo:
            shadowContainerView.bottomAnchor, constant: 0).isActive = true
        
        self.backgroundImageView.contentMode = .scaleAspectFill
        self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundImageView.layer.masksToBounds = false
        contentView.addSubview(self.backgroundImageView)
        
        self.backgroundImageView.leadingAnchor.constraint(equalTo:
            contentView.leadingAnchor, constant: 0).isActive = true
        self.backgroundImageView.trailingAnchor.constraint(equalTo:
            contentView.trailingAnchor, constant: 0).isActive = true
        self.backgroundImageView.topAnchor.constraint(equalTo:
            contentView.topAnchor, constant: 0).isActive = true
        self.backgroundImageView.bottomAnchor.constraint(equalTo:
            contentView.bottomAnchor, constant: 0).isActive = true
        
        self.gradientView.startColorPosition = .topLeft
        self.gradientView.endColorPosition = .bottomRight
        self.gradientView.isHidden = true
        self.gradientView.translatesAutoresizingMaskIntoConstraints = false
        self.gradientView.layer.masksToBounds = false
        contentView.addSubview(self.gradientView)
        
        self.gradientView.leadingAnchor.constraint(equalTo:
            contentView.leadingAnchor).isActive = true
        self.gradientView.trailingAnchor.constraint(equalTo:
            contentView.trailingAnchor).isActive = true
        self.gradientView.topAnchor.constraint(equalTo:
            contentView.topAnchor, constant: 0).isActive = true
        self.gradientView.bottomAnchor.constraint(equalTo:
            contentView.bottomAnchor, constant: 0).isActive = true
        
        self.gradeView.isHidden = true
        self.gradeView.backgroundColor = UIColor.black
        self.gradeView.alpha = 0
        self.gradeView.translatesAutoresizingMaskIntoConstraints = false
        self.gradeView.layer.masksToBounds = false
        contentView.addSubview(self.gradeView)
        
        self.gradeView.leadingAnchor.constraint(equalTo:
            contentView.leadingAnchor).isActive = true
        self.gradeView.trailingAnchor.constraint(equalTo:
            contentView.trailingAnchor).isActive = true
        self.gradeView.topAnchor.constraint(equalTo:
            contentView.topAnchor, constant: 0).isActive = true
        self.gradeView.bottomAnchor.constraint(equalTo:
            contentView.bottomAnchor, constant: 0).isActive = true
        
        contentView.layer.masksToBounds = true
        shadowContainerView.layer.cornerRadius = 14
        contentView.layer.cornerRadius = 14
        
        self.titleLabel.text = ""
        self.titleLabel.setDeepShadowForLetters()
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.font = UIFont.system(weight: .demiBold, size: 32)
        self.titleLabel.textColor = UIColor.white
        self.titleLabel.numberOfLines = 0
        contentView.addSubview(self.titleLabel)
        
        self.titleLabel.leadingAnchor.constraint(equalTo:
            contentView.leadingAnchor, constant: 20).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo:
            contentView.trailingAnchor, constant: -20).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo:
            contentView.topAnchor, constant: 20).isActive = true
        
        self.subtitleLabel.text = ""
        self.subtitleLabel.setDeepShadowForLetters()
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subtitleLabel.font = UIFont.system(weight: .regular, size: 17)
        self.subtitleLabel.textColor = UIColor.white
        self.subtitleLabel.numberOfLines = 0
        contentView.addSubview(self.subtitleLabel)
        
        self.subtitleLabel.leadingAnchor.constraint(equalTo:
            contentView.leadingAnchor, constant: 20).isActive = true
        self.subtitleLabel.trailingAnchor.constraint(equalTo:
            contentView.trailingAnchor, constant: -20).isActive = true
        self.subtitleLabel.bottomAnchor.constraint(equalTo:
            contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundImageView.image = nil
        self.titleLabel.text = ""
        self.subtitleLabel.text = ""
        self.gradientView.isHidden = true
        self.gradeView.alpha = 0
        self.gradeView.isHidden = true
        self.titleLabel.isHidden = false
        self.subtitleLabel.isHidden = false
        self.titleLabel.alpha = 1
        self.subtitleLabel.alpha = 1
    }
}
