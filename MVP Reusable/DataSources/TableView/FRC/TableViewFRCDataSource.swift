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

    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController<NSManagedObject>()
    
    //MARK: - Public
    
    init(fetchedResultController: NSFetchedResultsController<NSManagedObject>) {
        self.fetchedResultController = fetchedResultController
    }

    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return numberOfItemsInSection(sectionIndex: section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let itemModel = itemAtIndexPath(indexPath: indexPath) as? DataSourceViewModel,
            let cellReuseIdentifier = itemModel.cellReuseIdentifier,
            let cell = tableView.dequeueReusableCell(withIdentifier:cellReuseIdentifier),
            let configurableCell = cell as? ConfigurableCell {
            configurableCell.configure(viewModel: itemModel)
            return cell
        }
        
        return UITableViewCell()
    }

}
