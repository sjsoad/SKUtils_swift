//
//  AuthViewModel+GooglePlusDelegate.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import GoogleSignIn

extension LoginViewModel: GIDSignInDelegate {

    public func sign(_ signIn: GIDSignIn!,
                     didSignInFor user: GIDGoogleUser!,
                     withError error: Error!) {
        if (error == nil) {
            authHandler(signIn.currentUser.authentication.accessToken,
                        .googlePlus,
                        nil)
        } else {
            authHandler(nil,
                        .googlePlus,
                        error)
        }
    }
    
}
