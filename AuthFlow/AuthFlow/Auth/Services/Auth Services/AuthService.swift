//
//  AuthService.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import Foundation
import UIKit

typealias AuthServiceHandler = (_ accessToken: String? ,
                                _ authType: GrantType,
                                _ error: Error?) -> Void

protocol AuthServiceProtocol {

    func login(handler: @escaping AuthServiceHandler,
               fromController controller: UIViewController)
    func logout()
    
}
