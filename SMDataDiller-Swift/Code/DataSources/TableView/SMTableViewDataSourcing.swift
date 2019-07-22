//
//  SMTableViewDataSourcing.swift
//  SMDataDiller-Swift
//
//  Created by Max Kuznetsov on 7/14/19.
//  Copyright © 2019 molfar.io. All rights reserved.
//

import UIKit

public protocol SMTableViewDataSourcing: SMDataSourcing {

    var tableView: UITableView { get set }

    func classForCell(at indexPath: IndexPath) -> UITableViewCell.Type
    func heightForRow(at indexPath: IndexPath) -> CGFloat

    func cellStyle(at indexPath: IndexPath) -> UITableViewCell.CellStyle

    func setup<T: UITableViewCell>(cell: T, at indexPath: IndexPath)
    func fill<T: UITableViewCell>(cell: T, at indexPath: IndexPath)
}

public extension SMTableViewDataSourcing {

    func classForCell(at indexPath: IndexPath) -> UITableViewCell.Type {
        return UITableViewCell.self
    }

    func cellReuseIdentifier(at indexPath: IndexPath) -> String {
        let cellClass = classForCell(at: indexPath)
        return String(describing: cellClass)
    }

    func heightForRow(at indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func cellStyle(at indexPath: IndexPath) -> UITableViewCell.CellStyle {
        return .default
    }

    func setup<T: UITableViewCell>(cell: T, at indexPath: IndexPath) {

    }

    func fill<T: UITableViewCell>(cell: T, at indexPath: IndexPath) {

    }

    func fill<T: UITableViewCell>(cell: T, at indexPath: IndexPath) where T: SMCell, DataProvider.Item == T.Item {
        cell.fill(from: dataProvider.item(at: indexPath))
    }
}

// MARK: - UITableViewDelegate
public extension UITableViewDelegate where Self: SMTableViewDataSourcing {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if shouldAutoDeselectCells {
            tableView.deselectRow(at: indexPath, animated: true)
        }

        didSelectRow(at: indexPath)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        didDeselectRow(at: indexPath)
    }
}

// MARK: - UITableViewDataSource
public extension UITableViewDataSource where Self: SMTableViewDataSourcing  {

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataProvider.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.numberOfItemsIn(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = cellReuseIdentifier(at: indexPath)
        let cellStyle = self.cellStyle(at: indexPath)

        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) ?? {
            let cell = UITableViewCell(style: cellStyle, reuseIdentifier: reuseIdentifier)
            self.setup(cell: cell, at: indexPath)
            return cell
        }()

        fill(cell: cell, at: indexPath)
        return cell
    }
}
