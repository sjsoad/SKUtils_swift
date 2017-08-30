//
//  ___FILEBASENAME___RequestProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey on 13.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import Foundation

typealias ___FILEBASENAME___SuccessHandler = (_ response: ___FILEBASENAME___Request.Response) -> Void
typealias ___FILEBASENAME___ResponseValue = () // Example: Bool

protocol ___FILEBASENAME___Requesting: RequestErrorHandling /* or RequestExecuting */ {
    
    func exampleFunc(successHandler: @escaping ___FILEBASENAME___SuccessHandler,
                     executingHandler: RequestExecutingHandler?,
                     errorHandler: ErrorHandler?)
}

extension ___FILEBASENAME___Requesting {
    
    func exampleFunc(successHandler: @escaping ___FILEBASENAME___SuccessHandler,
                     executingHandler: RequestExecutingHandler? = nil,
                     errorHandler: ErrorHandler? = nil) {
        executingHandler?(true)
        let urlString = <#String#>
        let headers = <#[String: String]#>
        let parameters = <#[String: String]#>
        let request = ___FILEBASENAME___Request(withURL: urlString,
                                                multipartData: data,
                                                multipartKey: <#"photo"#>,
                                                mimeType: <#"image/jpeg"#>,
                                                fileName: <#"photo.jpg"#>,
                                                parameters: parameters,
                                                headers: headers)
        let apiClient = APIClient()
        apiClient.executeMultipartRequest(request: request,
                                          success: { response in
                                            executingHandler?(false)
                                            successHandler(response)
        },
                                          failure: { error in
                                            executingHandler?(false)
                                            errorHandler?(error)
        })    }
    
}
