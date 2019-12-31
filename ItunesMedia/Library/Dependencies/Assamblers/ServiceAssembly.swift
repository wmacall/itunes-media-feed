//
//  ServiceAssembly.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Swinject

final class ServiceAssembly: Assembly {

    func assemble(container: Container) {

        // LimitOffsetCalculatorService

        container.register(LimitOffsetCalculatorService.self) { _ in
            LimitOffsetCalculatorService()
        }

    }

}
