//
//  AppDelegate.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 14.07.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //MARK: - Location
    var locationSerice: LocationService = {
        let alertTitles = AlertTitles(title: "Location Service",
                                      message: "Location service is disabled! Please turn on it in Settings",
                                      actionButtonTitle: "Go to Settings",
                                      cancelButtonTitle: "Cancel")
        let locationPermissions = LocationPermissions(settingAlertTitles: alertTitles)
        let locationSerice = LocationService(withLocationUsage: .requestAlwaysAuthorization,
                                             locationPermissions: locationPermissions)
        return locationSerice
    }()
    
    //MARK: - Image Picker
    
   /*var imagePicker = UIImagePickerController().configure(configurator: { (picker) in
        picker.sourceType = .camera
    })
    var cameraPermissions: CameraPermissions? = {
     let alertTitles = AlertTitles(title: "Service",
     message: "Service is disabled! Please turn on it in Settings",
     actionButtonTitle: "Go to Settings",
     cancelButtonTitle: "Cancel")
     let cameraPermissions = CameraPermissions(settingAlertTitles: alertTitles)
     return cameraPermissions
     }()
    var libraryPermissions: PhotoLibraryPermissions?*/
    
//    var apnsService = PushNotificationsService(service: FCMService())
    
    //MARK: - Delegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.locationSerice.startUpdatingLocation()
        self.locationSerice.startUpdatingHeading()
        self.locationSerice.delegate = self;
//        DatabaseManager.configureRealm()
//        DatabaseManager.mapTestJSONToDatabase()
        
//        apnsService.setupService()
//        apnsService.registerForPushNotifications(application)
        
        return true 
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
//        apnsService.connectToService()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
//        apnsService.disconnectFromService()
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

