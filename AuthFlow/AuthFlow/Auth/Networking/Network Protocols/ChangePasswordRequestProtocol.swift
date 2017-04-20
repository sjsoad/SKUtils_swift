//
//  ChangePasswordRequestProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 15.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

typealias ChangePasswordSuccessHandler = (_ response: ChangePasswordRequest.Response) -> Void

protocol ChangePasswordRequestProtocol: RequestSucceedProtocol, RequestErrorHandlerProtocol {
    
    func changePassword(password: String,
                        token: String)
    
    func changeSuccessHandler() -> ChangePasswordSuccessHandler
    
}

extension ChangePasswordRequestProtocol where Self: NSObject {
    
    func changePassword(password: String,
                        token: String) {
        if let executingHandler = requerstExecutingHandler {
            executingHandler(true, nil)
        }
        let urlString = API.host + API.changePassword + "/" + token
        let changePassRequest = ChangePasswordRequest(withURL: urlString,
                                                      parameters: ["plainPassword": password])
        let apiClient = APIClient()
        let _ = apiClient.executeRequest(request: changePassRequest,
                                         success: changeSuccessHandler(),
                                         failure: requestErrorHandler())
    }
    
    //MARK: - Handlers
    
    func changeSuccessHandler() -> ChangePasswordSuccessHandler {
        return { [weak self] response in
            guard var strongSelf = self else { return }
            if let executingHandler = strongSelf.requerstExecutingHandler {
                executingHandler(false, nil)
            }
            strongSelf.requestSucceed.value = true
        }
    }
    
}
