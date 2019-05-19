//
//  SMBaseDataSourceDelegate.swift
//  SMDataDiller-Swift
//
//  Created by Max on 26.06.2018.
//  Copyright © 2018 molfar.io. All rights reserved.
//

import Foundation

//public protocol SMBaseDataSourceDelegate: class {
//    func dataSource<ItemType: Equatable, DataProviderType: SMDataProvider, DataSourceType: SMBaseDataSource<DataProviderType>>(_ dataSource: DataSourceType, didSelectRowAt indexPath: IndexPath, with item: ItemType)
//
//    func dataSource<ItemType: Equatable, DataProviderType: SMDataProvider, DataSourceType: SMBaseDataSource<DataProviderType>>(_ dataSource: DataSourceType, didDeselectRowAt indexPath: IndexPath, with item: ItemType)
//}



public protocol SMBaseDataSourceDelegate: class {
//    associatedtype DataProviderType: SMDataProvider
//    associatedtype DataSourceType
    
//    func dataSource<DataSourceType: SMBaseDataSource, ItemType: Equatable>(_ dataSource: DataSourceType, didSelectRowAt indexPath: IndexPath, with item: ItemType) where ItemType == DataProviderType.ItemType, DataSourceType.
    
//    func dataSource<ItemType: Equatable, DataProviderType: SMDataProvider, DataSourceType: SMBaseDataSource<DataProviderType>>(_ dataSource: DataSourceType, didDeselectRowAt indexPath: IndexPath, with item: ItemType)
}
