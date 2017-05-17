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

    func add(loginProcessor: LoginProcessorProtocol?,
             to controller: UIViewController)
    
    func add(processor: UIViewController,
             to controller: UIViewController)
    
}

extension LoginProcessorSetupProtocol {

    func add(loginProcessor: LoginProcessorProtocol?,
             to controller: UIViewController) {
        if var vc = controller as? LoginProcessingProtocol {
            vc.loginProcessor = loginProcessor
        }
    }
    
    func add(processor: UIViewController,
             to controller: UIViewController) {
        if let loginProcessor = processor as? LoginProcessorProtocol,
            var loginProcessingVC = controller as? LoginProcessingProtocol {
            loginProcessingVC.loginProcessor = loginProcessor
        }
    }

    
}
