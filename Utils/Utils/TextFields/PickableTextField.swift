//
//  PickableTextField.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 18.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class PickableTextField: BaseTextField {

    @IBInspectable var doneButtonTitle: String = "Done" {
        didSet {
            self.doneButton.title = self.doneButtonTitle
        }
    }

    lazy var toolbar: UIToolbar = {
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
        let doneButton = UIBarButtonItem(title: self.doneButtonTitle,
                                         style: .plain,
                                         target: self,
                                         action: #selector(doneButtonPressed(_:)))
        return doneButton
    }()
    
    // MARK: - Functions -
    
    internal func doneButtonPressed(_ sender: UIBarButtonItem) {
    }
    
}
