//
//  PopToProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 22.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol PopToProtocol {
    
    static func popTo<T: UIViewController>(controller type: T.Type,
                      from controller: UIViewController,
                      animated: Bool) -> T?
    
}

extension PopToProtocol {

    static func popTo<T: UIViewController>(controller type: T.Type,
                      from controller: UIViewController,
                      animated: Bool) -> T? {
        if let navigation = controller.navigationController {
            if let vc = navigation.viewControllers.filter({ (viewController) -> Bool in
                return viewController is T
            }).first as? T {
                navigation.popToViewController(vc,
                                               animated: animated)
                return vc
            }
        }
        return nil
    }

}
