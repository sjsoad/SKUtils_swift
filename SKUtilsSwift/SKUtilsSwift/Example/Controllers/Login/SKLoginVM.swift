//
//  SKLoginVM.swift
//  SKUtilsSwift
//
//  Created by Mac on 19.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SKLoginVM: NSObject {

    var emailValidator: SKEmailValidator = SKEmailValidator()
    var passValidator: SKPasswordValidator = SKPasswordValidator()
    
    var loginValidation = Observable.just(false)
    var passwordValidation = Observable.just(false)
    
    var canLogin = Observable.just(false)
    
    func setupWith(emailField : ControlEvent<Void>, passwordTextField: ControlEvent<Void>, emailString: Observable<String>, passString: Observable<String>) {
        let emailValidation = emailString.map({email in
             self.emailValidator.isTextValid(email)
        }).shareReplay(1)
        
        let passValidation = passString.map({pass in
            self.passValidator.isTextValid(pass)
        }).shareReplay(1)
        
        loginValidation = emailField.map({
            true
        }).shareReplay(1)

        passwordValidation = passwordTextField.map({
            true
        }).shareReplay(1)
        
        canLogin = Observable.combineLatest(emailValidation, passValidation, resultSelector: { (email, password) in
            return email && password
        })
    }
    
    func login() -> Void {
    }
}
