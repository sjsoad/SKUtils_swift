//
//  CollectionViewArrayDataSource.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 10.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class CollectionViewArrayDataSource: NSObject, UICollectionViewDataSource, ArrayDataSource {

    private(set) var sections: [SectionModel] = []
    
    // MARK: - Public
    
    init(sections: [SectionModel]) {
        self.sections = sections
    }
    
    func reload(withSections sections: [SectionModel]) {
        self.sections = sections
    }
    
    func append(withSection section: SectionModel) {
        sections.append(section)
    }
    
    // MARK: - Private
    
    private func viewModel(for indexPath: IndexPath, kind: String) -> HeaderDataSourceViewModel? {
        let sectionModel = sections[indexPath.row]
        if kind == UICollectionElementKindSectionHeader {
            guard let header = sectionModel.header,
                let viewModel = header.headerViewModel as? HeaderDataSourceViewModel else { return nil }
            return viewModel
        } else if kind == UICollectionElementKindSectionFooter {
            guard let footer = sectionModel.footer,
                let viewModel = footer.footerViewModel as? HeaderDataSourceViewModel else { return nil }
            return viewModel
        }
        return nil
    }
    
    // MARK: - UITableViewDataSource
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let viewModel = self.viewModel(for: indexPath, kind: kind) else { return UICollectionReusableView() }
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: viewModel.reuseIdentifier,
                                                                   for: indexPath)
        if let configurableView = view as? ConfigurableView {
            configurableView.configure(viewModel: viewModel)
        }
        return view
    }
    
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
