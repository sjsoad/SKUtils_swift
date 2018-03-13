//
//  RefreshTokenResponse.swift
//  Yada
//
//  Created by Sergey on 05.03.2018.
//Copyright © 2018 Sergey. All rights reserved.
//

import UIKit
import Foundation
import ObjectMapper

class RefreshTokenResponse: APIResponsing {
    
    var result: RefreshTokenResponseType?
    
    required init(JSON: AnyObject) {
        guard let json = JSON as? [String: Any] else {
            result = nil
            return
        }
        result = Mapper<AuthInfo>().map(JSON: json)
    }
}
