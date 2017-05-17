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
        let vc = UIStoryboard.load(controller: LoginViewController.self,
                                   from: "Login")
        let navigation = UINavigationController(rootViewController: vc)
        add(processor: controller, to: vc)
        //        navigation.isHeroEnabled = true
        controller.present(navigation,
                           animated: animated,
                           completion: nil)
    }
    
    func presentSignUp(from controller: UIViewController,
                       animated: Bool) {
        let vc = UIStoryboard.load(controller: RegistrationViewController.self,
                                   from: "Registration")
        let navigation = UINavigationController(rootViewController: vc)
        add(processor: controller, to: vc)
        //        navigation.isHeroEnabled = true
        controller.present(navigation,
                           animated: true,
                           completion: nil)
    }
    
}
