//
//  AuthProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 13.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol AuthProtocol: PopToProtocol {
    
    static func popToAuth(from controller: UIViewController,
                          animated: Bool)
    static func pushAuth(from controller: UIViewController,
                         animated: Bool)
}

extension AuthProtocol {
    
    static func popToAuth(from controller: UIViewController,
                          animated: Bool) {
        let _ = popTo(controller: AuthViewController.self,
                      from: controller,
                      animated: animated)
    }
    
    static func pushAuth(from controller: UIViewController,
                         animated: Bool) {
        let vc = AuthViewController.load(from: "Auth")
        controller.navigationController?.pushViewController(vc,
                                                            animated: animated)
    }
    
    
}
