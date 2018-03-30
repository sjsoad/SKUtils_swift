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

protocol APIRequesting {
    
    associatedtype Response: APIResponsing
    
    var HTTPMethod: Method { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get set }
    var path: String { get }
    
    init(withURL url: String,
         parameters: [String: Any]?,
         headers: [String: String]?)
    
}

extension APIRequesting {
    
    var HTTPMethod: Method { return .get }
    
}
