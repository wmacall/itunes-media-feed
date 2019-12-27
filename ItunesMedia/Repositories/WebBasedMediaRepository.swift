//
//  WebBasedMediaRepository.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Moya
import RxMoya
import RxSwift

final class WebBasedMediaRepository: MediaRepository {

    // MARK: - Providers

    private let provider = MoyaProvider<MediaProvider>(plugins: K.Moya.plugins)

    // MARK: - Fetch
    
    func fetch(with searchRequestModel: SearchRequestModel) -> Observable<[FullMediaModel]> {
        return provider.rx.request(.search(requestModel: searchRequestModel))
            .filterSuccessfulStatusCodes()
            .map(ResponseModel<FullMediaModel>.self)
            .map { $0.results }        
            .asObservable()
    }

}
