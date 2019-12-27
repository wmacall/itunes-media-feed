//
//  SectionedMediaSectionController.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class SectionedMediaSectionController: ListSectionController {
    
    // MARK: - Attributes
    
    weak var viewModel: MediaSectionViewModel?
    
    // MARK: - LifeCycle
    
    override init() {
        super.init()
                
        inset.left = 16
        inset.right = 16
        minimumLineSpacing = 8
        supplementaryViewSource = self
    }
    
    override func didUpdate(to object: Any) {
        guard let viewModel = object as? MediaSectionViewModel
            else { return }
        
        self.viewModel = viewModel
    }
    
    override func numberOfItems() -> Int {
        return viewModel?.viewModels.count ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext
            else { return .zero }
            
        let width = (collectionContext.containerSize(for: self).width  / 2) - 8
        let height = K.Components.Feed.horizontalSectionHeight
        
        return CGSize(width: width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let viewModel = viewModel?.viewModels[index],
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

// MARK: - ListSupplementaryViewSource

extension SectionedMediaSectionController: ListSupplementaryViewSource {
    
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
            nibName: String(describing: SectionTitleHeaderView.self),
            bundle: nil,
            at: index
        ) as! SectionTitleHeaderView
                
        headerView.setupSkeletonView(isSkeletoneable: viewModel.isSkeleton)
        headerView.setupActionableHeader(with: viewModel.title)
            
        return headerView
    }
    
    func sizeForSupplementaryView(ofKind elementKind: String, at index: Int) -> CGSize {
        guard let collectionContext = collectionContext
            else { return .zero }
                
        let width = collectionContext.containerSize(for: self).width
        let height = K.Components.Feed.sectionHeaderViewHeight
        
        return CGSize(width: width, height: height)
    }
    
}
