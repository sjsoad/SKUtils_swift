//
//  ___FILEBASENAME___RequestProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey on 13.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import Foundation

typealias ___FILEBASENAME___SuccessHandler = (_ response: ___FILEBASENAME___Request.Response) -> Void

protocol ___FILEBASENAME___RequestProtocol: RequestSucceedProtocol, RequestErrorHandlerProtocol {
    
    func exampleFunc()
    func successHandlerFor___FILEBASENAME___() -> ___FILEBASENAME___SuccessHandler
    func errorHandlerFor___FILEBASENAME___() -> ErrorHandler
    
    var resultFor___FILEBASENAME___Request: Dynamic<Bool> { get set }
}

extension LoginRequestProtocol where Self: NSObject {
    
    func exampleFunc() {
        if let executingHandler = requerstExecutingHandler {
            executingHandler(true, nil)
        }
        let urlString = <#String#>
        let headers = <#[String: String]#>
        let parameters = <#[String: Any]#>
        let request = ___FILEBASENAME___Request(withURL: urlString,
                                                parameters: parameters,
                                                headers: headers)
        let apiClient = APIClient()
        let _ = apiClient.executeRequest(request: request,
                                         success: successHandlerFor___FILEBASENAME___(),
                                         failure: requestErrorHandler())
    }
    
    //MARK: - Handlers
    
    func successHandlerFor___FILEBASENAME___() -> ___FILEBASENAME___SuccessHandler {
        return { [weak self] response in
            guard var strongSelf = self else { return }
            if let executingHandler = strongSelf.requerstExecutingHandler {
                executingHandler(false, nil)
            }
            strongSelf.resultFor___FILEBASENAME___Request.value = true
            <#process responce#>
//            Example:
//            strongSelf.requestSucceed.value = result of request
//            and set parameters that was retreived
        }
    }
    
    func errorHandlerFor___FILEBASENAME___() -> ErrorHandler {
        return requestErrorHandler()
    }
    
}
