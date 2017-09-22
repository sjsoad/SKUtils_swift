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
    private(set) var reachabilityManager: NetworkReachabilityManager?
    private(set) var host: String?
    private var reahcabilityErrorMessage: String = "Network connection seems to be offline"
    
    // MARK: - Init
    
    init(sessionManager: SessionManager? = Alamofire.SessionManager.default) {
        self.sessionManager = sessionManager
    }
    
    // MARK: - Utils -
    
    func reachabilityManagerWith(host: String, reachabilityError message: String) -> Bool {
        guard let reachabilityManager = NetworkReachabilityManager(host: host) else { return false }
        reachabilityManager.listener = { status in
            print("Network Status Changed: \(status)")
        }
        reachabilityManager.startListening()
        self.reachabilityManager = reachabilityManager
        self.host = host
        self.reahcabilityErrorMessage = message
        return true
    }
    
    // MARK: - Public Methods
    
    @discardableResult
    func executeRequest<T: APIRequesting>(request: T,
                                          success: ((_ response: T.Response) -> Void)? = nil,
                                          failure: ErrorHandler? = nil) -> Request? {
        return execute(request: request, success: success, failure: failure)
    }
    
    @discardableResult
    func executeMultipartRequest<T: APIMultipartRequesting>(request: T,
                                                            success: ((_ response: T.Response) -> Void)? = nil,
                                                            failure: ErrorHandler? = nil) -> Request? {
        return upload(request: request, success: success, failure: failure)
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
    
    // MARK: - APIRequesting -
    
    private func execute<T: APIRequesting>(request: T,
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
    
    // MARK: - APIMultipartRequesting -
    
    private func upload<T: APIMultipartRequesting>(request: T,
                                                   success: ((_ response: T.Response) -> Void)? = nil,
                                                   failure: ErrorHandler? = nil) -> Request? {
        guard var urlRequest = try? URLRequest(url: request.path, method: request.HTTPMethod, headers: request.headers) else { return nil }
        let boundary = "Boundary-\(UUID().uuidString)"
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = request.createBody(withBoundary: boundary)
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
    
}
