//
//  Commons.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import RxSwift

typealias FetchHandler = (PaginatedRequestModel) -> Observable<[Model]>
