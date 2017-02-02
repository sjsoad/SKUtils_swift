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
    var parameters: [String: AnyObject]? { get }
    var headers: [String: String]? { get }
    var path: String { get }

    init(withURL url: String)
    
}

extension APIRequestProtocol {

    var HTTPMethod: Method { return .get }
    var parameters: [String: AnyObject]? { return nil }
    var headers: [String: String]? {
        return [
            "Accept":"application/json",
            "Content-Type":"application/json"
        ]
    }

}
