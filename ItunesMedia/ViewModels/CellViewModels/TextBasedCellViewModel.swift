//
//  TextBasedCellViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class TextBasedCellViewModel {
    
    // MARK: - Attributes
    
    let identifier: String
    let title: String
    let content: String
    
    // MARK: - LifeCycle
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
        identifier = UUID().uuidString
    }
    
}

// MARK: - ListDiffable

extension TextBasedCellViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? TextBasedCellViewModel
            else { return false }
        
        return identifier == object.identifier
    }
    
}

