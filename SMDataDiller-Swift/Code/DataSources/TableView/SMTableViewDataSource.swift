//
//  SMTableViewDataSource.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 7/22/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import UIKit

open class SMTableViewDataSource: SMTableViewDataSourcing {
    public typealias DataProvider = SMDataProvider<String>

    public var tableView: UITableView
    public var dataProvider: SMDataProvider<String>

    init(tableView: UITableView, dataProvider: DataProvider) {
        self.tableView = tableView
        self.dataProvider = dataProvider
    }

    public func didSelectRow(at indexPath: IndexPath) {

    }

    public func didDeselectRow(at indexPath: IndexPath) {

    }
}
