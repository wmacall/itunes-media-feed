//
//  PaginatedRequestModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

struct PaginatedRequestModel: Encodable {
    let query: String?
    let page: Int
    let itemsPerPage: Int
}

