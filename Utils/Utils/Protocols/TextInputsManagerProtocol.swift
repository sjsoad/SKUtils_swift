//
//  KeyboardManagerProtocol.swift
//  StudentShare
//
//  Created by Sergey on 22.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

protocol TextInputsManaging: class {
    
    func hideKeyboard()
    func clearTextInputs()
    func reloadTextFieldsManager()
    func firstResponder() -> UIView?
    
}
