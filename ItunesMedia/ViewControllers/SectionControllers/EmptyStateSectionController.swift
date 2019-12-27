//
//  EmptyStateSectionController.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class EmptyStateSectionController: ListSectionController {
    
    // MARK: - Attributes
    
    var viewModel: EmptyStateViewModel?
    
    // MARK: - LifeCycle
    
    override func didUpdate(to object: Any) {
        viewModel = object as? EmptyStateViewModel
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext
            else { return .zero }
        
        inset.top = collectionContext.containerSize(for: self).height * 0.08
        let width = collectionContext.containerSize(for: self).width
        return CGSize(width: width, height: 325)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let viewModel = viewModel,
            let collectionContext = collectionContext else { return EmptyCell() }
        
        let cell = collectionContext.dequeueReusableCell(
            withNibName: String(describing: EmptyStateCell.self),
            bundle: nil,
            for: self,
            at: index
        ) as! EmptyStateCell
        
        cell.bindViewModel(viewModel)
        
        return cell
    }
    
}
