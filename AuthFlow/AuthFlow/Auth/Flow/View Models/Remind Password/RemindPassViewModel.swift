//
//  RemindPassViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 09.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RemindPassViewModel: NSObject, RemindPasswordRequestProtocol, ValidationHelper {
  
    var resultOfRemindPasswordRequest: Dynamic<Bool> = Dynamic(false)
    var executingHandlerForRemindPassword: RequerstExecutingHandler?
    
    func validate(email: String?) -> ValidationResult {
        let emailValidated = emailValidator().isValid(email)
        if emailValidated {
//            <#remindPassword(email: email!)#>
            return ValidationResult(succeed: true, error: nil)
        }
        return ValidationResult(succeed: false, error: "")
    }
    
}
