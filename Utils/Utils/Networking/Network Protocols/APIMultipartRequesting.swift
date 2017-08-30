//
//  APIMultipartProtocol.swift
//  Place
//
//  Created by Sergey on 29.08.17.
//  Copyright © 2017 the appsolutions. All rights reserved.
//

import UIKit
import Foundation

protocol APIMultipartRequesting {

    associatedtype Response: APIResponsing
    
    var HTTPMethod: Method { get }
    var multipartData: Data { get }
    var multipartKey: String { get }
    var mimeType: String { get }
    var fileName: String { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var path: String { get }

    init(withURL url: String,
         multipartData: Data,
         multipartKey: String,
         mimeType: String,
         fileName: String,
         parameters: [String: Any]?,
         headers: [String: String]?)
    
}
extension APIMultipartRequesting {

    var HTTPMethod: Method { return .post }
    
}
