//
//  DataSourceSectionRepresentable.swift
//  SwiftUtils
//
//  Created by Sergey on 17.10.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

typealias DataSourceSectionChangeHandler = (([Int]) -> Void)

protocol DataSourceSectionRepresentable {

    var items: [DataSourceModel] { get }
    var header: SectionHeader? { get }
    var footer: SectionFooter? { get }
    
}

// MARK: - DataSourceSectionAppendable -

protocol DataSourceSectionAppendable {

    func append(newItems: [DataSourceModel], handler: DataSourceSectionChangeHandler?)
    func append(item: DataSourceModel, handler: DataSourceSectionChangeHandler?)
    
}

// MARK: - DataSourceSectionRemovable -

protocol DataSourceSectionRemovable {
    
    func remove(itemsAt indexes: [Int])
    func remove(itemAt index: Int)
    
}

// MARK: - DataSourceSectionInsertable -

protocol DataSourceSectionInsertable {
    
    func insert(newItems: [DataSourceModel], at index: Int, handler: DataSourceSectionChangeHandler?)
    func insert(item: DataSourceModel, at index: Int, handler: DataSourceSectionChangeHandler?)
    
}

// MARK: - DataSourceSectionReorderable -

protocol DataSourceSectionReordering {
    
    func replace(itemAt index: Int, with item: DataSourceModel)
    func reorderItems(at sourceIndex: Int, and destinationIndex: Int)
    
}
