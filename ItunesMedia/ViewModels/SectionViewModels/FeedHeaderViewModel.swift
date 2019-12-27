//
//  MediaSelectionViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class FeedHeaderViewModel {
    
    // MARK: - Attributes
    
    let day: String
    
    // MARK: - LifeCycle
    
    init(day: String) {
        self.day = day.uppercased()
    }
    
}

// MARK: - ListDiffable
extension FeedHeaderViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return day as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? FeedHeaderViewModel
            else { return false }
        
        return day == object.day
    }
    
}
