
import UIKit

class StreachyHeader: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0 {
                guard let collectionView = collectionView else {return}
                
                let contentOfsetY = collectionView.contentOffset.y
                
                if contentOfsetY > 0 {
                    return
                }
                
                let width = collectionView.frame.width
                
                let height = attributes.frame.height - contentOfsetY
                
                
                attributes.frame = CGRect(x: 0, y: contentOfsetY, width: width , height: height)
            }
        })
        
        
        
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
