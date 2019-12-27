//
//  MediaFeedViewControllerDelegate.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

protocol MediaFeedViewControllerDelegate: class {
    func mediaFeedViewControllerDidSelectMedia(_ media: Media)
}
