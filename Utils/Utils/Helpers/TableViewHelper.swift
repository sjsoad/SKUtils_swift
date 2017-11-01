//
//  DynamicTableViewCellProtocol.swift
//  StudentShare
//
//  Created by Sergey on 27.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class TableViewHelper {
    
    // MARK: - Update Height -
    
    static func updateHeight(of tableView: UITableView, height contraint: NSLayoutConstraint, view: UIView) {
        let tableContentHeight = tableView.contentSize.height
        DispatchQueue.global().async {
            let constraintValue = contraint.constant
            if constraintValue != tableContentHeight {
                DispatchQueue.main.sync {
                    contraint.constant = tableContentHeight
                    UIView.animate(withDuration: 0.25) {
                        view.layoutIfNeeded()
                    }
                }
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
