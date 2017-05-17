//
//  Constants.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

struct Instagram {
    
    static let clientId = "9c650565e99d456b8eeed5a88b702599"
    static let clientSecret = "17f03ba3728a4baebe77404e0428bcfe"
    static let redirectUri = "https://www.grossum.com"
    
}

struct Facebook {

    static let appId = "1667358100234823"
    
}

struct GoogleMaps {

    static let GoogleMapsApiKey = "AIzaSyC5CvXOcm8BtvxOxTKQL_g5Z0bekknx6eg"
    
}

struct API {
    
    static let host = "http://dev.geotouch.gedzyk.com"
    static let socialLogin = "/api/login_check/%@?accessToken=%@"
    static let emailLogin = "/api/login_check"
    static let registration = "/api/users"
    static let profile = "/api/users-self"
    static let remindPassword = "/api/resetting/send-mail"
    static let changePassword = "/api/resetting/reset"
    
}

struct GeoTouch {

    static let appScheme = "geotouch://dev.geotouch.gedzyk.com"

}
