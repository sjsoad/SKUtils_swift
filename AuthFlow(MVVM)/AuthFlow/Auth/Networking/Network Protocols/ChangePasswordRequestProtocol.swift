//
//  ChangePasswordRequestProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 15.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

typealias ChangePasswordSuccessHandler = (_ response: ChangePasswordRequest.Response) -> Void

protocol ChangePasswordRequestProtocol: RequestErrorHandlerProtocol {
    
    func changePassword(password: String,
                        token: String)
    
    func successHandlerForChangePassword() -> ChangePasswordSuccessHandler
    func errorHandlerForChangePassword() -> ErrorHandler
    
    var executingHandlerForChangePassword: RequerstExecutingHandler? { get set }
    var resultOfChangePasswordRequest: Dynamic<Bool> { get set }

}

extension ChangePasswordRequestProtocol where Self: NSObject {
    
    func changePassword(password: String,
                        token: String) {
        if let executingHandler = executingHandlerForChangePassword {
            executingHandler(true, nil)
        }
        let urlString = API.host + API.changePassword + "/" + token
        let changePassRequest = ChangePasswordRequest(withURL: urlString,
                                                      parameters: ["plainPassword": password])
        let apiClient = APIClient()
        _ = apiClient.executeRequest(request: changePassRequest,
                                     success: successHandlerForChangePassword(),
                                     failure: errorHandlerForChangePassword())
    }
    
    // MARK: - Handlers
    
    func successHandlerForChangePassword() -> ChangePasswordSuccessHandler {
        return { [weak self] response in
            guard var strongSelf = self else { return }
            if let executingHandler = strongSelf.executingHandlerForChangePassword {
                executingHandler(false, nil)
            }
            strongSelf.resultOfChangePasswordRequest.value = true
        }
    }
    
    func errorHandlerForChangePassword() -> ErrorHandler {
        return requestErrorHandler(executingHandler: executingHandlerForChangePassword)
    }
    
}
