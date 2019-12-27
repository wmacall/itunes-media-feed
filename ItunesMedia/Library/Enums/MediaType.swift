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
    var backgroundImage: String {
        switch self {
        case .movie: return R.Base.placeholder.name
        case .podcast: return R.Base.placeholder.name
        case .music: return R.Base.placeholder.name
        case .tvShow: return R.Base.placeholder.name
        case .ebook: return R.Base.placeholder.name        
        case .all: return R.Base.placeholder.name
        }
    }
}
