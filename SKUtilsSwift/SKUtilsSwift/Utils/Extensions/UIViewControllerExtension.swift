//
//  UIAlertController.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 29.10.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func show(animated: Bool, completion: (() -> Void)? = nil) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = UIWindowLevelAlert;
        window.makeKeyAndVisible()
        let controller = UIViewController()
        window.rootViewController = controller
        controller.present(self,
                           animated: true,
                           completion: completion)
    }
    
}
