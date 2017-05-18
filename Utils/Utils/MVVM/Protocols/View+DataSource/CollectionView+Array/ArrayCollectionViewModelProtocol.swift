//
//  ArrayCollectionViewModelProtocol.swift
//  MyWeather
//
//  Created by Mac on 08.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol ArrayCollectionViewModelProtocol {
    
    associatedtype ModelType: Any
    
    var collectionViewDataSource: CollectionViewArrayDataSource! { get }
    
    init(array: [ModelType])
    
}
