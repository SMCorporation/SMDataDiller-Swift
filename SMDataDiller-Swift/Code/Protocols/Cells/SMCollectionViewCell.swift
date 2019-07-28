//
//  SMCollectionViewCell.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 7/28/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import UIKit

public protocol SMCollectionViewCell: SMCell, UICollectionViewCell {
    static var size: CGSize { get }
}
