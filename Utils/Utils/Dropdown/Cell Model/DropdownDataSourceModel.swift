//
//  DropdownDataSourceModel.swift
//  Nioxin
//
//  Created by Sergey on 19.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

protocol DropdownCellConfigurator {
    
    var text: String? { get }
    var isSelected: Bool { get }
    
    init(text: String?, isSelected: Bool, cellIdentifier: String)
    
}

class DropdownDataSourceModel: DropdownCellConfigurator, DataSourceModel {

    private(set) var reuseIdentifier: String
    private(set) var text: String?
    private(set) var isSelected: Bool = false
    
    required init(text: String?, isSelected: Bool, cellIdentifier: String) {
        self.text = text
        self.isSelected = isSelected
        self.reuseIdentifier = cellIdentifier
    }
    
}
