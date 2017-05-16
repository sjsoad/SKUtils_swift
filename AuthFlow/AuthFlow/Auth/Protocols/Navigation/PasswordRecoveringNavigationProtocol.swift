//
//  PasswordRecoveringProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 13.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol PasswordRecoveringNavigationProtocol {
    
    func presentPasswordReminder(from controller: UIViewController,
                                 animated: Bool)
    func presentPasswordChanger(temporaryToken: String,
                                animated: Bool)
    
}

extension PasswordRecoveringNavigationProtocol {
    
    func presentPasswordReminder(from controller: UIViewController,
                                 animated: Bool) {
        let vc: RemindPassViewController = RemindPassViewController.load(from: "Password")
        vc.show(animated: animated,
                completion: nil)
    }
    
    func presentPasswordChanger(temporaryToken: String,
                                animated: Bool) {
        let vc: ChangePassViewController = ChangePassViewController.load(from: "Password")
        let changePassViewModel = ChangePassViewModel(token: temporaryToken)
        vc.changePassViewModel = changePassViewModel
        vc.show(animated: animated,
                completion: nil)
    }
    
}
