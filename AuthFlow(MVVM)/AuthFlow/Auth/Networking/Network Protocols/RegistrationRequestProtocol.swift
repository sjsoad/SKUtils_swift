//
//  RegistrationRequestProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

typealias RegistrationSuccessHandler = (_ response: RegistrationRequest.Response) -> Void

protocol RegistrationRequestProtocol: RequestErrorHandlerProtocol {
    
    func register(email: String,
                  nickname: String,
                  password: String)
    
    func successHandlerForRegistration() -> RegistrationSuccessHandler
    func errorHandlerForRegistration() -> ErrorHandler
    
    var executingHandlerForRegistration: RequerstExecutingHandler? { get set }
    var resultOfRegistrationRequest: Dynamic<Bool> { get set }
    
}

extension RegistrationRequestProtocol where Self: NSObject {
    
    func register(email: String,
                  nickname: String,
                  password: String) {
        let urlString = API.host + API.registration
        let paramteres = ["email": email,
                          "nickName": nickname,
                          "plainPassword": password]
        register(parameters: paramteres,
                 urlString: urlString)
    }
    
    fileprivate func register(parameters: [String: Any]?,
                              urlString: String) {
        if let executingHandler = executingHandlerForRegistration {
            executingHandler(true, nil)
        }
        
        let registrationRequest = RegistrationRequest(withURL: urlString,
                                                      parameters: parameters)
        let apiClient = APIClient()
        _ = apiClient.executeRequest(request: registrationRequest,
                                     success: successHandlerForRegistration(),
                                     failure: errorHandlerForRegistration())
    }
    
    // MARK: - Handlers
    
    func successHandlerForRegistration() -> RegistrationSuccessHandler {
        return { [weak self] response in
            guard let strongSelf = self else { return }
            if let executingHandler = strongSelf.executingHandlerForRegistration {
                executingHandler(false, nil)
            }
            strongSelf.resultOfRegistrationRequest.value = true
        }
    }
    
    func errorHandlerForRegistration() -> ErrorHandler {
        return requestErrorHandler(executingHandler: executingHandlerForRegistration)
    }
    
}
