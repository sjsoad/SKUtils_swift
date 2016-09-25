//
//  FRCDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 08.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import CoreData

protocol FRCDataSource: AbstractDataSource {
    
    var fetchedResultController: NSFetchedResultsController<NSManagedObject> { get }
    
}

extension FRCDataSource {

    func numberOfSections() -> Int {
        if let sections = fetchedResultController.sections {
            return sections.count
        }
        return 0
    }
    
    func numberOfItemsInSection(_ sectionIndex: Int) -> Int {
        if let sections = fetchedResultController.sections {
            let section = sections[sectionIndex]
            if let items = section.objects {
                return items.count
            }
        }
        return 0
    }
    
    func itemAtIndexPath(_ indexPath: IndexPath) -> AnyObject {
        return fetchedResultController.object(at: indexPath)
    }
    
}
