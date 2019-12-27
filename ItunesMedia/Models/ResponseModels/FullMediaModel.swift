//
//  ResponseMediaModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

struct FullMediaModel: Media, Decodable {
    
    var kindValue: String
    let trackId: Int
    let artistName: String
    let artworkUrl60: String
    let releaseDate: String
    let trackName: String?
    let primaryGenreName: String?
    let collectionViewUrl: String?
    let previewUrl: String?
    let artworkUrl600: String?
    let genres: [String]?
    let artworkUrl100: String?
    let description: String?
    let price: String?
    let trackViewUrl: String?
    let longDescription: String?
    let collectionName: String?
    
    var kind: KindType? {
        return KindType(rawValue: kindValue)
    }

    private enum CodingKeys : String, CodingKey {
        case kindValue = "kind"
        case trackId
        case artistName
        case artworkUrl60
        case releaseDate
        case trackName
        case primaryGenreName
        case collectionViewUrl
        case previewUrl
        case artworkUrl600
        case genres
        case artworkUrl100
        case description
        case price
        case trackViewUrl
        case longDescription
        case collectionName

    }
    
}
