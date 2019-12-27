//
//  LimitOffsetBasedAdapter.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

final class LimitOffsetBasedAdapter {

    // MARK: - Attributes
    
    private let limitOffsetCalculatorService: LimitOffsetCalculatorService

    // MARK: - LifeCycle
    
    init(limitOffsetCalculatorService: LimitOffsetCalculatorService) {
        self.limitOffsetCalculatorService = limitOffsetCalculatorService
    }

    // MARK: - Helpers
    
    func limitOffset(from page: Int, itemsPerPage: Int) -> (Int, Int) {
        return limitOffsetCalculatorService.limitOffset(
            from: page,
            itemsPerPage: itemsPerPage
        )
    }

}
