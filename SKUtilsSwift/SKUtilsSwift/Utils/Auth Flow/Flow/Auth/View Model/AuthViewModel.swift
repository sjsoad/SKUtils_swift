//
//  AuthViewModel.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import GoogleSignIn

class AuthViewModel: NSObject, LoginRequestProtocol, ValidationHelper {
    
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
    
    //MARK: - Social Auth
    
    func loginWithFacebook(fromController controller: UIViewController) {
        let facebookAuth = FacebookAuth()
        facebookAuth.login(handler: authHandler,
                           fromController: controller)
    }
   
    func loginWithInstagram(fromController controller: UIViewController) {
        let instagramAuth = InstagramAuth()
        instagramAuth.login(handler: authHandler,
                            fromController: controller)
    }
    
    func loginWithGooglePlus(fromController controller: AuthViewController) {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = controller
        let googleAuth = GooglePlusAuth()
        googleAuth.login(handler: authHandler,
                         fromController: controller)
    }
    
}