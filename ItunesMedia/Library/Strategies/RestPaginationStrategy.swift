//
//  RestPaginationStrategy.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import RxSwift
import RxCocoa

final class RestPaginationStrategy: PaginationStrategy {

    // MARK: - Attributes
    
    var itemsPerPage: Int
    var currentPage = 1
    var isFetching = false
    var hasNextPage = true

    var fetchHandler: FetchHandler?
    var models = BehaviorRelay<[Model]>(value: [])

    // MARK: - Inputs
    
    var querySearch = BehaviorSubject<String?>(value: nil)
    var fetchFirstPage = PublishSubject<Void>()
    var fetchNextPage = PublishSubject<Void>()

    // MARK: - Outputs
    
    let displayLoadingIndicator = BehaviorRelay<Bool>(value: false)
    let displaySkeletonModels = BehaviorRelay<Bool>(value: true)
    lazy var updateModels: Observable<Void> = {
        let shouldSearchItems = Observable.combineLatest(
            fetchFirstPage.startWith(()),
            querySearch.distinctUntilChanged()
        )
        .do(onNext: { [unowned self] _ in
            self.isFetching = true
            self.currentPage = 1
            self.displaySkeletonModels.accept(true)
        })
        .flatMapLatest { [weak self] _ -> Observable<Void> in
            return Observable.of(())
        }

        let shouldLoadNextPage = fetchNextPage
            .skipWhile { [unowned self] _ in self.isFetching && self.models.value.isEmpty }
            .filter { [unowned self] _ in self.hasNextPage }
            .do(onNext: { [displayLoadingIndicator] _ in
                displayLoadingIndicator.accept(true)
            })
            .debounce(.seconds(2), scheduler: MainScheduler.instance)

        return Observable.merge(
            shouldSearchItems,
            shouldLoadNextPage
        )
        .flatMapLatest { [unowned self] _ -> Observable<[Model]> in
            guard let fetchHandler = self.fetchHandler
                else { fatalError("Origin for data not provided") }

            let query = try self.querySearch.value()
            let requestModel = PaginatedRequestModel(
                query: query,
                page: self.currentPage,
                itemsPerPage: self.itemsPerPage
            )
            return fetchHandler(requestModel)
        }            
        .do(onNext: { [weak self] models in
            guard let self = self else { return }
            self.hasNextPage = models.count > 0
            self.displayLoadingIndicator.accept(false)
            self.displaySkeletonModels.accept(false)

            if self.currentPage == 1 {
                // replace models
                self.models.accept(models)
            } else {
                // add fetched models
                var currentModels = self.models.value
                currentModels.append(contentsOf: models)
                self.models.accept(currentModels)
            }
            
            // set next page
            if self.hasNextPage {
                self.currentPage += 1
            }
            
            self.isFetching = false
                        
        })
        .map { _ in () }
    }()

    // MARK: - LifeCycle
    
    init(itemsPerPage: Int) {
        self.itemsPerPage = itemsPerPage
    }
    
}
