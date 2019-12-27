//
//  FeedMediaFactory.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import IGListKit

final class FeedMediaFactory {
    
    func mediaModelFromKind(model: Model) -> Media? {
        guard let model = model as? FullMediaModel,
            let mediaKind = model.kind
            else { return nil }
        
        switch mediaKind {
        case .song:
            guard let trackName = model.trackName,
                let primaryGenreName = model.primaryGenreName,
                let collectionViewUrl = model.collectionViewUrl,
                let previewUrl = model.previewUrl,
                let artworkUrl100 = model.artworkUrl100
                else { return nil }
            
            return SongModel(
                kindValue: model.kindValue,
                trackId: model.trackId,
                artistName: model.artistName,
                artworkUrl60: model.artworkUrl60,
                releaseDate: model.releaseDate,
                trackName: trackName,
                primaryGenreName: primaryGenreName,
                collectionViewUrl: collectionViewUrl,
                previewUrl: previewUrl,
                artworkUrl100: artworkUrl100
            )
            
        case .podcast:
            guard let trackName = model.trackName,
                let artworkUrl600 = model.artworkUrl600,
                let collectionViewUrl = model.collectionViewUrl,
                let genres = model.genres
                else { return nil }
            
            return PodcastModel(
                kindValue: model.kindValue,
                trackId: model.trackId,
                artistName: model.artistName,
                artworkUrl60: model.artworkUrl60,
                releaseDate: model.releaseDate,
                trackName: trackName,
                artworkUrl600: artworkUrl600,
                genres: genres,
                collectionViewUrl: collectionViewUrl
            )
            
        case .ebook:
            guard let artworkUrl100 = model.artworkUrl100,
                let trackViewUrl = model.trackViewUrl,
                let description = model.description,                
                let trackName = model.trackName,
                let genres = model.genres,
                let price = model.price
                else { return nil }
            
            return EbookModel(
                kindValue: model.kindValue,
                trackId: model.trackId,
                artistName: model.artistName,
                artworkUrl60: model.artworkUrl60,
                releaseDate: model.releaseDate,
                artworkUrl100: artworkUrl100,
                description: description,
                price: price,
                genres: genres,
                trackName: trackName,
                trackViewUrl: trackViewUrl
            )
            
        case .movie:
            guard let trackName = model.trackName,
                let primaryGenreName = model.primaryGenreName,
                let collectionViewUrl = model.collectionViewUrl,
                let longDescription = model.longDescription
                else { return nil }
            
            return MovieModel(
                kindValue: model.kindValue,
                trackId: model.trackId,
                artistName: model.artistName,
                artworkUrl60: model.artworkUrl60,
                releaseDate: model.releaseDate,
                trackName: trackName,
                primaryGenreName: primaryGenreName,
                collectionViewUrl: collectionViewUrl,
                longDescription: longDescription
            )
            
        case .show:
            guard let longDescription = model.longDescription,
                let primaryGenreName = model.primaryGenreName,
                let trackViewUrl = model.trackViewUrl,
                let collectionName = model.collectionName
                else { return nil }
            
            return TvShowModel(
                kindValue: model.kindValue,
                trackId: model.trackId,
                artistName: model.artistName,
                artworkUrl60: model.artworkUrl60,
                releaseDate: model.releaseDate,
                longDescription: longDescription,
                primaryGenreName: primaryGenreName,
                trackViewUrl: trackViewUrl,
                collectionName: collectionName
            )
        }
    }
    
    func cellViewModel(from media: Media) -> ListDiffable? {
        switch media {
        case let songModel as SongModel:
            return MediaCellViewModel(
                artworkUrl: songModel.artworkUrl100,
                title: songModel.trackName,
                subtitle: songModel.artistName,
                datetime: songModel.releaseDate,
                model: songModel
            )
            
        case let movieModel as MovieModel:
            return MediaCellViewModel(
                artworkUrl: movieModel.artworkUrl60,
                title: movieModel.trackName,
                subtitle: movieModel.artistName,
                datetime: movieModel.releaseDate,
                model: movieModel
            )
            
        case let podcastModel as PodcastModel:
            return MediaCellViewModel(
                artworkUrl: podcastModel.artworkUrl600,
                title: podcastModel.trackName,
                subtitle: podcastModel.artistName,
                datetime: podcastModel.releaseDate,
                model: podcastModel
            )
            
        case let tvShowModel as TvShowModel:
            return MediaCellViewModel(
                artworkUrl: tvShowModel.artworkUrl60,
                title: tvShowModel.collectionName,
                subtitle: tvShowModel.artistName,
                datetime: tvShowModel.releaseDate,
                model: tvShowModel
            )
            
        case let ebookModel as EbookModel:
            return MediaCellViewModel(
                artworkUrl: ebookModel.artworkUrl60,
                title: ebookModel.trackName,
                subtitle: ebookModel.artistName,
                datetime: ebookModel.releaseDate,
                model: ebookModel
            )
            
        default: return nil
        }
    }
    
    func sections(with models: [Media], skeletonModels: Bool, loadingIndicator: Bool) -> [ListDiffable] {
        if skeletonModels {
            return SkeletonCellViewModel.skeletonSections(count: 3)
        }
        
        var mediaModels = models.compactMap { [unowned self] model in
                self.mediaModelFromKind(model: model)
            }
            .group(by: { $0.kind?.title ?? "" })
            .map { [unowned self] section -> ListDiffable in
                MediaSectionViewModel(
                    title: section.0,
                    viewModels: section.1.compactMap { self.cellViewModel(from: $0) },
                    isSkeleton: false
                )
            }
        
        if loadingIndicator {
            mediaModels.append(LoadingCellViewModel())
        }
        
        if mediaModels.count == 0 {
            mediaModels.append(EmptyStateViewModel())
        }
        
        return mediaModels
    }
    
}
