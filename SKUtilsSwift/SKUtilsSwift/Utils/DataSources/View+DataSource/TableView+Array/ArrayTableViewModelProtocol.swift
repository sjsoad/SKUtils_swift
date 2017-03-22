//
//  ArrayCollectionViewModelProtocol.swift
//  MyWeather
//
//  Created by Mac on 08.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol ArrayTableViewModelProtocol {
    
    associatedtype ModelType: AnyObject
    associatedtype CellType: ConfigurableCell
    
    var tableViewDataSource: TableViewArrayDataSource? { get set }
    
    init(array: [ModelType])
    
}
