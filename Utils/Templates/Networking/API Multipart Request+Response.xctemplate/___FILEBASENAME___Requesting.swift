//
//  ___FILEBASENAME___RequestProtocol.swift
//  SKUtilsSwift
//
//  Created by Sergey on 13.05.17.
//  Copyright © 2017 Sergey Kostyan. All rights reserved.
//

import Foundation

typealias ___VARIABLE_fileName:identifier___SuccessHandler = (_ response: ___VARIABLE_fileName:identifier___Request.Response) -> Void
typealias ___VARIABLE_fileName:identifier___ResponseType = () // Example: Bool

protocol ___FILEBASENAMEASIDENTIFIER___: RequestErrorHandling, RequestExecuting {
    
    func request<#exampleFunc#>(successHandler: @escaping ___VARIABLE_fileName:identifier___SuccessHandler,
                     executingHandler: RequestExecutingHandler?,
                     errorHandler: ErrorHandler?)
}

extension ___FILEBASENAMEASIDENTIFIER___ {
    
    func request<#exampleFunc#>(successHandler: @escaping ___VARIABLE_fileName:identifier___SuccessHandler,
                     executingHandler: RequestExecutingHandler? = nil,
                     errorHandler: ErrorHandler? = nil) {
        executingHandler?(true)
        let urlString = <#String#>
        let headers = <#[String: String]#>
        let parameters = <#[String: String]#>
        let request = ___VARIABLE_fileName:identifier___Request(withURL: urlString,
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
