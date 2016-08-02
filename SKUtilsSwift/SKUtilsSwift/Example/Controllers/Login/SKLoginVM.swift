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
    
var disposeBag = DisposeBag()

    func setupWith(emailField : ControlEvent<Void>, passwordTextField: ControlEvent<Void>, emailString: Observable<String>, passString: Observable<String>) {
        let emailValidation = emailString.flatMapLatest { email in
            Observable.just(self.emailValidator.isTextValid(email))
            }.shareReplay(1)
        
        let passValidation = passString.flatMapLatest {pass in
            Observable.just(self.passValidator.isTextValid(pass))
            }.shareReplay(1)
        
        self.loginValidation = Observable.combineLatest(emailValidation, emailField, resultSelector: { (email, onEndEditing) in
            return email
        })

        self.passwordValidation = Observable.combineLatest(passValidation, passwordTextField, resultSelector: { (password, onEndEditing) in
            return password
        })
        
//        self.loginValidation = emailField.map({_ in
//            //            emailValidation
//            email
//            //            emailValidation.map{ valid in
//            //                valid
//            //            }.shareReplay(1)
//        }).shareReplayLatestWhileConnected()
//        
//        self.passwordValidation = passwordTextField.map({_ in
//            
//            password
//            //            passValidation.subscribeNext { valid in
//            //                valid
//            //            }.addDisposableTo(disposeBag)
//        }).shareReplayLatestWhileConnected()
        
        canLogin = Observable.combineLatest(emailValidation, passValidation, resultSelector: { (email, password) in
            return email && password
        }).distinctUntilChanged()
    }
    
    func login() -> Void {
    }
}
