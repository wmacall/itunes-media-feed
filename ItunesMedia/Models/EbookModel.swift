//
//  EbookModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

struct EbookModel: Media, Decodable {
    
    let kindValue: String
    let trackId: Int
    let artistName: String
    let artworkUrl60: String
    let releaseDate: String
    let artworkUrl100: String
    let description: String
    let price: String
    let genres: [String]
    let trackName: String
    let trackViewUrl: String
    
    var kind: KindType? {
        return KindType(rawValue: kindValue)
    }
    
}
