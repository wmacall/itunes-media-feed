//
//  ResponseModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

struct ResponseModel<Model: Decodable>: Decodable {
    let results: [Model]
}
