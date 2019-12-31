//
//  CoordinatorAssembly.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Swinject

final class CoordinatorAssembly: Assembly {

    func assemble(container: Container) {

        // MediaFeedCoordinator
        
        container.register(MediaFeedCoordinator.self) { _, presenter, parentCoordinator in
            MediaFeedCoordinator(presenter: presenter, parentCoordinator: parentCoordinator)
        }


    }

}
