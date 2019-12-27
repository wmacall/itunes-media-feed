//
//  MediaFeedViewControllerDataSource.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class ListSectionDataSource: NSObject {

    // MARK: - Attributes
    
    var objects: [ListDiffable] = []
    
}

// MARK: - ListAdapterDataSource

extension ListSectionDataSource: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return objects
    }
    
    func listAdapter(
        _ listAdapter: ListAdapter,
        sectionControllerFor object: Any
    ) -> ListSectionController {
        
        switch object {
        case is FeedHeaderViewModel:
            return FeedHeaderSectionController()
            
        case is MediaSectionViewModel:
            return SectionedMediaSectionController()
            
        case is MediaCellViewModel,
             is SkeletonCellViewModel:
            
            return MediaSectionController()
            
        case is EmptyStateViewModel:
            return EmptyStateSectionController()
            
        case is LoadingCellViewModel:
            return LoadingSectionController()
            
        default:
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {        
        return nil
    }
    
}
