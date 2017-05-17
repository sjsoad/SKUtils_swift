//
//  ProfileRequest.swift
//  GeoTouch
//
//  Created by Sergey on 14.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class ProfileRequest: APIRequestProtocol {

    typealias Response = ProfileRepsonse
    
    var parameters: [String : Any]?
    var headers: [String: String]?
    var path: String = ""
    
    required init() {
        
    }
    
}
