//
//  AuthHelper.swift
//  GeoTouch
//
//  Created by Sergey on 06.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

enum GrantType: String {
    case authTypeEmail = "email"
    case authTypeFacebook = "facebook"
    case authTypeInstagram = "instagram"
    case authTypeGooglePlus = "google"
}

class AuthCredentials: NSObject {
    
    var accessToken: String
    var refreshToken: String
    
    init(accessToken: String,
         refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
}
