//
//  DynamicTableViewCellProtocol.swift
//  StudentShare
//
//  Created by Sergey on 27.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class TableViewHelper {
    
    static func activateDynamicCellHeight(for tableView: UITableView) {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
    }
    
}
