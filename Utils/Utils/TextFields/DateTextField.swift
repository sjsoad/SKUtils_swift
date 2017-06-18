//
//  DateTextField.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 17.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class DateTextField: BaseTextField {

    var currentDate: Date {
        set {
            self.datePicker.date = newValue
        }
        get {
            return self.datePicker.date
        }
    }
    
    #if TARGET_INTERFACE_BUILDER
    @IBOutlet open weak var dateFieldDelegate: AnyObject?
    #else
    weak open var dateFieldDelegate: DateTextFieldDelegate?
    #endif
    
    @IBInspectable var dateDisplayingFormat: String = "dd MM yyyy" {
        didSet {
            self.dateFormatter.dateFormat = self.dateDisplayingFormat
        }
    }
    
    @IBInspectable var doneButtonTitle: String = "Done" {
        didSet {
            self.doneButton.title = self.doneButtonTitle
        }
    }
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        return dateFormatter
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        return datePicker
    }()
    
    lazy var datePickerToolbar: UIToolbar? = {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let doneButton = self.doneButton
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }()
    
    private lazy var doneButton: UIBarButtonItem = {
        let doneButton = UIBarButtonItem(title: nil,
                                         style: .plain,
                                         target: self,
                                         action: #selector(doneButtonPressed(_:)))
        return doneButton
    }()
    
    // MARK: - Init -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.inputView = self.datePicker
        self.inputAccessoryView = self.datePickerToolbar
    }
    
    // MARK: - Functions -
    
    @objc private func datePickerValueChanged(_ sender: UIDatePicker) {
        display(selectedDate: sender.date)
        guard let delegate = dateFieldDelegate else { return }
        delegate.dateTextField?(self, selectedDate: sender.date)
    }
    
    @objc private func doneButtonPressed(_ sender: UIBarButtonItem) {
        display(selectedDate: datePicker.date)
        guard let delegate = dateFieldDelegate else { return }
        delegate.dateTextField?(self, pressedDoneButton: sender)
    }
    
    private func display(selectedDate date: Date) {
        let dateString = self.dateFormatter.string(from: date)
        self.text = dateString
    }
    
}

@objc protocol DateTextFieldDelegate : class {

    @objc optional func dateTextField(_ dateTextField: DateTextField, selectedDate date: Date)
    @objc optional func dateTextField(_ dateTextField: DateTextField, pressedDoneButton button: UIBarButtonItem)
    
}
