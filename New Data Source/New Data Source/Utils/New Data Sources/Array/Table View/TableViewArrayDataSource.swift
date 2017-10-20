//
//  TableViewArrayDataSource.swift
//  New Data Source
//
//  Created by Sergey on 18.10.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class TableViewArrayDataSource: NSObject, ArrayDataSourceRepresentable {

    private(set) var sections: [SectionModel] = []
    private var editingProvider: TableViewRowEditing?
    private var movingProvider: TableViewRowMoving?
    
    init(with sections: [SectionModel], editingProvider: TableViewRowEditing? = nil, movingProvider: TableViewRowMoving? = nil) {
        self.sections = sections
        self.editingProvider = editingProvider
        self.movingProvider = movingProvider
    }
    
    // MARK: - DataSourceAppendable -
    
    func append(newSections: [SectionModel], handler: DataSourceChangeHandler?) {
        let lastIndex = sections.count - 1
        self.sections.append(contentsOf: newSections)
        let diff = Array(lastIndex + 1...lastIndex + newSections.count)
        handler?(diff)
    }
    
    func append(newSection: SectionModel, handler: DataSourceChangeHandler?) {
        self.sections.append(newSection)
        let diff = [self.sections.count - 1]
        handler?(diff)
    }
    
    // MARK: - DataSourceRemovable -
    
    func remove(sectionsAt indexes: [Int]) {
        indexes.forEach { [weak self] (index) in
            self?.remove(sectionAt: index)
        }
    }
    
    func remove(sectionAt index: Int) {
        guard sections.indices.contains(index) else { return }
        sections.remove(at: index)
    }
 
    // MARK: - DataSourceInsertable -
    
    func insert(newSections: [SectionModel], at index: Int, handler: DataSourceChangeHandler?) {
        sections.insert(contentsOf: newSections, at: index)
        let diff = Array(index...index + sections.count - 1)
        handler?(diff)
    }
    
    func insert(newSection: SectionModel, at index: Int, handler: DataSourceChangeHandler?) {
        self.sections.insert(newSection, at: index)
        handler?([index])
    }
    
}

// MARK: - UITableViewDataSource -

extension TableViewArrayDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }
    
    // Row display
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionModel = sections[section]
        return sectionModel.header?.headerTitle
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let sectionModel = sections[section]
        return sectionModel.footer?.footerTitle
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let model = itemAtIndexPath(indexPath: indexPath),
            let cell = tableView.dequeueReusableCell(withIdentifier: model.reuseIdentifier),
            let configurableCell = cell as? ConfigurableCell {
            configurableCell.configure(viewModel: model)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return numberOfItemsInSection(sectionIndex: section)
    }
    
    // Moving/reordering
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return movingProvider?.canMoveRow?(indexPath) ?? false
    }
    
    // Data manipulation - insert and delete support
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        editingProvider?.edititngHandler?(editingStyle, indexPath)
    }
    
    
    // Data manipulation - reorder / moving support
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        movingProvider?.movingHandler?(sourceIndexPath, destinationIndexPath)
    }
    
}
