import UIKit

public class SPCollectionViewLayout: UICollectionViewFlowLayout {
    
    var itemSpacingFactor: CGFloat = 0.11
    var minItemSpace: CGFloat = 0
    var maxItemSpace: CGFloat = 100
    var scalingOffset: CGFloat = 200
    var minimumAlphaFactor: CGFloat = 0.5
    var minimumScaleFactor: CGFloat = 0.8
    var yCenteringTranslation: CGFloat = 0
    
    var cellSideRatio: CGFloat = 1
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
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
        scrollDirection = .horizontal
    }
    
    public override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        if !self.isPaging {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        switch self.scrollDirection {
        case .horizontal:
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
        case .vertical:
            let rawPageValue = (self.collectionView!.contentOffset.y) / self.pageHeight
            
            let currentPage = (velocity.y > 0.0) ? floor(rawPageValue) : ceil(rawPageValue);
            let nextPage = (velocity.y > 0.0) ? ceil(rawPageValue) : floor(rawPageValue);
            
            let pannedLessThanAPage = fabs(1 + currentPage - rawPageValue) > 0.5;
            let flicked = fabs(velocity.y) > 0.3
            
            var proposedContentOffset = proposedContentOffset
            if (pannedLessThanAPage && flicked) {
                proposedContentOffset.y = nextPage * self.pageHeight
            } else {
                proposedContentOffset.y = round(rawPageValue) * self.pageHeight
            }
            return proposedContentOffset;
        }
    }
    
    override public func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
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
        
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        
        self.itemSize = SPLayout.sizeWith(widthFactor: self.widthFactor, maxWidth: self.maxWidth, heightFactor: self.heightFactor, maxHeight: self.maxHeight, relativeSideFactor: self.cellSideRatio, from: collectionView.bounds.size)
        
        if self.minWidth != nil {
            self.itemSize.width.setIfFewer(when: self.minWidth!)
        }
        
        switch self.scrollDirection {
        case .horizontal:
            self.minimumLineSpacing = collectionView.frame.width * itemSpacingFactor
        case .vertical:
            self.minimumLineSpacing = collectionView.frame.height * itemSpacingFactor
        }
        self.minimumLineSpacing.setIfMore(when: self.maxItemSpace)
        self.minimumLineSpacing.setIfFewer(when: self.minItemSpace)
    }
}
