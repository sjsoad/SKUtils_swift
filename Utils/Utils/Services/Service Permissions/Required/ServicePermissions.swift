//
//  ServicePermissions.swift
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

// MARK: - ServicePermissions -

protocol ServicePermissions: PermissionsStateble, PermissionsRequesting {
    
}

// MARK: - DefaultServicePermissions -

class DefaultServicePermissions: NSObject {

    private var alertTitles: AlertTitles
    
    init(settingAlertTitles: AlertTitles) {
        self.alertTitles = settingAlertTitles
    }
    
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
        openInMainThread(alert: alert)
    }
    
    // MARK: - Private -
    
    private func openSettings() {
        let settingsURL = URL(string: UIApplicationOpenSettingsURLString)
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
    
    private func openInMainThread(alert: UIAlertController) {
        DispatchQueue.main.sync {
            alert.show(animated: true, completion: nil)
        }
    }
    
}
