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

class LocationService: NSObject {

    var locationManager = CLLocationManager()
    
    fileprivate var locationUsage: LocationUsage
    fileprivate var locationServicePermissions: LocationServicePermissions
    
    init(withLocationUsage locationUsage: LocationUsage,
         locationServicePermissions: LocationServicePermissions) {
        self.locationUsage = locationUsage
        self.locationServicePermissions = locationServicePermissions;
    }
    
    //MARK: - Public methods
    
    func start(updatingLocation: Bool, updatingHeading: Bool) {
        switch self.locationServicePermissions.isServiceAvailable() {
        case .permissionsNotAsked:
            self.askPermissions()
            break
        default:
            break
        }
        self._start(updatingLocation: updatingLocation,
                    updatingHeading: updatingHeading)
    }
    
    func stop(updatingLocation: Bool, updatingHeading: Bool) {
        if updatingLocation {
            self.locationManager.stopUpdatingLocation()
        }
        if updatingHeading {
            self.locationManager.stopUpdatingHeading()
        }
    }
    
    //MARK: - Private methods
    
    fileprivate func _start(updatingLocation: Bool, updatingHeading: Bool) {
        if updatingLocation {
            self.locationManager.startUpdatingLocation()
        }
        if updatingHeading {
            self.locationManager.stopUpdatingHeading()
        }
    }
    
    fileprivate func askPermissions() {
        if locationManager.responds(to: NSSelectorFromString(locationUsage.rawValue)) {
            locationManager.perform(NSSelectorFromString(locationUsage.rawValue))
        }
    }
}
