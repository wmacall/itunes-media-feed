//
//  WebBasedMediaRepository.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/26/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import RxSwift

protocol MediaRepository {
    func fetch(with searchRequestModel: SearchRequestModel) -> Observable<[FullMediaModel]>
}
