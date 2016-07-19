//
//  SKLoginVM.swift
//  SKUtilsSwift
//
//  Created by Mac on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class SKLoginVM: NSObject {

    @IBOutlet weak var emailValidator: SKEmailValidator!
    @IBOutlet weak var passValidator: SKPasswordValidator!
    
    var email: String? = nil
    var pass: String? = nil
    
    func isEmailValid(text: String) -> Bool {
        return self.emailValidator.isTextValid(text)
    }
    
    func isPassValid(text: String) -> Bool {
        return self.passValidator.isTextValid(text)
    }
    
    func login() -> Void {
        var valid = false
        if let email = self.email {
            valid = self.isEmailValid(email)
        }
        if let pass = self.pass {
            valid = self.isPassValid(pass)
        }
        if valid {
            
        }
    }
}
