//
//  IpRequestProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey on 13.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import Foundation

typealias IpSuccessHandler = (_ response: IpRequest.Response) -> Void
typealias IpResponseValue = [String: String] // Example: Bool

protocol IpRequesting: RequestErrorHandling /* or RequestExecuting */{
    
    func exampleFunc(successHandler: @escaping IpSuccessHandler,
                     executingHandler: RequestExecutingHandler?,
                     errorHandler: ErrorHandler?)
}

extension IpRequesting {
    
    func exampleFunc(successHandler: @escaping IpSuccessHandler,
                     executingHandler: RequestExecutingHandler? = nil,
                     errorHandler: ErrorHandler? = nil) {
        executingHandler?(true)
        let urlString = "https://api.ipify.org"
        let request = IpRequest(withURL: urlString)
        let apiClient = APIClient()
        _ = apiClient.executeRequest(request: request,
                                     success: { response in
                                        executingHandler?(false)
                                        successHandler(response)
        },
                                     failure: { error in
                                        executingHandler?(false)
                                        errorHandler?(error)
        })
    }
 
}
