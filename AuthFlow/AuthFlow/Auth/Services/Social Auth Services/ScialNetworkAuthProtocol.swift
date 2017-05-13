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
    case facebook = "facebook"
    case instagram = "instagram"
    case twitter = "twitter"
    case googlePlus = "google"
}

typealias SocalNetworkAuthHandler = (_ accessToken: String? ,
                                     _ authType: GrantType,
                                     _ error: Error?) -> Void

protocol ScialNetworkAuthProtocol {
    
    func login(handler: @escaping SocalNetworkAuthHandler,
               fromController controller: UIViewController)
    func logout()
    
}
