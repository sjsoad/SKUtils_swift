//
//  CollectionViewArrayDataSource.swift
//  New Data Source
//
//  Created by Sergey on 18.10.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class CollectionViewArrayDataSource: NSObject, ArrayDataSourceRepresentable {
    
    private(set) var sections: [SectionModel] = []
    private(set) var featuresProvider: AnyObject?
    
    init(with sections: [SectionModel], featuresProvider: AnyObject? = nil) {
        self.sections = sections
        self.featuresProvider = featuresProvider
    }
    
    // MARK: - DataSourceAppendable -
    
    func append(newSections: [SectionModel], handler: DataSourceChangeHandler?) {
        let lastIndex = sections.count - 1
        self.sections.append(contentsOf: newSections)
        let diff = Array(lastIndex + 1...lastIndex + newSections.count)
        handler?(diff)
    }
    
    func append(newSection: SectionModel, handler: DataSourceChangeHandler?) {
        self.sections.append(newSection)
        let diff = [self.sections.count - 1]
        handler?(diff)
    }
    
    // MARK: - DataSourceRemovable -
    
    func remove(sectionsAt indexes: [Int]) {
        indexes.forEach { [weak self] (index) in
            self?.remove(sectionAt: index)
        }
    }
    
    func remove(sectionAt index: Int) {
        guard sections.indices.contains(index) else { return }
        sections.remove(at: index)
    }
    
    // MARK: - DataSourceInsertable -
    
    func insert(newSections: [SectionModel], at index: Int, handler: DataSourceChangeHandler?) {
        sections.insert(contentsOf: newSections, at: index)
        let diff = Array(index...index + sections.count - 1)
        handler?(diff)
    }
    
    func insert(newSection: SectionModel, at index: Int, handler: DataSourceChangeHandler?) {
        self.sections.insert(newSection, at: index)
        handler?([index])
    }
    
    // MARK: - Private
    
    private func model(for indexPath: IndexPath, kind: String) -> DataSourceModel? {
        let sectionModel = sections[indexPath.section]
        if kind == UICollectionElementKindSectionHeader {
            guard let header = sectionModel.header,
                let model = header.headerModel else { return nil }
            return model
        } else if kind == UICollectionElementKindSectionFooter {
            guard let footer = sectionModel.footer,
                let model = footer.footerModel else { return nil }
            return model
        }
        return nil
    }
    
}

extension CollectionViewArrayDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return numberOfItemsInSection(sectionIndex: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let model = itemAtIndexPath(indexPath: indexPath) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.reuseIdentifier,
                                                          for: indexPath)
            if let configurableCell = cell as? ConfigurableCell {
                configurableCell.configure(viewModel: model)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let model = self.model(for: indexPath, kind: kind) else { return UICollectionReusableView() }
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                   withReuseIdentifier: model.reuseIdentifier,
                                                                   for: indexPath)
        if let configurableView = view as? ConfigurableView {
            configurableView.configure(viewModel: model)
        }
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        guard let movingProvider = featuresProvider as? CollectionViewRowMoving else { return false }
        return movingProvider.canMoveRow?(indexPath) ?? false
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let movingProvider = featuresProvider as? CollectionViewRowMoving else { return }
        movingProvider.movingHandler?(sourceIndexPath, destinationIndexPath)
    }
    
}
