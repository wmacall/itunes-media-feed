//
//  LoadingSectionController.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class LoadingSectionController: ListSectionController {
        
    // MARK: - LifeCycle
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext
            else { return .zero }
        
        let width = collectionContext.containerSize(for: self).width
        return CGSize(width: width, height: 60)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let collectionContext = collectionContext else { return EmptyCell() }
        
        let cell = collectionContext.dequeueReusableCell(of: LoadingCell.self, for: self, at: index) as! LoadingCell
        
        return cell
    }
    
}
