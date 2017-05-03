//
//  RemindPassViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 09.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RemindPassViewModel: NSObject, RemindPasswordRequestProtocol, ValidationHelper {
    
    var requerstExecutingHandler: RequerstExecutingHandler?
    
    var requestSucceed: Dynamic<Bool> = Dynamic(false)
    
    func validate(email: String?) -> (succeed: Bool, error: String?) {
        let emailValidated = emailValidator().isValid(email)
        if emailValidated {
//            <#remindPassword(email: email!)#>
            return (true, nil)
        }
        return (false, "")
    }
    
}
