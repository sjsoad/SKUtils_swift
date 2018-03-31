//
//  PickerTextField.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class PickerViewField: ToolbarTextField {
    
    // MARK: - Lazy -
    
    private(set) lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    // MARK: - Init -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inputView = picker
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
        picker.dataSource = manager
        picker.delegate = manager
        picker.reloadAllComponents()
        for selectedIndex in manager.selectedIndexes {
            picker.selectRow(selectedIndex.row, inComponent: selectedIndex.section, animated: false)
        }
    }
    
}
