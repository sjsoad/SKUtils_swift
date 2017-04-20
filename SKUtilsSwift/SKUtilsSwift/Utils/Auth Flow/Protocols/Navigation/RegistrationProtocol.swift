//
//  RegistrationProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 24.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Foundation

protocol RegistrationProtocol {

    static func pushRegistration(from controller: UIViewController,
                                 animated: Bool)
    
}

extension RegistrationProtocol {

    static func pushRegistration(from controller: UIViewController,
                                 animated: Bool) {
        let vc = RegistrationViewController.load(from: "Registration")
        controller.navigationController?.pushViewController(vc,
                                                            animated: animated)
    }
    
}
