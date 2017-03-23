//
//  AuthNavigation.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

class AuthNavigation: PasswordRecovering, List, Auth {
    
    class func presentAbout(from controller: UIViewController) {
        let vc = AboutUsViewController.load(from: "Main")
        controller.navigationController?.present(vc,
                                                 animated: true,
                                                 completion: nil)
    }

}
