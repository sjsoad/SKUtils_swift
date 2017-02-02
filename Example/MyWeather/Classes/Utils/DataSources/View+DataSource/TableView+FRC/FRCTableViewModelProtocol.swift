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
    
    associatedtype ModelType: AnyObject
    associatedtype CellType: ConfigurableCell
    
    var frc: NSFetchedResultsController<NSManagedObject> { get set }
    var frcDataSource: TableViewFRCDataSource? { get set }
    
    init(frc: NSFetchedResultsController<NSManagedObject>)
    
}
