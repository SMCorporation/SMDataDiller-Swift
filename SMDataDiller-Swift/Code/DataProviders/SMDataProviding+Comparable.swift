//
//  SMDataProviding+Comparable.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 7/14/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import Foundation

public extension SMDataProviding where Item: Comparable {

    func indexPath(of item: Item) -> IndexPath? {
        guard let index = items.firstIndex(of: item) else {
            return nil
        }

        return IndexPath(row: index, section: 0)
    }
}
