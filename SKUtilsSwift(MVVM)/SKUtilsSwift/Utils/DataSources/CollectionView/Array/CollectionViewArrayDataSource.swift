//
//  CollectionViewArrayDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 10.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class CollectionViewArrayDataSource: NSObject, UICollectionViewDataSource, ArrayDataSource {

    var sections : [SectionModel] = []
    
    //MARK: - Public
    
    init(sections: [SectionModel]) {
        self.sections = sections
    }
    
    func reload(withSections sections: [SectionModel]) {
        self.sections = sections
    }
    
    func append(withSection section: SectionModel) {
        sections.append(section)
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections()
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection(sectionIndex: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let viewModel = itemAtIndexPath(indexPath: indexPath) as? DataSourceViewModel {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellReuseIdentifier,
                                                          for: indexPath)
            if let configurableCell = cell as? ConfigurableCell {
                configurableCell.configure(viewModel: viewModel)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
}
