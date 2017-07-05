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
        DispatchQueue.global().async {
            let constraintValue = contraint.constant
            let tableContentHeight = tableView.contentSize.height
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
    
}
