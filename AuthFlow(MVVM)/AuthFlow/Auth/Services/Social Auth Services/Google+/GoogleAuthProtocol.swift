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

protocol GoogleAuthProtocol: SocalNetworkAuthHandlerProtocol {

    func loginWithGooglePlus(fromController controller: UIViewController)
}

extension GoogleAuthProtocol {

    func loginWithGooglePlus(fromController controller: UIViewController) {
        guard let delegate = self as? GIDSignInDelegate else { return }
        guard let uiDelegate = self as? GIDSignInUIDelegate else { return }
        GIDSignIn.sharedInstance().delegate = delegate
        GIDSignIn.sharedInstance().uiDelegate = uiDelegate
        let googleAuth = GooglePlusAuth()
        googleAuth.login(handler: authHandler,
                         fromController: controller)
    }
        
}
