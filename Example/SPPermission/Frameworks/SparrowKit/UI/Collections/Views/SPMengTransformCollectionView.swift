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

struct SPMengTransformCollectionData {
    
    var title: String
    var subtitle: String
    var gradeFactor: CGFloat? = nil
    var image: UIImage?
    var imageLink: String?
    
    var withShadow: Bool = true
    var textColor: UIColor = .white
    
    var startGradientColor: UIColor? = nil
    var endGradientColor: UIColor? = nil
    
    var withGrade: Bool {
        return self.gradeFactor != nil
    }
}

class SPMengTransformCollectionView: SPPageCollectionView {
    
    var data: [SPMengTransformCollectionData] = []
    var withParalax: Bool = true
    static var recomendedHeight: CGFloat = 310
    
    override func commonInit() {
        self.layout.scrollDirection = .horizontal
        
        self.layout.cellSideRatio = 1.23
        self.layout.heightFactor = 1
        self.layout.maxHeight = 228
        self.layout.maxWidth = 304
        self.layout.itemSpacingFactor = 0
        self.layout.minItemSpace = 0
        self.layout.maxItemSpace = 0
        self.layout.sectionInset.left = 20
        self.layout.sectionInset.right = 40
        
        self.delegate = self
        self.dataSource = self
        
        self.register(SPMengTransformCollectionViewCell.self, forCellWithReuseIdentifier: "sectionCell")
    }
    
    func configure(with data: [SPMengTransformCollectionData]) {
        self.data = data
        self.reloadData()
    }
}

extension SPMengTransformCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = self.data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCell", for: indexPath) as! SPMengTransformCollectionViewCell
        cell.currentIndexPath = indexPath
        cell.titleLabel.text = data.title
        cell.titleLabel.textColor = data.textColor
        cell.subtitleLabel.text = data.subtitle
        cell.subtitleLabel.textColor = data.textColor
        cell.withShadow = data.withShadow
        
        if let startColor = data.startGradientColor {
            if let endColor = data.endGradientColor {
                cell.gradientView.isHidden = false
                cell.backgroundImageView.isHidden = true
                cell.gradientView.startColor = startColor
                cell.gradientView.endColor = endColor
            } else {
                cell.gradientView.isHidden = true
                cell.backgroundImageView.isHidden = false
            }
        } else {
            cell.gradientView.isHidden = true
            cell.backgroundImageView.isHidden = false
        }

        if self.withParalax {
            cell.backgroundImageView.gradeView.backgroundColor = UIColor.clear
        } else {
            cell.backgroundImageView.gradeView.backgroundColor = UIColor.white
        }
        
        let showGrade: (_ animated: Bool) -> () = { (animated) in
            if data.withGrade {
                
                let grade = data.gradeFactor ?? 0.1
                
                cell.gradeView.alpha = 0
                cell.gradeView.isHidden = false
                if animated {
                    SPAnimation.animate(0.3, animations: {
                        cell.gradeView.alpha = grade
                    })
                    delay(0.2, closure: {
                        SPAnimationAlpha.showList(views: [cell.titleLabel, cell.subtitleLabel])
                    })
                } else {
                    cell.gradeView.alpha = grade
                    cell.titleLabel.alpha = 1
                    cell.subtitleLabel.alpha = 1
                }
                cell.titleLabel.setDeepShadowForLetters()
            }
        }
        
        if let image = data.image {
            cell.backgroundImageView.setImage(image: image, animatable: false)
            showGrade(false)
        } else {
            if let link = data.imageLink {
                if let image = self.fromCahce(link: link) {
                    cell.backgroundImageView.setImage(image: image, animatable: false)
                    showGrade(false)
                } else {
                    cell.backgroundImageView.removeImage()
                    cell.titleLabel.alpha = 0
                    cell.subtitleLabel.alpha = 0
                    SPDownloader.image(link: link) { (response) in
                        if let image = response {
                            if cell.currentIndexPath == indexPath {
                                cell.backgroundImageView.setImage(image: image, animatable: true)
                                self.toCache(link: link, image: image)
                                showGrade(true)
                            }
                        }
                    }
                }
            }
        }
        
        
        
        cell.layer.transform = animateCell(cellFrame: cell.frame)
        
        return cell
    }
}

extension SPMengTransformCollectionView: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.updateCells()
    }
    
    func updateCells() {
        
        for cell in self.visibleCells as! [SPMengTransformCollectionViewCell] {
            let indexPath = self.indexPath(for: cell)!
            
            let attributes = self.layoutAttributesForItem(at: indexPath)!
            if let rootController = SPApp.rootController {
                let cellFrame = self.convert(attributes.frame, to: rootController.view)
                
                if self.withParalax {
                    let translationX = cellFrame.origin.x / 5
                    cell.backgroundImageView.transform = CGAffineTransform(translationX: translationX, y: 0)
                }
                
                cell.layer.transform = animateCell(cellFrame: cellFrame)
            }
        }
    }
    
    private func animateCell(cellFrame: CGRect) -> CATransform3D {
        let angleFromX = Double((-cellFrame.origin.x) / 10)
        let angle = CGFloat((angleFromX * Double.pi) / 180.0)
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/1000
        let rotation = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        var scaleFromX = (1000 - (cellFrame.origin.x - 200)) / 1000
        let scaleMax: CGFloat = 1.0
        let scaleMin: CGFloat = 0.6
        if scaleFromX > scaleMax {
            scaleFromX = scaleMax
        }
        if scaleFromX < scaleMin {
            scaleFromX = scaleMin
        }
        let scale = CATransform3DScale(CATransform3DIdentity, scaleFromX, scaleFromX, 1)
        
        return CATransform3DConcat(rotation, scale)
    }
}
