//
//  PickerDataSource.swift
//  Nioxin
//
//  Created by Sergey on 16.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

class PickerComponentObject: NSObject {
    
    var items: [PickerRowObject] = [PickerRowObject]()
    
    init(items: [PickerRowObject]) {
        self.items = items
    }
    
}

class PickerRowObject: NSObject {

    var title: String?
    var attributedTitle: NSAttributedString?
    var rowView: UIView?

    init(title: String? = nil,
         attributedTitle: NSAttributedString? = nil,
         rowView: UIView? = nil) {
        self.title = title
        self.attributedTitle = attributedTitle
        self.rowView = rowView
    }
    
}

class PickerDataSourceConfigurator {

    var components: [PickerComponentObject] = [PickerComponentObject]()

    init(components: [PickerComponentObject]) {
        self.components = components
    }
    
}

class PickerManager: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {

    private var configuration: PickerDataSourceConfigurator!
    private var handler: ((PickerRowObject, Int, Int) -> Void)?
    
    init(configuration: PickerDataSourceConfigurator, selectionHandler: ((PickerRowObject, Int, Int) -> Void)? = nil) {
        self.configuration = configuration
        self.handler = selectionHandler
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

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let handler = handler else { return }
        let rowObject = configuration.components[component].items[row]
        handler(rowObject, component, row)
    }
    
}
