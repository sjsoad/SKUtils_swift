//
//  DropdownCell.swift
//  Nioxin
//
//  Created by Sergey on 19.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

class DropdownCell: UITableViewCell, ConfigurableCell {

    @IBOutlet private weak var itemLabel: UILabel!
    @IBOutlet private weak var selectionIndicator: UIButton!

    func configure<T>(viewModel: T) {
        guard let viewModel = viewModel as? DropdownCellConfigurator else { return }
        itemLabel.text = viewModel.text
        selectionIndicator.isSelected = viewModel.isSelected
    }
    
}
