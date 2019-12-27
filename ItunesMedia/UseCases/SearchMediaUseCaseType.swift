//
//  SearchMediaUseCaseType.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import RxSwift

final class SearchMediaUseCaseType: SearchMediaUseCase {

    // MARK: - Attributes

    let limitOffsetAdapter: LimitOffsetBasedAdapter
    let mediaRepository: MediaRepository

    // MARK: - LifeCycle

    init(limitOffsetAdapter: LimitOffsetBasedAdapter,
         mediaRepository: MediaRepository) {

        self.limitOffsetAdapter = limitOffsetAdapter
        self.mediaRepository = mediaRepository
    }

    // MARK: - Fetch

    func fetch(with searchRequestModel: PaginatedRequestModel) -> Observable<[FullMediaModel]> {
        let limitOffset = limitOffsetAdapter.limitOffset(
            from: searchRequestModel.page,
            itemsPerPage: searchRequestModel.itemsPerPage
        )

        let searchRequestModel = SearchRequestModel(
            query: searchRequestModel.query,
            offset: limitOffset.1,
            limit: limitOffset.0
        )

        return mediaRepository.fetch(with: searchRequestModel)
    }
    
}
