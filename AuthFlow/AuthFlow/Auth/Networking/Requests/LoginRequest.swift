//
//  LoginRequest.swift
//  GeoTouch
//
//  Created by Sergey on 13.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class LoginRequest: APIRequestProtocol {
    
    typealias Response = LoginResponse
    
    var HTTPMethod: Method {
        return .post
    }
    var parameters: [String : Any]?
    var headers: [String: String]?
    var path: String = ""
    
    required init() {
        
    }
    
}
