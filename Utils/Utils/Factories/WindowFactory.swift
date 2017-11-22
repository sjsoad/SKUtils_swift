//
//  WindowBuilder.swift
//  SKUtilsSwift
//
//  Created by Mac on 02.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

extension UIWindow {

    static func alertWindow(rootController: UIViewController?) -> UIWindow {
        return UIWindow.window(windowLevel: UIWindowLevelAlert,
                               rootController: rootController)
    }
    
    static func normalWindow(rootController: UIViewController?) -> UIWindow {
        return UIWindow.window(windowLevel: UIWindowLevelNormal,
                               rootController: rootController)
    }
    
    static func window(windowLevel: UIWindowLevel,
                       rootController: UIViewController?) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.windowLevel = windowLevel
        window.makeKeyAndVisible()
        window.rootViewController = rootController
        return window
    }
    
}
