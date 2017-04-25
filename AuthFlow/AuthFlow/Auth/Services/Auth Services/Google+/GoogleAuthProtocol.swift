//
//  GoogleAuthProtocol.swift
//  StudentShare
//
//  Created by Sergey on 24.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation
import GoogleSignIn

protocol GoogleAuthProtocol: AuthHandlerProtocol {

    func loginWithGooglePlus(fromController controller: UIViewController)
}

extension GoogleAuthProtocol {

    func loginWithGooglePlus(fromController controller: UIViewController) {
        GIDSignIn.sharedInstance().delegate = self as! GIDSignInDelegate
        GIDSignIn.sharedInstance().uiDelegate = controller as! GIDSignInUIDelegate
        let googleAuth = GooglePlusAuth()
        googleAuth.login(handler: authHandler,
                         fromController: controller)
    }
        
}
