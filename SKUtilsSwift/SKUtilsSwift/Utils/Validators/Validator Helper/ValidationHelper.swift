//
//  RegistrationViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 07.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol ValidationHelper {
    
    func emailValidator() -> EmailValidator
    func passValidator() -> PasswordValidator
    func baseValidator() -> BaseValidator
    func equalValidator() -> EqualStringsValidator
    
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
    
}
