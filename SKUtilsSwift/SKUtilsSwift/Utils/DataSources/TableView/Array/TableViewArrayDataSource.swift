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
    @IBOutlet var tableView: UITableView!
    var sections : [SectionModel] = []
    
    //MARK: - Public
    
    init(sections: [SectionModel],
         tableView: UITableView,
         reuseIdentifier: String?) {
        self.sections = sections
        self.reuseIdentifier = reuseIdentifier
        self.tableView = tableView
    }
    
    func reload(withSections sections: [SectionModel]) {
        self.sections = sections
        self.tableView.reloadData()
    }
    
    func append(withSection section: SectionModel) {
        self.sections.append(section)
        self.tableView.reloadData()
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return numberOfItemsInSection(section)
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier!)
        
        if let configurableCell = cell as? ConfigurableCell {
            let itemModel = itemAtIndexPath(indexPath)
            configurableCell.configureWithModel(itemModel)
        }

        return cell ?? UITableViewCell()
    }
}
