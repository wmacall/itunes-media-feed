//
//  SognCellViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class MediaCellViewModelType: MediaCellViewModel {
    
    // MARK: - Attributes
    
    let identifier: String
    let artworkUrl: String
    let title: String
    let subtitle: String
    let datetime: String
    let model: Media
    
    // MARK: - LifeCycle
    
    init(artworkUrl: String,
         title: String,
         subtitle: String,
         datetime: String,
         model: Media) {
        
        self.artworkUrl = artworkUrl
        self.title = title
        self.subtitle = subtitle
        self.datetime = datetime
        self.model = model
        identifier = UUID().uuidString
    }
    
    // MARK: - Properties
    
    var imageURL: URL? {
        return URL(string: artworkUrl)
    }
    
    var date: String {
        return datetime.toDate()?.mediaDateFormat() ?? datetime
    }
    
}

// MARK: - ListDiffable

extension MediaCellViewModelType: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? MediaCellViewModelType
            else { return false }
        
        return identifier == object.identifier
    }
    
}
