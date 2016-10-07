//
//  CollectionViewArrayDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 10.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class CollectionViewArrayDataSource: NSObject, UICollectionViewDataSource, ArrayDataSource {

    @IBInspectable var reuseIdentifier: String?
    @IBOutlet var collectionView: UICollectionView!
    var sections : [SectionModel] = []
    
    //MARK: - Public
    
    init(sections: [SectionModel],
         collectionView: UICollectionView,
         reuseIdentifier: String?) {
        self.sections = sections
        self.reuseIdentifier = reuseIdentifier
        self.collectionView = collectionView
    }
    
    func reload(withSections sections: [SectionModel]) {
        self.sections = sections
        self.collectionView.reloadData()
    }
    
    func append(withSection section: SectionModel) {
        self.sections.append(section)
        self.collectionView.reloadData()
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections()
    }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier!, for: indexPath)
        
        if let configurableCell = cell as? ConfigurableCell {
            let itemModel = itemAtIndexPath(indexPath)
            configurableCell.configureWithModel(itemModel)
        }
        
        return cell 
    }
    
}
