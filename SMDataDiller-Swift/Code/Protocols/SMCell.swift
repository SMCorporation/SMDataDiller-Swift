//
//  SMCell.swift
//  SMDataDiller-Swift
//
//  Created by Max on 26.06.2018.
//  Copyright © 2018 molfar.io. All rights reserved.
//

import Foundation

public protocol SMCell {
    associatedtype Item

    func fill(from item: Item)
}

