//
//  TwitterAuth.swift
//  StudentShare
//
//  Created by Sergey on 24.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterAuth: NSObject, ScialNetworkAuthProtocol {

    func login(handler: @escaping SocalNetworkAuthHandler,
               fromController controller: UIViewController) {
        Twitter.sharedInstance().logIn(withMethods: .webBased) { (session, error) in
            if error != nil {
                handler(nil,
                        .twitter,
                        error)
            }
            else if let currentSession = session {
                handler(currentSession.authToken,
                        .twitter,
                        nil)
            }
        }
    }
    
    func logout() {
        let sessionStore = Twitter.sharedInstance().sessionStore
        if let currentSession = sessionStore.session() {
            sessionStore.logOutUserID(currentSession.userID)
        }
    }

    
}
