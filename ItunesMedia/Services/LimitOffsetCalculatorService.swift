//
//  LimitOffsetCalculatorService.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

final class LimitOffsetCalculatorService {
    
    func limitOffset(from page: Int, itemsPerPage: Int) -> (Int, Int) {
        return (itemsPerPage, (page - 1) * itemsPerPage)
    }
    
}
