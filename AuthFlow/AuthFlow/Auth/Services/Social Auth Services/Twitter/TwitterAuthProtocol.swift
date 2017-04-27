//
//  TwitterAuthProtocol.swift
//  StudentShare
//
//  Created by Sergey on 24.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol TwitterAuthProtocol: SocalNetworkAuthHandlerProtocol {

    func loginWithTwitter(fromController controller: UIViewController)
    
}

extension TwitterAuthProtocol {

    func loginWithTwitter(fromController controller: UIViewController) {
        let twitterAuth = TwitterAuth()
        twitterAuth.login(handler: authHandler,
                          fromController: controller)
    }
    
}
