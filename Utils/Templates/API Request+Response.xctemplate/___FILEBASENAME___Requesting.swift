//
//  ___FILEBASENAME___RequestProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey on 13.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import Foundation

typealias ___FILEBASENAME___SuccessHandler = (_ response: ___FILEBASENAME___Request.Response) -> Void
typealias ___FILEBASENAME___ResponseValue = ()

protocol ___FILEBASENAME___Requesting: RequestErrorHandling {
    
    func exampleFunc()
    func successHandlerFor___FILEBASENAME___() -> ___FILEBASENAME___SuccessHandler
    func errorHandlerFor___FILEBASENAME___() -> ErrorHandler
    
    var executingHandlerFor___FILEBASENAME___: RequestExecutingHandler? { get }
    var result: Dynamic<___FILEBASENAME___ResponceValue?> { get }
}

extension ___FILEBASENAME___Requesting where Self: NSObject {
    
    func exampleFunc() {
        if let executingHandler = executingHandlerFor___FILEBASENAME___ {
            executingHandler(true, nil)
        }
        let urlString = <#String#>
        let headers = <#[String: String]#>
        let parameters = <#[String: Any]#>
        let request = ___FILEBASENAME___Request(withURL: urlString,
                                                parameters: parameters,
                                                headers: headers)
        let apiClient = APIClient()
        _ = apiClient.executeRequest(request: request,
                                     success: successHandlerFor___FILEBASENAME___(),
                                     failure: errorHandlerFor___FILEBASENAME___())
    }
    
    // MARK: - Handlers
    
    func successHandlerFor___FILEBASENAME___() -> ___FILEBASENAME___SuccessHandler {
        return { [weak self] response in
            guard let strongSelf = self else { return }
            if let executingHandler = strongSelf.executingHandlerFor___FILEBASENAME___ {
                executingHandler(false, nil)
            }
            strongSelf.result.value = response.result
        }
    }
    
    func errorHandlerFor___FILEBASENAME___() -> ErrorHandler {
        return requestErrorHandler(executingHandler: executingHandlerFor___FILEBASENAME___)
    }
    
}
