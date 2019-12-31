//
//  ViewModelAssembly.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Swinject

final class ViewModelAssembly: Assembly {

    func assemble(container: Container) {
        
        // MediaFeedViewModel
        
        container.register(MediaFeedViewModelType.self) { resolver in
            guard let paginationStrategy = resolver.resolve(RestPaginationStrategy.self),
                let searchMediaUseCase = resolver.resolve(SearchMediaUseCaseType.self),
                let feedMediaFactory = resolver.resolve(FeedMediaFactory.self)
                else { fatalError("Unable to resolve dependencies for MediaFeedViewModel") }
            
            return MediaFeedViewModelType(
                paginationStrategy: paginationStrategy,
                searchMediaUseCase: searchMediaUseCase,
                feedMediaFactory: feedMediaFactory
            )
        }
        
        // MediaContentViewModelType
        
        container.register(MediaContentViewModelType.self) { (resolver, mediaModel: Media) in
            guard let mediaContentFactory = resolver.resolve(MediaContentFactory.self)
                else { fatalError("Unable to resolve dependencies for MediaFeedViewModel") }
            
            return MediaContentViewModelType(
                mediaModel: mediaModel,
                mediaContentFactory: mediaContentFactory
            )
        }
        
    }

}
