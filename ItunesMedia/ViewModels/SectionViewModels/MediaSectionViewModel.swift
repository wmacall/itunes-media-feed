//
//  MediaSectionViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class MediaSectionViewModel {
    
    // MARK: - Attributes
    
    let title: String
    let viewModels: [ListDiffable]
    let identifier: String
    let isSkeleton: Bool
    
    // MARK: - LifeCycle
    
    init(title: String, viewModels: [ListDiffable], isSkeleton: Bool) {
        self.title = title
        self.viewModels = viewModels
        self.isSkeleton = isSkeleton
        
        identifier = UUID().uuidString
    }
    
}

// MARK: - ListDiffable

extension MediaSectionViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? MediaSectionViewModel
            else { return false }
        
        return identifier == object.identifier
    }
    
}
