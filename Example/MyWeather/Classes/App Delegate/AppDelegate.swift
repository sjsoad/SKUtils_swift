//
//  AppDelegate.swift
//  MyWeather
//
//  Created by Sergey Kostyan on 27.11.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
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
    var apiClient = APIClient()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(GoogleServices.ApiKey)
        GMSPlacesClient.provideAPIKey(GoogleServices.ApiKey)
        locationSerice.startUpdatingLocation()
        return true
    }
    
}

