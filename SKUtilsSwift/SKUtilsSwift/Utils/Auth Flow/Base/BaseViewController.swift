//
//  BaseViewController.swift
//  GeoTouch
//
//  Created by Sergey on 03.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit
import Hero

class BaseViewController: UIViewController, Navigatable {

    typealias navigationType = BaseNavigation
    
    @IBInspectable var navigationBarVisible: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let navigation = navigationController {
            if navigation.isNavigationBarHidden != !navigationBarVisible {
                navigation.setNavigationBarHidden(!navigationBarVisible,
                                                  animated: false)
            }
        }
    }
}
