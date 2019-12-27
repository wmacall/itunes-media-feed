//
//  MediaContentFactgory.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class MediaContentFactory {
    
    func content(from model: Media) -> [ListDiffable] {
        switch model {
        case let songModel as SongModel:
            let mediaDetailCellViewModel = MediaDetailCellViewModel(
                artworkUrl: songModel.artworkUrl100,
                title: songModel.trackName,
                subtitle: songModel.artistName,
                datetime: songModel.releaseDate,
                url: songModel.collectionViewUrl
            )
            
            let genre = TextBasedCellViewModel(
                title: L10n.genreTitle,
                content: songModel.primaryGenreName
            )
            
            return [mediaDetailCellViewModel, genre]
            
        case let movieModel as MovieModel:
            let mediaDetailCellViewModel = MediaDetailCellViewModel(
                artworkUrl: movieModel.artworkUrl60,
                title: movieModel.trackName,
                subtitle: movieModel.artistName,
                datetime: movieModel.releaseDate,
                url: movieModel.collectionViewUrl
            )
            
            let genre = TextBasedCellViewModel(
                title: L10n.genreTitle,
                content:  movieModel.primaryGenreName
            )
            
            let description = TextBasedCellViewModel(
                title: L10n.descriptionTitle,
                content: movieModel.longDescription
            )
            
            return [mediaDetailCellViewModel, genre, description]
            
        case let podcastModel as PodcastModel:
            let mediaDetailCellViewModel = MediaDetailCellViewModel(
                artworkUrl: podcastModel.artworkUrl600,
                title: podcastModel.trackName,
                subtitle: podcastModel.artistName,
                datetime: podcastModel.releaseDate,
                url: podcastModel.collectionViewUrl
            )
                        
            let genres = TextBasedCellViewModel(
                title: L10n.genresTitle,
                content: genresWithBulletFormat(genres: podcastModel.genres)
            )
            
            return [mediaDetailCellViewModel, genres]
            
        case let tvShowModel as TvShowModel:
            let mediaDetailCellViewModel = MediaDetailCellViewModel(
                artworkUrl: tvShowModel.artworkUrl60,
                title: tvShowModel.collectionName,
                subtitle: tvShowModel.artistName,
                datetime: tvShowModel.releaseDate,
                url: tvShowModel.trackViewUrl
            )
            
            let genre = TextBasedCellViewModel(
                title: L10n.genreTitle,
                content:  tvShowModel.primaryGenreName
            )
            
            let description = TextBasedCellViewModel(
                title: L10n.descriptionTitle,
                content: tvShowModel.longDescription
            )
            
            return [mediaDetailCellViewModel, genre, description]
            
        case let ebookModel as EbookModel:
            let mediaDetailCellViewModel = MediaDetailCellViewModel(
                artworkUrl: ebookModel.artworkUrl60,
                title: ebookModel.trackName,
                subtitle: ebookModel.artistName,
                datetime: ebookModel.releaseDate,
                url: ebookModel.trackViewUrl
            )
                        
            let genres = TextBasedCellViewModel(
                title: L10n.genreTitle,
                content: genresWithBulletFormat(genres: ebookModel.genres)
            )
            
            let description = TextBasedCellViewModel(
                title: L10n.descriptionTitle,
                content: ebookModel.description
            )
            
            return [mediaDetailCellViewModel, genres, description]
            
        default: return []
        }
    }
    
    
    private func genresWithBulletFormat(genres: [String]) -> String {
        let bullet = "\u{2022}"
        return L10n.genreList(bullet,genres.joined(separator: "\n\(bullet) "))
    }
}
