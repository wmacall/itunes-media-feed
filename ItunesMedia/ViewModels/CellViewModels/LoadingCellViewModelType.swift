//
//  LoadinCellViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class LoadingCellViewModelType: LoadingCellViewModel {
    
    // MARK: - Attributes
    
    let identifier: String
    
    // MARK: - LifeCycle
    
    init() {
        identifier = UUID().uuidString
    }
    
}

// MARK: - ListDiffable

extension LoadingCellViewModelType: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? LoadingCellViewModelType
            else { return false }
        
        return identifier == object.identifier
    }
    
}
