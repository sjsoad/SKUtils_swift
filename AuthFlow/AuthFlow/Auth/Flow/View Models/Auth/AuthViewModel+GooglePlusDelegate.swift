//
//  AuthViewModel+GooglePlusDelegate.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import GoogleSignIn

extension AuthViewModel: GIDSignInDelegate {

    public func sign(_ signIn: GIDSignIn!,
                     didSignInFor user: GIDGoogleUser!,
                     withError error: Error!) {
        if (error == nil) {
            authHandler(signIn.currentUser.authentication.accessToken,
                        .authTypeGooglePlus,
                        nil)
        } else {
            authHandler(nil,
                        .authTypeGooglePlus,
                        error)
        }
    }
    
}
