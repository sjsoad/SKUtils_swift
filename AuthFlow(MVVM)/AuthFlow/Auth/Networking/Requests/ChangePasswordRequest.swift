//
//  ChangePasswordRequest.swift
//  GeoTouch
//
//  Created by Sergey on 15.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ChangePasswordRequest: APIRequestProtocol {
    
    typealias Response = SucccessResponse
    
    var HTTPMethod: Method {
        return .put
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
