//
//  InstagramAuthProtocol.swift
//  AuthFlow
//
//  Created by Sergey on 25.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol InstagramAuthProtocol: AuthHandlerProtocol {
    
    func loginWithInstagram(fromController controller: UIViewController)
    
}

extension InstagramAuthProtocol {

    func loginWithInstagram(fromController controller: UIViewController) {
        let instagramAuth = InstagramAuth()
        instagramAuth.login(handler: authHandler,
                            fromController: controller)
    }
    
}
