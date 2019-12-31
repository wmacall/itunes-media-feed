//
//  FactoryAssembly.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Swinject

final class FactoryAssembly: Assembly {

    func assemble(container: Container) {

        // FeedMediaFactory

        container.register(FeedMediaFactory.self) { _ in
            FeedMediaFactory()
        }
        
        // MediaContentFactory
        
        container.register(MediaContentFactory.self) { _ in
            MediaContentFactory()
        }

    }

}
