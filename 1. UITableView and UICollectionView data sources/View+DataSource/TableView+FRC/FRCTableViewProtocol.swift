//
//  ArrayCollectionViewProtocol.swift
//  MyWeather
//
//  Created by Mac on 08.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol FRCTableViewProtocol {
    
    associatedtype ViewModelType: FRCTableViewModelProtocol
    
    var frcDataVM: ViewModelType? { get set }
    func setDataSource(tableView: UITableView)
    
}

extension FRCTableViewProtocol {
    
    func setDataSource(tableView: UITableView) {
        if let viewModel = frcDataVM {
            if let dataSource = viewModel.frcDataSource {
                tableView.dataSource = dataSource
                tableView.reloadData()
            }
        }
    }
    
}
