//
//  PushNotificationsService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 11.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

class PushNotificationsService<T: AnyObject where T: APNSService>: NSObject, APNSService {

    var service: T?
    
    init(service: T) {
        self.service = service
    }
    
    func setupService() {
        if let service = self.service {
            service.setupService()
        }
    }
    
    func registerForPushNotifications(application: UIApplication) {
        if #available(iOS 8.0, *) {
            let settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound],
                                                                                  categories: nil)
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        } else {
            let types: UIRemoteNotificationType = [.Alert, .Badge, .Sound]
            application.registerForRemoteNotificationTypes(types)
        }
    }
    
    func connectToService() {
        if let service = self.service {
            service.connectToService()
        }
    }
    
    func disconnectFromService() {
        if let service = self.service {
            service.disconnectFromService()
        }
    }
    
}
