//
//  DynamicTableViewCellProtocol.swift
//  StudentShare
//
//  Created by Sergey on 27.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol DynamicTableViewCellProtocol {

    func activateDynamicCellHeight(for tableView: UITableView)
    
}

extension DynamicTableViewCellProtocol {

    func activateDynamicCellHeight(for tableView: UITableView) {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
    }
    
}
