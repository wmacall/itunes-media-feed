//
//  Protocol.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import RxCocoa
import IGListKit

protocol MediaContentViewModel {
    var mediaContent: Driver<[ListDiffable]> { get }
    var title: String { get }
}
