//
//  ResetPasswordRequestProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 15.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

typealias RemindPasswordSuccessHandler = (_ response: RemindPasswordRequest.Response) -> Void

protocol RemindPasswordRequestProtocol: RequestSucceedProtocol, RequestErrorHandlerProtocol {

    func remindPassword(email: String)
    
    func remindSuccessHandler() -> RemindPasswordSuccessHandler
    
}

extension RemindPasswordRequestProtocol where Self: NSObject {
    
    func remindPassword(email: String) {
        if let executingHandler = requerstExecutingHandler {
            executingHandler(true, nil)
        }
        let urlString = API.host + API.remindPassword
        let remindPassRequest = RemindPasswordRequest(withURL: urlString,
                                                      parameters: ["email": email])
        let apiClient = APIClient()
        let _ = apiClient.executeRequest(request: remindPassRequest,
                                         success: remindSuccessHandler(),
                                         failure: requestErrorHandler())
    }
    
    //MARK: - Handlers
    
    func remindSuccessHandler() -> RemindPasswordSuccessHandler {
        return { [weak self] response in
            guard var strongSelf = self else { return }
            if let executingHandler = strongSelf.requerstExecutingHandler {
                executingHandler(false, nil)
            }
            strongSelf.requestSucceed.value = true
        }
    }

}
