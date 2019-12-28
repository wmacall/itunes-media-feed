//
//  MediaFeedViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import RxSwift
import IGListKit

protocol MediaFeedViewModel {
    var searchQuery: BehaviorSubject<String?> { get }
    var pullToRefresh: PublishSubject<Void> { get }
    var shouldLoadMore: PublishSubject<Void> { get }
    var shouldUpdateFeed: Observable<Void> { get }
    var listObjects: [ListDiffable] { get }
}
