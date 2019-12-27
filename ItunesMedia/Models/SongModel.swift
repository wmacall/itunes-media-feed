//
//  SongModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

struct SongModel: Media, Decodable {    
    
    var kindValue: String
    let trackId: Int
    let artistName: String
    let artworkUrl60: String
    let releaseDate: String
    let trackName: String
    let primaryGenreName: String
    let collectionViewUrl: String
    let previewUrl: String
    let artworkUrl100: String
    
    var kind: KindType? {
        return KindType(rawValue: kindValue)
    }
    
}
