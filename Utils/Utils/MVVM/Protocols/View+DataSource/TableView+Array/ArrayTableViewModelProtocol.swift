//
//  ArrayCollectionViewModelProtocol.swift
//  MyWeather
//
//  Created by Mac on 08.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol ArrayTableViewModelProtocol {
    
    associatedtype ModelType: Any
    
    var tableViewDataSource: TableViewArrayDataSource! { get }
    
    init(array: [ModelType])
    
}
