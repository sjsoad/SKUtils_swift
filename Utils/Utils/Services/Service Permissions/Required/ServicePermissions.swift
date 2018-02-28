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

protocol ServicePermissions {
    
    associatedtype PermissionsState
    
    func permissionsState() -> PermissionsState
    func requestPermissions(handler: @escaping (PermissionsState) -> Void)
    
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
        if Thread.isMainThread {
            alert.show(animated: true, completion: nil)
        } else {
            openInMainThread(alert: alert)
        }
    }
    
    // MARK: - Private -
    
    private func openSettings() {
        let settingsURL = URL(string: UIApplicationOpenSettingsURLString)
        if UIApplication.shared.canOpenURL(settingsURL!) {
            UIApplication.shared.open(settingsURL!, options: [:], completionHandler: nil)
        }
    }
    
    private func openInMainThread(alert: UIAlertController) {
        DispatchQueue.main.sync {
            alert.show(animated: true, completion: nil)
        }
    }
    
}
