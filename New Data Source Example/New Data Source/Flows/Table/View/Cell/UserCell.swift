//
//  UserCell.swift
//  New Data Source
//
//  Created by Sergey on 19.10.17.
//Copyright © 2017 Sergey. All rights reserved.
//
// use APIClient for executing this requests

import UIKit
import Foundation

class UserCell: UITableViewCell, ConfigurableCell {
        
    func configure<T>(viewModel: T) {
        guard let viewModel = viewModel as? UserCellViewModelDisplaying else { return }
        textLabel?.text = viewModel.firstName
        detailTextLabel?.text = viewModel.lastName
    }
    
}
