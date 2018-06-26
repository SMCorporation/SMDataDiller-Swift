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
    
    func numberOfSections() -> Int {
        if hasSection() {
            return items.count
        }
        return items.isEmpty ? 0 : 1
    }
    
    func numberOfItems(in section: Int) -> Int {
        if hasSection() {
            if items.count <= section {
                return NSNotFound
            }
            
            let sectionObject = items[section]
            if isSectionObject(object: sectionObject) {
                return (sectionObject as! SMSectionObjectProtocol).itemsCount
            }
        }
        return items.count
    }
    
    func item(at indexPath: IndexPath) -> T? {
        if hasSection() {
            if items.count <= indexPath.section {
                return nil
            }
            
            let item = items[indexPath.section]
            if isSectionObject(object: item) {
                return (item as! SMSectionObjectProtocol).itemForRow(row: indexPath.row) as? T
            }
            
            return (item as! Array<T>)[indexPath.row]
        }
        
        return items.isEmpty ? nil : items[indexPath.row]
    }
    
    func indexPath(of item: T) -> IndexPath? {
        var indexPath = IndexPath
        
        
        return indexPath
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
    
    func indexPathOfItem(item: T) -> IndexPath {
        
    }
}
