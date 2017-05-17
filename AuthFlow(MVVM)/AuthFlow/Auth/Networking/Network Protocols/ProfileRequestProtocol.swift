//
//  ProfileRequestProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

typealias ProfileSuccessHandler = (_ response: ProfileRequest.Response) -> Void

protocol ProfileRequestProtocol: RequestErrorHandlerProtocol, ProfileProtocol {

    func profile(authCredentials: AuthCredentials)
    func successHandlerForProfile() -> ProfileSuccessHandler
    func errorHandlerForProfile() -> ErrorHandler
    
    var executingHandlerForProfile: RequerstExecutingHandler? { get set }
    var resultOfProfileRequest: Dynamic<Bool> { get set }
    
}

extension ProfileRequestProtocol where Self: NSObject {

    func profile(authCredentials: AuthCredentials) {
        let urlString = API.host + API.profile
        profile(parameters: nil,
                headers: ["Authorization" : "Bearer " + authCredentials.accessToken],
                urlString: urlString)
    }
    
    fileprivate func profile(parameters: [String: Any]?,
                             headers: [String: String]?,
                             urlString: String) {
        if let executingHandler = executingHandlerForProfile {
            executingHandler(true, nil)
        }
        
        let profileRequest = ProfileRequest(withURL: urlString,
                                            parameters: parameters,
                                            headers: headers)
        let apiClient = APIClient()
        let _ = apiClient.executeRequest(request: profileRequest,
                                         success: successHandlerForProfile(),
                                         failure: errorHandlerForProfile())
    }
    
    //MARK: - Handlers
    
    func successHandlerForProfile() -> ProfileSuccessHandler {
        return { [weak self] response in
            guard var strongSelf = self else { return }
            if let executingHandler = strongSelf.executingHandlerForProfile {
                executingHandler(false, nil)
            }
            strongSelf.profile = response.profile
            strongSelf.resultOfProfileRequest.value = true
        }
    }

    func errorHandlerForProfile() -> ErrorHandler {
        return requestErrorHandler(executingHandler: executingHandlerForProfile)
    }
    
}
