//
//  GooglePlusService.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import GoogleSignIn

class GooglePlusAuth: NSObject, SocalNetworkAuthHandlerProtocol {
    
    var authHandler: SocalNetworkAuthHandler!
    
    func login(handler: @escaping SocalNetworkAuthHandler,
               fromController controller: UIViewController) {
        authHandler = handler
        GIDSignIn.sharedInstance().signIn()
    }
    
    func logout() {
        GIDSignIn.sharedInstance().signOut()
    }
    
}
