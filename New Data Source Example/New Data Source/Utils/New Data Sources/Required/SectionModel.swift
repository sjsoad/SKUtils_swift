//
//  SectionModel.swift
//  SwiftUtils
//
//  Created by Sergey on 17.10.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class SectionModel: NSObject, DataSourceSectionRepresentable {

    private(set) var items: [DataSourceModel]
    private(set) var header: SectionHeader?
    private(set) var footer: SectionFooter?
    
    init(withItems items: [DataSourceModel],
         header: SectionHeader? = nil,
         footer: SectionFooter? = nil) {
        self.items = items
        self.header = header
        self.footer = footer
    }
    
}

// MARK: - DataSourceSectionAppendable -

extension SectionModel: DataSourceSectionAppendable {
    
    func append(newItems: [DataSourceModel], handler: DataSourceSectionChangeHandler?) {
        let lastIndex = items.count - 1
        items.append(contentsOf: items)
        let diff = Array(lastIndex + 1...lastIndex + newItems.count)
        handler?(diff)
    }
    
    func append(item: DataSourceModel, handler: DataSourceSectionChangeHandler?) {
        items.append(item)
        let diff = [items.count - 1]
        handler?(diff)
    }
    
}

// MARK: - DataSourceSectionRemovable -

extension SectionModel: DataSourceSectionRemovable {
    
    func remove(itemsAt indexes: [Int]) {
        indexes.forEach { [weak self] (index) in
            self?.remove(itemAt: index)
        }
    }
    
    func remove(itemAt index: Int) {
        guard self.items.indices.contains(index) else { return }
        self.items.remove(at: index)
    }
    
}

// MARK: - DataSourceSectionInsertable -

extension SectionModel: DataSourceSectionInsertable {
    
    func insert(newItems: [DataSourceModel], at index: Int, handler: DataSourceSectionChangeHandler?) {
        guard self.items.indices.contains(index) else { return }
        self.items.insert(contentsOf: items, at: index)
        let diff = Array(index...index + items.count - 1)
        handler?(diff)
    }
    
    func insert(item: DataSourceModel, at index: Int, handler: DataSourceSectionChangeHandler?) {
        guard self.items.indices.contains(index) else { return }
        self.items.insert(item, at: index)
        let diff = [index]
        handler?(diff)
    }
    
}

extension SectionModel: DataSourceSectionReordering {    
    
    func replace(itemAt index: Int, with item: DataSourceModel) {
        guard self.items.indices.contains(index) else { return }
        self.items[index] = item
    }
    
    func reorderItems(at sourceIndex: Int, and destinationIndex: Int) {
        guard self.items.indices.contains(sourceIndex), self.items.indices.contains(destinationIndex) else { return }
        self.items.swapAt(sourceIndex, destinationIndex)
    }
    
}
