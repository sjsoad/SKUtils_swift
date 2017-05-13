//
//  APIRequestProtocol.swift
//  MyWeather
//
//  Created by Mac on 05.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import Alamofire

typealias Method = Alamofire.HTTPMethod

protocol APIRequestProtocol {

    associatedtype Response: ResponseProtocol

    var HTTPMethod: Method { get }
    var parameters: [String: Any]? { get set }
    var headers: [String: String]? { get set }
    var path: String { get set }

    init()
    init(withURL url: String,
        parameters: [String: Any]?,
        headers: [String: String]?
    )
    
}

extension APIRequestProtocol {

    var HTTPMethod: Method { return .get }
    var parameters: [String: String]? { return nil }
    var headers: [String: String]? { return nil }
    
    init(withURL url: String,
         parameters: [String : Any]? = nil,
         headers: [String : String]? = nil) {
        self.init()
        self.path = url
        self.parameters = parameters
        self.headers = headers
    }
    
}
