//
//  RegistrationViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 07.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol Validating {
    
    var emailValidator: Validator { get }
    var passValidator: Validator { get }
    var baseValidator: Validator { get }
    var equalValidator: EqualValidator { get }
    
}

extension Validating {
    
    var emailValidator: Validator {
        return EmailValidator()
    }
    var passValidator: Validator {
        return PasswordValidator()
    }
    var baseValidator: Validator {
        return BaseValidator()
    }
    var equalValidator: EqualValidator {
        return EqualStringsValidator()
    }
    
}
