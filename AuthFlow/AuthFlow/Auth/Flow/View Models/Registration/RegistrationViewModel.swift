//
//  RegistrationViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 07.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RegistrationViewModel: NSObject, RegistrationRequestProtocol, ValidationHelper {
    
    var requerstExecutingHandler: RequerstExecutingHandler?

    var requestSucceed: Dynamic<Bool> = Dynamic(false)
 
    func validate(email: String?,
                  password: String?,
                  username: String?) -> (succeed: Bool, error: String?) {
        let emailValidated = emailValidator().isValid(email)
        let passwordValidated = passValidator().isValid(password)
        let usernameValidated = baseValidator().isValid(username)
        if !emailValidated {
            return (false, "")
        }
        else if !passwordValidated {
            return (false, "")
            
        } else if !usernameValidated {
            return (false, "")
        }
        else {
//            <#register(email: email!, password: password!)#>
            return (true, nil)
        }
        
    }
    
}
