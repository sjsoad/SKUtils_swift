//
//  KeyboardManagerProtocol.swift
//  StudentShare
//
//  Created by Sergey on 22.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

protocol TextFieldsManagerProtocol {

    var textFieldsManager: TextFieldsManager! { get set }
    func hideKeyboard()
    
}

extension TextFieldsManagerProtocol {

    func hideKeyboard() {
        textFieldsManager.hideKeyboard()
    }
    
}
