//
//  SKPasswordValidator.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 17.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class PasswordValidator: BaseValidator {

    @IBInspectable var passwordRegularExpresionString = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$"
    @IBInspectable var passwordPredicateString        = "SELF MATCHES %@"
    
    override func isTextValid(text: String?) -> Bool {
        if let text = text {
            var isTextValid = super.isTextValid(text)
            if isTextValid {
                let passwordValidationPredicate = NSPredicate(format: passwordPredicateString, passwordRegularExpresionString)
                isTextValid = passwordValidationPredicate.evaluateWithObject(text)
            }
            return isTextValid
        }
        return false
    }
    
}
