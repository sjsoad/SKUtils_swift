//
//  AbstractDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 08.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol AbstractDataSource {
    
    func numberOfSections() -> Int
    func numberOfItemsInSection(sectionIndex: Int) -> Int
    func itemAtIndexPath(indexPath: IndexPath) -> AnyObject
    
}
