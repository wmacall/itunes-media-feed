//
//  MediaModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

struct TvShowModel: Media, Decodable {
    let trackId: Int
    let artistName: String
    let artworkUrl60: String
    let releaseDate: String
    let longDescription: String
    let primaryGenreName: String
    let trackViewUrl: String
    let collectionName: String
}
