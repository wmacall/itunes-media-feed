//
//  PodcastModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

struct PodcastModel: Media, Decodable {
    
    let kindValue: String
    let trackId: Int
    let artistName: String
    let artworkUrl60: String
    let releaseDate: String
    let trackName: String
    let artworkUrl600: String
    let genres: [String]
    let collectionViewUrl: String
    
    var kind: KindType? {
        return KindType(rawValue: kindValue)
    }
    
}
