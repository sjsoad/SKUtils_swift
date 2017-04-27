//
//  InstagramService.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class InstagramAuth: NSObject, ScialNetworkAuthProtocol {
    
    func login(handler: @escaping SocalNetworkAuthHandler,
               fromController controller: UIViewController) {
        let instagramVC = InstagramAuthViewController(clientId: Instagram.clientId,
                                                      clientSecret: Instagram.clientSecret,
                                                      redirectUri: Instagram.redirectUri,
                                                      handler: handler)
        let navigation = UINavigationController(rootViewController: instagramVC)
        controller.present(navigation,
                           animated: true,
                           completion: nil)
        
    }

    func logout() {
    }
    
}
