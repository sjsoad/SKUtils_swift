//
//  APIManager.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 01.08.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import Alamofire

class APIManager: NSObject {
    class func loginWithParameters(username: String, password: String) -> Void {
        Alamofire.request(.GET, "https://api.github.com/user")
            .authenticate(user: username, password: password)
            .responseJSON { (JSON) in
                print(JSON)
        }
    }
}
