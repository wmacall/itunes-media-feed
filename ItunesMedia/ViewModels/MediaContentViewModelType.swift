//
//  MediaContentViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import RxSwift
import RxCocoa
import IGListKit

final class MediaContentViewModelType: MediaContentViewModel {
    
    // MARK: - Attributes
    
    private let mediaModel: Media
    private let mediaContentFactory: MediaContentFactory
    
    // MARK: - Outputs
        
    let mediaContent: Driver<[ListDiffable]>
    
    // MARK: - LifeCycle
    
    init(mediaModel: Media, mediaContentFactory: MediaContentFactory) {
        self.mediaModel = mediaModel
        self.mediaContentFactory = mediaContentFactory
        mediaContent = Observable.just(mediaContentFactory.content(from: mediaModel))
            .asDriver(onErrorJustReturn: [])
    }
    
    // MARK: - Properties
    
    var title: String {
        return mediaModel.artistName
    }
    
}
