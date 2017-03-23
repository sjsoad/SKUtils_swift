//
//  RegistrationRequest.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RegistrationRequest: APIRequestProtocol {

    typealias Response = RegistrationResponse
    
    var HTTPMethod: Method {
        return .post
    }
    var parameters: [String : Any]?
    var headers: [String: String]?
    var path: String = ""
    
    required init() {
        
    }
}
