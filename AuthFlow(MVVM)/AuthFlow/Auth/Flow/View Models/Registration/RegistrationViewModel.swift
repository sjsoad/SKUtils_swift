//
//  RegistrationViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 07.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RegistrationViewModel: NSObject, RegistrationRequestProtocol, DefaultValidationHelper {
    
    var resultOfRegistrationRequest: Dynamic<Bool> = Dynamic(false)
    var executingHandlerForRegistration: RequerstExecutingHandler?
 
    func validate(email: String?,
                  password: String?,
                  username: String?) -> ValidationResult {
        let emailValidated = emailValidator.isValid(email)
        let passwordValidated = passValidator.isValid(password)
        let usernameValidated = baseValidator.isValid(username)
        if !emailValidated {
            return ValidationResult(succeed: false, error: "")
        } else if !passwordValidated {
            return ValidationResult(succeed: false, error: "")
            
        } else if !usernameValidated {
            return ValidationResult(succeed: false, error: "")
        } else {
//            <#register(email: email!, password: password!)#>
            return ValidationResult(succeed: true, error: nil)
        }
        
    }
    
}
