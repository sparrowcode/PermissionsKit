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

class SPCollectionViewLayout: UICollectionViewFlowLayout {
    
    var itemSpacingFactor: CGFloat = 0.11
    var minItemSpace: CGFloat = 0
    var maxItemSpace: CGFloat = 100
    var scalingOffset: CGFloat = 200
    var minimumAlphaFactor: CGFloat = 0.5
    var minimumScaleFactor: CGFloat = 0.8
    var yCenteringTranslation: CGFloat = 0
    
    var cellSideRatio: CGFloat? = nil
    var maxWidth: CGFloat = 350
    var minWidth: CGFloat?
    var widthFactor: CGFloat = 0.9
    var maxHeight: CGFloat = 350
    var heightFactor: CGFloat = 0.9
    
    var isGradeItems: Bool = false
    var isScaleItems: Bool = false
    var isPaging: Bool = false
    
    var pageWidth: CGFloat {
        get {
            return self.itemSize.width + self.minimumLineSpacing
        }
    }
    
    var pageHeight: CGFloat {
        get {
            return self.itemSize.height + self.minimumLineSpacing
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        self.scrollDirection = .horizontal
        self.minimumInteritemSpacing = 0
        self.minimumLineSpacing = 0
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        if !self.isPaging {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        switch self.scrollDirection {
        case .horizontal:
            let rawPageValue = (self.collectionView!.contentOffset.x) / self.pageWidth
            let currentPage = (velocity.x > 0.0) ? floor(rawPageValue) : ceil(rawPageValue);
            let nextPage = (velocity.x > 0.0) ? ceil(rawPageValue) : floor(rawPageValue);
            
            let pannedLessThanAPage = abs(1 + currentPage - rawPageValue) > 0.5;
            let flicked = abs(velocity.x) > 0.3
            
            var proposedContentOffset = proposedContentOffset
            if (pannedLessThanAPage && flicked) {
                proposedContentOffset.x = nextPage * self.pageWidth
            } else {
                proposedContentOffset.x = round(rawPageValue) * self.pageWidth
            }
            return proposedContentOffset
        case .vertical:
            let rawPageValue = (self.collectionView!.contentOffset.y) / self.pageHeight
            
            let currentPage = (velocity.y > 0.0) ? floor(rawPageValue) : ceil(rawPageValue);
            let nextPage = (velocity.y > 0.0) ? ceil(rawPageValue) : floor(rawPageValue);
            
            let pannedLessThanAPage = abs(1 + currentPage - rawPageValue) > 0.5;
            let flicked = abs(velocity.y) > 0.3
            
            var proposedContentOffset = proposedContentOffset
            if (pannedLessThanAPage && flicked) {
                proposedContentOffset.y = nextPage * self.pageHeight
            } else {
                proposedContentOffset.y = round(rawPageValue) * self.pageHeight
            }
            return proposedContentOffset
        default:
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = self.collectionView,
            let superAttributes = super.layoutAttributesForElements(in: rect) else {
                return super.layoutAttributesForElements(in: rect)
        }
        
        let contentOffset = collectionView.contentOffset
        let size = collectionView.bounds.size
        
        guard case let newAttributesArray as [UICollectionViewLayoutAttributes] = NSArray(array: superAttributes, copyItems: true) else {
            return nil
        }
        
        switch self.scrollDirection {
        case .horizontal:
            let visibleRect = CGRect.init(x: contentOffset.x, y: contentOffset.y, width: size.width, height: size.height)
            let visibleCenterX = visibleRect.midX
            newAttributesArray.forEach {
                let distanceFromCenter = visibleCenterX - $0.center.x
                
                let absDistanceFromCenter = min(abs(distanceFromCenter), self.scalingOffset)
                
                if self.isScaleItems {
                    let scale = absDistanceFromCenter * (self.minimumScaleFactor - 1) / self.scalingOffset + 1
                    $0.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
                }
                
                if self.isGradeItems {
                    let alpha = absDistanceFromCenter * (self.minimumAlphaFactor - 1) / self.scalingOffset + 1
                    $0.alpha = alpha
                }
            }
        case .vertical:
            let visibleRect = CGRect.init(x: contentOffset.x, y: contentOffset.y, width: size.width, height: size.height)
            let visibleCenterY: CGFloat = visibleRect.midY + self.yCenteringTranslation
            for owner in newAttributesArray {
                let distanceFromCenter = visibleCenterY - owner.center.y
                let absDistanceFromCenter = min(abs(distanceFromCenter), self.scalingOffset)
                
                if self.isScaleItems {
                    let scale = absDistanceFromCenter * (self.minimumScaleFactor - 1) / self.scalingOffset + 1
                    owner.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
                }
                
                if self.isGradeItems {
                    let alpha = absDistanceFromCenter * (self.minimumAlphaFactor - 1) / self.scalingOffset + 1
                    owner.alpha = alpha
                }
            }
        default:
            return super.layoutAttributesForElements(in: rect)
        }
        return newAttributesArray
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    var isAllowInsertAnimation: Bool = false
    var deleteIndexPaths: [IndexPath] = []
    var insertIndexPaths: [IndexPath] = []
    
    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
        super.prepare(forCollectionViewUpdates: updateItems)
        for item in updateItems {
            if item.updateAction == .delete {
                if item.indexPathBeforeUpdate != nil {
                    self.deleteIndexPaths.append(item.indexPathBeforeUpdate!)
                }
            }
            
            if item.updateAction == .insert {
                if item.indexPathAfterUpdate != nil {
                    self.insertIndexPaths.append(item.indexPathAfterUpdate!)
                }
            }
        }
    }
    
    override func finalizeCollectionViewUpdates() {
        super.finalizeCollectionViewUpdates()
        self.insertIndexPaths.removeAll()
        self.deleteIndexPaths.removeAll()
    }
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes: UICollectionViewLayoutAttributes? = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath)
        
        if isAllowInsertAnimation {
            if self.insertIndexPaths.contains(itemIndexPath) {
                attributes?.alpha = 0
                attributes?.zIndex = 0
                attributes?.transform = CGAffineTransform.init(scaleX: self.minimumScaleFactor, y: self.minimumScaleFactor)
            }
        }
        
        return attributes
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {

        let attributes: UICollectionViewLayoutAttributes? = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath)
        
        if self.deleteIndexPaths.contains(itemIndexPath) {
            attributes?.alpha = 0
            attributes?.zIndex = 0
            attributes?.transform3D = CATransform3DScale(CATransform3DIdentity, self.minimumScaleFactor, self.minimumScaleFactor, 1)
        }
        
        return attributes
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = self.collectionView else {
            return
        }
        
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        if cellSideRatio == nil {
            var height = collectionView.bounds.size.height * self.heightFactor
            if height > self.maxHeight {
                height = self.maxHeight
            }
            
            var width = collectionView.bounds.size.width * self.widthFactor
            if width > self.maxWidth {
                width = self.maxWidth
            }
            
            self.itemSize = CGSize.init(
                width: width,
                height: height
            )
        } else {
            self.itemSize = SPLayout.sizeWith(
                widthFactor: self.widthFactor,
                maxWidth: self.maxWidth,
                heightFactor: self.heightFactor,
                maxHeight: self.maxHeight,
                relativeSideFactor: self.cellSideRatio!,
                from: collectionView.bounds.size
            )
        }
        
        if self.minWidth != nil {
            self.itemSize.width.setIfFewer(when: self.minWidth!)
        }
        
        switch self.scrollDirection {
        case .horizontal:
            self.minimumLineSpacing = collectionView.frame.width * itemSpacingFactor
        case .vertical:
            self.minimumLineSpacing = collectionView.frame.height * itemSpacingFactor
        default:
            break
        }
        self.minimumLineSpacing.setIfMore(when: self.maxItemSpace)
        self.minimumLineSpacing.setIfFewer(when: self.minItemSpace)
    }
}
