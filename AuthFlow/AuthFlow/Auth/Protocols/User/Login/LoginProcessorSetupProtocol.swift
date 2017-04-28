//
//  LoginProcessorSetupProtocol.swift
//  AuthFlow
//
//  Created by Sergey on 28.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol LoginProcessorSetupProtocol {

    static func add(loginProcessor: LoginProcessorProtocol?,
                    to controller: UIViewController)
    
    static func add(processor: UIViewController,
                    to controller: UIViewController)
    
}

extension LoginProcessorSetupProtocol {

    static func add(loginProcessor: LoginProcessorProtocol?,
                    to controller: UIViewController) {
        if var vc = controller as? LoginProcessingProtocol {
            vc.loginProcessor = loginProcessor
        }
    }

    static func add(processor: UIViewController,
                    to controller: UIViewController) {
        if let loginProcessor = processor as? LoginProcessorProtocol,
            var loginProcessingVC = controller as? LoginProcessingProtocol {
            loginProcessingVC.loginProcessor = loginProcessor
        }
    }

    
}
