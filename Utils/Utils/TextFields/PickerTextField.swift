//
//  PickerTextField.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class PickerTextField: PickableTextField {
    
    #if TARGET_INTERFACE_BUILDER
    @IBOutlet open weak var pickerFieldDelegate: AnyObject?
    #else
    weak open var pickerFieldDelegate: PickerTextFieldDelegate?
    #endif

    lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    // MARK: - Init -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.inputView = self.picker
    }
    
    // MARK: - Functions -
    
    override func doneButtonPressed(_ sender: UIBarButtonItem) {
        for componentIndex in 0..<picker.numberOfComponents {
            let selectedRowIndex = picker.selectedRow(inComponent: componentIndex)
            guard let delegate = picker.delegate else { return }
            delegate.pickerView?(picker, didSelectRow: selectedRowIndex, inComponent: componentIndex)
        }
        guard let delegate = pickerFieldDelegate else { return }
        delegate.pickerTextField?(self, didPressDoneButton: sender)
    }
    
    func reload(with manager: PickerManager) {
        self.picker.dataSource = manager
        self.picker.delegate = manager
        self.picker.reloadAllComponents()
    }
    
}

@objc protocol PickerTextFieldDelegate : class {
    
    @objc optional func pickerTextField(_ pickerTextField: PickerTextField, didPressDoneButton button: UIBarButtonItem)
    
}
