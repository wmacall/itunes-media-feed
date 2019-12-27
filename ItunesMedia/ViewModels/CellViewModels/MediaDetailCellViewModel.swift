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
    let datetime: String
    let url: String
    
    // MARK: - LifeCycle
    
    init(artworkUrl: String,
         title: String,
         subtitle: String,
         datetime: String,
         url: String) {
        
        self.artworkUrl = artworkUrl
        self.title = title
        self.subtitle = subtitle
        self.datetime = datetime
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
    
    var date: String {
        return datetime.toDate()?.mediaDateFormat() ?? datetime
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


