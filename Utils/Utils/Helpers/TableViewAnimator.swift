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
        execute(block: {
            tableView.deleteRows(at: indexPathes, with: animation)
        }, duringTableViewUpdate: tableView)
    }
    
    class func insertRows(in tableView: UITableView, at indexPathes: [IndexPath], animation: UITableViewRowAnimation) {
        execute(block: {
            tableView.insertRows(at: indexPathes, with: animation)
        }, duringTableViewUpdate: tableView)
    }
    
    // MARK: - Sections animation -
    
    class func deleteSections(in tableView: UITableView, at indexes: [Int], animation: UITableViewRowAnimation) {
        execute(block: {
            tableView.deleteSections(IndexSet(indexes), with: animation)
        }, duringTableViewUpdate: tableView)
    }
    
    class func insertSections(in tableView: UITableView, at indexes: [Int], animation: UITableViewRowAnimation) {
        execute(block: {
            tableView.insertSections(IndexSet(indexes), with: animation)
        }, duringTableViewUpdate: tableView)
    }
    
    // MARK: - Private -
    
    private class func execute(block: () -> Void, duringTableViewUpdate tableView: UITableView) {
        tableView.beginUpdates()
        block()
        tableView.endUpdates()
    }
    
}
