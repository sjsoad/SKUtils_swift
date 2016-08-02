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
    
    var emailValidation = Observable.just(false)
    var passValidation = Observable.just(false)
    
    var canLogin = Observable.just(false)
    
    var emailValid = false
    var passValid = false


    func setupWith(emailField : ControlEvent<Void>, passwordTextField: ControlEvent<Void>, emailString: Observable<String>, passString: Observable<String>) {
        let emailStringValidation = emailString.flatMapLatest { email in
            Observable.just(self.emailValidator.isTextValid(email))
            }.shareReplay(1)
        
        let passStringValidation = passString.flatMapLatest {pass in
            Observable.just(self.passValidator.isTextValid(pass))
            }.shareReplay(1)
        
        self.emailValidation = emailField.map({_ in
            self.emailValid
        }).shareReplay(1)
        
        self.passValidation = passwordTextField.map({_ in
            self.passValid
        }).shareReplay(1)
        
        canLogin = Observable.combineLatest(emailStringValidation, passStringValidation, resultSelector: { (email, password) in
            self.emailValid = email
            self.passValid = password
            return email && password
        }).distinctUntilChanged()
    }
    
    func login() -> Void {
    }
}
