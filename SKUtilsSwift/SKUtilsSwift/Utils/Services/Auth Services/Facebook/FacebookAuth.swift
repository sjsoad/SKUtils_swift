//
//  FacebookAuth.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookAuth: NSObject, AuthServiceProtocol {

    func login(handler: @escaping AuthServiceHandler,
               fromController controller: UIViewController) {
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["public_profile", "email"],
                           from: controller) { (loginResult, error) in
                            if error != nil {
                                handler(nil ,
                                        .authTypeFacebook,
                                        error)
                            }
                            else if let result = loginResult {
                                if !result.isCancelled {
                                    handler(result.token.tokenString,
                                            .authTypeFacebook,
                                            nil)
                                }
                            }
        }
    }
    
    func logout() {
        let facebook = FBSDKLoginManager()
        facebook.logOut()
    }
    
}
