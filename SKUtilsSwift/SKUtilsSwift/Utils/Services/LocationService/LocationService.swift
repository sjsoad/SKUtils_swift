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

var locationSerice: LocationService = {
    let alertConfiguration = AlertConfigurator(title: "Location Service",
                                               message: "Location service is disabled! Please turn on it in Settings",
                                               settingsButtonTitle: "Go to Settings",
                                               cancelButtonTitle: "Cancel")
    let locationPermissions = LocationPermissions(settingAlertConfiguration: alertConfiguration)
    let locationSerice = LocationService(withLocationUsage: .requestAlwaysAuthorization,
                                         locationPermissions: locationPermissions)
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
    fileprivate var locationPermissions: LocationPermissions
    
    init(withLocationUsage locationUsage: LocationUsage,
         locationPermissions: LocationPermissions) {
        self.locationUsage = locationUsage
        self.locationPermissions = locationPermissions;
    }
    
    //MARK: - Public methods
    
    func start(updatingLocation: Bool, updatingHeading: Bool) {
        switch self.locationPermissions.permissionsState() {
        case .permissionsNotAsked:
            self.askPermissions()
            break
        case .permissionsGranted:
            self._start(updatingLocation: updatingLocation,
                        updatingHeading: updatingHeading)
            break
        default:
            break
        }
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
