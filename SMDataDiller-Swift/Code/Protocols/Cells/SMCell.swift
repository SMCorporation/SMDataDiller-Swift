//
//  SMCell.swift
//  SMDataDiller-Swift
//
//  Created by Max on 26.06.2018.
//  Copyright © 2018 molfar.io. All rights reserved.
//

import UIKit

public protocol SMCell {
    associatedtype Item

    static var nibName: String? { get }

    func fill(from item: Item)
}

extension SMCell {

    public static var nibName: String? {
        let className = String(describing: self) as NSString
        let nibName = className.lastPathComponent

        guard Bundle.main.path(forResource: nibName, ofType: "nib") != nil else {
            return nil
        }

        return nibName
    }
}
