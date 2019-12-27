//
//  MediaDetailCellViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class MediaDetailCellViewModel {
    
    // MARK: - Attributes
    
    let identifier: String
    let artworkUrl: String
    let title: String
    let subtitle: String
    let footer: String
    let url: String
    
    // MARK: - LifeCycle
    
    init(artworkUrl: String,
         title: String,
         subtitle: String,
         footer: String,
         url: String) {
        
        self.artworkUrl = artworkUrl
        self.title = title
        self.subtitle = subtitle
        self.footer = footer
        self.url = url
        identifier = UUID().uuidString
    }
    
    // MARK: - Properties
    
    var imageURL: URL? {
        return URL(string: artworkUrl)
    }
    
    var storeURL: URL? {
        return URL(string: url)
    }

}

// MARK: - ListDiffable

extension MediaDetailCellViewModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? MediaDetailCellViewModel
            else { return false }
        
        return identifier == object.identifier
    }
    
}


