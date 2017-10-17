//
//  UINavigationController+Utils.swift
//  Nioxin
//
//  Created by Sergey on 23.06.17.
//  Copyright © 2017 grossum solutions. All rights reserved.
//

import UIKit

extension UINavigationController {

    @discardableResult
    func pop<ControllerClass: UIViewController>(to class: ControllerClass.Type) -> Bool {
        let controllers = viewControllers.filter({ (viewController) -> Bool in
            return viewController is ControllerClass
        })
        if let vc = controllers.last {
            popToViewController(vc, animated: true)
            return true
        }
        return false
    }
    
    func stackContains<ControllerClass: UIViewController>(viewControllerOfType class: ControllerClass.Type) -> Bool {
        let controllers = viewControllers.filter({ (viewController) -> Bool in
            return viewController is ControllerClass
        })
        return controllers.last != nil
    }
    
}
