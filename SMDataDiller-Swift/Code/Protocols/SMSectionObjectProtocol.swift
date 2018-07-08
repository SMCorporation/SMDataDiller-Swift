//
//  SMSectionObjectProtocol.swift
//  SMDataDiller-Swift
//
//  Created by Nomad on 6/26/18.
//  Copyright © 2018 molfar.io. All rights reserved.
//

import Foundation

protocol SMSectionObjectProtocol {
    associatedtype DataPrviderItem
    
    var itemsCount: UInt { get }
    func itemForRow<DataPrviderItem>(row: UInt) -> DataPrviderItem
    func rowForItem<DataPrviderItem>(item: DataPrviderItem) -> UInt
}
