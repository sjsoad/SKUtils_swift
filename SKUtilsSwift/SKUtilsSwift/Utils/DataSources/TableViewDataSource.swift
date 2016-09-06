//
//  TableViewDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 06.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDataSource {

    @IBInspectable var reuseIdentifier: String?
    var sections : Array<TableSectionModel>?
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = sections {
            let sectionModel = sections[section]
            if let items = sectionModel.items {
                return items.count
            }
        }
        return 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let sections = sections {
            let sectionModel = sections[section]
            return sectionModel.header?.headerTitle
        }
        return nil
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if let sections = sections {
            let sectionModel = sections[section]
            return sectionModel.footer?.footerTitle
        }
        return nil
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!) as! ConfigurableCell
        if let sections = sections {
            let sectionModel = sections[indexPath.section]
            if let items = sectionModel.items {
                cell.configureWithModel(items[indexPath.row])
            }
        }
        return cell as! UITableViewCell
    }
}
