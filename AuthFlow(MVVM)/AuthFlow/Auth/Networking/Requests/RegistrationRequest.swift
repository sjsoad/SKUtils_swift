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
    private(set) var parameters: [String : Any]?
    private(set) var headers: [String: String]?
    private(set) var path: String
    
    required init(withURL url: String,
                  parameters: [String: Any]? = nil,
                  headers: [String: String]? = nil) {
        self.parameters = parameters
        self.headers = headers
        self.path = url
    }

}
