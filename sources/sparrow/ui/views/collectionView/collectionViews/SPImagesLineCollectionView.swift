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

class SPImagesLineCollectionView: SPCollectionView {
    
    fileprivate let imageCellIdentificator: String = "imageCellIdentificator"
    
    var links: [String] = []
    var images: [UIImage] = []
    
    var mode: Mode = .links {
        didSet {
            self.reloadData()
        }
    }
    
    override init() {
        super.init()
        self.layout.scrollDirection = .horizontal
        self.dataSource = self
        
        self.register(SPImageCollectionViewCell.self, forCellWithReuseIdentifier: self.imageCellIdentificator)
        
        self.layout.cellSideRatio = 1
        self.layout.heightFactor = 1
        self.layout.minItemSpace = 10
        self.layout.maxItemSpace = 10
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    enum Mode {
        case links
        case images
    }
}

extension SPImagesLineCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch self.mode {
        case .links:
            return self.links.count
        case .images:
            return self.images.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: self.imageCellIdentificator, for: indexPath) as! SPImageCollectionViewCell
        
        switch self.mode {
        case .links:
            let link = self.links[indexPath.row]
            if let image = self.fromCahce(link: link) {
                cell.view.setImage(image: image, animatable: false)
            } else {
                cell.view.setImage(link: link) { (image) in
                    self.toCache(link: link, image: image)
                }
            }
        case .images:
            cell.view.setImage(image: self.images[indexPath.row], animatable: false)
        }
        
        return cell
    }
}
