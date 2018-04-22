//
//  PickerTextField.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import PickerViewManager

public class PickerViewField: ToolbarTextField {
    
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
    
    // MARK: - Private -
    
    private func reloadPicker() {
        picker.reloadAllComponents()
    }
    
    private func selectRows(at indexPathes: [IndexPath]) {
        for indexPath in indexPathes {
            guard indexPath.row > 0, indexPath.section < picker.numberOfComponents,
                indexPath.row < picker.numberOfRows(inComponent: indexPath.section) else { return }
            picker.selectRow(indexPath.row, inComponent: indexPath.section, animated: false)
        }
    }
    
}

// MARK: - PickerViewFieldReloading -

extension PickerViewField: PickerViewFieldReloading {
    
    public func reload(with manager: PickerManager) {
        picker.dataSource = manager
        picker.delegate = manager
        reloadPicker()
        selectRows(at: manager.selectedIndexes)
        manager.selectionSettingHandler = { [weak self] (selectedIndicies) in
            self?.selectRows(at: selectedIndicies)
        }
    }
    
}
