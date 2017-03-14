//
//  RegistrationViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 07.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ValidationHelper: NSObject {

    private let allFieldsValidated = 0
    
    var emailValidator = EmailValidator()
    var passValidator = PasswordValidator()
    var baseValidator = BaseValidator()
    
    func validate(fields: [UITextField]) -> Bool {
        var fieldsToValidate = fields
        for (index, field) in fieldsToValidate.enumerated() {
            var validField = false
            if field is EmailTextField {
                validField = emailValidator.isValid(field.text)
            }
            else if field is PassTextField {
                validField = passValidator.isValid(field.text)
            }
                
            else if field is BaseTextField {
                validField = baseValidator.isValid(field.text)
            }
            if validField {
                fieldsToValidate.remove(at: index)
            }
        }
        return fieldsToValidate.count == allFieldsValidated
    }
    
}
