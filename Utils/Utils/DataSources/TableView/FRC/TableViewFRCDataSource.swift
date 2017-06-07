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

    private(set) var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController<NSManagedObject>()
    
    // MARK: - Public
    
    init(fetchedResultController: NSFetchedResultsController<NSManagedObject>) {
        self.fetchedResultController = fetchedResultController
    }

    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return numberOfItemsInSection(sectionIndex: section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let viewModel = itemAtIndexPath(indexPath: indexPath) as? DataSourceViewModel,
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier),
            let configurableCell = cell as? ConfigurableCell {
            configurableCell.configure(viewModel: viewModel)
            return cell
        }
        
        return UITableViewCell()
    }

}
