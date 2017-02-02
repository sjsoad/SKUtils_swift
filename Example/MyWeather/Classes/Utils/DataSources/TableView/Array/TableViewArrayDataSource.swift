//
//  TableViewDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 06.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class TableViewArrayDataSource: NSObject , UITableViewDataSource, ArrayDataSource {

    @IBInspectable var reuseIdentifier: String?
    var sections : [SectionModel] = []
    
    //MARK: - Public
    
    init(sections: [SectionModel],
         reuseIdentifier: String?) {
        self.sections = sections
        self.reuseIdentifier = reuseIdentifier
    }
    
    func reload(withSections sections: [SectionModel]) {
        self.sections = sections
    }
    
    func append(withSection section: SectionModel) {
        sections.append(section)
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return numberOfItemsInSection(sectionIndex: section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier!)
        
        if let configurableCell = cell as? ConfigurableCell {
            let itemModel = itemAtIndexPath(indexPath: indexPath)
            configurableCell.configure(viewModel: itemModel)
        }

        return cell ?? UITableViewCell()
    }
}
