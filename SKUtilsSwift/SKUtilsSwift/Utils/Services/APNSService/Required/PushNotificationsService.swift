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
import UserNotifications

class PushNotificationsService<T: APNSService>: NSObject, APNSService {

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
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge,
                                                                             .alert,
                                                                             .sound])
            { (granted, error) in }
            application.registerForRemoteNotifications()
        }
        // iOS 9 support
        else if #available(iOS 9, *) {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge,
                                                                                                     .sound,
                                                                                                     .alert],
                                                                                             categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }
            // iOS 8 support
        else if #available(iOS 8, *) {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge,
                                                                                                     .sound,
                                                                                                     .alert],
                                                                                             categories: nil))
            UIApplication.shared.registerForRemoteNotifications()
        }
            // iOS 7 support
        else {  
            application.registerForRemoteNotifications(matching: [.badge, .sound, .alert])
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
