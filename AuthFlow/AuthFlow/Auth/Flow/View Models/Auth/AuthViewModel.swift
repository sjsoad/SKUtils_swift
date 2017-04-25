//
//  AuthViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import GoogleSignIn

class AuthViewModel: NSObject, LoginRequestProtocol, ValidationHelper, FacebookAuthProtocol, InstagramAuthProtocol, GoogleAuthProtocol {
    
    var authHandler: AuthServiceHandler!
    
    var requerstExecutingHandler: RequerstExecutingHandler?
    
    var requestSucceed: Dynamic<Bool> = Dynamic(false)
    var authCredentials: AuthCredentials?
    
    var tryToLogin: Bool = false
    
    override init() {
        super.init()
        authHandler = { [weak self](accessToken, type, error) in
            guard let strongSelf = self else { return }
            
            if error == nil, let token = accessToken {
                strongSelf.login(accessToken: token,
                                 grantType: type)
            }
            else if let executingHandler = strongSelf.requerstExecutingHandler {
                executingHandler(false, error)
            }
        }
    }
    
}
