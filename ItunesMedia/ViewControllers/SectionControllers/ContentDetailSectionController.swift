//
//  ContentDetailSectionController.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class ContentDetailSectionController: ListSectionController {
    
    // MARK: - Attributes
    
    var viewModel: ListDiffable?
    
    // MARK: - LifeCycle
    
    override init() {
        super.init()
        inset.top = 8
        inset.left = 16
        inset.right = 16
    }
    
    override func didUpdate(to object: Any) {
        viewModel = object as? ListDiffable
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let collectionContext = collectionContext
            else { return .zero }
        
        let width = collectionContext.containerSize(for: self).width
        
        switch viewModel {
        case is MediaDetailCellViewModel:
            return CGSize(width: width, height: 115)
            
        case let textBasedCellViewModel as TextBasedCellViewModel:
            return CellSize.size(
              width: width,
              text: textBasedCellViewModel.content,
              font: UIFont.systemFont(ofSize: 14, weight: .regular),
              aditionalVertialHeight: 40
            )            
            
        default: return .zero
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let viewModel = viewModel,
            let collectionContext = collectionContext else { return EmptyCell() }
        
        switch viewModel {
        case is MediaDetailCellViewModel:
            let cell = collectionContext.dequeueReusableCell(
                withNibName: String(describing: MediaDetailCell.self),
                bundle: nil,
                for: self,
                at: index
            ) as! MediaDetailCell
            
            cell.bindViewModel(viewModel)
            return cell
            
        case is TextBasedCellViewModel:
            let cell = collectionContext.dequeueReusableCell(
                of: TextBasedCell.self,
                for: self,
                at: index
            ) as! TextBasedCell
            
            cell.bindViewModel(viewModel)            
            return cell
            
        default: return EmptyCell()
        }
    }
    
}
