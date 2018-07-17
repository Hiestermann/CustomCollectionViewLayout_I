//
//  CustomLayout.swift
//  CustomCollectinViewLayout
//
//  Created by Kilian on 15.07.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import UIKit

protocol CustomLayoutDelegate: class {
    func collectionView(_ collectionView:UICollectionView, widthIndexPath indexPath:IndexPath) -> CGFloat
    
    
}

class CustomLayout: UICollectionViewLayout {

    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentSize: CGSize?
    
    var y = 15
    
    var dragOffset: CGFloat = 180
    
    var width: CGFloat {
        return collectionView?.frame.width ?? 0
    }
    
    var yOffset: CGFloat {
        return collectionView?.contentOffset.y ?? 0
    }
    
    var currentFocusedItemIndex: Int {
        return max(0, Int(yOffset / dragOffset))
    }
    
    weak var delegate: CustomLayoutDelegate?
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 200 , height: y + 15)
    }
    
    var nextItemPercentageOffset: CGFloat {
        return (yOffset / dragOffset) - CGFloat(currentFocusedItemIndex)
    }

    
    override func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        
        
        let widht = width
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            
            let frame = CGRect(x: 10, y: y, width: Int(widht - 20), height: Int(widht - 20))
            y = y + Int(widht - 20) + 10
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            cache.append(attributes)
        }
        contentSize = CGSize(width: collectionView.bounds.width, height: CGFloat(y))
        
    }
    
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = cache.filter { attributes in
            return attributes.frame.intersects(rect)
        }
        
        for attribute in attributes {
            
            let distance = abs(collectionView!.contentOffset.y + collectionView!.frame.height / 2 - attribute.center.y)

            let scale =  max(1 - distance / (collectionView!.bounds.height), 0.75)
            attribute.transform = CGAffineTransform(scaleX: scale, y: scale)
            attribute.alpha = scale
            
        }
        return attributes
        
    }
 
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

        let proposedItemIndex = round(proposedContentOffset.y / dragOffset)
        let nearestPageOffset = proposedItemIndex * dragOffset

        return CGPoint(x: 0, y: nearestPageOffset + 20)
    }
    
}
