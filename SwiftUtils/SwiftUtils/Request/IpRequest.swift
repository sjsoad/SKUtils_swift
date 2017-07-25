//
//  IpRequest.swift
//  SwiftUtils
//
//  Created by Sergey on 25.07.17.
//  Copyright © 2017 Sergey. All rights reserved.
//
// use APIClient for executing this requests

import UIKit
import Foundation

class IpRequest: APIRequesting {
    
    typealias Response = IpResponse
    
    var HTTPMethod: Method {
        return .get
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
