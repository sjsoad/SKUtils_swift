//
//  GooglePlusService.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import GoogleSignIn

class GooglePlusAuth: NSObject, AuthServiceProtocol {
    
    var handler: AuthServiceHandler?
    
    func login(handler: @escaping AuthServiceHandler,
               fromController controller: UIViewController) {
        self.handler = handler
        GIDSignIn.sharedInstance().signIn()
    }
    
    func logout() {
        GIDSignIn.sharedInstance().signOut()
    }
    
}
