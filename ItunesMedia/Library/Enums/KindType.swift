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
        case .podcast: return L10n.podcastSectionTitle
        case .song: return L10n.songsSectionTitle
        case .movie: return L10n.moviesSectionTitle
        case .show: return L10n.showsSectionTitle
        case .ebook: return L10n.ebooksSectionTitle
        }
    }
}
