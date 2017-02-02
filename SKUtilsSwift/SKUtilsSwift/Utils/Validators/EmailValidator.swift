//
//  SKEmailValidator.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 14.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class EmailValidator: BaseValidator {
    
    @IBInspectable var emailRegularExpresionString = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
    @IBInspectable var emailPredicateString        = "SELF MATCHES %@"
    
    override func isTextValid(_ text: String?) -> Bool {
        if let text = text {
            var isTextValid = super.isTextValid(text)
            if isTextValid {
                let emailValidationPredicate = NSPredicate(format: emailPredicateString, emailRegularExpresionString)
                isTextValid = emailValidationPredicate.evaluate(with: text)
            }
            return isTextValid
        }
        return false
    }
}
