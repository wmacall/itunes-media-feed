//
//  Sequence+grouping.swift
//  ItunesMedia
//
//  Created by Gustavo Lopez on 12/27/19.
//  Copyright © 2019 Gustavo Lopez. All rights reserved.
//

import Foundation

extension Sequence {
    func group<GroupingType: Hashable>(by key: (Iterator.Element) -> GroupingType) -> [(GroupingType ,[Iterator.Element])] {
        var groups: [GroupingType: [Iterator.Element]] = [:]
        var groupsOrder: [GroupingType] = []
        forEach { element in
            let key = key(element)
            if case nil = groups[key]?.append(element) {
                groups[key] = [element]
                groupsOrder.append(key)
            }
        }
        return groupsOrder.map { ($0, groups[$0]!) }
    }
}
