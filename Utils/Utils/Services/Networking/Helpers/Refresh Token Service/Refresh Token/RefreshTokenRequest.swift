//
//  RefreshTokenRequest.swift
//  Yada
//
//  Created by Sergey on 05.03.2018.
//Copyright © 2018 Sergey. All rights reserved.
//
// use APIClient for executing this requests

import UIKit
import Foundation

class RefreshTokenRequest: APIRequesting {
    
    typealias Response = RefreshTokenResponse
    
    var HTTPMethod: Method {
        return .post
    }
    private(set) var parameters: [String : Any]?
    private(set) var headers: [String: String]?
    private(set) var path: String
    
    required init(withURL url: String,
                  parameters: [String : Any]? = nil,
                  headers: [String : String]? = nil) {
        self.parameters = parameters
        self.headers = headers
        self.path = url
    }
    
}
