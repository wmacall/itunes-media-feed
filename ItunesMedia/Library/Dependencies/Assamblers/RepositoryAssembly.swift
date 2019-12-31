//
//  RepositoryAssembly.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Swinject

final class RepositoryAssembly: Assembly {

    func assemble(container: Container) {
        
        // WebBasedMediaRepository
        
        container.register(WebBasedMediaRepository.self) { _ in
            WebBasedMediaRepository()
        }
    
    }

}
