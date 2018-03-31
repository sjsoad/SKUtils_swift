//
//  ToolbarTextField.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

typealias ToolbarFieldDoneButtonHandler = ((_ field: UITextField, _ sender: UIBarButtonItem) -> Void)

class ToolbarTextField: BaseTextField {
    
    private var doneButtonHandler: ToolbarFieldDoneButtonHandler?
    
    @IBInspectable private(set) var doneButtonTitle: String = "Done" {
        didSet {
            doneButton.title = doneButtonTitle
        }
    }
    
    // MARK: - Lazy -
    
    lazy var toolbar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                          target: nil,
                                          action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }()
    
    private lazy var doneButton: UIBarButtonItem = {
        let doneButton = UIBarButtonItem(title: doneButtonTitle,
                                         style: .plain,
                                         target: self,
                                         action: #selector(doneButtonPressed(_:)))
        return doneButton
    }()
    
    // MARK: - Init -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inputAccessoryView = toolbar
    }
    
    // MARK: - Actions -
    
    @objc func doneButtonPressed(_ sender: UIBarButtonItem) {
        sendActions(for: .editingDidEndOnExit)
        doneButtonHandler?(self, sender)
    }
    
}

// MARK: - DoneTitleSetting -

extension ToolbarTextField: DoneTitleSetting {
    
    func set(doneTitle title: String) {
        doneButtonTitle = title
    }
    
}

// MARK: - DoneButtonHandlerSetting -

extension ToolbarTextField: DoneButtonHandlerSetting {
    
    func set(doneButtonHandler handler: @escaping ToolbarFieldDoneButtonHandler) {
        doneButtonHandler = handler
    }
}