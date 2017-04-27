//
//  FacebookAuthProtocol.swift
//  StudentShare
//
//  Created by Sergey on 24.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol FacebookAuthProtocol: SocalNetworkAuthHandlerProtocol {

   func loginWithFacebook(fromController: UIViewController)
    
}

extension FacebookAuthProtocol {

    func loginWithFacebook(fromController controller: UIViewController) {
        let facebookAuth = FacebookAuth()
        facebookAuth.login(handler: authHandler,
                           fromController: controller)
    }
    
}
