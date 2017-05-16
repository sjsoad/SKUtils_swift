 //
//  RegistrationProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 24.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol RegistrationNavigationProtocol: PopToNavigationProtocol, LoginProcessorSetupProtocol {
    
    func moveToRegistration(loginProcessor: LoginProcessorProtocol?,
                            from controller: UIViewController,
                            animated: Bool)
    
}

extension RegistrationNavigationProtocol {
    
    func moveToRegistration(loginProcessor: LoginProcessorProtocol?,
                            from controller: UIViewController,
                            animated: Bool) {
        if let vc = popTo(controller: RegistrationViewController.self,
                          from: controller,
                          animated: animated) {
            Self.add(loginProcessor: loginProcessor,
                     to: vc)
        }
        else {
            let vc = UIStoryboard.load(controller: RegistrationViewController.self,
                                       from: "Registration")
            Self.add(loginProcessor: loginProcessor,
                     to: vc)
            controller.navigationController?.pushViewController(vc,
                                                                animated: animated)
        }
    }
    
}
