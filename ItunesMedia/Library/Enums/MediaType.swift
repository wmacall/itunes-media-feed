//
//  MediaType.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

enum MediaType: String {
    case movie
    case podcast
    case music
    case tvShow
    case ebook
    case all
}

extension MediaType {
    func model(for kind: String) -> Media {
        fatalError("Not implemented yet")
    }
}
