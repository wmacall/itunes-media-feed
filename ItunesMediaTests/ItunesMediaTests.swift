//
//  ItunesMediaTests.swift
//  ItunesMediaTests
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import XCTest
@testable import Itunes_Media

class ItunesMediaTests: XCTestCase {

    func testPageBasedPaginationToLimitAndOffset() {
        let itemsPerPage = 10

        let limitOffsetCalculatorService = LimitOffsetCalculatorService()
        let limitOffsetForFirstPage = limitOffsetCalculatorService.limitOffset(
            from: 1,
            itemsPerPage: itemsPerPage
        )

        let limitOffsetForSecondPage = limitOffsetCalculatorService.limitOffset(
            from: 2,
            itemsPerPage: itemsPerPage
        )

        // First Page
        XCTAssertEqual(limitOffsetForFirstPage.0, itemsPerPage)
        XCTAssertEqual(limitOffsetForFirstPage.1, 0)

        // Second Page
        XCTAssertEqual(limitOffsetForSecondPage.0, itemsPerPage)
        XCTAssertEqual(limitOffsetForSecondPage.1, 10)
    }


}
