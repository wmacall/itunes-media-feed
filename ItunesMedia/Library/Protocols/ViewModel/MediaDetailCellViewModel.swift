//
//  MediaDetailCellViewModel.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

protocol MediaDetailCellViewModel {
    var imageURL: URL? { get }
    var storeURL: URL? { get }
    var title: String { get }
    var subtitle: String { get }
    var date: String { get }    
}
