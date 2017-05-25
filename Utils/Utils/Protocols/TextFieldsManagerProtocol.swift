//
//  KeyboardManagerProtocol.swift
//  StudentShare
//
//  Created by Sergey on 22.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import UIKit
import Foundation

protocol TextInputsManagerProtocol {

    var textInputsManager: TextInputsManager! { get set }
    func hideKeyboard()
    
}

extension TextInputsManagerProtocol {

    func hideKeyboard() {
        textInputsManager.hideKeyboard()
    }
    
}
