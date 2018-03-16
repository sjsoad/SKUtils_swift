//
//  RefreshTokenService.swift
//  Yada
//
//  Created by Sergey on 05.03.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

typealias RefreshTokenResponseType = <#AuthInfo#>

class RefreshTokenService: NSObject {

    class func refreshTokenHandler(with repeatHandler: @escaping RepeatRequestHandler, failure: ErrorHandler?) -> RefreshTokenHandler {
        return {
            //  WARNING: - Here is the place where you need to write refreshing mechanism of token -
            guard let authService: DefaultAuthService = ServicesRepository().getService(),
                let refreshToken = authService.refreshToken() else { return }
            let urlString = [API.host, API.Auth.refresh].joined(separator: "/")
            let parameters: [String: Any] = ["client_id": BasicAuth.clientPublicId,
                                             "client_secret": BasicAuth.clientSecret,
                                             "grant_type": GrandType.refresh.rawValue,
                                             "refresh_token": refreshToken]
            let request = RefreshTokenRequest(withURL: urlString,
                                              parameters: parameters)
            let apiClient = APIClient()
            apiClient.executeRequest(request: request,
                                     success: { response in
                                        guard let authInfo = response.result else { return }
                                        authService.save(authInfo: authInfo)
                                        print(authInfo.accessToken)
                                        repeatHandler(authInfo.accessToken)
            },
                                     failure: failure)
        }
    }
    
}
