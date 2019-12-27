//
//  SearchRequestModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

struct SearchRequestModel: Encodable {
    let query: String?
    let offset: Int?
    let limit: Int?
}
