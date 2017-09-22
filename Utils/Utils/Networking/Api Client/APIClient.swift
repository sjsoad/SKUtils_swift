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
    
    private var sessionManager: SessionManager!
    
    // MARK: - Init
    
    init(sessionManager: SessionManager? = Alamofire.SessionManager.default) {
        self.sessionManager = sessionManager
    }
    
    // MARK: - Public Methods
    
    @discardableResult
    func executeRequest<T: APIRequesting>(request: T,
                                          success: ((_ response: T.Response) -> Void)? = nil,
                                          failure: ErrorHandler? = nil) -> Request? {
        return sessionManager.request(request.path,
                                      method: request.HTTPMethod,
                                      parameters: request.parameters,
                                      encoding: JSONEncoding.default,
                                      headers: request.headers)
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    if let error = ErrorParser.checkForError(JSON: value as AnyObject), let errorClosure = failure {
                        errorClosure(error)
                    } else if let successClosure = success {
                        let response: T.Response = T.Response(JSON: value as AnyObject)
                        successClosure(response)
                    }
                case .failure(let error):
                    if let errorClosure = failure {
                        errorClosure(error)
                    }
                }
            })
    }
    
    @discardableResult
    func executeMultipartRequest<T: APIMultipartRequesting>(request: T,
                                                            success: ((_ response: T.Response) -> Void)? = nil,
                                                            failure: ErrorHandler? = nil) -> Request? {
        guard let urlRequest = request.create() else { return nil }
        return sessionManager.request(urlRequest).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                if let error = ErrorParser.checkForError(JSON: value as AnyObject), let errorClosure = failure {
                    errorClosure(error)
                } else if let successClosure = success {
                    let response: T.Response = T.Response(JSON: value as AnyObject)
                    successClosure(response)
                }
            case .failure(let error):
                if let errorClosure = failure {
                    errorClosure(error)
                }
            }
        }
    }
    
    func pauseAllRequests(pause: Bool) {
        sessionManager.session.delegateQueue.isSuspended = pause
    }
    
    func cancelAllRequests() {
        sessionManager.session.invalidateAndCancel()
    }
    
    func cancel(task: URLSessionTask?) {
        if let taskToCancel = task {
            taskToCancel.cancel()
        }
    }
    
}
