//
//  RegistrationNavigation.swift
//  GeoTouch
//
//  Created by Sergey on 13.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class RegistrationNavigation: PopToNavigationProtocol {
    
    static func popToAuth(login: Bool,
                          email: String?,
                          password: String?,
                          from controller: UIViewController) {
        if let auth: AuthViewController = popTo(controller: AuthViewController.self,
                                                from: controller,
                                                animated: true) {
            auth.emailField.text = email
            auth.passwordField.text = password
            auth.authViewModel.tryToLogin = true
        }
    }
    
}
