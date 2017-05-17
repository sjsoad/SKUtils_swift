//
//  ResetPasswordRequestProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 15.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

typealias RemindPasswordSuccessHandler = (_ response: RemindPasswordRequest.Response) -> Void

protocol RemindPasswordRequestProtocol: RequestErrorHandlerProtocol {

    func remindPassword(email: String)
    
    func successHandlerForRemindPassword() -> RemindPasswordSuccessHandler
    func errorHandlerForRemindPassword() -> ErrorHandler
    
    var executingHandlerForRemindPassword: RequerstExecutingHandler? { get set }
    var resultOfRemindPasswordRequest: Dynamic<Bool> { get set }
    
}

extension RemindPasswordRequestProtocol where Self: NSObject {
    
    func remindPassword(email: String) {
        if let executingHandler = executingHandlerForRemindPassword {
            executingHandler(true, nil)
        }
        let urlString = API.host + API.remindPassword
        let remindPassRequest = RemindPasswordRequest(withURL: urlString,
                                                      parameters: ["email": email])
        let apiClient = APIClient()
        let _ = apiClient.executeRequest(request: remindPassRequest,
                                         success: successHandlerForRemindPassword(),
                                         failure: errorHandlerForRemindPassword())
    }
    
    //MARK: - Handlers
    
    func successHandlerForRemindPassword() -> RemindPasswordSuccessHandler {
        return { [weak self] response in
            guard var strongSelf = self else { return }
            if let executingHandler = strongSelf.executingHandlerForRemindPassword {
                executingHandler(false, nil)
            }
            strongSelf.resultOfRemindPasswordRequest.value = true
        }
    }

    func errorHandlerForRemindPassword() -> ErrorHandler {
        return requestErrorHandler(executingHandler: executingHandlerForRemindPassword)
    }
    
}
