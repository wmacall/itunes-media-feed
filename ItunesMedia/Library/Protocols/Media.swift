//
//  Media.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

protocol Media {
    var trackId: Int { get }
    var artistName: String { get }
    var artworkUrl60: String { get }
    var releaseDate: String { get }
}
