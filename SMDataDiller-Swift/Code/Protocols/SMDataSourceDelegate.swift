//
//  SMBaseDataSourceDelegate.swift
//  SMDataDiller-Swift
//
//  Created by Max on 26.06.2018.
//  Copyright © 2018 molfar.io. All rights reserved.
//

import Foundation

public protocol SMDataSourceDelegate: AnyObject {
    associatedtype DataSource: SMDataSourcing

    func dataSource(_ dataSource: DataSource, didSelectRowAt indexPath: IndexPath, with item: DataSource.DataProvider.Item)
    func dataSource(_ dataSource: DataSource, didDeselectRowAt indexPath: IndexPath, with item: DataSource.DataProvider.Item)
}
