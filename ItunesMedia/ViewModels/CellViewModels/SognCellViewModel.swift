//
//  SognCellViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class MediaCellViewModel {
    
    // MARK: - Attributes
    
    let identifier: String
    let artworkUrl: String
    let title: String
    let subtitle: String
    let datetime: String
    
    // MARK: - LifeCycle
    
    init(artworkUrl: String,
         title: String,
         subtitle: String,
         datetime: String) {
        
        self.artworkUrl = artworkUrl
        self.title = title
        self.subtitle = subtitle
        self.datetime = datetime
        identifier = UUID().uuidString
    }
    
    // MARK: - Properties
    
    var imageURL: URL? {
        return URL(string: artworkUrl)
    }
    
    var date: String {
        return datetime // TODO: apply format
    }
    
}

// MARK: - ListDiffable

extension MediaCellViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? MediaCellViewModel
            else { return false }
        
        return identifier == object.identifier
    }
    
}
