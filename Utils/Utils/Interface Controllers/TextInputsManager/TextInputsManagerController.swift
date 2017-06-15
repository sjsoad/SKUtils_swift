//
//  TextInputsManagerInterface.swift
//  SwiftUtils
//
//  Created by Sergey Kostyan on 14.06.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class TextInputsManagerController: UIViewController, TextInputsManagerInterface {

    @IBOutlet private var textInputsManager: TextInputsManager!
    
    // MARK: - TextInputsManagerInterface -
    
    internal func hideKeyboard() {
        textInputsManager.hideKeyboard()
    }
    
    internal func clearTextInputs() {
        textInputsManager.clearTextInputs()
    }
    
    internal func reloadTextFieldsManager() {
        textInputsManager.reloadTextFieldsManager()
    }
    
    internal func firstResponder() -> UIView? {
        return textInputsManager.firstResponder()
    }

}
