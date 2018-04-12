//
//  DynamicTableViewCellProtocol.swift
//  StudentShare
//
//  Created by Sergey on 27.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class TableViewHelper {
    
    // MARK: - Registration -
    
    static func register(cellClass: ReusableCell.Type, for tableView: UITableView) {
        let cellNib = UINib(nibName: cellClass.nibName, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    // MARK: - Update Height -
    
    static func updateHeight(of tableView: UITableView, height constraint: NSLayoutConstraint, view: UIView) {
        let constraintValue = constraint.constant
        let tableContentHeight = tableView.contentSize.height + tableView.contentInset.top + tableView.contentInset.bottom
        if constraintValue != tableContentHeight {
            constraint.constant = tableContentHeight
            UIView.animate(withDuration: 0.25) {
                view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - Auto sizing -
    
    static func dynamicCellHeight(for tableView: UITableView, estimatedRowHeight height: CGFloat) {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = height
    }
    
    static func dynamicHeaderHeight(for tableView: UITableView, estimatedHeaderHeight height: CGFloat) {
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionHeaderHeight = height
    }
    
    static func dynamicFooterHeight(for tableView: UITableView, estimatedFooterHeight height: CGFloat) {
        tableView.sectionFooterHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionFooterHeight = height
    }
}
