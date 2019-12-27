//
//  EmptyStateViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class EmptyStateViewModel {
    
    // MARK: - Attributes
    
    let identifier: String
    
    // MARK: - LifeCycle
    
    init() {
        identifier = UUID().uuidString
    }
    
    // MARK: - Properties
    
    var title: String {
        return L10n.searchEmptyStateTitle
    }
    
    var subtitle: String {
        return L10n.searchEmptyStateSubtitle
    }
    
    var imageName: String {
        return "results"
    }
    
}

// MARK: - ListDiffable

extension EmptyStateViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? EmptyStateViewModel
            else { return false }
        
        return identifier == object.identifier
    }
    
}
