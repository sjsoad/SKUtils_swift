//
//  ArrayCollectionViewProtocol.swift
//  MyWeather
//
//  Created by Mac on 08.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol FRCCollectionViewProtocol {
    
    associatedtype ViewModelType: FRCCollectionViewModelProtocol
    
    var frcDataVM: ViewModelType? { get set }
    func setDataSource(collectionView: UICollectionView)
    
}

extension FRCCollectionViewProtocol {
    
    func setDataSource(collectionView: UICollectionView) {
        if let viewModel = frcDataVM {
            if let dataSource = viewModel.frcDataSource {
                collectionView.dataSource = dataSource
                collectionView.reloadData()
            }
        }
    }
    
}
