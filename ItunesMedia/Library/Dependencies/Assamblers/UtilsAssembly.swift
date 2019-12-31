//
//  UtilsAssembly.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Swinject

final class UtilsAssembly: Assembly {

    func assemble(container: Container) {

        // LimitOffsetBasedAdapter
        
        container.register(LimitOffsetBasedAdapter.self) { resolver in
            guard let limitOffsetCalculatorService = resolver.resolve(LimitOffsetCalculatorService.self)
                else {fatalError("Unable to resolve LimitOffsetCalculatorService") }
            
            return LimitOffsetBasedAdapter(limitOffsetCalculatorService: limitOffsetCalculatorService)
        }

        container.register(RestPaginationStrategy.self) { _ in
            RestPaginationStrategy(itemsPerPage: K.Networking.Pagination.itemsPerPage)
        }

    }

}

