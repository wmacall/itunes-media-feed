//
//  SkeletonCellViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class SkeletonCellViewModel {
    
    // MARK: - Attributes
    
    let identifier: String
    
    // MARK: - LifeCycle
    
    init() {
        identifier = UUID().uuidString
    }
    
}

// MARK: - ListDiffable

extension SkeletonCellViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? SkeletonCellViewModel
            else { return false }
        
        return identifier == object.identifier
    }
    
}

extension SkeletonCellViewModel {
    
    static func skeletonModels(count: Int) -> [SkeletonCellViewModel] {
        var models: [SkeletonCellViewModel] = []
        for _ in 0..<count {
            models.append(.init())
        }
        
        return models
    }
    
    static func skeletonSections(count: Int) -> [MediaSectionViewModel] {
        var models: [MediaSectionViewModel] = []
        for _ in 0..<count {
            models.append(MediaSectionViewModel(
                title: L10n.sectionTitlePlaceholder,
                viewModels: skeletonModels(count: count),
                isSkeleton: true
            ))
        }
        
        return models
    }
    
}
