//
//  SMSectionObjectProtocol.swift
//  SMDataDiller-Swift
//
//  Created by Nomad on 6/26/18.
//  Copyright © 2018 molfar.io. All rights reserved.
//

import Foundation

protocol SMSectionObjectProtocol {
    var itemsCount: Int { get }
    func itemForRow(row: Int) -> Any
    func rowForItem(item: Any) -> Int
}
