//
//  SKLocationService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 03.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

//TODO: READM ME

/* -------------------------------------------------------------------------------------------------------------------------
 Add description to NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription in order to use location Service
 Add this property to yoor class and init it with valid arguments, add delegate and enjoy.
 
 var locationSerice : LocationService = {
    let alertConfiguration = SettingAlertConfiguration(title: "Location Service",
                                                       message: "Location service is disabled! Please turn on it in Settings",
                                                       settingsButtonTitle: "Go to Settings",
                                                       cancelButtonTitle: "Cancel")
    let locationSerice = LocationService(withLocationUsage: .requestAlwaysAuthorization,
                                         settingAlertConfiguration: alertConfiguration)
    return locationSerice
 }()
 
---------------------------------------------------------------------------------------------------------------------------- */


import UIKit
import CoreLocation

enum LocationUsage: String {
    case requestWhenInUseAuthorization
    case requestAlwaysAuthorization
}

struct SettingAlertConfiguration {
    var title : String
    var message : String
    var settingsButtonTitle : String
    var cancelButtonTitle : String
}

class LocationService: NSObject {

    
    var locationManager = CLLocationManager()
    
    private var alertConfiguration: SettingAlertConfiguration
    private var locationUsage: LocationUsage
    
    init(withLocationUsage locationUsage: LocationUsage,
                           settingAlertConfiguration: SettingAlertConfiguration) {
        self.locationUsage = locationUsage
        self.alertConfiguration = settingAlertConfiguration
    }
    
    //MARK: - Public methods
    
    func startLocationService() {
        self.checkLocationServiceState()
    }
    
    func start(updatingLocation updatingLocation: Bool, updatingHeading: Bool) {
        if updatingLocation {
            self.locationManager.startUpdatingLocation()
        }
        if updatingHeading {
            self.locationManager.stopUpdatingHeading()
        }
    }
    
    func stop(updatingLocation updatingLocation: Bool, updatingHeading: Bool) {
        if updatingLocation {
            self.locationManager.stopUpdatingLocation()
        }
        if updatingHeading {
            self.locationManager.stopUpdatingHeading()
        }
    }
    
    //MARK: - Private methods
    
    private func checkLocationServiceState() {
        switch CLLocationManager.authorizationStatus() {
        case .NotDetermined:
            if locationManager.respondsToSelector(NSSelectorFromString(locationUsage.rawValue)) {
                locationManager.performSelector(NSSelectorFromString(locationUsage.rawValue))
            }
            self.start(updatingLocation: true, updatingHeading: true)
            break
        case .Restricted, .Denied, .AuthorizedWhenInUse:
            self.showSettingsAlert()
            break
            
        default:
            print("default")
        }
    }
    
    private func showSettingsAlert() {
        let alert = UIAlertController.init(title: alertConfiguration.title,
                                           message: alertConfiguration.message,
                                           preferredStyle: .Alert)
        let settingsAction = UIAlertAction.init(title: alertConfiguration.settingsButtonTitle,
                                                style: .Default) { (action) in
                                                    self.openSettings()
        }
        let cancelAction = UIAlertAction.init(title: alertConfiguration.cancelButtonTitle,
                                              style: .Cancel,
                                              handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        //TODO: in order to show this alert you need to have viewController
        if let topView = UIApplication.sharedApplication().keyWindow?.rootViewController {
            topView.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    private func openSettings() {
        let settingsURL = NSURL.init(string: UIApplicationOpenSettingsURLString)
        if UIApplication.sharedApplication().canOpenURL(settingsURL!) {
            UIApplication.sharedApplication().openURL(settingsURL!)
        }
    }
}