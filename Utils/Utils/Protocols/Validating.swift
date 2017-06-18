//
//  RegistrationViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 07.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol Validating {
    
    var emailValidator: EmailValidator { get }
    var passValidator: PasswordValidator { get }
    var baseValidator: BaseValidator { get }
    var equalValidator: EqualStringsValidator { get }
    
}

extension Validating {
    
    var emailValidator: EmailValidator {
        return EmailValidator()
    }
    var passValidator: PasswordValidator {
        return PasswordValidator()
    }
    var baseValidator: BaseValidator {
        return BaseValidator()
    }
    var equalValidator: EqualStringsValidator {
        return EqualStringsValidator()
    }
    
}
