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

protocol APIClientService {
    
    func executeRequest<T: APIRequesting>(request: T,
                                          success: ((_ response: T.Response) -> Void)?,
                                          failure: ErrorHandler?) -> Request?
    func executeMultipartRequest<T: APIMultipartRequesting>(request: T,
                                                            success: ((_ response: T.Response) -> Void)?,
                                                            failure: ErrorHandler?) -> Request?
    func pauseAllRequests(pause: Bool)
    func cancelAllRequests()
    func cancel(task: URLSessionTask?)
}

class APIClient {
    
    private var sessionManager: SessionManager!
    
    // MARK: - Init
    
    init(sessionManager: SessionManager? = Alamofire.SessionManager.default) {
        self.sessionManager = sessionManager
    }
    
}

// MARK: - APIClientService -

extension APIClient: APIClientService {
    
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
                    if let error = ErrorParser.checkForError(JSON: value as AnyObject) {
                        failure?(error)
                    } else {
                        let response: T.Response = T.Response(JSON: value as AnyObject)
                        success?(response)
                    }
                case .failure(let error):
                    failure?(error)
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
                if let error = ErrorParser.checkForError(JSON: value as AnyObject) {
                    failure?(error)
                } else {
                    let response: T.Response = T.Response(JSON: value as AnyObject)
                    success?(response)
                }
            case .failure(let error):
                failure?(error)
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
