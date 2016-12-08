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
    
    var arrayDataVM: ViewModelType? { get set }
    func setDataSource(collectionView: UITableView)
    
}

extension ArrayTableViewProtocol {
    
    func setDataSource(collectionView: UITableView) {
        if let viewModel = arrayDataVM {
            if let dataSource = viewModel.arrayDataSource {
                collectionView.dataSource = dataSource
                collectionView.reloadData()
            }
        }
    }
    
}
