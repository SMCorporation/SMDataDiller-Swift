//
//  SMTableViewDataSource.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 7/22/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import UIKit

open class SMTableViewDataSource<DataProviderType: SMDataProviding>: SMTableViewDataSourcing {
    public typealias DataProvider = DataProviderType

    public var tableView: UITableView

    public var dataProvider: DataProviderType

    public func didSelectRow(at indexPath: IndexPath) {

    }

    public func didDeselectRow(at indexPath: IndexPath) {

    }

    init(tableView: UITableView, dataProvider: DataProviderType) {
        self.tableView = tableView
        self.dataProvider = dataProvider
    }
}

//open class SMTableViewDataSource<T: SMDataProviding>: SMTableViewDataSourcing {
//    public typealias DataProvider = T
//
//    public var tableView: UITableView
//    public var dataProvider: T
//
//    public func didSelectRow(at indexPath: IndexPath) {
//
//    }
//
//    public func didDeselectRow(at indexPath: IndexPath) {
//
//    }
//
//
////    open var tableView: UITableView!
////        {
////        didSet {
////            tableView.delegate = self
////            tableView.dataSource = self
////        }
////    }
//
//    init(tableView: UITableView, dataProvider: T) {
//        self.tableView = tableView
//        self.dataProvider = dataProvider
//    }
//}
//
////extension SMTableViewDataSource
//
