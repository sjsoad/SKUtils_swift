//
//  PermissionsService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 25.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

struct SettingAlertConfiguration {
    var title : String
    var message : String
    var settingsButtonTitle : String
    var cancelButtonTitle : String
}

protocol ServicePermissions {
    
    var alertConfiguration: SettingAlertConfiguration { get }
    func permissionsState() -> PermissionsState
    func showSettingsAlert()
    func openSettings()
}

extension ServicePermissions {
    
    func showSettingsAlert() {
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
        alert.show(animated: true, completion: nil)
    }
    
    func openSettings() {
        let settingsURL = URL.init(string: UIApplicationOpenSettingsURLString)
        if UIApplication.shared.canOpenURL(settingsURL!) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsURL!,
                                          options: [:],
                                          completionHandler: nil)
            }
            else {
                UIApplication.shared.openURL(settingsURL!)
            }
        }
    }
    
}
