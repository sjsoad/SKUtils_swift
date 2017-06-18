//
//  DynamicTableViewCellProtocol.swift
//  StudentShare
//
//  Created by Sergey on 27.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class TableViewHelper {
    
    static func dynamicCellHeight(for tableView: UITableView, estimatedRowHeight height: CGFloat) {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = height
    }
    
}
