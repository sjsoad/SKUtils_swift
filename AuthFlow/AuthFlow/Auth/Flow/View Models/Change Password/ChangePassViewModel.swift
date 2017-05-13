//
//  ChangePassViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 09.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ChangePassViewModel: NSObject, ChangePasswordRequestProtocol, ValidationHelper {

    var requerstExecutingHandler: RequerstExecutingHandler?
    
    var requestSucceed: Dynamic<Bool> = Dynamic(false)
    
    var temporaryToken: String?
    
    func validate(password: String?,
                  confirmation: String?) -> ValidationResult {
        let passwordValidated = passValidator().isValid(password)
        let passwordEqual = equalValidator().isEqual(password,
                                                     secondString: confirmation)
        if !passwordValidated {
            return ValidationResult(succeed: false, error: "")
            
        } else if !passwordEqual {
            return ValidationResult(succeed: false, error: "")
        }
//        <#change password#>
        return ValidationResult(succeed: true, error: nil)
    }
    
}
