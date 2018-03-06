//
//  ValidationService.swift
//  SwiftUtils
//
//  Created by Sergey on 01.12.2017.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class DefaultValidationService: NSObject {

    private var emailValidator: Validator
    private var passValidator: Validator
    private var baseValidator: Validator
    
    init(emailValidator: Validator = EmailValidator(),
         passValidator: Validator = PasswordValidator(),
         baseValidator: Validator = DefaultValidator()) {
        self.emailValidator = emailValidator
        self.passValidator = passValidator
        self.baseValidator = baseValidator
    }
    
    func isValid(email: String?) -> Bool {
        return emailValidator.isValid(email)
    }
    
    func isValid(password: String?) -> Bool {
        return passValidator.isValid(password)
    }
    
    func isValid(text: String?) -> Bool {
        return baseValidator.isValid(text)
    }
    
}
