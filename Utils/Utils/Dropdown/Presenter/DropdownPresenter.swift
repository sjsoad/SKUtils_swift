//
//  DropdownPresenter.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

typealias DropdownRectConfiguration = (x: CGFloat?, y: CGFloat?, width: CGFloat?, height: CGFloat?)

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

protocol DropdownOutput {
    
    func dropdownTriggeredSelectionEvent(at indexPath: IndexPath)
    func dropdownTriggeredCloseAction()
    func dropdownDidHide()
    
}

protocol DropdownModule {
    
    func show(in window: UIWindow?, rectConfiguration configuration: DropdownRectConfiguration)
    func hideDropdown()
    func removeDropdown()
    //    func selectedIndexes() -> [IndexPath]
    
}

@objc protocol DropdownModuleDelegate {
    
    @objc optional func dropdown(presenter: DropdownPresenter, didSelectItemAt indexPath: IndexPath)
    @objc optional func dropdown(didHideWith presenter: DropdownPresenter)
    
}

class DropdownPresenter: NSObject, DropdownModule {
    
    fileprivate weak var view: DropdownReloadable?
    fileprivate weak var delegate: DropdownModuleDelegate?
    fileprivate var dataSource = TableViewArrayDataSource(sections: [])
    fileprivate var items = [String]()
    fileprivate var allOptionIndex: IndexPath?
    fileprivate var selectedIndexes = [IndexPath]()
    
    required init(with view: DropdownReloadable,
                  items: [String],
                  selectedIndexes: [IndexPath],
                  allOptionIndex: IndexPath? = nil,
                  delegate: DropdownModuleDelegate? = nil) {
        super.init()
        self.view = view
        self.items = items
        self.selectedIndexes = selectedIndexes
        self.allOptionIndex = allOptionIndex
        self.delegate = delegate
        self.createDataSource()
    }
    
    class func dropdown(cellClass name: String = "DropdownCell",
                        items: [String],
                        selectedIndexes: [IndexPath] = [IndexPath](),
                        allOptionIndex: IndexPath? = nil,
                        allowsMultipleSelection: Bool,
                        delegate: DropdownModuleDelegate?) -> DropdownModule? {
        guard let dropdownView = DropdownView.newDropdown() else { return nil }
        let presenter = DropdownPresenter(with: dropdownView,
                                          items: items,
                                          selectedIndexes: selectedIndexes,
                                          delegate: delegate)
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
        var sectionItems = [DropdownViewModel]()
        for (index, item) in items.enumerated() {
            let indexPath = IndexPath(row: index, section: 0)
            let viewModel = DropdownViewModel(text: item,
                                              isSelected: selectedIndexes.contains(indexPath),
                                              cellIdentifier: DropdownCell.reuseIdentifier)
            sectionItems.append(viewModel)
        }
        let sectionModel = SectionModel(withItems: sectionItems)
        dataSource = TableViewArrayDataSource(sections: [sectionModel])
    }
    
}

extension DropdownPresenter: DropdownOutput {
    
    func dropdownTriggeredSelectionEvent(at indexPath: IndexPath) {
        guard let view = view else { return }
        if let index = selectedIndexes.index(of: indexPath) {
            if selectedIndexes.count > 1 { // at least one object should be selected
                selectedIndexes.remove(at: index)
            }
        } else {
            if view.allowsMultipleSelection && indexPath != allOptionIndex {
                if let allOptionIndex = allOptionIndex,
                    let index = selectedIndexes.index(of: allOptionIndex) {
                    selectedIndexes.remove(at: index)
                }
                selectedIndexes.append(indexPath)
            } else {
                selectedIndexes = [indexPath]
            }
        }
        createDataSource()
        view.reload(with: dataSource)
        delegate?.dropdown?(presenter: self, didSelectItemAt: indexPath)
    }
    
    func dropdownTriggeredCloseAction() {
        hideDropdown()
    }
    
    func dropdownDidHide() {
        delegate?.dropdown?(didHideWith: self)
    }
    
}
