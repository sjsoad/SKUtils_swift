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

    private(set) var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController<NSManagedObject>()
    
    // MARK: - Public
    
    init(fetchedResultController: NSFetchedResultsController<NSManagedObject>) {
        self.fetchedResultController = fetchedResultController
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections()
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection(sectionIndex: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if  let viewModel = itemAtIndexPath(indexPath: indexPath) as? DataSourceViewModel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.reuseIdentifier,
                                                          for: indexPath)
            if let configurableCell = cell as? ConfigurableCell {
                configurableCell.configure(viewModel: viewModel)
            }
            return cell
        }
        return UICollectionViewCell()
        
    }
}
