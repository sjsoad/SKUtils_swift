//
//  ArrayCollectionViewModelProtocol.swift
//  MyWeather
//
//  Created by Mac on 08.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import CoreData

protocol FRCCollectionViewModelProtocol {
    
    var frc: NSFetchedResultsController<NSManagedObject> { get }
    var frcCollectionViewDataSource: CollectionViewFRCDataSource! { get }
    
    init(frc: NSFetchedResultsController<NSManagedObject>)
    
}
