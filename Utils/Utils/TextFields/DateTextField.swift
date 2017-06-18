//
//  DateTextField.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 17.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class DateTextField: PickableTextField {
    
    #if TARGET_INTERFACE_BUILDER
    @IBOutlet open weak var dateFieldDelegate: AnyObject?
    #else
    weak open var dateFieldDelegate: DateTextFieldDelegate?
    #endif
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        return datePicker
    }()
    
    // MARK: - Init -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.inputView = self.datePicker
        self.inputAccessoryView = self.toolbar
    }
    
    // MARK: - Functions -
    
    override func doneButtonPressed(_ sender: UIBarButtonItem) {
        guard let delegate = dateFieldDelegate else { return }
        delegate.dateTextField?(self, didPressDoneButton: sender)
    }
    
    // MARK: - Private -
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        guard let delegate = dateFieldDelegate else { return }
        delegate.dateTextField?(self, didSelectedDate: sender.date)
    }
    
}

@objc protocol DateTextFieldDelegate : class {

    @objc optional func dateTextField(_ dateTextField: DateTextField, didSelectedDate date: Date)
    @objc optional func dateTextField(_ dateTextField: DateTextField, didPressDoneButton button: UIBarButtonItem)
    
}
