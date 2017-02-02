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
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController<NSManagedObject>()
    
    //MARK: - Public
    
    init(fetchedResultController: NSFetchedResultsController<NSManagedObject>,
         reuseIdentifier: String?) {
        self.fetchedResultController = fetchedResultController
        self.reuseIdentifier = reuseIdentifier
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier!)
        
        if let configurableCell = cell as? ConfigurableCell {
            let itemModel = itemAtIndexPath(indexPath: indexPath)
            configurableCell.configure(viewModel: itemModel)
        }
        
        return cell ?? UITableViewCell()
    }

}
