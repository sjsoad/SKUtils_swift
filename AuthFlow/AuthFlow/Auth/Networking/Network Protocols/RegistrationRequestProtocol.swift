//
//  RegistrationRequestProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

typealias RegistrationSuccessHandler = (_ response: RegistrationRequest.Response) -> Void

protocol RegistrationRequestProtocol: RequestSucceedProtocol, RequestErrorHandlerProtocol {
    
    func register(email: String,
                  nickname: String,
                  password: String)
    
    func registrationSuccessHandler() -> RegistrationSuccessHandler
    
}

extension RegistrationRequestProtocol where Self: NSObject {
    
    func register(email: String,
                  nickname: String,
                  password: String) {
        let urlString = API.host + API.registration
        let paramteres = ["email" : email,
                          "nickName" : nickname,
                          "plainPassword" : password]
        register(parameters: paramteres,
                 urlString: urlString)
    }
    
    fileprivate func register(parameters: [String: Any]?,
                              urlString: String) {
        if let executingHandler = requerstExecutingHandler {
            executingHandler(true, nil)
        }
        
        let registrationRequest = RegistrationRequest(withURL: urlString,
                                                      parameters: parameters)
        let apiClient = APIClient()
        let _ = apiClient.executeRequest(request: registrationRequest,
                                         success: registrationSuccessHandler(),
                                         failure: requestErrorHandler())
    }
    
    //MARK: - Handlers
    
    func registrationSuccessHandler() -> RegistrationSuccessHandler {
        return { [weak self] response in
            guard let strongSelf = self else { return }
            if let executingHandler = strongSelf.requerstExecutingHandler {
                executingHandler(false, nil)
            }
            strongSelf.requestSucceed.value = true
        }
    }
    
}
