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
typealias RefreshTokenHandler = () -> Void
typealias RepeatRequestHandler = (_ accessToken: String) -> Void

//private let unauthorizedErrorCode = 401

protocol APIClientService {
    
    func executeRequest<T: APIRequesting>(request: T,
                                          success: ((_ response: T.Response) -> Void)?,
                                          failure: ErrorHandler?) -> Request?
    func executeMultipartRequest<T: APIMultipartRequesting>(request: T,
                                                            success: ((_ response: T.Response) -> Void)?,
                                                            failure: ErrorHandler?,
                                                            afRequest: ((Request?) -> Void)?)
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
//                if response.response?.statusCode == unauthorizedErrorCode {
//                    let refreshTokenHandler = RefreshTokenService.refreshTokenHandler(with: { [weak self] (token) in
//                        let repeatRequest = T(withURL: request.path, parameters: request.parameters, headers: API.headers(with: token))
//                        self?.executeRequest(request: repeatRequest, success: success, failure: failure)
//                        }, failure: failure)
//                    refreshTokenHandler()
//                } else {
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
//                }
            })
    }
    
    func executeMultipartRequest<T: APIMultipartRequesting>(request: T,
                                                            success: ((_ response: T.Response) -> Void)? = nil,
                                                            failure: ErrorHandler? = nil,
                                                            afRequest: ((Request?) -> Void)? = nil) {
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
                afRequest?(upload)
                upload.responseJSON { response in
//                    if response.response?.statusCode == unauthorizedErrorCode {
//                        let refreshTokenHandler = RefreshTokenService.refreshTokenHandler(with: { [weak self] (token) in
//                            let repeatRequest = T(withURL: request.path,
//                                                  multipartData: request.multipartData,
//                                                  multipartKey: request.multipartKey,
//                                                  mimeType: request.mimeType,
//                                                  fileName: request.fileName,
//                                                  parameters: request.parameters,
//                                                  headers: API.headers(with: token))
//                            self?.executeMultipartRequest(request: repeatRequest, success: success, failure: failure)
//                            }, failure: failure)
//                        refreshTokenHandler()
//                    } else {
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
//                    }
                }
            case .failure(let error):
                afRequest?(nil)
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
