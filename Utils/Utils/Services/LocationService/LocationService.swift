//
//  SKLocationService.swift
//  SKUtilsSwift
//
//  Created by Sergey Kostyan on 03.09.16.
//  Copyright © 2016 Sergey Kostyan. All rights reserved.
//

// TODO: READ ME

/* -------------------------------------------------------------------------------------------------------------------------
 iOS 10:
 Add description to NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription in order to use location Service
 Add this property to your class and init it with valid arguments, add delegate and enjoy.

var locationService: LocationService = {
    let alertTitles = AlertTitles(title: "Location Service",
                                  message: "Location service is disabled! Please turn on it in Settings",
                                  actionButtonTitle: "Go to Settings",
                                  cancelButtonTitle: "Cancel")
    let locationPermissions = LocationPermissions(settingAlertTitles: alertTitles)
    let locationSerice = LocationService(withLocationUsage: .requestAlwaysAuthorization,
                                         locationPermissions: locationPermissions)
    return locationSerice
}()
/---------------------------------------------------------------------------------------------------------------------------- */

import UIKit
import CoreLocation

enum LocationUsage: String {
    case requestWhenInUseAuthorization
    case requestAlwaysAuthorization
}

class LocationService: CLLocationManager {
    
    fileprivate var locationUsage: LocationUsage
    fileprivate var locationPermissions: LocationPermissions
    
    init(withLocationUsage locationUsage: LocationUsage,
         locationPermissions: LocationPermissions) {
        self.locationUsage = locationUsage
        self.locationPermissions = locationPermissions
        super.init()
        self.checkPermissions()
    }
    
    // MARK: - Public methods
    
    func permissionsState() -> PermissionsState {
        return locationPermissions.permissionsState()
    }
    
    func checkPermissions() {
        switch locationPermissions.permissionsState() {
        case .permissionsNotAsked:
            askPermissions()
            break
        default:
            break
        }
    }
    
    // MARK: - Private -
    
    fileprivate func askPermissions() {
        if responds(to: NSSelectorFromString(locationUsage.rawValue)) {
            perform(NSSelectorFromString(locationUsage.rawValue))
        }
    }
}
