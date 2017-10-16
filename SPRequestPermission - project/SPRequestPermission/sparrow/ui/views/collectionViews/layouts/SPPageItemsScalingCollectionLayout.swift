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

@available(iOS, unavailable)
public class SPPageItemsScalingCollectionLayout: UICollectionViewFlowLayout {
    
    var itemSideRatio: CGFloat = 0.764
    var itemSpacingFactor: CGFloat = 0.11
    var scaleItems: Bool = true
    var scalingOffset: CGFloat = 200
    var minimumScaleFactor: CGFloat = 0.9
    var minimumAlphaFactor: CGFloat = 0.3
    
    var pageWidth: CGFloat {
        get {
            return self.itemSize.width + self.minimumLineSpacing
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        scrollDirection = .horizontal
    }
    
    public override func targetContentOffset( forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let rawPageValue = (self.collectionView!.contentOffset.x) / self.pageWidth
        let currentPage = (velocity.x > 0.0) ? floor(rawPageValue) : ceil(rawPageValue);
        let nextPage = (velocity.x > 0.0) ? ceil(rawPageValue) : floor(rawPageValue);
        
        let pannedLessThanAPage = fabs(1 + currentPage - rawPageValue) > 0.5;
        let flicked = fabs(velocity.x) > 0.3
        
        var proposedContentOffset = proposedContentOffset
        if (pannedLessThanAPage && flicked) {
            proposedContentOffset.x = nextPage * self.pageWidth
        } else {
            proposedContentOffset.x = round(rawPageValue) * self.pageWidth
        }
        return proposedContentOffset;
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = self.collectionView,
            let superAttributes = super.layoutAttributesForElements(in: rect) else {
                return super.layoutAttributesForElements(in: rect)
        }
        if scaleItems == false {
            
            return super.layoutAttributesForElements(in: rect)
        }
        
        let contentOffset = collectionView.contentOffset
        let size = collectionView.bounds.size
        
        let visibleRect = CGRect.init(x: contentOffset.x, y: contentOffset.y, width: size.width, height: size.height)
        let visibleCenterX = visibleRect.midX
        
        guard case let newAttributesArray as [UICollectionViewLayoutAttributes] = NSArray(array: superAttributes, copyItems: true) else {
            return nil
        }
        
        newAttributesArray.forEach {
            let distanceFromCenter = visibleCenterX - $0.center.x
            let absDistanceFromCenter = min(abs(distanceFromCenter), self.scalingOffset)
            let scale = absDistanceFromCenter * (self.minimumScaleFactor - 1) / self.scalingOffset + 1
            $0.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
            
            let alpha = absDistanceFromCenter * (self.minimumAlphaFactor - 1) / self.scalingOffset + 1
            $0.alpha = alpha
        }
        
        return newAttributesArray
    }
    
    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override public func prepare() {
        super.prepare()
        
        guard let collectionView = self.collectionView else {
            return
        }
        
        var heightItems = collectionView.bounds.height
        if (heightItems > 400) {
            heightItems = 400
        }
        
        self.itemSize = CGSize(width: heightItems * self.itemSideRatio, height: heightItems)
        self.minimumLineSpacing = self.itemSize.width * self.itemSpacingFactor
    }
}
