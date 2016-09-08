//
//  TableViewFRCDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 08.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreData

class TableViewFRCDataSource: NSObject, UITableViewDataSource, FRCDataSource {

    @IBInspectable var reuseIdentifier: String?
    @IBOutlet var tableView: UITableView!
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
    
    
    //MARK: - Public
    
    func initWithFRC(fetchedResultController fetchedResultController: NSFetchedResultsController,
                                   tableView: UITableView,
                                   reuseIdentifier: String?) {
        self.fetchedResultController = fetchedResultController
        self.reuseIdentifier = reuseIdentifier
        self.tableView = tableView
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
