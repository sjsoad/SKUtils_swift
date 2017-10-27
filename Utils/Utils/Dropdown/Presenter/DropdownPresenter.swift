//
//  DropdownPresenter.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

typealias DropdownRectConfiguration = (x: CGFloat?, y: CGFloat?, width: CGFloat?, height: CGFloat?)
typealias DropdownSelectionHandler = ((_ module: DropdownModule, _ selectedIndex: IndexPath) -> Void)
typealias DropdownClosingHandler = ((_ module: DropdownModule) -> Void)
typealias DropdownMaximumReachedHandler = ((_ module: DropdownModule, _ maxValue: Int) -> Void)

protocol DropdownViewable: class {
    
    func show()
    func hide()
    func set(rectConfiguration configuration: DropdownRectConfiguration)
}

protocol DropdownReloadable: DropdownViewable {
    
    var allowsMultipleSelection: Bool { get }
    func reload(with dataSource: TableViewArrayDataSource)
    func register(cellClass name: String)
    
}

protocol DropdownOutput: class {
    
    func dropdownTriggeredSelectionEvent(at indexPath: IndexPath)
    func dropdownTriggeredCloseAction()
    func dropdownDidHide()
    
}

protocol DropdownModule {
    
    var selectedIndexPathes: [IndexPath] { get }
    var allOptionSelected: Bool { get }
    
    func show(in window: UIWindow?, rectConfiguration configuration: DropdownRectConfiguration)
    func hideDropdown()
    func removeDropdown()
    
}

class DropdownPresenter: NSObject, DropdownModule {
    
    fileprivate var view: DropdownReloadable?
    fileprivate var dataSource = TableViewArrayDataSource(sections: [])
    fileprivate var items = [String]()
    fileprivate var allOptionIndex: IndexPath?
    fileprivate var maxSelectedItems: Int?
    fileprivate var indexes = [IndexPath]()
    fileprivate var selectionHandler: DropdownSelectionHandler?
    fileprivate var closingHandler: DropdownClosingHandler?
    fileprivate var maximumReachedHandler: DropdownMaximumReachedHandler?
    
    var selectedIndexPathes: [IndexPath] {
        return indexes
    }
    
    var allOptionSelected: Bool {
        guard let allOptionIndex = allOptionIndex else { return false }
        return indexes.contains(allOptionIndex)
    }
    
    required init(with view: DropdownReloadable,
                  items: [String],
                  selectedIndexes: [IndexPath],
                  allOptionIndex: IndexPath? = nil,
                  maxSelectedItems: Int? = nil,
                  selectionHandler: DropdownSelectionHandler? = nil,
                  closingHandler: DropdownClosingHandler? = nil,
                  maximumReachedHandler: DropdownMaximumReachedHandler? = nil) {
        super.init()
        self.view = view
        self.items = items
        self.indexes = selectedIndexes
        self.allOptionIndex = allOptionIndex
        self.maxSelectedItems = maxSelectedItems
        self.selectionHandler = selectionHandler
        self.closingHandler = closingHandler
        self.maximumReachedHandler = maximumReachedHandler
        self.createDataSource()
    }
    
    class func dropdown(cellClass name: String = "DropdownCell",
                        items: [String],
                        selectedIndexes: [IndexPath] = [IndexPath](),
                        allOptionIndex: IndexPath? = nil,
                        maxSelectedItems: Int? = nil,
                        allowsMultipleSelection: Bool,
                        selectionHandler: DropdownSelectionHandler? = nil,
                        closingHandler: DropdownClosingHandler? = nil,
                        maximumReachedHandler: DropdownMaximumReachedHandler? = nil) -> DropdownModule? {
        guard let dropdownView = DropdownView.newDropdown() else { return nil }
        let presenter = DropdownPresenter(with: dropdownView,
                                          items: items,
                                          selectedIndexes: selectedIndexes,
                                          allOptionIndex: allOptionIndex,
                                          maxSelectedItems: maxSelectedItems,
                                          selectionHandler: selectionHandler,
                                          closingHandler: closingHandler,
                                          maximumReachedHandler: maximumReachedHandler)
        dropdownView.presenter = presenter
        dropdownView.register(cellClass: name)
        dropdownView.allowsMultipleSelection = allowsMultipleSelection
        return presenter
    }
    
    // MARK: - Module -
    
    func show(in window: UIWindow?, rectConfiguration configuration: DropdownRectConfiguration) {
        guard let view = view as? UIView,
            let window = window else { return }
        view.frame = window.bounds
        window.addSubview(view)
        self.view?.set(rectConfiguration: configuration)
        self.view?.show()
        self.view?.reload(with: dataSource)
    }
    
    func hideDropdown() {
        view?.hide()
    }
    
    func removeDropdown() {
        guard let view = view as? UIView else { return }
        view.removeFromSuperview()
    }
    
    // MARK: - Private -
    
    fileprivate func createDataSource() {
        var sectionItems = [DropdownDataSourceModel]()
        for (index, item) in items.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            let cellModel = DropdownDataSourceModel(text: item,
                                              isSelected: indexes.contains(indexPath),
                                              cellIdentifier: DropdownCell.reuseIdentifier)
            sectionItems.append(cellModel)
        }
        let sectionModel = SectionModel(withItems: sectionItems)
        dataSource = TableViewArrayDataSource(sections: [sectionModel])
    }
    
}

extension DropdownPresenter: DropdownOutput {
    
    func dropdownTriggeredSelectionEvent(at indexPath: IndexPath) {
        guard let view = view else { return }
        if let index = indexes.index(of: indexPath) {
            if indexes.count > 1 { // at least one object should be selected
                indexes.remove(at: index)
            }
        } else {
            if let maxSelectedItems = maxSelectedItems, indexes.count >= maxSelectedItems {
                guard let maximumReachedHandler = maximumReachedHandler else { return }
                maximumReachedHandler(self, maxSelectedItems)
                return
            }
            if view.allowsMultipleSelection && indexPath != allOptionIndex {
                if let allOptionIndex = allOptionIndex,
                    let index = indexes.index(of: allOptionIndex) {
                    indexes.remove(at: index)
                }
                indexes.append(indexPath)
            } else {
                indexes = [indexPath]
            }
        }
        createDataSource()
        view.reload(with: dataSource)
        guard let selectionHandler = selectionHandler else { return }
        selectionHandler(self, indexPath)
    }
    
    func dropdownTriggeredCloseAction() {
        hideDropdown()
    }
    
    func dropdownDidHide() {
        removeDropdown()
        guard let closingHanlder = closingHandler else { return }
        closingHanlder(self)
    }
    
}
