//
//  AuthProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 13.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol LoginNavigationProtocol: PopToNavigationProtocol, LoginProcessorSetupProtocol {
    
    func moveToAuth(loginProcessor: LoginProcessorProtocol?,
                    email: String?,
                    password: String?,
                    from controller: UIViewController,
                    animated: Bool)
    
}

extension LoginNavigationProtocol {
    
    func moveToAuth(loginProcessor: LoginProcessorProtocol?,
                    email: String?,
                    password: String?,
                    from controller: UIViewController,
                    animated: Bool) {
        if let vc = popTo(controller: LoginViewController.self,
                          from: controller,
                          animated: animated) {
            Self.add(loginProcessor: loginProcessor,
                     to: vc)
        }
        else {
            let vc = LoginViewController.load(from: "Login")
            Self.add(loginProcessor: loginProcessor,
                     to: vc)
            controller.navigationController?.pushViewController(vc,
                                                                animated: animated)
        }
    }
    
}
