//
//  PickerDataSource.swift
//  Nioxin
//
//  Created by Sergey on 16.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

protocol PickerRow {
    
    var title: String? { get }
    var attributedTitle: NSAttributedString? { get }
    
}

class PickerComponentObject: NSObject {
    
    var items: [PickerRow] = [PickerRow]()
    
    init(items: [PickerRow]) {
        self.items = items
    }
    
}

class PickerRowObject: NSObject, PickerRow {

    private(set) var title: String?
    private(set) var attributedTitle: NSAttributedString?

    init(title: String? = nil,
         attributedTitle: NSAttributedString? = nil) {
        self.title = title
        self.attributedTitle = attributedTitle
    }
    
}

class PickerDataSourceConfigurator {

    var components: [PickerComponentObject] = [PickerComponentObject]()

    init(components: [PickerComponentObject]) {
        self.components = components
    }
    
}

typealias PickerManagerSelectionHandler = (PickerRow, _ component: Int, _ row: Int) -> Void

class PickerManager: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {

    private var configuration: PickerDataSourceConfigurator!
    private var handler: PickerManagerSelectionHandler?
    private(set) var selectedIndexes = [IndexPath]()
    
    init(configuration: PickerDataSourceConfigurator,
         selectionHandler: PickerManagerSelectionHandler? = nil) {
        self.configuration = configuration
        self.handler = selectionHandler
    }
    
    // MARK: - Setter -
    
    func set(selectedIndexes: [IndexPath]) {
        self.selectedIndexes = selectedIndexes
    }
    
    // MARK: - UIPickerViewDataSource -
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return configuration.components.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return configuration.components[component].items.count
    }
    
    // MARK: - UIPickerViewDelegate -
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return configuration.components[component].items[row].title
    }

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return configuration.components[component].items[row].attributedTitle
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let handler = handler else { return }
        let rowObject = configuration.components[component].items[row]
        let selectedIndex = IndexPath(row: row, section: component)
        // TODO - Check
        if let indexPath = selectedIndexes.filter({ (indexPath) -> Bool in
            return indexPath.section = component
        }).first, let index = selectedIndexes.index(of: indexPath) {
            selectedIndexes[index] = selectedIndex
        } else {
            selectedIndexes.append(selectedIndex)
        }
        handler(rowObject, component, row)
    }
    
}
