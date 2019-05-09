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

class SPCollectionView: UICollectionView {
    
    let layout = UICollectionViewFlowLayout()
    private var cacheImages: [(link: String, image: UIImage)] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: self.layout)
        self.commonInit()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: self.layout)
        self.commonInit()
    }
    
    internal func commonInit() {
        self.backgroundColor = UIColor.clear
        self.decelerationRate = UIScrollView.DecelerationRate.fast
        self.delaysContentTouches = false
        self.isPagingEnabled = false
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    
    func height(rows: Int) -> CGFloat {
        return self.layout.itemSize.height * CGFloat(rows) + self.layout.minimumLineSpacing * CGFloat(rows - 1)
    }
    
    func width(columns: Int) -> CGFloat {
        return self.layout.itemSize.width * CGFloat(columns) + self.layout.minimumInteritemSpacing * CGFloat(columns - 1)
    }
}

//MARK: - Cache
extension SPCollectionView {
    
    func setCachedImage(link: String, indexPath: IndexPath, on imageView: SPDownloadingImageView, cell: SPCollectionViewCell) {
        cell.currentIndexPath = indexPath
        if let image = self.fromCahce(link: link) {
            imageView.setImage(image: image, animatable: false)
        } else {
            SPDownloader.image(link: link) { (response) in
                if let image = response {
                    if cell.currentIndexPath == indexPath {
                        imageView.setImage(image: image, animatable: true)
                        self.toCache(link: link, image: image)
                    }
                }
            }
        }
    }
    
    func toCache(link: String, image: UIImage?) {
        if image == nil {
            return
        }
        
        if self.fromCahce(link: link) == nil {
            self.cacheImages.append((link: link, image: image!))
        }
    }
    
    func fromCahce(link: String) -> UIImage? {
        
        let cachedData = self.cacheImages.first(where: {
            $0.link == link
        })
        
        return cachedData?.image
    }
}
