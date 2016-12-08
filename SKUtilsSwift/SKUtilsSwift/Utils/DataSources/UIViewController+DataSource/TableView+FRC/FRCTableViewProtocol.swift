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
    func setDataSource(collectionView: UITableView)
    
}

extension FRCTableViewProtocol {
    
    func setDataSource(collectionView: UITableView) {
        if let viewModel = frcDataVM {
            if let dataSource = viewModel.frcDataSource {
                collectionView.dataSource = dataSource
                collectionView.reloadData()
            }
        }
    }
    
}
