//
//  ArrayCollectionViewModelProtocol.swift
//  MyWeather
//
//  Created by Mac on 08.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import CoreData

protocol FRCTableViewModelProtocol {
    
    var frc: NSFetchedResultsController<NSManagedObject> { get }
    var frcTableViewDataSource: TableViewFRCDataSource! { get }
    
    init(frc: NSFetchedResultsController<NSManagedObject>)
    
}
