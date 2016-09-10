//
//  TableViewDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 06.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class TableViewArrayDataSource: NSObject , ArrayDataSource {

    @IBInspectable var reuseIdentifier: String?
    @IBOutlet var tableView: UITableView!
    var sections : [TableSectionModel] = []
    
    //MARK: - Public
    
    func initWithSections(sections sections: [TableSectionModel],
                                   tableView: UITableView,
                                   reuseIdentifier: String?) {
        self.sections = sections
        self.reuseIdentifier = reuseIdentifier
        self.tableView = tableView
    }
    
    func reloadWithSections(sections sections: [TableSectionModel]) {
        self.sections = sections
        self.tableView.reloadData()
    }
    
    func appendWithSection(section section: TableSectionModel) {
        self.sections.append(section)
        self.tableView.reloadData()
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return numberOfSections()
    }
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return numberOfItemsInSection(section)
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier!)
        
        if let configurableCell = cell as? ConfigurableCell {
            let itemModel = itemAtIndexPath(indexPath)
            configurableCell.configureWithModel(itemModel)
        }

        return cell ?? UITableViewCell()
    }
}
