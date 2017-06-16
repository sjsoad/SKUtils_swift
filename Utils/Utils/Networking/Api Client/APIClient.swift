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
    
    func executeRequest<T: APIRequestProtocol>(request: T,
                        success: ((_ response: T.Response) -> Void)? = nil,
                        failure: ErrorHandler? = nil) -> Request? {
        return execute(request: request, success: success, failure: failure)
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
    
    // MARK: - Private -
    
    private func networkConnectionError(host: String) -> Error {
        return NSError(domain: host, code: 404, userInfo: [NSLocalizedDescriptionKey: reahcabilityErrorMessage])
    }
    
    private func execute<T: APIRequestProtocol>(request: T,
                         success: ((_ response: T.Response) -> Void)? = nil,
                         failure: ErrorHandler? = nil) -> Request? {
        return sessionManager.request(request.path,
                                      method: request.HTTPMethod,
                                      parameters: request.parameters,
                                      encoding: JSONEncoding.default,
                                      headers: request.headers)
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success:
                    if let successClosure = success,
                        let json = response.result.value {
                        // add error parser if needed
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
    
}
