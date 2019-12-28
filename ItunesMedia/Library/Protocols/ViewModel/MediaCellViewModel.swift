//
//  MediaCellViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

protocol MediaCellViewModel {
    var imageURL: URL? { get }
    var title: String { get }
    var subtitle: String { get }
    var date: String { get }
    var model: Media { get }    
}
