//
//  DateTextField.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 17.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

typealias DatePickerFieldDateSelectionHandler = ((_ field: UITextField, _ picker: UIDatePicker, _ date: Date) -> Void)

class DatePickerField: PickerTextField {
    
    var dateSelectionHandler: DatePickerFieldDateSelectionHandler?
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        return datePicker
    }()
    
    // MARK: - Init -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.inputView = self.datePicker
    }
    
    // MARK: - Functions -
    
    override func doneButtonPressed(_ sender: UIBarButtonItem) {
        dateSelectionHandler?(self, datePicker, datePicker.date)
        super.doneButtonPressed(sender)
    }
    
    // MARK: - Private -
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        dateSelectionHandler?(self, sender, sender.date)
    }
    
}
