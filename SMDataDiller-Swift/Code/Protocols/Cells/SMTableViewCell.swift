//
//  SMTableViewCell.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 7/28/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import UIKit

public protocol SMTableViewCell {
    static var height: CGFloat { get }
}

extension UITableViewCell: SMTableViewCell {
    public static var height: CGFloat {
        return 44
    }
}
