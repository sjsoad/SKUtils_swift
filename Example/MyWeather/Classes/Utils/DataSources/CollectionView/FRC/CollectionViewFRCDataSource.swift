//
//  CollectionViewFRCDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 10.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreData

class CollectionViewFRCDataSource: NSObject, UICollectionViewDataSource, FRCDataSource {

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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections()
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection(sectionIndex: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier!, for: indexPath)
        
        if let configurableCell = cell as? ConfigurableCell {
            let itemModel = itemAtIndexPath(indexPath: indexPath)
            configurableCell.configure(viewModel: itemModel)
        }
        
        return cell 
    }
}
