//
//  AuthNavigationProtocol.swift
//  AuthFlow
//
//  Created by Sergey on 28.04.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation
//import Hero

protocol AuthNavigationProtocol: LoginProcessorSetupProtocol {
    
    func presentSignIn(from controller: UIViewController,
                       animated: Bool)
    static func presentSignUp(from controller: UIViewController,
                              animated: Bool)
}

extension AuthNavigationProtocol {
    
    func presentSignIn(from controller: UIViewController,
                       animated: Bool) {
        let vc = LoginViewController.load(from: "Login")
        Self.add(processor: controller,
                 to: vc)
        let navigation = UINavigationController(rootViewController: vc)
        //        navigation.isHeroEnabled = true
        controller.present(navigation,
                           animated: animated,
                           completion: nil)
    }
    
    func presentSignUp(from controller: UIViewController,
                       animated: Bool) {
        let vc = RegistrationViewController.load(from: "Registration")
        let navigation = UINavigationController(rootViewController: vc)
        Self.add(processor: controller,
                 to: vc)
        //        navigation.isHeroEnabled = true
        controller.present(navigation,
                           animated: true,
                           completion: nil)
    }
    
}
