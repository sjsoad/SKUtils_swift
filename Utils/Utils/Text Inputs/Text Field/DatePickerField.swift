//
//  DateTextField.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 17.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

public typealias DatePickerFieldDateSelectionHandler = ((_ field: UITextField, _ picker: UIDatePicker, _ date: Date) -> Void)

public class DatePickerField: ToolbarTextField {
    
    private var dateSelectionHandler: DatePickerFieldDateSelectionHandler?
    
    // MARK: - Lazy -
    
    private(set) lazy var datePicker: UIDatePicker = { [unowned self] in
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        return datePicker
    }()
    
    // MARK: - Init -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inputView = datePicker
    }
    
    // MARK: - Actions -
    
    override func doneButtonPressed(_ sender: UIBarButtonItem) {
        dateSelectionHandler?(self, datePicker, datePicker.date)
        super.doneButtonPressed(sender)
    }
    
    // MARK: - Private -
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        dateSelectionHandler?(self, sender, sender.date)
    }
    
}

extension DatePickerField: DateSelectionHandlerSetting {
    
    public func set(dateSelectionHandler handler: @escaping DatePickerFieldDateSelectionHandler) {
        dateSelectionHandler = handler
    }
    
}
