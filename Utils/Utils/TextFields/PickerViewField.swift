//
//  PickerTextField.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class PickerViewField: PickerTextField {
    
    // MARK: - Lazy -
    
    private(set) lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    // MARK: - Init -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.inputView = self.picker
    }
    
    // MARK: - Actions -
    
    override func doneButtonPressed(_ sender: UIBarButtonItem) {
        for componentIndex in 0..<picker.numberOfComponents {
            let selectedRowIndex = picker.selectedRow(inComponent: componentIndex)
            if let delegate = picker.delegate {
                delegate.pickerView?(picker, didSelectRow: selectedRowIndex, inComponent: componentIndex)
            }
        }
        super.doneButtonPressed(sender)
    }
    
}

// MARK: - PickerViewFieldReloading -

extension PickerViewField: PickerViewFieldReloading {
    
    func reload(with manager: PickerManager) {
        self.picker.dataSource = manager
        self.picker.delegate = manager
        self.picker.reloadAllComponents()
        for selectedIndex in manager.selectedIndexes {
            self.picker.selectRow(selectedIndex.row, inComponent: selectedIndex.section, animated: false)
        }
    }
    
}

