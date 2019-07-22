//
//  SMDataProvider.swift
//  SMDataDiller-SwiftTests
//
//  Created by Max Kuznetsov on 7/14/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import Foundation

class SMDataProvider<T>: SMDataProviding {
    typealias Item = T

    var items: [T] = []
}
