//
//  APIClient.swift
//  MyWeather
//
//  Created by Mac on 05.12.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
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
                                 headers: request.headers).responseJSON(completionHandler: { (response) in
                                    switch response.result {
                                    case .success:
                                        if let successClosure = success {
                                            let response: T.Response = T.Response(JSON: response.result.value as AnyObject)
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
