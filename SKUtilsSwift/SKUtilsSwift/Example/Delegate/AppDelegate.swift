//
//  AppDelegate.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 14.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var locationSerice: LocationService = {
        let alertConfiguration = SettingAlertConfiguration(title: "Location Service",
                                                         message: "Location service is disabled! Please turn on it in Settings",
                                             settingsButtonTitle: "Go to Settings",
                                               cancelButtonTitle: "Cancel")
        let locationPermissions = LocationPermissions(settingAlertConfiguration: alertConfiguration)
        let locationSerice = LocationService(withLocationUsage: .requestAlwaysAuthorization,
                                     locationPermissions: locationPermissions)
        return locationSerice
    }()
//    var apnsService = PushNotificationsService(service: FCMService())
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.locationSerice.start(updatingLocation: true,
                                  updatingHeading: true)
        self.locationSerice.locationManager.delegate = self;
//        DatabaseManager.configureRealm()
//        DatabaseManager.mapTestJSONToDatabase()
        
//        apnsService.setupService()
//        apnsService.registerForPushNotifications(application)
        
        return true 
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
//        apnsService.connectToService()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
//        apnsService.disconnectFromService()
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("update location")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("update heading")
    }

}

