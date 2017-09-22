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
    var parameters: [String: String]? { get }
    var headers: [String: String]? { get }
    var path: String { get }

    init(withURL url: String,
         multipartData: Data,
         multipartKey: String,
         mimeType: String,
         fileName: String,
         parameters: [String: String]?,
         headers: [String: String]?)

    func create() -> URLRequest?
    
}
extension APIMultipartRequesting {

    var HTTPMethod: Method { return .post }
    
    func create() -> URLRequest? {
        guard var urlRequest = try? URLRequest(url: path, method: HTTPMethod, headers: headers) else { return nil }
        let boundary = "Boundary-\(UUID().uuidString)"
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = createBody(withBoundary: boundary)
        return urlRequest
    }
    
}

private extension APIMultipartRequesting {
    
    func createBody(withBoundary boundary: String) -> Data {
        let body = NSMutableData()
        
        let boundaryPrefix = "--\(boundary)\r\n"
        
        if let parameters = parameters {
            for (key, value) in parameters {
                body.appendString(boundaryPrefix)
                body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString("\(value)\r\n")
            }
        }
        
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"file\"; filename=\"\(fileName)\"\r\n")
        body.appendString("Content-Type: \(mimeType)\r\n\r\n")
        body.append(multipartData)
        body.appendString("\r\n")
        body.appendString("--".appending(boundary.appending("--")))
        
        return body as Data
    }
    
}

// MARK: - NSMutableData -
private extension NSMutableData {
    
    func appendString(_ string: String) {
        if let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            append(data)
        }
    }
}
