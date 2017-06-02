//
//  PermissionsService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 25.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import Foundation
import UIKit

struct AlertTitles {
    var title: String
    var message: String
    var actionButtonTitle: String
    var cancelButtonTitle: String
}

protocol ServicePermissions {
    
    var alertTitles: AlertTitles { get }
    func permissionsState() -> PermissionsState
    func showSettingsAlert()
    func openSettings()
}

extension ServicePermissions {
    
    func showSettingsAlert() {
        let settingsAction = UIAlertAction.defaultAction(title: alertTitles.actionButtonTitle,
                                                         handler: { _ in
                                                            self.openSettings()
        })
        let cancelAction = UIAlertAction.cancelAction(title: alertTitles.cancelButtonTitle)
        let alert = UIAlertController(title: alertTitles.title,
                                      message: alertTitles.message,
                                      preferredStyle: .alert)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        if Thread.isMainThread {
            alert.show(animated: true, completion: nil)
        } else {
            DispatchQueue.main.sync {
                alert.show(animated: true, completion: nil)
            }
        }

    }
    
    func openSettings() {
        let settingsURL = URL.init(string: UIApplicationOpenSettingsURLString)
        if UIApplication.shared.canOpenURL(settingsURL!) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(settingsURL!,
                                          options: [:],
                                          completionHandler: nil)
            } else {
                UIApplication.shared.openURL(settingsURL!)
            }
        }
    }
    
}
