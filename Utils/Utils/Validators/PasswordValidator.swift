//
//  SKPasswordValidator.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 17.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class PasswordValidator: BaseValidator {

    var passwordRegularExpresionString = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$"
    var passwordPredicateString        = "SELF MATCHES %@"
    
    override func isValid(_ text: String?) -> Bool {
        guard let text = text else { return false }
        var isTextValid = super.isValid(text)
        if isTextValid {
            let passwordValidationPredicate = NSPredicate(format: passwordPredicateString, passwordRegularExpresionString)
            isTextValid = passwordValidationPredicate.evaluate(with: text)
        }
        return isTextValid
    }
    
}
