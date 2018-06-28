//
//  SMBaseDataProvider.swift
//  SMDataDiller-Swift
//
//  Created by Max on 28.05.2018.
//  Copyright © 2018 molfar.io. All rights reserved.
//
import Foundation

class SMBaseDataProvider<T> {
    
    var items = [T]()
    var sectionItems = [UInt]()
    
    init() {
        // there is place for any initial configurations of your dataProvider
    }
    
    func reload(_ completion: (()-> Void)? = nil) -> Void {
        // there is place for logic of re creating items
    }
    
    func numberOfSections() -> UInt {
        if hasSection() {
            return UInt(items.count)
        }
        return items.isEmpty ? 0 : 1
    }
    
    func numberOfItems(in section: UInt) -> UInt {
        if hasSection() {
            if items.count <= section {
                return UInt(NSNotFound)
            }
            
            let sectionObject = items[Int(section)]
            if isSectionObject(object: sectionObject) {
                return (sectionObject as! SMSectionObjectProtocol).itemsCount
            }
        }
        return UInt(items.count)
    }
    
    func item(at indexPath: IndexPath) -> T? {
        if hasSection() {
            if items.count <= indexPath.section {
                return nil
            }
            
            let item = items[indexPath.section]
            if isSectionObject(object: item) {
                return (item as! SMSectionObjectProtocol).itemForRow(row: UInt(indexPath.row)) as? T
            }
            
            return (item as! Array<T>)[indexPath.row]
        }
        
        return items.isEmpty ? nil : items[indexPath.row]
    }
    
    func indexPath(of item: T) -> IndexPath? {
        var itemIndexPath = indexPathForItem(item: item, inItems: items, withSetionIndex: 0)
        if hasSection() {
            for index in 0..<items.count {
                let sectionItems = items[index]
                let indexPath = indexPathForItem(item: item, inItems: items, withSetionIndex: UInt(index))
                if indexPath != nil {
                    itemIndexPath = indexPath
                    break
                }
            }
        }
        
        return itemIndexPath
    }
}

//MARK: - Help Metods
private extension SMBaseDataProvider {
    
    func hasSection() -> Bool {
        if !items.isEmpty {
            let item = items.first
            if item is Array<Any> || isSectionObject(object: item) {
                return true
            }
        }
        return false
    }
    
    func isSectionObject(object: T?) -> Bool {
        return object as? SMSectionObjectProtocol != nil
    }
    
    func indexPathForItem(item: T, inItems items: T, withSetionIndex sectionIndex: UInt) -> IndexPath? {
        if let items = items as? Array<T> {
            for index in 0..<items.count {
                let sectionItem = items[index]
                if sectionItem == item {
                    return IndexPath(row: index, section: Int(sectionIndex))
                }
            }
        } else if isSectionObject(object: items) {
            let sectionObject: SMSectionObjectProtocol = items as! SMSectionObjectProtocol
            let itemIndex = sectionObject.rowForItem(item: item)
            if itemIndex != NSNotFound {
                return IndexPath(row: Int(itemIndex), section: Int(sectionIndex))
            }
        }
        return nil
    }
}

