//
//  ArrayCollectionViewProtocol.swift
//  MyWeather
//
//  Created by Mac on 08.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol ArrayTableViewProtocol {
    
    associatedtype ViewModelType: ArrayTableViewModelProtocol
    
    var arrayTableViewModel: ViewModelType? { get set }
    func setDataSource(tableView: UITableView)
    
}

extension ArrayTableViewProtocol {
    
    func setDataSource(tableView: UITableView) {
        if let viewModel = arrayTableViewModel {
            if let dataSource = viewModel.tableViewDataSource {
                tableView.dataSource = dataSource
                tableView.reloadData()
            }
        }
    }
    
}
