//
//  POIRequest.swift
//  LocationWithAR
//
//  Created by Sergey on 28.02.2018.
//Copyright © 2018 Sergey. All rights reserved.
//
// use APIClient for executing this requests

import UIKit
import Foundation

class POIRequest: APIRequesting {
    
    typealias Response = POIResponse
    
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
