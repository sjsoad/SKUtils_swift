//
//  PushNotificationsService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 11.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

//TODO: READM ME

/* -------------------------------------------------------------------------------------------------------------------------
 Create apns service instance with service type
    var apnsService = PushNotificationsService(service: FCMService())

 Setup and register for push notifications in AppDelegate
    apnsService.setupService()
    apnsService.registerForPushNotifications(application)
 
---------------------------------------------------------------------------------------------------------------------------- */

import UIKit

class PushNotificationsService<T: AnyObject>: NSObject, APNSService where T: APNSService {

    var service: T?
    
    init(service: T) {
        self.service = service
    }
    
    func setupService() {
        if let service = self.service {
            service.setupService()
        }
    }
    
    func registerForPushNotifications(_ application: UIApplication) {
        if #available(iOS 8.0, *) {
            let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound],
                                                                                  categories: nil)
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        } else {
            let types: UIRemoteNotificationType = [.alert, .badge, .sound]
            application.registerForRemoteNotifications(matching: types)
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
