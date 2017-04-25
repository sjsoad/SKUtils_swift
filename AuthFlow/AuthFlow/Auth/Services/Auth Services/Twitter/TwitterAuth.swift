//
//  TwitterAuth.swift
//  StudentShare
//
//  Created by Sergey on 24.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterAuth: NSObject, AuthServiceProtocol {

    func login(handler: @escaping AuthServiceHandler,
               fromController controller: UIViewController) {
        Twitter.sharedInstance().logIn(withMethods: .webBased) { (session, error) in
            if error != nil {
                handler(nil,
                        .authTypeTwitter,
                        error)
            }
            else if let currentSession = session {
                handler(currentSession.authToken,
                        .authTypeTwitter,
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
