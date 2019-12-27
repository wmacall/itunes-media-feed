//
//  FeedHeaderSectionController.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class FeedHeaderSectionController: ListSectionController {
    
   // MARK: - Attributes
    
    var viewModel: FeedHeaderViewModel?
    
    // MARK: - LifeCycle
    
    override init() {
        super.init()
        
        inset.left = 16
        inset.right = 16
        supplementaryViewSource = self
    }
    
    override func didUpdate(to object: Any) {
        viewModel = object as? FeedHeaderViewModel
    }
    
    override func numberOfItems() -> Int {
        return 0
    }
    
}

// MARK: - ListSupplementaryViewSource

extension FeedHeaderSectionController: ListSupplementaryViewSource {
    
    func supportedElementKinds() -> [String] {
        return [
            UICollectionView.elementKindSectionHeader
        ]
    }
    
    func viewForSupplementaryElement(ofKind elementKind: String, at index: Int) -> UICollectionReusableView {
        guard let viewModel = viewModel,
            let collectionContext = collectionContext
            else { return EmptyHeaderView() }
        
        let headerView = collectionContext.dequeueReusableSupplementaryView(
            ofKind: elementKind,
            for: self,
            class: FeedHeaderReusableView.self,
            at: index
        ) as! FeedHeaderReusableView
        
        headerView.bindViewModel(viewModel)
        
        return headerView
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        guard let collectionContext = collectionContext
            else { return .zero }
                        
        let width = collectionContext.containerSize(for: self).width
        let height = K.Components.Feed.headerViewHeight
        
        return CGSize(width: width, height: height)
    }
    
}

