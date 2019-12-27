//
//  ScrollView+LoadMore.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import UIKit

extension UIScrollView {
    func distance(targetContentOffsetPointee: UnsafeMutablePointer<CGPoint>) -> CGFloat {
        let tableViewHeight = contentSize.height
        let offset = targetContentOffsetPointee.pointee.y + bounds.height
        let distance = tableViewHeight - offset
        return distance
    }
}
