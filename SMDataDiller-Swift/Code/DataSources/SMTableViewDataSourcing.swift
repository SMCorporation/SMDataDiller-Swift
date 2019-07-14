//
//  SMTableViewDataSourcing.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 7/14/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import UIKit

public protocol SMTableViewDataSourcing: SMDataSourcing {

    func classForCell(at indexPath: IndexPath) -> UITableViewCell.Type
    func fill<T: UITableViewCell>(cell: T, at indexPath: IndexPath)
}

public extension SMTableViewDataSourcing {

    func cellReuseIdentifier(at indexPath: IndexPath) -> String {
        let cellClass = classForCell(at: indexPath)
        return String(describing: cellClass)
    }

    func fill<T: UITableViewCell>(cell: T, at indexPath: IndexPath) where T: SMCell, DataProvider.Item == T.Item {
        cell.fill(from: dataProvider.item(at: indexPath))
    }
}
