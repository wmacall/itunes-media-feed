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
        let itmesPerPage = 10

        let limitOffsetCalculatorService = LimitOffsetCalculatorService()
        let limitOffsetForFirstPage = limitOffsetCalculatorService.limitOffset(
            from: 1,
            itemsPerPage: itmesPerPage
        )

        let limitOffsetForSecondPage = limitOffsetCalculatorService.limitOffset(
            from: 2,
            itemsPerPage: itmesPerPage
        )

        // First Page
        XCTAssertEqual(limitOffsetForFirstPage.0, itmesPerPage)
        XCTAssertEqual(limitOffsetForFirstPage.1, 0)

        // Second Page
        XCTAssertEqual(limitOffsetForSecondPage.0, itmesPerPage)
        XCTAssertEqual(limitOffsetForSecondPage.1, 10)
    }


}
