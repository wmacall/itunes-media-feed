//
//  KindType.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

enum KindType: String {
    case podcast
    case song
    case movie = "feature-movie"
    case show = "tv-episode"
    case ebook
}

extension KindType {
    var title: String {
        switch self {
        case .podcast: return "Podcasts"
        case .song: return "Songs"
        case .movie: return "Movies"
        case .show: return "Shows"
        case .ebook: return "Ebooks"
        }
    }
}
