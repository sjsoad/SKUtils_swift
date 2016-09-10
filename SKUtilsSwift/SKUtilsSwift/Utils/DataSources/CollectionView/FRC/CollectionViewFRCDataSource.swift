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
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return numberOfSections()
    }
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection(section)
    }
    
    func collectionView(collectionView: UICollectionView,
                        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier!, forIndexPath: indexPath)
        
        if let configurableCell = cell as? ConfigurableCell {
            let itemModel = itemAtIndexPath(indexPath)
            configurableCell.configureWithModel(itemModel)
        }
        
        return cell ?? UICollectionViewCell()
    }
}
