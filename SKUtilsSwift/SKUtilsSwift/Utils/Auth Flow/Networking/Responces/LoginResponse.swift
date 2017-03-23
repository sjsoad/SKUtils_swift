//
//  LoginResponse.swift
//  GeoTouch
//
//  Created by Sergey on 13.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class LoginResponse: ResponseProtocol, Authenticatable {

    var authCredentials: AuthCredentials?
    
    required init(JSON: AnyObject) {
        if let accessToken = JSON["token"] as? String,
            let refreshToken = JSON["refreshToken"] as? String {
            authCredentials = AuthCredentials(accessToken: accessToken,
                                              refreshToken: refreshToken)
        }
    }
    
}
