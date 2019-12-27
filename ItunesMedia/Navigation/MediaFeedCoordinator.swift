//
//  MediaFeedCoordinator.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit

final class MediaFeedCoordinator: Coordinator {
    
    // MARK: - Attributes
    
    let presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    
    // MARK: - LifeCycle
    
    init(presenter: UINavigationController,
         parentCoordinator: Coordinator) {
        
        self.presenter = presenter
        self.parentCoordinator = parentCoordinator
    }
    
    // MARK: - Start
    
    func start() {
        guard let mediaFeedViewController = Injector.sharedAssambler.resolver.resolve(MediaFeedViewController.self)
            else { fatalError("Unable to resolve UsersViewController") }
        
        mediaFeedViewController.delegate = self
        presenter.pushViewController(mediaFeedViewController, animated: true)
    }
    
}

// MARK: - MediaFeedViewControllerDelegate

extension MediaFeedCoordinator: MediaFeedViewControllerDelegate {
    
    func mediaFeedViewControllerDidSelectMedia(_ media: Media) {
        guard let mediaContentViewController = Injector.sharedAssambler.resolver.resolve(
                MediaContentViewController.self,
                argument: media
            )
            else { fatalError("Unable to resolve UsersViewController") }
                
        presenter.pushViewController(mediaContentViewController, animated: true)
    }
    
}
