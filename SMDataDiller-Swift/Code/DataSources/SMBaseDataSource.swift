//
//  SMBaseDataSource.swift
//  SMDataDiller-Swift
//
//  Created by Max on 28.05.2018.
//  Copyright © 2018 molfar.io. All rights reserved.
//

import Foundation

open class SMBaseDataSource<Delegate: SMBaseDataSourceDelegate, DataProviderType: SMDataProvider> {
    
    public weak var delegate: Delegate?
    public var dataProvider: DataProviderType!
    
    open var shouldDeselectCells = true
    
    init(dataProvider: DataProviderType) {
        self.dataProvider = dataProvider
    }
    
    open func reload(_ completion: (() -> Void)?) {
        dataProvider.reload(completion)
    }
}


//MARK: - Base managment
extension SMBaseDataSource {
    func cellReuseIdentifier(for indexPath: IndexPath) -> String {
        return String(describing: type(of: self).self)
    }
}


//MARK: - Selection
extension SMBaseDataSource {
    func didSelectRow(at indexPath: IndexPath) {
//        delegate?.dataSource(self, didSelectRowAt: indexPath, with: dataProvider[indexPath])
    }
    
    func didDelesectRow(at indexPath: IndexPath) {
//        delegate?.dataSource(self, didDeselectRowAt: indexPath, with: dataProvider[indexPath])
    }
}

