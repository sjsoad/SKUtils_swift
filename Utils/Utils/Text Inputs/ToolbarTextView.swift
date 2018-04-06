//
//  ToolbarTextView.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 31.03.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

typealias ToolbarTextViewDoneButtonHandler = ((_ textView: UITextView, _ sender: UIBarButtonItem) -> Void)

class ToolbarTextView: UITextView {

    private var doneButtonHandler: ToolbarTextViewDoneButtonHandler?
    
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
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }()
    
    private lazy var doneButton: UIBarButtonItem = { [unowned self] in
        let doneButton = UIBarButtonItem(title: doneButtonTitle, style: .plain, target: self, action: #selector(doneButtonPressed(_:)))
        return doneButton
        }()
    
    // MARK: - Init -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inputAccessoryView = toolbar
    }
    
    // MARK: - Actions -
    
    @objc func doneButtonPressed(_ sender: UIBarButtonItem) {
        resignFirstResponder()
        doneButtonHandler?(self, sender)
    }
    
}

// MARK: - DoneTitleSetting -

extension ToolbarTextView: DoneTitleSetting {
    
    func set(doneTitle title: String) {
        doneButtonTitle = title
    }
    
}

// MARK: - DoneButtonHandlerSetting -

extension ToolbarTextView: DoneButtonHandlerSetting {
    
    func set<HandlerType>(doneButtonHandler handler: HandlerType) {
        doneButtonHandler = handler as? ToolbarTextViewDoneButtonHandler
    }
}
