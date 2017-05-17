//
//  LoginRequestProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation

typealias LoginSuccessHandler = (_ response: LoginRequest.Response) -> Void

protocol LoginRequestProtocol: AuthCredentialsProtocol, RequestErrorHandlerProtocol {
    
    func login(email: String,
               password: String)
    func login(accessToken: String,
               grantType: GrantType)
    
    func successHandlerForLogin() ->LoginSuccessHandler
    func errorHandlerForLogin() -> ErrorHandler
    
    var executingHandlerForLogin: RequerstExecutingHandler? { get set }
    var resultOfLoginRequest: Dynamic<Bool> { get set }
}

extension LoginRequestProtocol where Self: NSObject {

    func login(email: String,
               password: String) {
        if let executingHandler = executingHandlerForLogin {
            executingHandler(true, nil)
        }
        let urlString = API.host + API.emailLogin
        let loginRequest = LoginRequest(withURL: urlString,
                                        parameters: ["_username": email,
                                                     "_password" : password])
        let apiClient = APIClient()
        let _ = apiClient.executeRequest(request: loginRequest,
                                         success: successHandlerForLogin(),
                                         failure: errorHandlerForLogin())
    }
    
    func login(accessToken: String,
               grantType: GrantType) {
        if let executingHandler = executingHandlerForLogin {
            executingHandler(true, nil)
        }
        let socialLoginEndpoint = String(format: API.socialLogin,
                                         arguments: [grantType.rawValue, accessToken])
        let urlString = API.host + socialLoginEndpoint
        let socialLoginRequest = SocialLoginRequest(withURL: urlString)
        let apiClient = APIClient()
        let _ = apiClient.executeRequest(request: socialLoginRequest,
                                         success: successHandlerForLogin(),
                                         failure: errorHandlerForLogin())
    }
    
    //MARK: - Handlers
    
    func successHandlerForLogin() -> LoginSuccessHandler {
        return { [weak self] response in
            guard var strongSelf = self else { return }
            if let executingHandler = strongSelf.executingHandlerForLogin {
                executingHandler(false, nil)
            }
            strongSelf.authCredentials = response.authCredentials
            strongSelf.resultOfLoginRequest.value = true
        }
    }
    
    func errorHandlerForLogin() -> ErrorHandler {
        return requestErrorHandler(executingHandler: executingHandlerForLogin)
    }
    
}
