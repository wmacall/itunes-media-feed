//
//  Injector.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Swinject

final class Injector {
    static let sharedAssambler: Assembler = {
        let container = Container()
        let assambler = Assembler([
                UseCaseAssembly(),
                RepositoryAssembly(),
                ViewModelAssembly(),
                ViewControllerAssembly(),
                CoordinatorAssembly(),
                ServiceAssembly(),
                FactoryAssembly(),
                UtilsAssembly()
            ],
            container: container
        )
        return assambler
    }()
}
