//
//  SMDataProviding.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 7/14/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import Foundation

public protocol SMDataProviding {
    associatedtype Item

    var items: [Item] { get set }
    var numberOfSections: Int { get }

    func reload(_ completion: SMReloadCompletion?)
    func item(at indexPath: IndexPath) -> Item

    func numberOfItemsIn(section: Int) -> Int
}

public extension SMDataProviding {
    var numberOfSections: Int {
        return 1
    }

    func numberOfItemsIn(section: Int) -> Int {
        return items.count
    }

    func reload(_ completion: SMReloadCompletion?) {
        completion?()
    }

    func item(at indexPath: IndexPath) -> Item {
        return items[indexPath.row]
    }

    subscript(index: Int) -> Item {
        return item(at: IndexPath(row: index, section: 0))
    }

    subscript(indexPath: IndexPath) -> Item {
        return item(at: indexPath)
    }
}
