//
//  MediaFeedViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import RxSwift
import RxCocoa
import IGListKit

final class MediaFeedViewModel {

    // MARK: - Attributes

    private var paginationStrategy: PaginationStrategy
    private let feedMediaFactory: FeedMediaFactory
    private let searchMediaUseCase: SearchMediaUseCase

    // MARK: - Inputs

    var searchQuery: BehaviorSubject<String?> {
        return paginationStrategy.querySearch
    }

    var pullToRefresh: PublishSubject<Void> {
        return paginationStrategy.fetchFirstPage
    }

    var shouldLoadMore: PublishSubject<Void> {
        return paginationStrategy.fetchNextPage
    }

    // MARK: - Outputs

    lazy var shouldUpdateFeed: Observable<Void> = {
        let shouldDisplaySkeletonModels = paginationStrategy
            .displaySkeletonModels.skipWhile { !$0 }
            .map { _ in () }

        let shouldDisplayLoadingIndicator = paginationStrategy
            .displayLoadingIndicator.skipWhile { !$0 }
            .map { _ in () }

        return Observable.merge(
            paginationStrategy.updateModels,
            shouldDisplaySkeletonModels,
            shouldDisplayLoadingIndicator
        )
    }()

    // MARK: - LifeCycle

    init(paginationStrategy: PaginationStrategy,
         searchMediaUseCase: SearchMediaUseCase,
         feedMediaFactory: FeedMediaFactory) {

        self.paginationStrategy = paginationStrategy
        self.searchMediaUseCase = searchMediaUseCase
        self.feedMediaFactory = feedMediaFactory
        
        self.paginationStrategy.fetchHandler = fetchHandler
    }

    private func fetch(requestModel: PaginatedRequestModel) -> Observable<[Model]> {
        return searchMediaUseCase.fetch(with: requestModel)
            .map { $0 as [Model] }
            .asDriver(onErrorJustReturn: [])
            .asObservable()
    }

    // MARK: - Properties

    private lazy var fetchHandler: FetchHandler = {
        [weak self] requestModel in

        guard let self = self else { return Observable.empty() }
        return self.fetch(requestModel: requestModel)
    }

    var listObjects: [ListDiffable] {
        let models = paginationStrategy.models.value
            .compactMap { $0 as? Media }

        var listObjects: [ListDiffable] = []        
        listObjects.append(FeedHeaderViewModel(day: Date().defaultFormat()))
        
        let sectionObjects = feedMediaFactory.sections(
            with: models,
            skeletonModels: paginationStrategy.displaySkeletonModels.value,
            loadingIndicator: paginationStrategy.displayLoadingIndicator.value
        )
        
        listObjects.append(contentsOf: sectionObjects)
        return listObjects
    }

}
