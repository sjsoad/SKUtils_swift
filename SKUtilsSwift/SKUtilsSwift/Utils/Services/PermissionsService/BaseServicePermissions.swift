//
//  BasePermissionsService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 25.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class BasePermissionsService: NSObject, ServicePermissions {

    fileprivate func showSettingsAlert() {
        let alert = UIAlertController.init(title: alertConfiguration.title,
                                           message: alertConfiguration.message,
                                           preferredStyle: .alert)
        let settingsAction = UIAlertAction.init(title: alertConfiguration.settingsButtonTitle,
                                                style: .default) { (action) in
                                                    self.openSettings()
        }
        let cancelAction = UIAlertAction.init(title: alertConfiguration.cancelButtonTitle,
                                              style: .cancel,
                                              handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        //TODO: in order to show this alert you need to have viewController
        var window = UIWindow()
        window.makeKeyAndVisible()
        window.rootViewController = UIViewController()
        if let topView = UIApplication.shared.keyWindow?.rootViewController {
            topView.present(alert, animated: true, completion: nil)
        }
    }
    
    fileprivate func openSettings() {
        let settingsURL = URL.init(string: UIApplicationOpenSettingsURLString)
        if UIApplication.shared.canOpenURL(settingsURL!) {
            UIApplication.shared.openURL(settingsURL!)
        }
    }

    
}
