//
//  SMDataSourcing.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 5/20/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import Foundation

public protocol SMDataSourcing {
    associatedtype DataProvider: SMDataProviding

    var shouldAutoDeselectCells: Bool { get }

    var dataProvider: DataProvider { get set }
    func reload(_ completion: (() -> Void)?)

    func cellReuseIdentifier(at indexPath: IndexPath) -> String
}

public extension SMDataSourcing {
    var shouldAutoDeselectCells: Bool {
        return true
    }
}
