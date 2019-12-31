//
//  ViewControllerAssembly.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Swinject

final class ViewControllerAssembly: Assembly {

    func assemble(container: Container) {

        // MediaFeedViewController

        container.register(MediaFeedViewController.self) { resolver in
            guard let mediaFeedViewModel = resolver.resolve(MediaFeedViewModelType.self)
                else { fatalError("Unable to resolve MediaFeedViewModel") }
            
            let mediaFeedViewController = MediaFeedViewController()
            mediaFeedViewController.viewModel = mediaFeedViewModel
            return mediaFeedViewController
        }
        
        // MediaContentViewController
        
        container.register(MediaContentViewController.self) { (resolver, mediaModel: Media) in
            guard let  mediaContentViewModelType = resolver.resolve(MediaContentViewModelType.self, argument: mediaModel)
            else { fatalError("Unable to resolve MediaFeedViewModel") }
                
            let mediaContentViewController = MediaContentViewController()
            mediaContentViewController.viewModel = mediaContentViewModelType
            return mediaContentViewController
        }

    }

}
