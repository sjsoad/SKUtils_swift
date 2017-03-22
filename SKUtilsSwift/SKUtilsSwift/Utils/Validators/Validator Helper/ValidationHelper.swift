//
//  RegistrationViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 07.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

fileprivate typealias ValidationHelperHandler = (UITextField, Bool) -> Void
fileprivate typealias ComparisonHelperHandler = (UITextField, UITextField, Bool) -> Void

private let allFieldsValidated = 0

protocol ValidationHelper {
    
    func emailValidator() -> EmailValidator
    func passValidator() -> PasswordValidator
    func baseValidator() -> BaseValidator
    func equalValidator() -> EqualStringsValidator
    
    func validate(fields: [UITextField],
                  validationHandler: ValidationHelperHandler?) -> Bool
    func validate(thisEqual fieldOne: UITextField,
                  this fieldTwo: UITextField,
                  comparisonHandler: ComparisonHelperHandler?) -> Bool
}

extension ValidationHelper {
    
    func emailValidator() -> EmailValidator {
        return EmailValidator()
    }
    func passValidator() -> PasswordValidator {
        return PasswordValidator()
    }
    func baseValidator() -> BaseValidator {
        return BaseValidator()
    }
    func equalValidator() -> EqualStringsValidator {
        return EqualStringsValidator()
    }

    func validate(fields: [UITextField],
                  validationHandler: ValidationHelperHandler? = nil) -> Bool {
        var fieldsToValidate = fields
        for field in fieldsToValidate {
            var validField = false
            if field is EmailTextField {
                validField = emailValidator().isValid(field.text)
            }
            else if field is PassTextField {
                validField = passValidator().isValid(field.text)
            }
                
            else if field is BaseTextField {
                validField = baseValidator().isValid(field.text)
            }
            if validField,
                let index = fieldsToValidate.index(of: field) {
                fieldsToValidate.remove(at: index)
            }
            if let handler = validationHandler {
                handler(field, validField)
            }
        }
        return fieldsToValidate.count == allFieldsValidated
    }
    
    func validate(thisEqual fieldOne: UITextField,
                  this fieldTwo: UITextField,
                  comparisonHandler: ComparisonHelperHandler?) -> Bool {
        let equalText = equalValidator().isEqual(fieldOne.text,
                                                  secondString: fieldTwo.text)
        if let handler = comparisonHandler {
            handler(fieldOne, fieldTwo, equalText)
        }
        return equalText
    }
    
}
