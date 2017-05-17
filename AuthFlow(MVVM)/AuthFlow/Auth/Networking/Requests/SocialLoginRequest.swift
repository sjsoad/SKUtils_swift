//
//  SocialLoginRequest.swift
//  GeoTouch
//
//  Created by Sergey on 15.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class SocialLoginRequest: APIRequestProtocol {

    typealias Response = LoginResponse
    
    var parameters: [String : Any]?
    var headers: [String: String]?
    var path: String = ""
    
    required init() {
        
    }
    
}
