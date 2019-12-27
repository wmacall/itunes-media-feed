//
//  LoadinCellViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class LoadingCellViewModel {
    
    // MARK: - Attributes
    
    let identifier: String
    
    // MARK: - LifeCycle
    
    init() {
        identifier = UUID().uuidString
    }    
    
}

// MARK: - ListDiffable

extension LoadingCellViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? LoadingCellViewModel
            else { return false }
        
        return identifier == object.identifier
    }
    
}
