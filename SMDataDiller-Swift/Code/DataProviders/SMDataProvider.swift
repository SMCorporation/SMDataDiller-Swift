//
//  SMDataProvider.swift
//  SMDataDiller-SwiftTests
//
//  Created by Max Kuznetsov on 7/14/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import Foundation

 open class SMDataProvider<T>: SMDataProviding {
    public typealias Item = T

    public var items: [T] = []
}
