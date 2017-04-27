//
//  AuthService.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import UIKit

enum GrantType: String {
    case authTypeFacebook = "facebook"
    case authTypeInstagram = "instagram"
    case authTypeTwitter = "twitter"
    case authTypeGooglePlus = "google"
}

typealias SocalNetworkAuthHandler = (_ accessToken: String? ,
                                     _ authType: GrantType,
                                     _ error: Error?) -> Void

protocol ScialNetworkAuthProtocol {
    
    func login(handler: @escaping SocalNetworkAuthHandler,
               fromController controller: UIViewController)
    func logout()
    
}
