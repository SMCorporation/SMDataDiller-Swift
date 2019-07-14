//
//  SMDataProviding+Array.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 7/14/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import Foundation

extension SMDataProviding where Item: SMArray {

    var numberOfSections: Int {
        return items.count
    }

    func numberOfItemsIn(section: Int) -> Int {
        return items[section].arrayItems.count
    }
}

extension SMDataProviding where Item: SMArray {
    func item(at indexPath: IndexPath) -> Item.ArrayItem {
        return items[indexPath.section].arrayItems[indexPath.row]
    }
}

extension SMDataProviding where Item: SMArray, Item.ArrayItem: Comparable {
    func indexPath(of item: Item.ArrayItem) -> IndexPath? {

        for (section, array) in items.enumerated() {
            for (row, arrayItem) in array.arrayItems.enumerated() {
                if item == arrayItem {
                    return IndexPath(row: row, section: section)
                }
            }
        }

        return nil
    }
}
