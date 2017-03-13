//
//  NativeNavigationProtocol.swift
//  GeoTouch
//
//  Created by Sergey on 13.03.17.
//  Copyright © 2017 Sergey. All rights reserved.
//

import UIKit

protocol NativeNavigationProtocol {
    
    static func push(viewControllerName: String,
                     storyboard: UIStoryboard?,
                     navigationController: UINavigationController?,
                     animated: Bool) -> UIViewController?
    
    static func present(viewControllerName: String,
                        storyboard: UIStoryboard?,
                        from: UIViewController,
                        animated: Bool) -> UIViewController?
    
    static func dismiss(controller: UIViewController,
                        animated: Bool)
//    
//    static func pop(to className: String?,
//                    animated: Bool)
    
}

extension NativeNavigationProtocol {

    static func push(viewControllerName: String,
                    storyboard: UIStoryboard?,
                    navigationController: UINavigationController?,
                    animated: Bool) -> UIViewController? {
        if let board = storyboard {
            let viewController = board.instantiateViewController(withIdentifier: viewControllerName)
            if let navigation = navigationController {
                navigation.pushViewController(viewController,
                                              animated: animated)
            }
            return viewController
        }
        return nil
    }
    
    static func present(viewControllerName: String,
                       storyboard: UIStoryboard?,
                       from: UIViewController,
                       animated: Bool) -> UIViewController? {
        if let board = storyboard {
            let viewController = board.instantiateViewController(withIdentifier: viewControllerName)
            from.present(viewController,
                         animated: animated,
                         completion: nil)
            return viewController
        }
        return nil
    }

    static func dismiss(controller: UIViewController,
                        animated: Bool) {
        controller.dismiss(animated: animated,
                           completion: nil)
    }
    
}
