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

    var emailValidator: SKBaseValidator = SKBaseValidator()
    var passValidator: SKBaseValidator = SKBaseValidator()
    
    var emailValidation = Observable.just(false)
    var passValidation = Observable.just(false)
    
    var canLogin = Observable.just(false)
    var logining = Observable.just(false)
    var loggedIn = Observable.just(false)
    
    var emailValid = false
    var passValid = false

    func setupWith(emailFieldDidEndEditing : ControlEvent<Void>,
                   passwordTextFieldDidEndEditing: ControlEvent<Void>,
                   emailString: Observable<String>,
                   passString: Observable<String>,
                   loginButtonTap: Observable<Void>) {
        let emailStringValidation = emailString.flatMapLatest { email in
            Observable.just(self.emailValidator.isTextValid(email))
            }.shareReplay(1)
        
        let passStringValidation = passString.flatMapLatest {pass in
            Observable.just(self.passValidator.isTextValid(pass))
            }.shareReplay(1)
        
        emailValidation = emailFieldDidEndEditing.map({_ in
            self.emailValid
        }).shareReplay(1)
        
        passValidation = passwordTextFieldDidEndEditing.map({_ in
            self.passValid
        }).shareReplay(1)
        
        canLogin = Observable.combineLatest(emailStringValidation,
                                            passStringValidation,
                                            resultSelector: { (email, password) in
            self.emailValid = email
            self.passValid = password
            return email && password
        }).distinctUntilChanged()
        
        let usernameAndPassword = Observable.combineLatest(emailString, passString) { ($0, $1) }
        
        logining = loginButtonTap.map({ _ in
            return true
        })
        
        loggedIn = loginButtonTap.withLatestFrom(usernameAndPassword)
            .flatMapLatest({ (username, password)in
                return APIManager.loginWithParameters(username, password: password)
        })
            .flatMapLatest { loggedIn -> Observable<Bool> in
                Observable.just(false)
            }
            .shareReplay(1)
    }

}
