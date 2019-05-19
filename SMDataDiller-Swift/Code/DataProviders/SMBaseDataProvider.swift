//
//  SMBaseDataProvider.swift
//  SMDataDiller-Swift
//
//  Created by Max on 28.05.2018.
//  Copyright © 2018 molfar.io. All rights reserved.
//

import Foundation

public protocol SMDataProvider {
    associatedtype ItemType: Equatable
    
    var items: [ItemType] { get set }
    
    func reload(_ completion: (()->Void)?)
    func item(at indexPath: IndexPath) -> ItemType
}

extension SMDataProvider {
    public func reload(_ completion: (() -> Void)?) {
        completion?()
    }
    
    public func item(at indexPath: IndexPath) -> ItemType {
        return items[indexPath.row]
    }
    
    public subscript(index: Int) -> ItemType {
        return items[index]
    }
    
    public subscript(indexPath: IndexPath) -> ItemType {
        return items[indexPath.row]
    }
}


open class SMBaseDataProvider<Item: Equatable>: SMDataProvider {
    public typealias ItemType = Item
    public var items: [Item] = [Item]()
}


/*
open class SMBaseDataProvider<ItemType: Equatable> {
    
    open var items = [ItemType]()
    
    open func reload(_ completion: (()->Void)?) {
        completion?()
    }
}


//MARK: - Items managment
extension SMBaseDataProvider {
    func item(at indexPath: IndexPath) -> ItemType {
        return items[indexPath.row]
    }
    
    subscript(index: Int) -> ItemType {
        return items[index]
    }
    
    subscript(indexPath: IndexPath) -> ItemType {
        return items[indexPath.row]
    }
}
*/
