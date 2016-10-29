//
//  ArrayDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 08.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation

protocol ArrayDataSource: AbstractDataSource {
    
    var sections: [SectionModel]  { get }
    
}

extension ArrayDataSource {
    
    func numberOfSections() -> Int {
        return sections.count
    }
    
    func numberOfItemsInSection(sectionIndex: Int) -> Int {
        let section = sections[sectionIndex]
        let items = section.items
        return items.count
    }
    
    func itemAtIndexPath(indexPath: IndexPath) -> AnyObject {
        let section = sections[(indexPath as NSIndexPath).section]
        let items = section.items
        return items[(indexPath as NSIndexPath).row]
    }
    
}
