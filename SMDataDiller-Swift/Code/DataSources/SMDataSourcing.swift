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
    func reload(_ completion: SMReloadCompletion?)

    func cellReuseIdentifier(at indexPath: IndexPath) -> String
    
    func didSelectRow(at indexPath: IndexPath)
    func didDeselectRow(at indexPath: IndexPath)
}

public extension SMDataSourcing {
    var shouldAutoDeselectCells: Bool {
        return true
    }

    func reload(_ completion: SMReloadCompletion?) {
        dataProvider.reload(completion)
    }
}
