//
//  SMArray.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 7/14/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import Foundation

protocol SMArray {
    associatedtype ArrayItem
    var arrayItems: [ArrayItem] { get set }
}

extension Array: SMArray {
    typealias ArrayItem = Element

    var arrayItems: [Element] {
        get {
            return self
        }

        set {
            self = newValue
        }
    }
}
