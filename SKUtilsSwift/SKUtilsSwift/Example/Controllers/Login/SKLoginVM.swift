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
    
    var delegate: SKLoginDelegate? = nil
    
    var canTryToLogin: Bool = false
    
    func isEmailValid(text: String?) -> Bool {
        let valid = self.emailValidator.isTextValid(text)
        if let delegate = self.delegate {
            delegate.validateEmailTextField(valid)
        }
        self.canTryToLogin = valid
        return valid
    }
    
    func isPassValid(text: String?) -> Bool {
        let valid = self.passValidator.isTextValid(text)
        if let delegate = self.delegate {
            delegate.validatePassTextField(valid)
        }
        self.canTryToLogin = valid
        return valid
    }
    
    func login() -> Void {
        var valid = self.isEmailValid(self.email)
            valid = self.isPassValid(self.pass)
        if valid {
            
        }
    }
}
