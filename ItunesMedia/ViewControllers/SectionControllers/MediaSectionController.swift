//
//  MediaSectionControlle.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class MediaSectionController: ListSectionController {
    
    // MARK: - Attributes
    
    var viewModel: ListDiffable?
    
    // MARK: - LifeCycle
    
    override init() {
        super.init()        
        inset.right = 16
    }
    
    override func didUpdate(to object: Any) {
        viewModel = object as? ListDiffable
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext
            else { return .zero }
            
        let width = collectionContext.containerSize(for: self).width * 0.40
        let height = K.Components.Feed.horizontalSectionHeight
        
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let viewModel = viewModel,
            let collectionContext = collectionContext else { return EmptyCell() }
        
        let cell = collectionContext.dequeueReusableCell(
            withNibName: String(describing: MediaCell.self),
            bundle: nil,
            for: self,
            at: index
        ) as! MediaCell
        
        cell.bindViewModel(viewModel)
        
        return cell
    }
    
}
