//
//  FCMService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 11.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
//import Firebase
//import FirebaseInstanceID
//import FirebaseMessaging

class FCMService: NSObject, APNSService {

    func setupService() {
//        FIRApp.configure()
//        
//        // Add observer for InstanceID token refresh callback.
//        NotificationCenter.default.addObserver(self, selector: #selector(self.tokenRefreshNotification),
//                                                         name: NSNotification.Name.firInstanceIDTokenRefresh, object: nil)
    }

    func tokenRefreshNotification(_ notification: Notification) {
//        if let refreshedToken = FIRInstanceID.instanceID().token() {
//            print("InstanceID token: \(refreshedToken)")
//        }
//        
//        // Connect to FCM since connection may have failed when attempted before having a token.
//        connectToService()
    }

    func connectToService() {
//        FIRMessaging.messaging().connect { (error) in
//            if (error != nil) {
//                print("Unable to connect with FCM. \(error)")
//            } else {
//                print("Connected to FCM.")
//            }
//        }
    }

    func disconnectFromService() {
//        FIRMessaging.messaging().disconnect()
//        print("Disconnected from FCM.")
    }

}
