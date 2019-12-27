//
//  ApplicationCoordinator.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {

    // MARK: - Attributes

    let window: UIWindow
    var presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?

    // MARK: - LifeCycle

    init(window: UIWindow) {
        self.window = window
        presenter = UINavigationController()
        presenter.navigationBar.prefersLargeTitles = true
        window.rootViewController = presenter
    }

    // MARK: Start

    func start() {
        guard let usersCoordinator = Injector.sharedAssambler.resolver.resolve(
            MediaFeedCoordinator.self,
            arguments: presenter,
            self as Coordinator
        ) else { fatalError("Unable to resolve UsersCoordinator") }

        usersCoordinator.start()
        window.makeKeyAndVisible()

        addChildCoordinator(usersCoordinator)
    }

}
