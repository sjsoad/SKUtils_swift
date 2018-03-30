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
typealias RepeatRequestHandler = (_ accessToken: String) -> Void
typealias RequestHandler = (_ request: Request?) -> Void
typealias RefreshTokenHandler = (_ refreshedHandler: RefreshedTokenHandler?, _ failure: ErrorHandler?) -> Void
typealias RefreshedTokenHandler = (_ token: String) -> Void

private let unauthorizedErrorCode = 401

protocol APIClientService {
    
    func executeRequest<T: APIRequesting>(request: T,
                                          success: ((_ response: T.Response) -> Void)?,
                                          failure: ErrorHandler?,
                                          requestHandler: RequestHandler?)
    func executeMultipartRequest<T: APIMultipartRequesting>(request: T,
                                                            success: ((_ response: T.Response) -> Void)?,
                                                            failure: ErrorHandler?,
                                                            requestHandler: RequestHandler?)
    func pauseAllRequests(pause: Bool)
    func cancelAllRequests()
    func cancel(task: URLSessionTask?)
}

class APIClient {
    
    private var sessionManager: SessionManager!
    private var errorParsingService: ErrorParsingService?
    
    var refreshTokenHandler: RefreshTokenHandler?
    
    // MARK: - Init
    
    init(sessionManager: SessionManager? = Alamofire.SessionManager.default, errorParsingService: ErrorParsingService?) {
        self.sessionManager = sessionManager
        self.errorParsingService = errorParsingService
    }
    
}

// MARK: - APIClientService -

extension APIClient: APIClientService {
    
    func executeRequest<T: APIRequesting>(request: T,
                                          success: ((_ response: T.Response) -> Void)? = nil,
                                          failure: ErrorHandler? = nil,
                                          requestHandler: RequestHandler? = nil) {
        let alamofireRequest = sessionManager.request(request.path,
                                                      method: request.HTTPMethod,
                                                      parameters: request.parameters,
                                                      encoding: JSONEncoding.default,
                                                      headers: request.headers)
        requestHandler?(alamofireRequest)
        alamofireRequest.responseJSON(completionHandler: { [weak self] (response) in
            if response.response?.statusCode == unauthorizedErrorCode {
                self?.refreshTokenHandler?({ [weak self] (newToken) in
                    var repeatRequest = request
                    repeatRequest.headers = API.headers(with: newToken)
                    self?.executeRequest(request: repeatRequest, success: success, failure: failure, requestHandler: requestHandler)
                    }, failure)
            } else {
                switch response.result {
                case .success(let value):
                    if let error = self?.errorParsingService?.parseError(from: value as AnyObject) {
                        failure?(error)
                    } else {
                        let response: T.Response = T.Response(JSON: value as AnyObject)
                        success?(response)
                    }
                case .failure(let error):
                    failure?(error)
                }
            }
        })
    }
    
    func executeMultipartRequest<T: APIMultipartRequesting>(request: T,
                                                            success: ((_ response: T.Response) -> Void)? = nil,
                                                            failure: ErrorHandler? = nil,
                                                            requestHandler: RequestHandler? = nil) {
        sessionManager.upload(multipartFormData: { (multipartFormData) in
            if let parameters = request.parameters {
                for (key, value) in parameters {
                    if let data = "\(value)".data(using: String.Encoding.utf8) {
                        multipartFormData.append(data, withName: key as String)
                    }
                }
            }
            multipartFormData.append(request.multipartData, withName: request.multipartKey, fileName: request.fileName, mimeType: request.mimeType)
        }, to: request.path, method: request.HTTPMethod, headers: request.headers) { (result) in
            switch result {
            case .success(let upload, _, _):
                requestHandler?(upload)
                upload.responseJSON { [weak self] response in
                    if response.response?.statusCode == unauthorizedErrorCode {
                        self?.refreshTokenHandler?({ [weak self] (newToken) in
                            var repeatRequest = request
                            repeatRequest.headers = API.headers(with: newToken)
                            self?.executeMultipartRequest(request: repeatRequest, success: success, failure: failure, requestHandler: requestHandler)
                            }, failure)
                    } else {
                        switch response.result {
                        case .success(let value):
                            if let error = self?.errorParsingService?.parseError(from: value as AnyObject) {
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
            case .failure(let error):
                requestHandler?(nil)
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
