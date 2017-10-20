//
//  TableViewAnimator.swift
//  New Data Source
//
//  Created by Sergey on 20.10.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class TableViewAnimator: NSObject {

    // MARK: - Rows animation -
    
    class func deleteRows(in tableView: UITableView, at indexPathes: [IndexPath], animation: UITableViewRowAnimation) {
        tableView.beginUpdates()
        tableView.deleteRows(at: indexPathes, with: animation)
        tableView.endUpdates()
    }
    
    class func insertRows(in tableView: UITableView, at indexPathes: [IndexPath], animation: UITableViewRowAnimation) {
        tableView.beginUpdates()
        tableView.insertRows(at: indexPathes, with: animation)
        tableView.endUpdates()
    }
    
    // MARK: - Sections animation -
    
    class func deleteSections(in tableView: UITableView, at indexes: [Int], animation: UITableViewRowAnimation) {
        tableView.beginUpdates()
        tableView.deleteSections(IndexSet(indexes), with: animation)
        tableView.endUpdates()
    }
    
    class func insertSections(in tableView: UITableView, at indexes: [Int], animation: UITableViewRowAnimation) {
        tableView.beginUpdates()
        tableView.insertSections(IndexSet(indexes), with: animation)
        tableView.endUpdates()
    }
    
}
