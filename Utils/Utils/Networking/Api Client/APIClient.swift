//
//  APIClient.swift
//  MyWeather
//
//  Created by Mac on 05.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import Alamofire

typealias ErrorHandler = (_ error: Error) -> Void

class APIClient: NSObject {

    // MARK: - Public Methods
    
    func executeRequest<T: APIRequestProtocol>(request: T,
                                               success: ((_ response: T.Response) -> Void)? = nil,
                                               failure: ErrorHandler? = nil) -> Request? {
        return Alamofire.request(request.path,
                                 method: request.HTTPMethod,
                                 parameters: request.parameters,
                                 encoding: JSONEncoding.default,
                                 headers: request.headers)
            /*          .validate(statusCode: 200..<300)*/ // optional validation
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success:
                    if let successClosure = success,
                        let json = response.result.value {
                        let response: T.Response = T.Response(JSON: json as AnyObject)
                        successClosure(response)
                    }
                case .failure(let error):
                    if let errorClosure = failure {
                        errorClosure(error)
                    }
                }
            })
    }
    
    func cancelAllRequests() {
        Alamofire.SessionManager.default.session.invalidateAndCancel()
    }
    
    func cancel(task: URLSessionTask?) {
        if let taskToCancel = task {
            taskToCancel.cancel()
        }
    }
    
}