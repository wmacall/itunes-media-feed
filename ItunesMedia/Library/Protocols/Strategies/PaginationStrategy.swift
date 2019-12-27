//
//  PaginationStrategy.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import RxSwift
import RxCocoa

protocol PaginationStrategy {

    var itemsPerPage: Int { get }
    var isFetching: Bool { get set }
    var models: BehaviorRelay<[Model]> { get }

    // Inputs
    
    var querySearch: BehaviorSubject<String?> { get }
    var fetchFirstPage: PublishSubject<Void> { get }
    var fetchNextPage: PublishSubject<Void> { get }
    var fetchHandler: FetchHandler? { get set }

    // Outpus

    var displayLoadingIndicator: BehaviorRelay<Bool> { get }
    var displaySkeletonModels: BehaviorRelay<Bool> { get }
    var updateModels: Observable<Void> { get }

}
