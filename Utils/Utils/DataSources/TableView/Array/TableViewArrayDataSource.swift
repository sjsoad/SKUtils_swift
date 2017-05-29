//
//  TableViewDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 06.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class TableViewArrayDataSource: NSObject, UITableViewDataSource, ArrayDataSource {

    private(set) var sections: [SectionModel] = []
    
    // MARK: - Public
    
    init(sections: [SectionModel]) {
        self.sections = sections
    }
    
    func reload(withSections sections: [SectionModel]) {
        self.sections = sections
    }
    
    func append(withSection section: SectionModel) {
        sections.append(section)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return numberOfItemsInSection(sectionIndex: section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let viewModel = itemAtIndexPath(indexPath: indexPath) as? DataSourceViewModel,
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellReuseIdentifier),
            let configurableCell = cell as? ConfigurableCell {
            configurableCell.configure(viewModel: viewModel)
            return cell
        }
        return UITableViewCell()
    }
}
