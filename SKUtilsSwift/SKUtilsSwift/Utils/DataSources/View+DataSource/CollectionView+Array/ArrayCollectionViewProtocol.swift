//
//  ArrayCollectionViewProtocol.swift
//  MyWeather
//
//  Created by Mac on 08.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

protocol ArrayCollectionViewProtocol {
    
    associatedtype ViewModelType: ArrayCollectionViewModelProtocol
    
    var arrayCollectionViewModel: ViewModelType? { get set }
    func setDataSource(collectionView: UICollectionView)
    
}

extension ArrayCollectionViewProtocol {
    
    func setDataSource(collectionView: UICollectionView) {
        if let viewModel = arrayCollectionViewModel {
            collectionView.dataSource = viewModel.collectionViewDataSource
            collectionView.reloadData()
        }
    }
    
}
