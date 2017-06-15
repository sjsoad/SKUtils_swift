//
//  KeyboardManagerProtocol.swift
//  StudentShare
//
//  Created by Sergey on 22.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

protocol TextInputsManagerInterface: class {
    
    func hideKeyboard()
    func clearTextInputs()
    func firstResponder() -> UIView?
    
}

protocol TextInputsManagerProtocol: TextInputsManagerInterface {

    var textInputsManager: TextInputsManager! { get }
    
}

extension TextInputsManagerProtocol {

    func hideKeyboard() {
        textInputsManager.hideKeyboard()
    }
    
    func clearTextInputs() {
        textInputsManager.clearTextInputs()
    }
    
    func firstResponder() -> UIView? {
        return textInputsManager.firstResponder()
    }
    
}
