//
//  KeyboardManagerProtocol.swift
//  StudentShare
//
//  Created by Sergey on 22.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

protocol TextInputsManagerInterface {
    
    func hideKeyboard()
    
}

protocol TextInputsManagerProtocol: TextInputsManagerInterface {

    var textInputsManager: TextInputsManager! { get set }
    
}

extension TextInputsManagerProtocol {

    func hideKeyboard() {
        textInputsManager.hideKeyboard()
    }
    
}
