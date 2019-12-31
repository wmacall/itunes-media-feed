//
//  UseCaseAssembly.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Swinject

final class UseCaseAssembly: Assembly {

    func assemble(container: Container) {
        
        // SearchMediaUseCaseType
        
        container.register(SearchMediaUseCaseType.self) { resolver in
            guard let mediaRepository = resolver.resolve(WebBasedMediaRepository.self),
                let limitOffsetAdapter = resolver.resolve(LimitOffsetBasedAdapter.self)
                else { fatalError("Unable to resolve dependencies for SearchMediaUseCaseType") }
            
            return SearchMediaUseCaseType(
                limitOffsetAdapter: limitOffsetAdapter,
                mediaRepository: mediaRepository
            )
        }
                
    }

}
